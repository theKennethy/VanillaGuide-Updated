--[[--------------------------------------------------
----- VanillaGuide -----
------------------
AutoQuest.lua
Authors: GitHub Copilot
Version: 1.07.0
------------------------------------------------------
Description: 
    Auto-accept and auto-turn-in quests from the guide
    Like Zygor's auto quest functionality
------------------------------------------------------
]]--

Dv(" VGuide AutoQuest.lua Start")

VGuideAutoQuest = {}
VGuideAutoQuest.__index = VGuideAutoQuest

function VGuideAutoQuest:new(settings, display)
    local obj = {}
    setmetatable(obj, self)
    obj.settings = settings
    obj.display = display
    obj.frame = nil
    obj.guideQuests = {}  -- Cache of quest names from current guide
    return obj
end

function VGuideAutoQuest:Initialize()
    -- Create the event frame
    self.frame = CreateFrame("Frame", "VG_AutoQuestFrame", UIParent)
    
    -- Register quest dialog events
    self.frame:RegisterEvent("QUEST_DETAIL")      -- Quest offer dialog
    self.frame:RegisterEvent("QUEST_PROGRESS")    -- Turn-in check dialog
    self.frame:RegisterEvent("QUEST_COMPLETE")    -- Ready to complete
    self.frame:RegisterEvent("QUEST_ACCEPT_CONFIRM") -- Escort quest confirm
    self.frame:RegisterEvent("GOSSIP_SHOW")       -- NPC gossip with quest options
    
    local this = self
    self.frame:SetScript("OnEvent", function()
        this:OnEvent(event, arg1, arg2, arg3)
    end)
    
    -- Build initial quest cache
    self:RefreshGuideQuests()
    
    Di("      - Auto Quest initialized")
end

-- Get the AutoQuest settings
function VGuideAutoQuest:GetSettings()
    if self.settings and self.settings.db and self.settings.db.char then
        return self.settings.db.char.AutoQuest or {}
    end
    return {}
end

-- Check if auto-accept is enabled
function VGuideAutoQuest:IsAutoAcceptEnabled()
    local s = self:GetSettings()
    return s.Enable and s.AutoAccept
end

-- Check if auto-turn-in is enabled
function VGuideAutoQuest:IsAutoTurnInEnabled()
    local s = self:GetSettings()
    return s.Enable and s.AutoTurnIn
end

-- Check if we should skip reward choice quests
function VGuideAutoQuest:SkipRewardChoice()
    local s = self:GetSettings()
    return s.SkipRewardChoice ~= false  -- Default true
end

-- Check if notifications are enabled
function VGuideAutoQuest:ShowNotification()
    local s = self:GetSettings()
    return s.ShowNotification ~= false  -- Default true
end

-- Build cache of quest names from the current guide
function VGuideAutoQuest:RefreshGuideQuests()
    self.guideQuests = {}
    
    if not VGuide or not VGuide.GuideTable then return end
    
    local currentGuide = VGuide.GuideTable:GetGuide()
    if not currentGuide then return end
    
    for i, step in ipairs(currentGuide) do
        if step and step.text then
            -- Extract quest name from step text (format: "A Quest Name" or "T Quest Name" etc)
            local questName = self:ParseQuestName(step.text)
            if questName then
                self.guideQuests[questName] = true
            end
        end
    end
end

-- Parse quest name from step text
function VGuideAutoQuest:ParseQuestName(text)
    if not text or text == "" then return nil end
    
    -- Match patterns like "A Quest Name", "T Quest Name", "C Quest Name"
    -- A = Accept, T = Turn in, C = Complete
    local _, _, questName = string.find(text, "^[AaTtCc]%s+(.+)$")
    if questName then
        -- Clean up the quest name (remove coordinates, notes, etc)
        questName = string.gsub(questName, "%s*%(.*%)%s*$", "")
        questName = string.gsub(questName, "%s*%[.*%]%s*$", "")
        return questName
    end
    
    return nil
end

-- Check if a quest is in our guide
function VGuideAutoQuest:IsQuestInGuide(questTitle)
    if not questTitle then return false end
    
    -- Refresh cache if empty
    if not next(self.guideQuests) then
        self:RefreshGuideQuests()
    end
    
    -- Direct match
    if self.guideQuests[questTitle] then
        return true
    end
    
    -- Fuzzy match (in case of slight differences)
    local lowerTitle = string.lower(questTitle)
    for guideName, _ in pairs(self.guideQuests) do
        if string.lower(guideName) == lowerTitle then
            return true
        end
    end
    
    return false
end

-- Send notification to chat
function VGuideAutoQuest:Notify(message)
    if self:ShowNotification() then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r " .. message)
    end
end

-- Handle events
function VGuideAutoQuest:OnEvent(event, arg1, arg2, arg3)
    if event == "QUEST_DETAIL" then
        self:OnQuestDetail()
    elseif event == "QUEST_PROGRESS" then
        self:OnQuestProgress()
    elseif event == "QUEST_COMPLETE" then
        self:OnQuestComplete()
    elseif event == "QUEST_ACCEPT_CONFIRM" then
        self:OnQuestAcceptConfirm()
    elseif event == "GOSSIP_SHOW" then
        self:OnGossipShow()
    end
end

-- QUEST_DETAIL: Quest offer dialog opened
function VGuideAutoQuest:OnQuestDetail()
    if not self:IsAutoAcceptEnabled() then return end
    
    local questTitle = GetTitleText()
    if not questTitle then return end
    
    -- Check if quest is in our guide
    if self:IsQuestInGuide(questTitle) then
        self:Notify("Auto-accepting: " .. questTitle)
        AcceptQuest()
    end
end

-- QUEST_PROGRESS: Turn-in dialog (checking objectives)
function VGuideAutoQuest:OnQuestProgress()
    if not self:IsAutoTurnInEnabled() then return end
    
    local questTitle = GetTitleText()
    if not questTitle then return end
    
    -- Check if quest is in our guide and is completable
    if self:IsQuestInGuide(questTitle) and IsQuestCompletable() then
        self:Notify("Auto-progressing: " .. questTitle)
        CompleteQuest()
    end
end

-- QUEST_COMPLETE: Quest ready to be completed
function VGuideAutoQuest:OnQuestComplete()
    if not self:IsAutoTurnInEnabled() then return end
    
    local questTitle = GetTitleText()
    if not questTitle then return end
    
    -- Check if quest is in our guide
    if not self:IsQuestInGuide(questTitle) then return end
    
    -- Check for reward choices
    local numChoices = GetNumQuestChoices()
    if numChoices and numChoices > 1 then
        if self:SkipRewardChoice() then
            self:Notify("Manual reward selection needed: " .. questTitle)
            return  -- Let player choose reward
        end
    end
    
    -- Auto-complete (get first reward if only one choice)
    if numChoices and numChoices == 1 then
        GetQuestReward(1)
        self:Notify("Auto-completed: " .. questTitle)
    elseif not numChoices or numChoices == 0 then
        -- No reward choices, just complete
        GetQuestReward(0)
        self:Notify("Auto-completed: " .. questTitle)
    end
end

-- QUEST_ACCEPT_CONFIRM: Escort quest confirmation
function VGuideAutoQuest:OnQuestAcceptConfirm()
    if not self:IsAutoAcceptEnabled() then return end
    
    local questTitle = GetTitleText()
    if not questTitle then return end
    
    if self:IsQuestInGuide(questTitle) then
        self:Notify("Auto-confirming escort: " .. questTitle)
        ConfirmAcceptQuest()
    end
end

-- GOSSIP_SHOW: NPC gossip dialog with quest options
function VGuideAutoQuest:OnGossipShow()
    if not self:IsAutoAcceptEnabled() and not self:IsAutoTurnInEnabled() then return end
    
    -- Check for available quests to accept
    if self:IsAutoAcceptEnabled() then
        -- GetGossipAvailableQuests returns: title1, level1, title2, level2...
        local availableQuests = {GetGossipAvailableQuests()}
        for i = 1, getn(availableQuests), 2 do
            local title = availableQuests[i]
            if title and self:IsQuestInGuide(title) then
                self:Notify("Auto-selecting available quest: " .. title)
                -- Select the quest (1-indexed by quest number, not array index)
                SelectGossipAvailableQuest(math.floor(i/2) + 1)
                return  -- Only handle one at a time
            end
        end
    end
    
    -- Check for active quests to turn in
    if self:IsAutoTurnInEnabled() then
        -- GetGossipActiveQuests returns: title1, level1, isComplete1, title2...
        local activeQuests = {GetGossipActiveQuests()}
        for i = 1, getn(activeQuests), 3 do
            local title = activeQuests[i]
            local isComplete = activeQuests[i + 2]
            if title and isComplete and self:IsQuestInGuide(title) then
                self:Notify("Auto-selecting completed quest: " .. title)
                SelectGossipActiveQuest(math.floor(i/3) + 1)
                return  -- Only handle one at a time
            end
        end
    end
end

-- Toggle auto-accept
function VGuideAutoQuest:ToggleAutoAccept()
    local s = self:GetSettings()
    s.AutoAccept = not s.AutoAccept
    local status = s.AutoAccept and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Auto-accept " .. status)
end

-- Toggle auto-turn-in
function VGuideAutoQuest:ToggleAutoTurnIn()
    local s = self:GetSettings()
    s.AutoTurnIn = not s.AutoTurnIn
    local status = s.AutoTurnIn and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Auto-turn-in " .. status)
end

-- Toggle entire auto-quest system
function VGuideAutoQuest:Toggle()
    local s = self:GetSettings()
    s.Enable = not s.Enable
    local status = s.Enable and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Auto-quest " .. status)
end

-- Get status
function VGuideAutoQuest:IsEnabled()
    local s = self:GetSettings()
    return s.Enable
end

Dv(" VGuide AutoQuest.lua End")
