--[[--------------------------------------------------
----- VanillaGuide -----
------------------
LevelDetector.lua
Authors: theKennethy
Version: 1.05.0
------------------------------------------------------
Description: 
    Automatic level detection and guide suggestion
    Skip already-completed quests
    
Features:
    - Detects player level on login and level up
    - Suggests appropriate guide based on level
    - Tracks completed quests
    - Skips steps for completed quests
------------------------------------------------------
]]--

Dv(" VGuide LevelDetector.lua Start")

VGuideLevelDetector = {}
VGuideLevelDetector.__index = VGuideLevelDetector

function VGuideLevelDetector:new(oSettings, oGuideTable, oDisplay)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.GuideTable = oGuideTable
    obj.Display = oDisplay
    
    -- Cache for completed quests (persisted in saved variables)
    obj.CompletedQuests = {}
    
    -- Cache for guide level ranges
    obj.GuideLevelRanges = {}
    
    return obj
end

function VGuideLevelDetector:Initialize()
    -- Build guide level range cache
    self:BuildGuideLevelCache()
    
    -- Load completed quests from saved variables
    self:LoadCompletedQuests()
    
    -- Note: PLAYER_LEVEL_UP event is registered in Core.lua
    
    -- Check on first login if we should suggest a guide
    local settings = self.Settings:GetSettingsLevelDetector()
    if settings.Enable and settings.AutoSuggestOnLogin then
        self:CheckAndSuggestGuide()
    end
    
    Di("  LevelDetector initialized")
end

-- Build a cache of guide ID -> level range mappings
function VGuideLevelDetector:BuildGuideLevelCache()
    if not self.GuideTable or not self.GuideTable.Guide then return end
    
    for guideId, guide in pairs(self.GuideTable.Guide) do
        if guide and guide.title then
            -- Parse level range from title like "12-15 Barrens" or "1-6 Durotar"
            local _, _, minLevel, maxLevel = string.find(guide.title, "^(%d+)%-(%d+)")
            if minLevel and maxLevel then
                self.GuideLevelRanges[guideId] = {
                    min = tonumber(minLevel),
                    max = tonumber(maxLevel),
                    title = guide.title
                }
            end
        end
    end
    
    Dv("  Built level cache for " .. self:TableCount(self.GuideLevelRanges) .. " guides")
end

-- Helper to count table entries (since getn doesn't work on hash tables)
function VGuideLevelDetector:TableCount(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-- Find the best guide for a given level
function VGuideLevelDetector:FindGuideForLevel(level)
    local bestGuide = nil
    local bestMatch = nil
    
    for guideId, range in pairs(self.GuideLevelRanges) do
        -- Check if this guide covers the player's level
        if level >= range.min and level <= range.max then
            -- Prefer guides where player is closer to min level (just starting the range)
            local matchScore = level - range.min
            if not bestMatch or matchScore < bestMatch then
                bestMatch = matchScore
                bestGuide = {
                    id = guideId,
                    min = range.min,
                    max = range.max,
                    title = range.title
                }
            end
        end
    end
    
    -- If no exact match, find the next guide above current level
    if not bestGuide then
        local closestAbove = nil
        for guideId, range in pairs(self.GuideLevelRanges) do
            if range.min > level then
                if not closestAbove or range.min < closestAbove.min then
                    closestAbove = {
                        id = guideId,
                        min = range.min,
                        max = range.max,
                        title = range.title
                    }
                end
            end
        end
        bestGuide = closestAbove
    end
    
    return bestGuide
end

-- Called on level up
function VGuideLevelDetector:OnLevelUp()
    local settings = self.Settings:GetSettingsLevelDetector()
    if not settings.Enable then return end
    
    local playerLevel = UnitLevel("player")
    Dv("  Player leveled up to " .. playerLevel)
    
    if settings.AutoSwitchOnLevelUp then
        self:CheckAndSuggestGuide()
    end
end

-- Check current level and suggest/switch guide
function VGuideLevelDetector:CheckAndSuggestGuide()
    local settings = self.Settings:GetSettingsLevelDetector()
    if not settings.Enable then return end
    
    local playerLevel = UnitLevel("player")
    local currentGuideId = self.Display:GetCurrentGuideID()
    local currentRange = self.GuideLevelRanges[currentGuideId]
    
    -- Check if current guide is still appropriate
    if currentRange then
        -- If player is within the guide's range or just above it, stay
        if playerLevel >= currentRange.min and playerLevel <= currentRange.max + 2 then
            return -- Current guide is fine
        end
    end
    
    -- Find a better guide
    local suggestedGuide = self:FindGuideForLevel(playerLevel)
    if not suggestedGuide then return end
    
    -- Don't suggest the same guide
    if suggestedGuide.id == currentGuideId then return end
    
    if settings.AutoSwitchOnLevelUp then
        -- Auto-switch
        self.Display:GuideByID(suggestedGuide.id)
        if settings.ShowNotification then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Auto-switched to " .. suggestedGuide.title)
        end
    elseif settings.ShowNotification then
        -- Just notify
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Suggested guide for level " .. playerLevel .. ": " .. suggestedGuide.title)
        DEFAULT_CHAT_FRAME:AddMessage("  Use /vguide suggest to switch")
    end
end

-- Manually switch to suggested guide
function VGuideLevelDetector:SwitchToSuggestedGuide()
    local playerLevel = UnitLevel("player")
    local suggestedGuide = self:FindGuideForLevel(playerLevel)
    
    if suggestedGuide then
        self.Display:GuideByID(suggestedGuide.id)
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Switched to " .. suggestedGuide.title)
        
        -- Also refresh UI
        if VGuide.UI and VGuide.UI.MainFrame then
            VGuide.UI.MainFrame:RefreshMainFrame()
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r No guide found for level " .. playerLevel)
    end
end

--------------------------------------------------
-- Completed Quest Tracking
--------------------------------------------------

-- Load completed quests from saved variables
function VGuideLevelDetector:LoadCompletedQuests()
    if VanillaGuideDB and VanillaGuideDB.CompletedQuests then
        self.CompletedQuests = VanillaGuideDB.CompletedQuests
    else
        self.CompletedQuests = {}
    end
end

-- Save completed quests to saved variables
function VGuideLevelDetector:SaveCompletedQuests()
    if not VanillaGuideDB then VanillaGuideDB = {} end
    VanillaGuideDB.CompletedQuests = self.CompletedQuests
end

-- Mark a quest as completed
function VGuideLevelDetector:MarkQuestCompleted(questName, questId)
    if questId then
        self.CompletedQuests[questId] = true
    end
    if questName then
        self.CompletedQuests[questName] = true
    end
    self:SaveCompletedQuests()
    Dv("  Marked quest completed: " .. (questName or questId or "unknown"))
end

-- Check if a quest is completed
function VGuideLevelDetector:IsQuestCompleted(questName, questId)
    -- Check by ID first (more reliable)
    if questId and self.CompletedQuests[questId] then
        return true
    end
    -- Check by name
    if questName and self.CompletedQuests[questName] then
        return true
    end
    -- Check if quest is in completed state in quest log (turned in)
    -- Note: In vanilla, there's no direct API to check completed quests
    -- We track this via QUEST_TURNED_IN events
    return false
end

-- Check if a step's quest is already completed
function VGuideLevelDetector:IsStepCompleted(stepText, stepData)
    if not stepText then return false end
    
    local settings = self.Settings:GetSettingsLevelDetector()
    if not settings.SkipCompletedQuests then return false end
    
    -- Extract quest name from step text
    local questName = nil
    local _
    
    -- Try different patterns for quest names
    -- Pattern: |c0000ffff"Quest Name"|r (from ACCEPT)
    _, _, questName = string.find(stepText, '|c0000ffff"([^"]+)"')
    if not questName then
        -- Pattern: |c0000ff00"Quest Name"|r (from TURNIN)
        _, _, questName = string.find(stepText, '|c0000ff00"([^"]+)"')
    end
    if not questName then
        -- Pattern: |c000079d2"Quest Name"|r (from DOQUEST)
        _, _, questName = string.find(stepText, '|c000079d2"([^"]+)"')
    end
    
    local questId = stepData and stepData.questId
    
    return self:IsQuestCompleted(questName, questId)
end

-- Called when a quest is turned in (from AutoAdvance system)
function VGuideLevelDetector:OnQuestTurnedIn(questName)
    -- Try to get quest ID from database
    local questId = nil
    if VGuideQuestDB and VGuideQuestDB.GetQuestId then
        questId = VGuideQuestDB:GetQuestId(questName)
    end
    
    self:MarkQuestCompleted(questName, questId)
end

-- Get the next non-completed step from current position
function VGuideLevelDetector:GetNextIncompleteStep()
    if not self.Display then return nil end
    
    local currentStep = self.Display:GetCurrentStep()
    local stepCount = self.Display:GetCurrentStepCount()
    local scrollDisplay = self.Display:GetScrollFrameDisplay()
    
    for i = currentStep, stepCount do
        local stepText = scrollDisplay[i]
        local stepInfo = self.Display.StepInfoDisplay[i]
        
        if not self:IsStepCompleted(stepText, stepInfo) then
            return i
        end
    end
    
    return nil -- All steps completed
end

-- Skip to next incomplete step (if skip is enabled)
function VGuideLevelDetector:SkipCompletedSteps()
    local settings = self.Settings:GetSettingsLevelDetector()
    if not settings.Enable or not settings.SkipCompletedQuests then return false end
    
    local nextStep = self:GetNextIncompleteStep()
    if not nextStep then return false end
    
    local currentStep = self.Display:GetCurrentStep()
    if nextStep > currentStep then
        self.Display:StepByID(nextStep)
        
        if settings.ShowNotification then
            local skipped = nextStep - currentStep
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Skipped " .. skipped .. " completed step(s)")
        end
        
        -- Refresh UI
        if VGuide.UI and VGuide.UI.MainFrame then
            VGuide.UI.MainFrame:RefreshMainFrame()
        end
        
        return true
    end
    
    return false
end

-- Check current step and skip if completed
function VGuideLevelDetector:CheckCurrentStepAndSkip()
    local settings = self.Settings:GetSettingsLevelDetector()
    if not settings.Enable or not settings.SkipCompletedQuests then return end
    
    local currentStep = self.Display:GetCurrentStep()
    local scrollDisplay = self.Display:GetScrollFrameDisplay()
    local stepText = scrollDisplay[currentStep]
    local stepInfo = self.Display.StepInfoDisplay[currentStep]
    
    if self:IsStepCompleted(stepText, stepInfo) then
        self:SkipCompletedSteps()
    end
end

-- Mark current step's quest as completed (for manual marking)
function VGuideLevelDetector:MarkCurrentStepCompleted()
    local currentStep = self.Display:GetCurrentStep()
    local scrollDisplay = self.Display:GetScrollFrameDisplay()
    local stepText = scrollDisplay[currentStep]
    local stepInfo = self.Display.StepInfoDisplay[currentStep]
    
    -- Extract quest name
    local _, _, questName = string.find(stepText, '|c%x+["\']([^"\']+)["\']')
    if not questName then
        _, _, questName = string.find(stepText, '"([^"]+)"')
    end
    
    local questId = stepInfo and stepInfo.questId
    
    if questName or questId then
        self:MarkQuestCompleted(questName, questId)
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Marked as completed: " .. (questName or "Quest"))
        
        -- Move to next step
        self.Display:NextStep()
        if VGuide.UI and VGuide.UI.MainFrame then
            VGuide.UI.MainFrame:RefreshMainFrame()
        end
    end
end

-- Get count of completed steps in current guide
function VGuideLevelDetector:GetCompletedStepCount()
    local count = 0
    local stepCount = self.Display:GetCurrentStepCount()
    local scrollDisplay = self.Display:GetScrollFrameDisplay()
    
    for i = 1, stepCount do
        local stepText = scrollDisplay[i]
        local stepInfo = self.Display.StepInfoDisplay[i]
        if self:IsStepCompleted(stepText, stepInfo) then
            count = count + 1
        end
    end
    
    return count
end

Dv(" VGuide LevelDetector.lua End")
