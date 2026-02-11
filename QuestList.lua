--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestList.lua
Authors: VanillaGuide Contributors
Version: 1.06.0
------------------------------------------------------
Description: 
    Pop-out quest list that shows quests from the current
    guide that are in your quest log. Click a quest to
    set the waypoint arrow to that quest's step.
------------------------------------------------------
]]--

Dv(" VGuide QuestList.lua Start")

VGuideQuestList = {}
VGuideQuestList.__index = VGuideQuestList

-- Constants
local FRAME_WIDTH = 220
local FRAME_HEIGHT = 300
local ENTRY_HEIGHT = 24
local MAX_VISIBLE_QUESTS = 10

function VGuideQuestList:new(oSettings, oDisplay)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.Display = oDisplay
    obj.quests = {}  -- List of quests from guide that are in quest log
    obj.visible = false
    
    ---------------------------------------
    -- Frame Creation
    ---------------------------------------
    
    local function CreateQuestListFrame()
        local frame = CreateFrame("Frame", "VGuideQuestListFrame", UIParent)
        frame:SetWidth(FRAME_WIDTH)
        frame:SetHeight(FRAME_HEIGHT)
        frame:SetPoint("LEFT", UIParent, "CENTER", 200, 0)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", function() this:StartMoving() end)
        frame:SetScript("OnDragStop", function() 
            this:StopMovingOrSizing()
            -- Save position
            local point, _, relPoint, xOfs, yOfs = this:GetPoint()
            if obj.Settings and obj.Settings.db and obj.Settings.db.char then
                obj.Settings.db.char.QuestList = obj.Settings.db.char.QuestList or {}
                obj.Settings.db.char.QuestList.point = point
                obj.Settings.db.char.QuestList.relPoint = relPoint
                obj.Settings.db.char.QuestList.x = xOfs
                obj.Settings.db.char.QuestList.y = yOfs
            end
        end)
        frame:SetFrameStrata("HIGH")
        frame:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        frame:SetBackdropColor(0.1, 0.1, 0.1, 0.9)
        frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
        frame:Hide()
        
        -- Title bar
        local titleBar = CreateFrame("Frame", nil, frame)
        titleBar:SetHeight(24)
        titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
        titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
        titleBar:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        })
        titleBar:SetBackdropColor(0.2, 0.4, 0.6, 0.8)
        frame.titleBar = titleBar
        
        -- Title text
        local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        titleText:SetPoint("LEFT", titleBar, "LEFT", 8, 0)
        titleText:SetTextColor(1, 0.82, 0)
        titleText:SetText("Quest List")
        frame.titleText = titleText
        
        -- Close button
        local closeBtn = CreateFrame("Button", nil, frame)
        closeBtn:SetWidth(18)
        closeBtn:SetHeight(18)
        closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
        closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
        closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
        closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
        closeBtn:SetScript("OnClick", function()
            obj:Hide()
        end)
        frame.closeBtn = closeBtn
        
        -- Refresh button
        local refreshBtn = CreateFrame("Button", nil, frame)
        refreshBtn:SetWidth(18)
        refreshBtn:SetHeight(18)
        refreshBtn:SetPoint("RIGHT", closeBtn, "LEFT", -2, 0)
        refreshBtn:SetNormalTexture("Interface\\Buttons\\UI-RefreshButton")
        refreshBtn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
        refreshBtn:SetScript("OnClick", function()
            obj:Refresh()
        end)
        refreshBtn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
            GameTooltip:SetText("Refresh quest list")
            GameTooltip:Show()
        end)
        refreshBtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        frame.refreshBtn = refreshBtn
        
        -- Scroll frame for quest entries
        local scrollFrame = CreateFrame("ScrollFrame", "VGuideQuestListScrollFrame", frame, "FauxScrollFrameTemplate")
        scrollFrame:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 4, -4)
        scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -26, 8)
        scrollFrame:SetScript("OnVerticalScroll", function()
            FauxScrollFrame_OnVerticalScroll(ENTRY_HEIGHT, function() obj:UpdateScrollFrame() end)
        end)
        frame.scrollFrame = scrollFrame
        
        -- Create quest entry buttons
        frame.questButtons = {}
        for i = 1, MAX_VISIBLE_QUESTS do
            local btn = CreateFrame("Button", "VGuideQuestListEntry"..i, frame)
            btn:SetWidth(FRAME_WIDTH - 30)
            btn:SetHeight(ENTRY_HEIGHT)
            btn:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, -((i-1) * ENTRY_HEIGHT))
            
            -- Background
            local bg = btn:CreateTexture(nil, "BACKGROUND")
            bg:SetAllPoints()
            bg:SetTexture(0.2, 0.2, 0.2, 0.5)
            btn.bg = bg
            
            -- Status icon (checkbox-like)
            local statusIcon = btn:CreateTexture(nil, "ARTWORK")
            statusIcon:SetWidth(16)
            statusIcon:SetHeight(16)
            statusIcon:SetPoint("LEFT", btn, "LEFT", 4, 0)
            btn.statusIcon = statusIcon
            
            -- Quest name text
            local questText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            questText:SetPoint("LEFT", statusIcon, "RIGHT", 4, 0)
            questText:SetPoint("RIGHT", btn, "RIGHT", -4, 0)
            questText:SetJustifyH("LEFT")
            questText:SetTextColor(1, 1, 1)
            btn.questText = questText
            
            -- Progress text (small, below quest name)
            local progressText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            progressText:SetPoint("BOTTOMLEFT", questText, "BOTTOMLEFT", 0, -10)
            progressText:SetJustifyH("LEFT")
            progressText:SetTextColor(0.7, 0.7, 0.7)
            progressText:SetFont("Fonts\\FRIZQT__.TTF", 9)
            btn.progressText = progressText
            
            -- Click handler
            btn:SetScript("OnClick", function()
                if this.questData then
                    obj:OnQuestClick(this.questData)
                end
            end)
            
            -- Hover effects
            btn:SetScript("OnEnter", function()
                this.bg:SetTexture(0.3, 0.4, 0.5, 0.7)
                if this.questData and this.questData.stepText then
                    GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
                    GameTooltip:SetText(this.questData.questName, 1, 0.82, 0)
                    GameTooltip:AddLine(this.questData.stepText, 1, 1, 1, true)
                    if this.questData.zone then
                        GameTooltip:AddLine(" ")
                        GameTooltip:AddLine("Zone: " .. this.questData.zone, 0.5, 0.8, 1)
                    end
                    if this.questData.x and this.questData.y then
                        GameTooltip:AddLine("Coords: " .. this.questData.x .. ", " .. this.questData.y, 0.5, 0.8, 1)
                    end
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine("Click to set waypoint", 0, 1, 0)
                    GameTooltip:Show()
                end
            end)
            btn:SetScript("OnLeave", function()
                this.bg:SetTexture(0.2, 0.2, 0.2, 0.5)
                GameTooltip:Hide()
            end)
            
            btn:Hide()
            frame.questButtons[i] = btn
        end
        
        -- No quests text
        local noQuestsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        noQuestsText:SetPoint("CENTER", scrollFrame, "CENTER", 0, 0)
        noQuestsText:SetTextColor(0.6, 0.6, 0.6)
        noQuestsText:SetText("No active quests from guide")
        noQuestsText:Hide()
        frame.noQuestsText = noQuestsText
        
        -- Quest count text
        local countText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        countText:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, 4)
        countText:SetTextColor(0.7, 0.7, 0.7)
        countText:SetText("0 quests")
        frame.countText = countText
        
        return frame
    end
    
    obj.frame = CreateQuestListFrame()
    
    ---------------------------------------
    -- Quest Parsing
    ---------------------------------------
    
    -- Parse quest name from step text
    obj.ParseQuestName = function(self, stepText)
        if not stepText then return nil end
        
        local questName = nil
        local _
        
        -- Look for quest names in VanillaGuide format
        -- After colorization: |c0000ffff"Quest Name"|r
        _, _, questName = string.find(stepText, '|c0000ffff"([^"]+)"')
        if not questName then
            _, _, questName = string.find(stepText, '|c000079d2"([^"]+)"')
        end
        if not questName then
            _, _, questName = string.find(stepText, '|c0000ff00"([^"]+)"')
        end
        
        -- Original format: #ACCEPT"Quest Name"#
        if not questName then
            _, _, questName = string.find(stepText, '#ACCEPT"([^"]+)"')
        end
        if not questName then
            _, _, questName = string.find(stepText, '#DOQUEST"([^"]+)"')
        end
        if not questName then
            _, _, questName = string.find(stepText, '#TURNIN"([^"]+)"')
        end
        
        return questName
    end
    
    -- Check if quest is in player's quest log
    obj.IsQuestInLog = function(self, questName)
        if not questName then return false, nil, nil end
        
        local numEntries = GetNumQuestLogEntries()
        for i = 1, numEntries do
            local title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
            if not isHeader and title then
                if string.lower(title) == string.lower(questName) then
                    -- Get progress percentage
                    local progress = 0
                    local numObjectives = GetNumQuestLeaderBoards(i)
                    if numObjectives and numObjectives > 0 then
                        local completed = 0
                        for j = 1, numObjectives do
                            local text, type, finished = GetQuestLogLeaderBoard(j, i)
                            if finished then
                                completed = completed + 1
                            end
                        end
                        progress = math.floor((completed / numObjectives) * 100)
                    elseif isComplete then
                        progress = 100
                    end
                    return true, progress, isComplete
                end
            end
        end
        return false, nil, nil
    end
    
    -- Scan current guide for quests in the player's log
    obj.ScanGuideForQuests = function(self)
        obj.quests = {}
        
        if not obj.Display then return end
        
        -- Get all steps from current guide
        local guideTable = obj.Display:GetGuideTable()
        if not guideTable then return end
        
        local currentGuideId = obj.Display:GetCurrentGuideID()
        if not currentGuideId then return end
        
        local guide = guideTable:GetGuideByID(currentGuideId)
        if not guide or not guide.steps then return end
        
        -- Scan each step for quests
        for stepNum, stepData in ipairs(guide.steps) do
            local stepText = stepData.label or stepData.text or ""
            local questName = obj:ParseQuestName(stepText)
            
            if questName then
                local inLog, progress, isComplete = obj:IsQuestInLog(questName)
                if inLog then
                    -- Check if we already have this quest (avoid duplicates)
                    local isDuplicate = false
                    for _, q in ipairs(obj.quests) do
                        if q.questName == questName then
                            isDuplicate = true
                            break
                        end
                    end
                    
                    if not isDuplicate then
                        table.insert(obj.quests, {
                            questName = questName,
                            stepNum = stepNum,
                            stepText = stepText,
                            progress = progress,
                            isComplete = isComplete,
                            x = stepData.x,
                            y = stepData.y,
                            zone = stepData.zone,
                        })
                    end
                end
            end
        end
        
        Dv("    QuestList: Found " .. getn(obj.quests) .. " active quests from guide")
    end
    
    ---------------------------------------
    -- UI Updates
    ---------------------------------------
    
    obj.UpdateScrollFrame = function(self)
        local numQuests = getn(obj.quests)
        
        FauxScrollFrame_Update(obj.frame.scrollFrame, numQuests, MAX_VISIBLE_QUESTS, ENTRY_HEIGHT)
        
        local offset = FauxScrollFrame_GetOffset(obj.frame.scrollFrame)
        
        for i = 1, MAX_VISIBLE_QUESTS do
            local btn = obj.frame.questButtons[i]
            local questIndex = i + offset
            
            if questIndex <= numQuests then
                local quest = obj.quests[questIndex]
                btn.questData = quest
                
                -- Set quest name (truncate if too long)
                local displayName = quest.questName
                if string.len(displayName) > 25 then
                    displayName = string.sub(displayName, 1, 22) .. "..."
                end
                btn.questText:SetText(displayName)
                
                -- Set status icon and color based on completion
                if quest.isComplete then
                    btn.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
                    btn.questText:SetTextColor(0.2, 1, 0.2)  -- Green
                    btn.progressText:SetText("Ready to turn in!")
                    btn.progressText:SetTextColor(0, 1, 0)
                elseif quest.progress and quest.progress > 0 then
                    btn.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Waiting")
                    btn.questText:SetTextColor(1, 0.82, 0)  -- Yellow/Gold
                    btn.progressText:SetText(quest.progress .. "% complete")
                    btn.progressText:SetTextColor(0.8, 0.8, 0.4)
                else
                    btn.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
                    btn.questText:SetTextColor(1, 1, 1)  -- White
                    btn.progressText:SetText("In progress")
                    btn.progressText:SetTextColor(0.6, 0.6, 0.6)
                end
                
                btn:Show()
            else
                btn.questData = nil
                btn:Hide()
            end
        end
        
        -- Show/hide "no quests" message
        if numQuests == 0 then
            obj.frame.noQuestsText:Show()
        else
            obj.frame.noQuestsText:Hide()
        end
        
        -- Update count text
        obj.frame.countText:SetText(numQuests .. " quest" .. (numQuests == 1 and "" or "s"))
    end
    
    obj.Refresh = function(self)
        obj:ScanGuideForQuests()
        obj:UpdateScrollFrame()
        Dv("    QuestList: Refreshed")
    end
    
    ---------------------------------------
    -- Quest Click Handler
    ---------------------------------------
    
    obj.OnQuestClick = function(self, questData)
        if not questData then return end
        
        Dv("    QuestList: Clicked quest: " .. questData.questName)
        
        -- Set the waypoint arrow if we have coordinates
        if questData.x and questData.y and questData.zone then
            if VGuideWaypointArrow then
                VGuideWaypointArrow:SetWaypoint(
                    questData.x, 
                    questData.y, 
                    questData.zone, 
                    questData.questName,
                    questData.stepText
                )
                Di("Arrow set to: " .. questData.questName)
            end
        else
            Di("No coordinates for: " .. questData.questName)
        end
        
        -- Optionally jump to that step in the guide
        if questData.stepNum and obj.Display then
            obj.Display:StepByID(questData.stepNum)
            -- Refresh main frame if it exists
            if VGuide and VGuide.UI and VGuide.UI.MainFrame then
                VGuide.UI.MainFrame:RefreshData()
            end
        end
    end
    
    ---------------------------------------
    -- Show/Hide/Toggle
    ---------------------------------------
    
    obj.Show = function(self)
        obj:Refresh()
        obj.frame:Show()
        obj.visible = true
    end
    
    obj.Hide = function(self)
        obj.frame:Hide()
        obj.visible = false
    end
    
    obj.Toggle = function(self)
        if obj.visible then
            obj:Hide()
        else
            obj:Show()
        end
    end
    
    obj.IsVisible = function(self)
        return obj.visible
    end
    
    ---------------------------------------
    -- Position Restore
    ---------------------------------------
    
    obj.RestorePosition = function(self)
        if obj.Settings and obj.Settings.db and obj.Settings.db.char and obj.Settings.db.char.QuestList then
            local saved = obj.Settings.db.char.QuestList
            if saved.point and saved.relPoint then
                obj.frame:ClearAllPoints()
                obj.frame:SetPoint(saved.point, UIParent, saved.relPoint, saved.x or 0, saved.y or 0)
            end
        end
    end
    
    ---------------------------------------
    -- Initialization
    ---------------------------------------
    
    obj.Initialize = function(self)
        obj:RestorePosition()
        Dv("    QuestList: Initialized")
    end
    
    return obj
end

Dv(" VGuide QuestList.lua End")
