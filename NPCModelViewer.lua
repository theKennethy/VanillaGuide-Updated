--[[--------------------------------------------------
----- VanillaGuide -----
------------------
NPCModelViewer.lua
Authors: GitHub Copilot
Version: 1.08.0
------------------------------------------------------
Description: 
    Show 3D model preview of quest NPCs
    Uses PlayerModel frame with NPC displayID database
------------------------------------------------------
]]--

Dv(" VGuide NPCModelViewer.lua Start")

VGuideNPCViewer = {}
VGuideNPCViewer.__index = VGuideNPCViewer

function VGuideNPCViewer:new(settings)
    local obj = {}
    setmetatable(obj, self)
    obj.settings = settings
    obj.frame = nil
    obj.model = nil
    obj.currentNPC = nil
    return obj
end

function VGuideNPCViewer:Initialize()
    self:CreateFrame()
    Di("      - NPC Model Viewer initialized")
end

-- Get settings
function VGuideNPCViewer:GetSettings()
    if self.settings and self.settings.db and self.settings.db.char then
        return self.settings.db.char.NPCViewer or {}
    end
    return {}
end

function VGuideNPCViewer:IsEnabled()
    local s = self:GetSettings()
    return s.Enable ~= false  -- Default true
end

-- Create the viewer frame
function VGuideNPCViewer:CreateFrame()
    -- Main frame
    local frame = CreateFrame("Frame", "VG_NPCViewerFrame", UIParent)
    frame:SetWidth(180)
    frame:SetHeight(220)
    frame:SetPoint("CENTER", UIParent, "CENTER", 200, 0)
    frame:SetFrameStrata("DIALOG")
    frame:SetFrameLevel(100)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:Hide()
    
    -- Background
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.9)
    
    -- Title bar
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetHeight(24)
    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    titleBar:EnableMouse(true)
    titleBar:SetScript("OnMouseDown", function()
        frame:StartMoving()
    end)
    titleBar:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
    end)
    
    -- Title text
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -12)
    title:SetText("NPC Preview")
    title:SetTextColor(1, 0.82, 0)
    frame.title = title
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    -- Model frame
    local model = CreateFrame("PlayerModel", "VG_NPCModel", frame)
    model:SetWidth(140)
    model:SetHeight(140)
    model:SetPoint("CENTER", frame, "CENTER", 0, 10)
    model:SetScript("OnMouseDown", function()
        this.rotating = true
        this.startX = arg1
    end)
    model:SetScript("OnMouseUp", function()
        this.rotating = false
    end)
    model:SetScript("OnUpdate", function()
        if this.rotating and this.startX then
            local currentX = GetCursorPosition()
            local diff = (currentX - this.startX) * 0.01
            this:SetFacing(this:GetFacing() + diff)
            this.startX = currentX
        end
    end)
    model:EnableMouse(true)
    self.model = model
    
    -- NPC name label
    local nameLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    nameLabel:SetPoint("BOTTOM", frame, "BOTTOM", 0, 30)
    nameLabel:SetWidth(160)
    nameLabel:SetJustifyH("CENTER")
    frame.nameLabel = nameLabel
    
    -- Hint text
    local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hint:SetPoint("BOTTOM", frame, "BOTTOM", 0, 12)
    hint:SetText("Drag to rotate")
    hint:SetTextColor(0.5, 0.5, 0.5)
    
    self.frame = frame
end

-- Show NPC model
function VGuideNPCViewer:ShowNPC(npcName)
    if not self:IsEnabled() then return end
    if not npcName or npcName == "" then return end
    
    -- Get display ID from database
    local displayID = VGuideNPCDatabase and VGuideNPCDatabase[npcName]
    
    if not displayID then
        -- Try case-insensitive lookup
        if VGuideNPCDatabase then
            local lowerName = string.lower(npcName)
            for name, id in pairs(VGuideNPCDatabase) do
                if string.lower(name) == lowerName then
                    displayID = id
                    break
                end
            end
        end
    end
    
    if not displayID then
        -- NPC not in database, show generic model based on faction
        local faction = UnitFactionGroup("player")
        if faction == "Alliance" then
            displayID = 2816  -- Human Male Guard
        else
            displayID = 7124  -- Orc Male Guard
        end
        self.frame.nameLabel:SetText(npcName .. "\n|cFF888888(Generic)|r")
    else
        self.frame.nameLabel:SetText(npcName)
    end
    
    -- Set model
    self.model:SetDisplayInfo(displayID)
    self.model:SetFacing(0)
    self.model:SetPosition(0, 0, 0)
    
    -- Show frame
    self.frame:Show()
    self.currentNPC = npcName
end

-- Hide viewer
function VGuideNPCViewer:Hide()
    if self.frame then
        self.frame:Hide()
    end
    self.currentNPC = nil
end

-- Toggle visibility
function VGuideNPCViewer:Toggle()
    if self.frame:IsVisible() then
        self:Hide()
    else
        -- Show last NPC or a default
        if self.currentNPC then
            self:ShowNPC(self.currentNPC)
        end
    end
end

-- Toggle enabled state
function VGuideNPCViewer:ToggleEnabled()
    local s = self:GetSettings()
    s.Enable = not s.Enable
    local status = s.Enable and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r NPC Viewer " .. status)
    
    if not s.Enable then
        self:Hide()
    end
end

Dv(" VGuide NPCModelViewer.lua End")
