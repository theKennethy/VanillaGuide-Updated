--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestOverview.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    pfQuest-style quest overview frame showing all
    current quests with objectives and progress.
------------------------------------------------------
]]--

Dv(" VGuide QuestOverview.lua Start")

VGuideQuestOverview = {}
VGuideQuestOverview.frame = nil
VGuideQuestOverview.enabled = true
VGuideQuestOverview.collapsed = {}  -- Track collapsed quests
VGuideQuestOverview.questLines = {} -- Track quest line frames

-- Configuration
VGuideQuestOverview.config = {
    width = 250,
    maxHeight = 400,
    fontSize = 11,
    titleFontSize = 12,
    bgAlpha = 0.7,
    showHeader = true,
    showObjectives = true,
    showCompleted = false,  -- Show completed objectives grayed out
    anchorPoint = "TOPRIGHT",
    offsetX = -20,
    offsetY = -200,
}

function VGuideQuestOverview:Initialize()
    if self.frame then return end
    
    -- Create main frame
    self.frame = CreateFrame("Frame", "VGuideQuestOverviewFrame", UIParent)
    self.frame:SetWidth(self.config.width)
    self.frame:SetHeight(100)  -- Will be adjusted dynamically
    self.frame:SetPoint(self.config.anchorPoint, UIParent, self.config.anchorPoint, self.config.offsetX, self.config.offsetY)
    self.frame:SetMovable(true)
    self.frame:EnableMouse(true)
    self.frame:SetClampedToScreen(true)
    self.frame:SetFrameStrata("MEDIUM")
    
    -- Background
    self.frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    self.frame:SetBackdropColor(0, 0, 0, self.config.bgAlpha)
    self.frame:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
    
    -- Make draggable
    self.frame:RegisterForDrag("LeftButton")
    self.frame:SetScript("OnDragStart", function()
        this:StartMoving()
    end)
    self.frame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
    end)
    
    -- Header
    if self.config.showHeader then
        self.header = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        self.header:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 8, -6)
        self.header:SetText("|cFF00CCFFQuest Tracker|r")
        self.header:SetFont("Fonts\\FRIZQT__.TTF", self.config.titleFontSize, "OUTLINE")
    end
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, self.frame)
    closeBtn:SetWidth(16)
    closeBtn:SetHeight(16)
    closeBtn:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -4, -4)
    closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeBtn:SetScript("OnClick", function()
        VGuideQuestOverview:Toggle()
    end)
    
    -- Content frame (scrollable area)
    self.content = CreateFrame("Frame", nil, self.frame)
    self.content:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 6, -22)
    self.content:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -6, 6)
    
    -- Register events
    self.frame:RegisterEvent("QUEST_LOG_UPDATE")
    self.frame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
    self.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    
    self.frame:SetScript("OnEvent", function()
        VGuideQuestOverview:Update()
    end)
    
    -- Initial update
    self:Update()
    
    Di("      - Quest Overview initialized")
end

function VGuideQuestOverview:Update()
    if not self.frame or not self.enabled then return end
    
    -- Clear existing quest lines
    for i = 1, table.getn(self.questLines) do
        if self.questLines[i] then
            self.questLines[i]:Hide()
        end
    end
    self.questLines = {}
    
    local yOffset = 0
    local numEntries = GetNumQuestLogEntries()
    local currentHeader = nil
    local lineIndex = 0
    
    for questIndex = 1, numEntries do
        local title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questIndex)
        
        if isHeader then
            -- Zone header
            currentHeader = title
            lineIndex = lineIndex + 1
            local headerLine = self:GetOrCreateLine(lineIndex)
            headerLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, -yOffset)
            headerLine.text:SetText("|cFFFFFF00" .. title .. "|r")
            headerLine.text:SetFont("Fonts\\FRIZQT__.TTF", self.config.fontSize, "OUTLINE")
            headerLine:Show()
            yOffset = yOffset + 14
        else
            -- Quest entry
            lineIndex = lineIndex + 1
            local questLine = self:GetOrCreateLine(lineIndex)
            questLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 4, -yOffset)
            
            -- Quest title with level
            local levelColor = self:GetDifficultyColor(level)
            local questColor = "|cFFFFFFFF"
            local statusIcon = ""
            
            if isComplete then
                questColor = "|cFF00FF00"
                statusIcon = "|cFFFFCC00?|r "
            end
            
            local displayTitle = statusIcon .. questColor .. "[" .. level .. "] " .. title .. "|r"
            questLine.text:SetText(displayTitle)
            questLine.text:SetFont("Fonts\\FRIZQT__.TTF", self.config.fontSize, "OUTLINE")
            questLine:Show()
            
            -- Store quest index for click handling
            questLine.questIndex = questIndex
            questLine:SetScript("OnMouseUp", function()
                -- Toggle objectives visibility
                local qIdx = this.questIndex
                if VGuideQuestOverview.collapsed[qIdx] then
                    VGuideQuestOverview.collapsed[qIdx] = nil
                else
                    VGuideQuestOverview.collapsed[qIdx] = true
                end
                VGuideQuestOverview:Update()
            end)
            
            yOffset = yOffset + 14
            
            -- Show objectives if not collapsed
            if self.config.showObjectives and not self.collapsed[questIndex] then
                local numObjectives = GetNumQuestLeaderBoards(questIndex)
                
                for objIndex = 1, numObjectives do
                    local text, objType, finished = GetQuestLogLeaderBoard(objIndex, questIndex)
                    if text then
                        lineIndex = lineIndex + 1
                        local objLine = self:GetOrCreateLine(lineIndex)
                        objLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 12, -yOffset)
                        
                        local objColor = "|cFFAAAAAA"
                        if finished then
                            objColor = "|cFF00FF00"
                            if not self.config.showCompleted then
                                -- Skip completed objectives
                                lineIndex = lineIndex - 1
                            else
                                objLine.text:SetText(objColor .. "- " .. text .. "|r")
                                objLine.text:SetFont("Fonts\\FRIZQT__.TTF", self.config.fontSize - 1, "")
                                objLine:Show()
                                yOffset = yOffset + 12
                            end
                        else
                            objLine.text:SetText(objColor .. "- " .. text .. "|r")
                            objLine.text:SetFont("Fonts\\FRIZQT__.TTF", self.config.fontSize - 1, "")
                            objLine:Show()
                            yOffset = yOffset + 12
                        end
                    end
                end
            end
        end
    end
    
    -- Adjust frame height
    local totalHeight = yOffset + 28  -- Add padding for header and bottom
    if totalHeight < 50 then totalHeight = 50 end
    if totalHeight > self.config.maxHeight then totalHeight = self.config.maxHeight end
    self.frame:SetHeight(totalHeight)
    
    -- Show "No quests" if empty
    if numEntries == 0 or lineIndex == 0 then
        lineIndex = lineIndex + 1
        local emptyLine = self:GetOrCreateLine(lineIndex)
        emptyLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 4, 0)
        emptyLine.text:SetText("|cFF888888No active quests|r")
        emptyLine:Show()
        self.frame:SetHeight(50)
    end
end

function VGuideQuestOverview:GetOrCreateLine(index)
    if self.questLines[index] then
        return self.questLines[index]
    end
    
    local line = CreateFrame("Frame", nil, self.content)
    line:SetWidth(self.config.width - 20)
    line:SetHeight(14)
    line:EnableMouse(true)
    
    line.text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line.text:SetPoint("LEFT", line, "LEFT", 0, 0)
    line.text:SetJustifyH("LEFT")
    line.text:SetWidth(self.config.width - 24)
    
    -- Highlight on hover
    line:SetScript("OnEnter", function()
        if this.questIndex then
            this.text:SetTextColor(1, 1, 0.5)
        end
    end)
    line:SetScript("OnLeave", function()
        if this.questIndex then
            this.text:SetTextColor(1, 1, 1)
        end
    end)
    
    self.questLines[index] = line
    return line
end

function VGuideQuestOverview:GetDifficultyColor(questLevel)
    local playerLevel = UnitLevel("player")
    local diff = questLevel - playerLevel
    
    if diff >= 5 then
        return "|cFFFF0000"  -- Red
    elseif diff >= 3 then
        return "|cFFFF8000"  -- Orange
    elseif diff >= -2 then
        return "|cFFFFFF00"  -- Yellow
    elseif diff >= -playerLevel * 0.2 then
        return "|cFF00FF00"  -- Green
    else
        return "|cFF808080"  -- Gray
    end
end

function VGuideQuestOverview:Toggle()
    if not self.frame then
        self:Initialize()
    end
    
    self.enabled = not self.enabled
    
    if self.enabled then
        self.frame:Show()
        self:Update()
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest Overview shown")
    else
        self.frame:Hide()
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest Overview hidden")
    end
end

function VGuideQuestOverview:Show()
    if not self.frame then
        self:Initialize()
    end
    self.enabled = true
    self.frame:Show()
    self:Update()
end

function VGuideQuestOverview:Hide()
    if self.frame then
        self.enabled = false
        self.frame:Hide()
    end
end

-- Initialize on load
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:SetScript("OnEvent", function()
    this:UnregisterAllEvents()
    -- Delay initialization slightly
    local delayFrame = CreateFrame("Frame")
    delayFrame.elapsed = 0
    delayFrame:SetScript("OnUpdate", function()
        this.elapsed = this.elapsed + arg1
        if this.elapsed > 1.5 then
            this:Hide()
            VGuideQuestOverview:Initialize()
        end
    end)
end)

Dv(" VGuide QuestOverview.lua End")
