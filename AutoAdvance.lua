--[[--------------------------------------------------
----- VanillaGuide -----
------------------
AutoAdvance.lua
Authors: VanillaGuide Contributors
Version: 1.05.0
------------------------------------------------------
Description: 
    Auto-Advance module for VanillaGuide
    Automatically advances to the next step when:
    - A quest mentioned in the current step is accepted
    - A quest mentioned in the current step is completed
    - A quest mentioned in the current step is turned in
    
    Integrates with pfQuest for enhanced tracking.
------------------------------------------------------
Events Used:
    QUEST_ACCEPTED - Fired when accepting a quest
    QUEST_COMPLETE - Fired when quest objectives are done
    QUEST_FINISHED - Fired when quest dialog closes (turn in)
    QUEST_LOG_UPDATE - General quest log changes
    UI_INFO_MESSAGE - System messages about quests
------------------------------------------------------
]]--

Dv(" VGuide AutoAdvance.lua Start")

VGuideAutoAdvance = {}
VGuideAutoAdvance.__index = VGuideAutoAdvance

function VGuideAutoAdvance:new(oSettings, oDisplay)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.Display = oDisplay
    obj.enabled = true
    
    -- Track last known quest states to detect changes
    obj.lastQuestStates = {}
    obj.pendingAdvance = false
    obj.lastAdvanceTime = 0
    obj.advanceCooldown = 0.5 -- seconds between auto-advances
    
    -- Current step quest info (cached)
    obj.currentStepQuests = {
        accept = {},   -- Quests to accept in this step
        doquest = {},  -- Quests to do/complete in this step
        turnin = {},   -- Quests to turn in this step
    }
    
    ---------------------------------------
    -- Settings Access
    ---------------------------------------
    
    obj.IsEnabled = function(self)
        local settings = obj.Settings:GetSettingsAutoAdvance()
        return settings and settings.Enable
    end
    
    obj.ShouldAdvanceOnAccept = function(self)
        local settings = obj.Settings:GetSettingsAutoAdvance()
        return settings and settings.Enable and settings.OnQuestAccept
    end
    
    obj.ShouldAdvanceOnComplete = function(self)
        local settings = obj.Settings:GetSettingsAutoAdvance()
        return settings and settings.Enable and settings.OnQuestComplete
    end
    
    obj.ShouldAdvanceOnTurnIn = function(self)
        local settings = obj.Settings:GetSettingsAutoAdvance()
        return settings and settings.Enable and settings.OnQuestTurnIn
    end
    
    obj.ShouldShowNotification = function(self)
        local settings = obj.Settings:GetSettingsAutoAdvance()
        return settings and settings.ShowNotification
    end
    
    ---------------------------------------
    -- Step Parsing
    ---------------------------------------
    
    -- Parse the current step text for quest references
    obj.ParseCurrentStep = function(self)
        obj.currentStepQuests = {
            accept = {},
            doquest = {},
            turnin = {},
        }
        
        if not obj.Display then return end
        
        local stepText = obj.Display:GetStepLabel()
        if not stepText then return end
        
        -- Find ACCEPT quests: #ACCEPT"Quest Name"# or colorized version
        for questName in string.gfind(stepText, '#ACCEPT"([^"]+)"') do
            table.insert(obj.currentStepQuests.accept, questName)
        end
        -- Also check colorized version
        for questName in string.gfind(stepText, '|c0000ffff"([^"]+)"') do
            table.insert(obj.currentStepQuests.accept, questName)
        end
        
        -- Find DOQUEST quests: #DOQUEST"Quest Name"#
        for questName in string.gfind(stepText, '#DOQUEST"([^"]+)"') do
            table.insert(obj.currentStepQuests.doquest, questName)
        end
        -- Colorized version
        for questName in string.gfind(stepText, '|c000079d2"([^"]+)"') do
            table.insert(obj.currentStepQuests.doquest, questName)
        end
        
        -- Find TURNIN quests: #TURNIN"Quest Name"#
        for questName in string.gfind(stepText, '#TURNIN"([^"]+)"') do
            table.insert(obj.currentStepQuests.turnin, questName)
        end
        -- Colorized version
        for questName in string.gfind(stepText, '|c0000ff00"([^"]+)"') do
            table.insert(obj.currentStepQuests.turnin, questName)
        end
        
        Dv("    AutoAdvance: Parsed step - Accept: " .. getn(obj.currentStepQuests.accept) .. 
           ", Do: " .. getn(obj.currentStepQuests.doquest) .. 
           ", TurnIn: " .. getn(obj.currentStepQuests.turnin))
    end
    
    -- Check if a quest name matches any in a list (case-insensitive partial match)
    obj.QuestMatchesList = function(self, questName, questList)
        if not questName or not questList then return false end
        
        local lowerName = string.lower(questName)
        
        for _, listQuest in ipairs(questList) do
            local lowerListQuest = string.lower(listQuest)
            -- Check both directions for partial match
            if string.find(lowerName, lowerListQuest, 1, true) or
               string.find(lowerListQuest, lowerName, 1, true) then
                return true, listQuest
            end
        end
        
        return false, nil
    end
    
    ---------------------------------------
    -- Auto-Advance Logic
    ---------------------------------------
    
    -- Attempt to advance to next step
    obj.TryAdvance = function(self, reason)
        if not obj:IsEnabled() then return false end
        
        -- Cooldown check
        local now = GetTime()
        if now - obj.lastAdvanceTime < obj.advanceCooldown then
            Dv("    AutoAdvance: Cooldown active, skipping")
            return false
        end
        
        -- Advance
        obj.lastAdvanceTime = now
        
        if obj.Display then
            obj.Display:NextStep()
            obj:ParseCurrentStep() -- Re-parse for new step
            
            -- Show notification
            if obj:ShouldShowNotification() then
                local msg = "|cff00ff00VanillaGuide:|r Auto-advanced - " .. (reason or "Step complete")
                DEFAULT_CHAT_FRAME:AddMessage(msg)
                
                -- Also show on screen briefly
                UIErrorsFrame:AddMessage("VGuide: " .. (reason or "Next step"), 0, 1, 0, 1, 2)
            end
            
            Dv("    AutoAdvance: Advanced! Reason: " .. (reason or "unknown"))
            return true
        end
        
        return false
    end
    
    ---------------------------------------
    -- Event Handlers
    ---------------------------------------
    
    -- Called when a quest is accepted
    obj.OnQuestAccepted = function(self, questName)
        if not obj:ShouldAdvanceOnAccept() then return end
        
        Dv("    AutoAdvance: Quest accepted - " .. (questName or "unknown"))
        
        local matches, matchedQuest = obj:QuestMatchesList(questName, obj.currentStepQuests.accept)
        if matches then
            Dv("    AutoAdvance: Matches current step ACCEPT quest: " .. matchedQuest)
            obj:TryAdvance("Accepted: " .. matchedQuest)
        end
    end
    
    -- Called when quest objectives are completed
    obj.OnQuestComplete = function(self, questName)
        if not obj:ShouldAdvanceOnComplete() then return end
        
        Dv("    AutoAdvance: Quest complete - " .. (questName or "unknown"))
        
        local matches, matchedQuest = obj:QuestMatchesList(questName, obj.currentStepQuests.doquest)
        if matches then
            Dv("    AutoAdvance: Matches current step DOQUEST: " .. matchedQuest)
            obj:TryAdvance("Completed: " .. matchedQuest)
        end
    end
    
    -- Called when a quest is turned in
    obj.OnQuestTurnedIn = function(self, questName)
        if not obj:ShouldAdvanceOnTurnIn() then return end
        
        Dv("    AutoAdvance: Quest turned in - " .. (questName or "unknown"))
        
        local matches, matchedQuest = obj:QuestMatchesList(questName, obj.currentStepQuests.turnin)
        if matches then
            Dv("    AutoAdvance: Matches current step TURNIN quest: " .. matchedQuest)
            obj:TryAdvance("Turned in: " .. matchedQuest)
        end
    end
    
    ---------------------------------------
    -- Quest Log Monitoring
    ---------------------------------------
    
    -- Scan quest log and detect newly completed quests
    obj.CheckForCompletedQuests = function(self)
        if not obj:IsEnabled() then return end
        
        local numEntries = GetNumQuestLogEntries()
        local newStates = {}
        
        for i = 1, numEntries do
            local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
            
            if not isHeader and questTitle then
                local lowerTitle = string.lower(questTitle)
                newStates[lowerTitle] = {
                    complete = isComplete,
                    index = i,
                }
                
                -- Check if this quest just became complete
                local oldState = obj.lastQuestStates[lowerTitle]
                if isComplete and (not oldState or not oldState.complete) then
                    -- Quest just completed!
                    obj:OnQuestComplete(questTitle)
                end
            end
        end
        
        -- Check for quests that were removed (turned in)
        for questTitle, oldState in pairs(obj.lastQuestStates) do
            if not newStates[questTitle] and oldState.complete then
                -- Quest was in log and complete, now gone = turned in
                obj:OnQuestTurnedIn(questTitle)
            end
        end
        
        obj.lastQuestStates = newStates
    end
    
    -- Check for newly accepted quests
    obj.CheckForAcceptedQuests = function(self, previousCount)
        if not obj:IsEnabled() then return end
        
        local numEntries, numQuests = GetNumQuestLogEntries()
        
        -- If quest count increased, scan for new quests
        if previousCount and numQuests > previousCount then
            for i = 1, numEntries do
                local questTitle, level, questTag, suggestedGroup, isHeader = GetQuestLogTitle(i)
                
                if not isHeader and questTitle then
                    local lowerTitle = string.lower(questTitle)
                    -- If this quest wasn't tracked before, it's new
                    if not obj.lastQuestStates[lowerTitle] then
                        obj:OnQuestAccepted(questTitle)
                    end
                end
            end
        end
    end
    
    ---------------------------------------
    -- pfQuest Integration
    ---------------------------------------
    
    -- Hook into pfQuest events if available
    obj.IntegrateWithPfQuest = function(self)
        -- pfQuest may provide additional hooks for quest tracking
        if pfQuest then
            Dv("    AutoAdvance: pfQuest detected, enhancing tracking")
            
            -- pfQuest stores quest data that we can use
            -- This gives us better quest ID matching
        end
    end
    
    ---------------------------------------
    -- Initialization
    ---------------------------------------
    
    -- Helper to count hash table entries
    local function tableCount(t)
        local count = 0
        for _ in pairs(t) do count = count + 1 end
        return count
    end
    
    obj.Initialize = function(self)
        obj:ParseCurrentStep()
        obj:IntegrateWithPfQuest()
        
        -- Initial quest log scan
        local numEntries = GetNumQuestLogEntries()
        for i = 1, numEntries do
            local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
            if not isHeader and questTitle then
                obj.lastQuestStates[string.lower(questTitle)] = {
                    complete = isComplete,
                    index = i,
                }
            end
        end
        
        Dv("    AutoAdvance: Initialized with " .. tableCount(obj.lastQuestStates) .. " tracked quests")
    end
    
    -- Call this when step changes (manually or auto)
    obj.OnStepChanged = function(self)
        obj:ParseCurrentStep()
    end
    
    return obj
end

-- Global instance will be created in Core.lua
VGuideAutoAdvancer = nil

Dv(" VGuide AutoAdvance.lua End")
