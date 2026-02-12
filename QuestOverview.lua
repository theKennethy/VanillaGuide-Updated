--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestOverview.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Moveable, scrollable quest tracker showing all 
    active quests with objectives and progress.
    Lua 5.0 compatible for WoW 1.12.
------------------------------------------------------
]]--

Dv(" VGuide QuestOverview.lua Start")

VGuideQuestOverview = {}
VGuideQuestOverview.frame = nil
VGuideQuestOverview.scrollFrame = nil
VGuideQuestOverview.scrollChild = nil
VGuideQuestOverview.enabled = true
VGuideQuestOverview.questLines = {}  -- Reusable font strings

-- Configuration
VGuideQuestOverview.config = {
    width = 260,
    height = 320,
    maxHeight = 450,
    minHeight = 80,
    lineHeight = 16,
    objLineHeight = 14,
    questSpacing = 4,
    bgAlpha = 0.8,
    anchorPoint = "TOPRIGHT",
    offsetX = -25,
    offsetY = -180,
}

function VGuideQuestOverview:Initialize()
    if self.frame then return end
    
    -- Hide the default WoW quest tracker permanently
    if QuestWatchFrame then
        QuestWatchFrame:Hide()
        QuestWatchFrame:UnregisterAllEvents()
        QuestWatchFrame.Show = function() end
        if QuestWatchFrameHeader then
            QuestWatchFrameHeader:Hide()
        end
    end
    if QuestWatch_Update then
        QuestWatch_Update = function() end
    end
    
    -- Main frame
    self.frame = CreateFrame("Frame", "VGuideQuestOverviewFrame", UIParent)
    self.frame:SetWidth(self.config.width)
    self.frame:SetHeight(self.config.height)
    self.frame:SetPoint(self.config.anchorPoint, UIParent, self.config.anchorPoint, self.config.offsetX, self.config.offsetY)
    self.frame:SetMovable(true)
    self.frame:EnableMouse(true)
    self.frame:SetClampedToScreen(true)
    self.frame:SetFrameStrata("MEDIUM")
    self.frame:SetFrameLevel(10)
    
    -- Background
    self.frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 14,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    self.frame:SetBackdropColor(0.05, 0.05, 0.08, self.config.bgAlpha)
    self.frame:SetBackdropBorderColor(0.3, 0.3, 0.35, 0.9)
    
    -- Title bar (draggable)
    local titleBar = CreateFrame("Frame", nil, self.frame)
    titleBar:SetHeight(20)
    titleBar:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", 0, 0)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function()
        VGuideQuestOverview.frame:StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function()
        VGuideQuestOverview.frame:StopMovingOrSizing()
    end)
    
    -- Title text
    local title = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 10, -6)
    title:SetText("|cFFFFD100Quest Tracker|r")
    title:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, self.frame, "UIPanelCloseButton")
    closeBtn:SetWidth(20)
    closeBtn:SetHeight(20)
    closeBtn:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -2, -2)
    closeBtn:SetScript("OnClick", function()
        VGuideQuestOverview:Toggle()
    end)
    
    -- Scroll frame
    self.scrollFrame = CreateFrame("ScrollFrame", "VGuideQuestOverviewScrollFrame", self.frame, "UIPanelScrollFrameTemplate")
    self.scrollFrame:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 8, -26)
    self.scrollFrame:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -28, 8)
    
    -- Scroll child (content holder)
    self.scrollChild = CreateFrame("Frame", nil, self.scrollFrame)
    self.scrollChild:SetWidth(self.config.width - 36)
    self.scrollChild:SetHeight(1)  -- Will be adjusted dynamically
    self.scrollFrame:SetScrollChild(self.scrollChild)
    
    -- Mouse wheel scrolling
    self.frame:EnableMouseWheel(true)
    self.frame:SetScript("OnMouseWheel", function()
        local scrollBar = getglobal("VGuideQuestOverviewScrollFrameScrollBar")
        if scrollBar then
            local current = scrollBar:GetValue()
            local min, max = scrollBar:GetMinMaxValues()
            local step = 40
            if arg1 > 0 then
                scrollBar:SetValue(math.max(current - step, min))
            else
                scrollBar:SetValue(math.min(current + step, max))
            end
        end
    end)
    
    -- Resize handle
    local resizeHandle = CreateFrame("Frame", nil, self.frame)
    resizeHandle:SetWidth(16)
    resizeHandle:SetHeight(16)
    resizeHandle:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -2, 2)
    resizeHandle:EnableMouse(true)
    
    local resizeTexture = resizeHandle:CreateTexture(nil, "OVERLAY")
    resizeTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeTexture:SetAllPoints(resizeHandle)
    
    resizeHandle:SetScript("OnMouseDown", function()
        VGuideQuestOverview.frame:StartSizing("BOTTOMRIGHT")
    end)
    resizeHandle:SetScript("OnMouseUp", function()
        VGuideQuestOverview.frame:StopMovingOrSizing()
        VGuideQuestOverview:Update()
    end)
    
    self.frame:SetResizable(true)
    self.frame:SetMinResize(180, self.config.minHeight)
    self.frame:SetMaxResize(400, self.config.maxHeight)
    
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
    
    Di("      - Quest Tracker initialized (scrollable)")
end

function VGuideQuestOverview:GetOrCreateLine(index, lineType)
    local key = lineType .. index
    if not self.questLines[key] then
        local fontString = self.scrollChild:CreateFontString(nil, "OVERLAY")
        fontString:SetFont("Fonts\\FRIZQT__.TTF", 11, "")
        fontString:SetJustifyH("LEFT")
        -- Note: SetWordWrap may not exist in 1.12, so we skip it
        self.questLines[key] = fontString
    end
    return self.questLines[key]
end

function VGuideQuestOverview:HideAllLines()
    for key, line in pairs(self.questLines) do
        if line and line.Hide then
            line:Hide()
        end
    end
end

function VGuideQuestOverview:Update()
    if not self.frame or not self.scrollChild then return end
    if not self.enabled then return end
    
    self:HideAllLines()
    
    local yOffset = 0
    local lineIndex = 0
    local numEntries = GetNumQuestLogEntries()
    local questCount = 0
    local contentWidth = self.scrollChild:GetWidth()
    
    for questIndex = 1, numEntries do
        local title, level, _, isHeader, _, isComplete = GetQuestLogTitle(questIndex)
        
        if not isHeader and title then
            questCount = questCount + 1
            lineIndex = lineIndex + 1
            
            -- Quest title
            local questLine = self:GetOrCreateLine(lineIndex, "quest")
            questLine:ClearAllPoints()
            questLine:SetPoint("TOPLEFT", self.scrollChild, "TOPLEFT", 0, yOffset)
            questLine:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
            
            -- Color by difficulty
            local playerLevel = UnitLevel("player")
            local levelDiff = level - playerLevel
            local r, g, b = 1, 0.82, 0
            if levelDiff >= 5 then
                r, g, b = 1, 0.1, 0.1  -- Red (impossible)
            elseif levelDiff >= 3 then
                r, g, b = 1, 0.5, 0.2  -- Orange (very hard)
            elseif levelDiff >= -2 then
                r, g, b = 1, 1, 0  -- Yellow (normal)
            elseif levelDiff >= -8 then
                r, g, b = 0.2, 0.9, 0.2  -- Green (easy)
            else
                r, g, b = 0.6, 0.6, 0.6  -- Gray (trivial)
            end
            
            local questText = ""
            if isComplete then
                questText = "|cFF00FF00[C]|r "
            end
            
            -- Truncate long quest names to prevent wrapping
            local displayTitle = title
            if string.len(title) > 28 then
                displayTitle = string.sub(title, 1, 26) .. ".."
            end
            questText = questText .. "[" .. level .. "] " .. displayTitle
            
            questLine:SetText(questText)
            questLine:SetTextColor(r, g, b)
            questLine:Show()
            
            yOffset = yOffset - self.config.lineHeight
            
            -- Objectives
            local numObjectives = GetNumQuestLeaderBoards(questIndex)
            for objIndex = 1, numObjectives do
                local text, objType, finished = GetQuestLogLeaderBoard(objIndex, questIndex)
                if text then
                    lineIndex = lineIndex + 1
                    local objLine = self:GetOrCreateLine(lineIndex, "obj")
                    objLine:ClearAllPoints()
                    objLine:SetPoint("TOPLEFT", self.scrollChild, "TOPLEFT", 14, yOffset)
                    objLine:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
                    
                    local prefix = "- "
                    if finished then
                        objLine:SetText(prefix .. text)
                        objLine:SetTextColor(0.3, 1, 0.3)  -- Bright green
                    else
                        objLine:SetText(prefix .. text)
                        objLine:SetTextColor(0.9, 0.9, 0.9)  -- Light gray
                    end
                    objLine:Show()
                    
                    yOffset = yOffset - self.config.objLineHeight
                end
            end
            
            yOffset = yOffset - self.config.questSpacing
        end
    end
    
    -- Empty state
    if questCount == 0 then
        lineIndex = lineIndex + 1
        local emptyLine = self:GetOrCreateLine(lineIndex, "empty")
        emptyLine:ClearAllPoints()
        emptyLine:SetPoint("TOPLEFT", self.scrollChild, "TOPLEFT", 0, 0)
        emptyLine:SetFont("Fonts\\FRIZQT__.TTF", 11, "")
        emptyLine:SetText("No active quests")
        emptyLine:SetTextColor(0.6, 0.6, 0.6)
        emptyLine:Show()
        yOffset = -20
    end
    
    -- Update scroll child height
    local totalHeight = math.abs(yOffset) + 10
    self.scrollChild:SetHeight(totalHeight)
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
