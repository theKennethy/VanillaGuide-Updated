--[[--------------------------------------------------
----- VanillaGuide -----
------------------
MinimapButton.lua
------------------------------------------------------
Description: 
    Standalone minimap button for VanillaGuide.
    Works without FuBar dependency.
--]]--------------------------------------------------

local VGuideMinimapButton = {}
VGuideMinimapButton.db = nil
VGuideMinimapButton.frame = nil

-- Default settings
local defaults = {
    position = 225, -- degrees around minimap
    enabled = true,
    locked = false,
}

-- Calculate button position on minimap rim
local function GetMinimapButtonPosition(angle)
    -- Convert angle to radians
    local radians = math.rad(angle)
    -- Minimap is 140x140, button is 31x31, radius ~80
    local radius = 80
    local x = math.cos(radians) * radius
    local y = math.sin(radians) * radius
    return x, y
end

-- Update the button position
local function UpdateButtonPosition(self)
    local x, y = GetMinimapButtonPosition(self.db.position or defaults.position)
    self.frame:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

-- Create tooltip
local function OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine("|cffffd700VanillaGuide|r", 1, 1, 1)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cff00ff00Left-Click:|r Toggle Guide Window", 0.8, 0.8, 0.8)
    GameTooltip:AddLine("|cff00ff00Right-Click:|r Open Settings", 0.8, 0.8, 0.8)
    GameTooltip:AddLine("|cff00ff00Shift+Click:|r Select Guide", 0.8, 0.8, 0.8)
    GameTooltip:AddLine("|cff00ff00Drag:|r Move Button", 0.8, 0.8, 0.8)
    GameTooltip:Show()
end

local function OnLeave(self)
    GameTooltip:Hide()
end

-- Handle button clicks
local function OnClick(self)
    if IsShiftKeyDown() then
        -- Open guide selection
        if VGuide and VGuide.UI and VGuide.UI.MainFrame then
            -- Toggle guide dropdown
            local frame = getglobal("VG_MainFrame")
            if frame and not frame:IsVisible() then
                frame:Show()
            end
            -- Trigger guide selection dropdown if available
            if VGuide.UI.MainFrame.ShowGuideDropdown then
                VGuide.UI.MainFrame:ShowGuideDropdown()
            end
        end
    elseif arg1 == "RightButton" then
        -- Open settings
        local settingsFrame = getglobal("VG_SettingsFrame")
        if settingsFrame then
            if settingsFrame:IsVisible() then
                settingsFrame:Hide()
            else
                settingsFrame:Show()
            end
        end
    else
        -- Toggle main frame
        local mainFrame = getglobal("VG_MainFrame")
        if mainFrame then
            if mainFrame:IsVisible() then
                mainFrame:Hide()
            else
                mainFrame:Show()
            end
        end
    end
end

-- Handle dragging for repositioning
local function OnMouseDown(self)
    if arg1 == "LeftButton" and not VGuideMinimapButton.db.locked then
        self.isMoving = true
        self:StartMoving()
    end
end

local function OnMouseUp(self)
    if self.isMoving then
        self.isMoving = false
        self:StopMovingOrSizing()
        
        -- Calculate new angle based on position relative to minimap center
        local mx, my = Minimap:GetCenter()
        local px, py = self:GetCenter()
        local angle = math.deg(math.atan2(py - my, px - mx))
        
        -- Store the angle
        VGuideMinimapButton.db.position = angle
        
        -- Snap back to minimap rim
        UpdateButtonPosition(VGuideMinimapButton)
    end
end

-- Initialize the minimap button
function VGuideMinimapButton:Initialize()
    -- Get or create saved vars entry
    if not VanillaGuideDBPC then
        VanillaGuideDBPC = {}
    end
    if not VanillaGuideDBPC.minimapButton then
        VanillaGuideDBPC.minimapButton = {}
        for k, v in pairs(defaults) do
            VanillaGuideDBPC.minimapButton[k] = v
        end
    end
    self.db = VanillaGuideDBPC.minimapButton
    
    -- Apply defaults for any missing values
    for k, v in pairs(defaults) do
        if self.db[k] == nil then
            self.db[k] = v
        end
    end
    
    -- Create the button frame
    self:CreateButton()
    
    -- Show/hide based on settings
    if self.db.enabled then
        self.frame:Show()
    else
        self.frame:Hide()
    end
end

function VGuideMinimapButton:CreateButton()
    -- Create main button frame
    local button = CreateFrame("Button", "VGuideMinimapButton", Minimap)
    button:SetWidth(31)
    button:SetHeight(31)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetMovable(true)
    button:EnableMouse(true)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:RegisterForDrag("LeftButton")
    
    -- Create textures
    local overlay = button:CreateTexture(nil, "OVERLAY")
    overlay:SetWidth(53)
    overlay:SetHeight(53)
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    overlay:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    
    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetWidth(20)
    background:SetHeight(20)
    background:SetTexture("Interface\\Icons\\INV_Misc_Book_09") -- Book icon for guide
    background:SetPoint("CENTER", button, "CENTER", 0, 0)
    button.icon = background
    
    -- Highlight texture
    local highlight = button:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetWidth(20)
    highlight:SetHeight(20)
    highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    highlight:SetPoint("CENTER", button, "CENTER", 0, 0)
    highlight:SetBlendMode("ADD")
    
    -- Set up scripts
    button:SetScript("OnEnter", OnEnter)
    button:SetScript("OnLeave", OnLeave)
    button:SetScript("OnClick", OnClick)
    button:SetScript("OnDragStart", OnMouseDown)
    button:SetScript("OnDragStop", OnMouseUp)
    
    self.frame = button
    
    -- Position the button
    UpdateButtonPosition(self)
end

-- Show the minimap button
function VGuideMinimapButton:Show()
    if self.frame then
        self.frame:Show()
        self.db.enabled = true
    end
end

-- Hide the minimap button
function VGuideMinimapButton:Hide()
    if self.frame then
        self.frame:Hide()
        self.db.enabled = false
    end
end

-- Toggle the minimap button visibility
function VGuideMinimapButton:Toggle()
    if self.frame then
        if self.frame:IsVisible() then
            self:Hide()
        else
            self:Show()
        end
    end
end

-- Lock/unlock button position
function VGuideMinimapButton:SetLocked(locked)
    self.db.locked = locked
end

function VGuideMinimapButton:IsLocked()
    return self.db.locked
end

-- Reset position to default
function VGuideMinimapButton:ResetPosition()
    self.db.position = defaults.position
    UpdateButtonPosition(self)
end

----------------------------------------------
-- Minimap Compass Labels (N, E, S, W)
----------------------------------------------

local VGuideMinimapCompass = {}
VGuideMinimapCompass.labels = {}
VGuideMinimapCompass.enabled = true

function VGuideMinimapCompass:Create()
    -- Create compass direction labels around the minimap (all 8 directions)
    local radius = 72
    local compassData = {
        { dir = "N",  angle = 90,  color = {1, 0.2, 0.2} },      -- North - Red
        { dir = "NE", angle = 45,  color = {0.6, 0.6, 0.6} },    -- NE - Dim
        { dir = "E",  angle = 0,   color = {0.8, 0.8, 0.8} },    -- East - Gray
        { dir = "SE", angle = -45, color = {0.6, 0.6, 0.6} },    -- SE - Dim
        { dir = "S",  angle = -90, color = {0.8, 0.8, 0.8} },    -- South - Gray
        { dir = "SW", angle = -135, color = {0.6, 0.6, 0.6} },   -- SW - Dim
        { dir = "W",  angle = 180, color = {0.8, 0.8, 0.8} },    -- West - Gray
        { dir = "NW", angle = 135, color = {0.6, 0.6, 0.6} },    -- NW - Dim
    }
    
    for i, data in ipairs(compassData) do
        local rad = math.rad(data.angle)
        local x = math.cos(rad) * radius
        local y = math.sin(rad) * radius
        
        local label = Minimap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        label:SetPoint("CENTER", Minimap, "CENTER", x, y)
        label:SetText(data.dir)
        label:SetTextColor(data.color[1], data.color[2], data.color[3])
        
        -- Smaller font for diagonal directions
        if string.len(data.dir) > 1 then
            label:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
        else
            label:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
        end
        
        self.labels[i] = label
    end
    
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap compass enabled")
end

function VGuideMinimapCompass:Show()
    for _, label in ipairs(self.labels) do
        label:Show()
    end
    self.enabled = true
end

function VGuideMinimapCompass:Hide()
    for _, label in ipairs(self.labels) do
        label:Hide()
    end
    self.enabled = false
end

function VGuideMinimapCompass:Toggle()
    if self.enabled then
        self:Hide()
    else
        self:Show()
    end
end

-- Make compass available globally
VGuideCompass = VGuideMinimapCompass

-- Make available globally
-- VGuideMinimapButton is already global

-- Initialize when Core.lua calls us
-- Hook into VGuide initialization
if VGuide then
    local oldOnEnable = VGuide.OnEnable
    VGuide.OnEnable = function(self, first)
        if oldOnEnable then
            oldOnEnable(self, first)
        end
        VGuideMinimapButton:Initialize()
        VGuideMinimapCompass:Create()
    end
else
    -- If VGuide doesn't exist yet, wait for PLAYER_LOGIN
    local initFrame = CreateFrame("Frame")
    initFrame:RegisterEvent("PLAYER_LOGIN")
    initFrame:SetScript("OnEvent", function()
        -- Slight delay to ensure VGuide is loaded
        this:UnregisterAllEvents()
        VGuideMinimapButton:Initialize()
        VGuideMinimapCompass:Create()
    end)
end
