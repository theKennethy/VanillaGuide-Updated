--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestOverview.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Moveable quest tracker showing all active quests
    with objectives and progress.
------------------------------------------------------
]]--

Dv(" VGuide QuestOverview.lua Start")

VGuideQuestOverview = {}
VGuideQuestOverview.frame = nil
VGuideQuestOverview.enabled = true
VGuideQuestOverview.collapsed = {}  -- Track collapsed quests

-- Configuration
VGuideQuestOverview.config = {
    width = 220,
    fontSize = 10,
    titleFontSize = 11,
    bgAlpha = 0.6,
    anchorPoint = "TOPRIGHT",
    offsetX = -20,
    offsetY = -200,
}

function VGuideQuestOverview:Initialize()
    if self.frame then return end
    
    -- Hide the default WoW quest tracker
    if QuestWatchFrame then
        QuestWatchFrame:Hide()
        QuestWatchFrame:UnregisterAllEvents()
    end
    
    -- Create main frame
    self.frame = CreateFrame("Frame", "VGuideQuestOverviewFrame", UIParent)
    self.frame:SetWidth(self.config.width)
    self.frame:SetHeight(50)
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
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    self.frame:SetBackdropColor(0, 0, 0, self.config.bgAlpha)
    self.frame:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
    
    -- Title bar for dragging
    local titleBar = CreateFrame("Frame", nil, self.frame)
    titleBar:SetHeight(16)
    titleBar:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 4, -4)
    titleBar:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -4, -4)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function()
        VGuideQuestOverview.frame:StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function()
        VGuideQuestOverview.frame:StopMovingOrSizing()
    end)
    
    -- Title text
    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    title:SetPoint("LEFT", titleBar, "LEFT", 0, 0)
    title:SetText("|cFFFFD100Quest Tracker|r")
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, self.frame)
    closeBtn:SetWidth(12)
    closeBtn:SetHeight(12)
    closeBtn:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -6, -6)
    closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeBtn:SetScript("OnClick", function()
        VGuideQuestOverview:Toggle()
    end)
    
    -- Content frame (scrollable area for quests)
    self.content = CreateFrame("Frame", nil, self.frame)
    self.content:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 6, -22)
    self.content:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -6, 6)
    
    -- Register events
    self.frame:RegisterEvent("QUEST_LOG_UPDATE")
    self.frame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
    self.frame:SetScript("OnEvent", function()
        VGuideQuestOverview:Update()
    end)
    
    -- Initial update
    self:Update()
    
    if not self.enabled then
        self.frame:Hide()
    end
    
    Di("      - Quest Tracker initialized")
end

function VGuideQuestOverview:Update()
    if not self.frame or not self.content then return end
    if not self.enabled then return end
    
    -- Clear existing content
    local children = { self.content:GetChildren() }
    for i = 1, table.getn(children) do
        if children[i] then
            children[i]:Hide()
            children[i]:SetParent(nil)
        end
    end
    
    local yOffset = 0
    local numEntries = GetNumQuestLogEntries()
    local questCount = 0
    
    for questIndex = 1, numEntries do
        local title, level, _, isHeader, _, isComplete = GetQuestLogTitle(questIndex)
        
        if not isHeader and title then
            questCount = questCount + 1
            
            -- Quest title line
            local questLine = self.content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            questLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, yOffset)
            questLine:SetWidth(self.config.width - 16)
            questLine:SetJustifyH("LEFT")
            
            -- Color by difficulty
            local playerLevel = UnitLevel("player")
            local levelDiff = level - playerLevel
            local r, g, b = 1, 0.82, 0
            if levelDiff >= 5 then
                r, g, b = 1, 0.1, 0.1  -- Red
            elseif levelDiff >= 3 then
                r, g, b = 1, 0.5, 0.25  -- Orange
            elseif levelDiff >= -2 then
                r, g, b = 1, 1, 0  -- Yellow
            elseif levelDiff >= -8 then
                r, g, b = 0.25, 1, 0.25  -- Green
            else
                r, g, b = 0.5, 0.5, 0.5  -- Gray
            end
            
            local prefix = isComplete and "|cFF00FF00[Done]|r " or ""
            questLine:SetText(prefix .. "[" .. level .. "] " .. title)
            questLine:SetTextColor(r, g, b)
            
            yOffset = yOffset - 12
            
            -- Show objectives if not collapsed
            if not self.collapsed[questIndex] then
                local numObjectives = GetNumQuestLeaderBoards(questIndex)
                for objIndex = 1, numObjectives do
                    local text, objType, finished = GetQuestLogLeaderBoard(objIndex, questIndex)
                    if text then
                        local objLine = self.content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                        objLine:SetPoint("TOPLEFT", self.content, "TOPLEFT", 10, yOffset)
                        objLine:SetWidth(self.config.width - 26)
                        objLine:SetJustifyH("LEFT")
                        
                        if finished then
                            objLine:SetText("- " .. text)
                            objLine:SetTextColor(0.2, 1, 0.2)
                        else
                            objLine:SetText("- " .. text)
                            objLine:SetTextColor(0.7, 0.7, 0.7)
                        end
                        
                        yOffset = yOffset - 11
                    end
                end
            end
            
            yOffset = yOffset - 3  -- Space between quests
        end
    end
    
    -- Update frame height based on content
    local contentHeight = math.abs(yOffset) + 28
    contentHeight = math.max(contentHeight, 40)
    contentHeight = math.min(contentHeight, 400)  -- Max height
    self.frame:SetHeight(contentHeight)
    
    -- Show "No quests" if empty
    if questCount == 0 then
        local emptyText = self.content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        emptyText:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, 0)
        emptyText:SetText("No active quests")
        emptyText:SetTextColor(0.5, 0.5, 0.5)
        self.frame:SetHeight(45)
    end
end

function VGuideQuestOverview:Toggle()
    self.enabled = not self.enabled
    if self.frame then
        if self.enabled then
            self.frame:Show()
            self:Update()
        else
            self.frame:Hide()
        end
    end
    local status = self.enabled and "shown" or "hidden"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest tracker " .. status)
end

function VGuideQuestOverview:Show()
    self.enabled = true
    if self.frame then
        self.frame:Show()
        self:Update()
    end
end

function VGuideQuestOverview:Hide()
    self.enabled = false
    if self.frame then
        self.frame:Hide()
    end
end

-- Initialize when addon loads
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:SetScript("OnEvent", function()
    this:UnregisterAllEvents()
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
