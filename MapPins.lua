--[[--------------------------------------------------
----- VanillaGuide -----
------------------
MapPins.lua
Authors: GitHub Copilot
Version: 1.08.0
------------------------------------------------------
Description: 
    Show quest objective pins on the world map
    Current step = large pin, upcoming = smaller pins
    Click pins to jump to that step
------------------------------------------------------
]]--

Dv(" VGuide MapPins.lua Start")

VGuideMapPins = {}
VGuideMapPins.__index = VGuideMapPins

-- Zone name to map file mapping (for coordinate conversion)
local ZoneMapFiles = {
    -- Eastern Kingdoms
    ["Alterac Mountains"] = "AlteracMountains",
    ["Arathi Highlands"] = "ArathiHighlands",
    ["Badlands"] = "Badlands",
    ["Blasted Lands"] = "BlastedLands",
    ["Burning Steppes"] = "BurningSteppes",
    ["Deadwind Pass"] = "DeadwindPass",
    ["Dun Morogh"] = "DunMorogh",
    ["Duskwood"] = "Duskwood",
    ["Eastern Plaguelands"] = "EasternPlaguelands",
    ["Elwynn Forest"] = "ElwynnForest",
    ["Hillsbrad Foothills"] = "HillsbradFoothills",
    ["Hinterlands"] = "Hinterlands",
    ["The Hinterlands"] = "Hinterlands",
    ["Ironforge"] = "Ironforge",
    ["Loch Modan"] = "LochModan",
    ["Redridge Mountains"] = "RedridgeMountains",
    ["Searing Gorge"] = "SearingGorge",
    ["Silverpine Forest"] = "SilverpineForest",
    ["Stormwind City"] = "StormwindCity",
    ["Stormwind"] = "StormwindCity",
    ["Stranglethorn Vale"] = "StranglethornVale",
    ["Swamp of Sorrows"] = "SwampOfSorrows",
    ["Tirisfal Glades"] = "TirisfalGlades",
    ["Undercity"] = "Undercity",
    ["Western Plaguelands"] = "WesternPlaguelands",
    ["Westfall"] = "Westfall",
    ["Wetlands"] = "Wetlands",
    -- Kalimdor
    ["Ashenvale"] = "Ashenvale",
    ["Azshara"] = "Azshara",
    ["Darkshore"] = "Darkshore",
    ["Darnassus"] = "Darnassus",
    ["Desolace"] = "Desolace",
    ["Durotar"] = "Durotar",
    ["Dustwallow Marsh"] = "DustwallowMarsh",
    ["Felwood"] = "Felwood",
    ["Feralas"] = "Feralas",
    ["Moonglade"] = "Moonglade",
    ["Mulgore"] = "Mulgore",
    ["Orgrimmar"] = "Orgrimmar",
    ["Silithus"] = "Silithus",
    ["Stonetalon Mountains"] = "StonetalonMountains",
    ["Tanaris"] = "Tanaris",
    ["Teldrassil"] = "Teldrassil",
    ["The Barrens"] = "Barrens",
    ["Barrens"] = "Barrens",
    ["Thousand Needles"] = "ThousandNeedles",
    ["Thunder Bluff"] = "ThunderBluff",
    ["Un'Goro Crater"] = "UngoroCrater",
    ["Winterspring"] = "Winterspring",
}

function VGuideMapPins:new(settings, display)
    local obj = {}
    setmetatable(obj, self)
    obj.settings = settings
    obj.display = display
    obj.pins = {}           -- Array of pin frames
    obj.maxPins = 6         -- Current + 5 upcoming
    obj.initialized = false
    return obj
end

function VGuideMapPins:Initialize()
    -- Create pin frames
    self:CreatePins()
    
    -- Hook into WorldMapFrame to refresh pins when map opens
    self:HookWorldMap()
    
    self.initialized = true
    Di("      - Map Pins initialized")
end

-- Get settings
function VGuideMapPins:GetSettings()
    if self.settings and self.settings.db and self.settings.db.char then
        return self.settings.db.char.MapPins or {}
    end
    return {}
end

function VGuideMapPins:IsEnabled()
    local s = self:GetSettings()
    return s.Enable ~= false  -- Default true
end

function VGuideMapPins:ShowRoute()
    local s = self:GetSettings()
    return s.ShowRoute ~= false  -- Default true
end

-- Create the pin frames
function VGuideMapPins:CreatePins()
    for i = 1, self.maxPins do
        local pin = CreateFrame("Button", "VG_MapPin" .. i, WorldMapButton)
        pin:SetWidth(i == 1 and 24 or 16)  -- Current step is larger
        pin:SetHeight(i == 1 and 24 or 16)
        pin:SetFrameStrata("HIGH")
        pin:SetFrameLevel(100 + (self.maxPins - i))  -- Current on top
        
        -- Pin texture
        local tex = pin:CreateTexture(nil, "ARTWORK")
        tex:SetAllPoints()
        pin.texture = tex
        
        -- Set texture based on pin type
        if i == 1 then
            -- Current objective - yellow exclamation mark (!)
            tex:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
            tex:SetTexCoord(0, 1, 0, 1)
        else
            -- Upcoming objectives - gray question mark
            tex:SetTexture("Interface\\GossipFrame\\ActiveQuestIcon")
            tex:SetTexCoord(0, 1, 0, 1)
            tex:SetVertexColor(0.6, 0.6, 0.6, 0.8)  -- Dimmed
        end
        
        -- Highlight on hover
        pin:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
        
        -- Tooltip
        pin:SetScript("OnEnter", function()
            if this.stepInfo then
                -- Smart anchor based on position
                local anchor = "ANCHOR_RIGHT"
                if this.stepInfo.x and this.stepInfo.x > 70 then
                    anchor = "ANCHOR_LEFT"
                end
                if this.stepInfo.y and this.stepInfo.y > 80 then
                    anchor = "ANCHOR_TOP"
                elseif this.stepInfo.y and this.stepInfo.y < 20 then
                    anchor = "ANCHOR_BOTTOM"
                end
                GameTooltip:SetOwner(this, anchor)
                GameTooltip:AddLine("VanillaGuide", 1, 0.82, 0)
                GameTooltip:AddLine(this.stepInfo.text or "Step " .. this.stepInfo.step, 1, 1, 1)
                if this.stepInfo.step then
                    GameTooltip:AddLine("Click to go to step " .. this.stepInfo.step, 0.5, 0.5, 0.5)
                end
                GameTooltip:Show()
            end
        end)
        pin:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        
        -- Click to jump to step
        local this = self
        pin:SetScript("OnClick", function()
            if this.stepInfo and this.stepInfo.step then
                this:JumpToStep(this.stepInfo.step)
            end
        end)
        
        pin:Hide()
        self.pins[i] = pin
    end
end

-- Jump to a specific step
function VGuideMapPins:JumpToStep(stepNum)
    if self.display then
        self.display:ToStep(stepNum)
        -- Refresh the main frame
        local mainFrame = getglobal("VG_MainFrame")
        if mainFrame and mainFrame.RefreshData then
            mainFrame:RefreshData()
        end
    end
end

-- Hook WorldMapFrame to refresh pins
function VGuideMapPins:HookWorldMap()
    -- Refresh when map zone changes (not on open)
    local originalUpdate = WorldMapFrame:GetScript("OnUpdate")
    local lastZone = ""
    local this = self
    WorldMapFrame:SetScript("OnUpdate", function()
        if originalUpdate then
            originalUpdate()
        end
        -- Check if zone changed
        local currentZone = GetMapInfo() or ""
        if currentZone ~= lastZone then
            lastZone = currentZone
            this:RefreshPins()
        end
    end)
end

-- Convert zone coordinates to map position
function VGuideMapPins:GetMapPosition(zone, x, y)
    if not zone or not x or not y then return nil, nil end
    
    -- Get current map info
    local currentMap = GetMapInfo()
    local targetMap = ZoneMapFiles[zone]
    
    -- If we're not viewing the right zone, return nil
    if not targetMap or currentMap ~= targetMap then
        return nil, nil
    end
    
    -- Convert percentage to map position (0-1)
    local mapX = x / 100
    local mapY = y / 100
    
    return mapX, mapY
end

-- Parse coordinates from step text
function VGuideMapPins:ParseCoordinates(text)
    if not text then return nil, nil, nil end
    
    -- Match patterns like "(45.5, 32.1 Duskwood)" or "(45, 32)"
    local x, y, zone = nil, nil, nil
    
    -- Try pattern with zone: (x, y Zone Name)
    local _, _, px, py, pzone = string.find(text, "%(([%d%.]+)[,%s]+([%d%.]+)%s+([^%)]+)%)")
    if px and py then
        x = tonumber(px)
        y = tonumber(py)
        zone = pzone
    else
        -- Try pattern without zone: (x, y)
        _, _, px, py = string.find(text, "%(([%d%.]+)[,%s]+([%d%.]+)%)")
        if px and py then
            x = tonumber(px)
            y = tonumber(py)
        end
    end
    
    return x, y, zone
end

-- Get zone from step or current zone
function VGuideMapPins:GetStepZone(step)
    if not step or not step.text then return nil end
    
    local _, _, zone = self:ParseCoordinates(step.text)
    if zone then return zone end
    
    -- Check for zone in the guide step
    if step.zone then return step.zone end
    
    -- Fallback to current zone
    return GetRealZoneText()
end

-- Refresh pins based on current step
function VGuideMapPins:RefreshPins()
    if not self:IsEnabled() then
        self:HideAllPins()
        return
    end
    
    -- Get current step from Display object
    if not VGuide or not VGuide.Display then
        self:HideAllPins()
        return
    end
    
    local currentStep = VGuide.Display:GetCurrentStep()
    local stepCount = VGuide.Display:GetCurrentStepCount()
    
    if not currentStep or not stepCount then
        self:HideAllPins()
        return
    end
    
    -- Get current map zone
    local currentMapZone = GetMapInfo()
    
    -- Place pins for current and upcoming steps
    local pinIndex = 1
    local stepsToShow = self:ShowRoute() and self.maxPins or 1
    
    for i = currentStep, math.min(currentStep + stepsToShow - 1, stepCount) do
        if pinIndex > self.maxPins then break end
        
        -- Get step info from Display
        local scrollDisplay = VGuide.Display:GetScrollFrameDisplay()
        local stepText = scrollDisplay and scrollDisplay[i]
        
        -- Get coordinates from step info
        local stepInfo = nil
        if VGuide.Display.StepInfoDisplay then
            stepInfo = VGuide.Display.StepInfoDisplay[i]
        end
        
        if stepInfo and stepInfo.x and stepInfo.y and stepInfo.zone then
            local x, y, zone = stepInfo.x, stepInfo.y, stepInfo.zone
            
            local mapX, mapY = self:GetMapPosition(zone, x, y)
            
            if mapX and mapY then
                self:PlacePin(pinIndex, mapX, mapY, {
                    step = i,
                    text = stepText or "",
                    zone = zone,
                    x = x,
                    y = y,
                    isCurrent = (i == currentStep)
                })
                pinIndex = pinIndex + 1
            end
        end
    end
    
    -- Hide unused pins
    for i = pinIndex, self.maxPins do
        self.pins[i]:Hide()
    end
end

-- Place a pin at map coordinates
function VGuideMapPins:PlacePin(pinIndex, mapX, mapY, stepInfo)
    local pin = self.pins[pinIndex]
    if not pin then return end
    
    -- Get map dimensions
    local mapWidth = WorldMapButton:GetWidth()
    local mapHeight = WorldMapButton:GetHeight()
    
    -- Calculate pixel position
    local pixelX = mapX * mapWidth
    local pixelY = -mapY * mapHeight  -- Negative because Y is inverted
    
    -- Position pin (centered on the coordinates)
    local pinSize = pin:GetWidth()
    pin:ClearAllPoints()
    pin:SetPoint("CENTER", WorldMapButton, "TOPLEFT", pixelX, pixelY)
    
    -- Store step info for tooltip/click
    pin.stepInfo = stepInfo
    
    -- Update appearance based on whether it's current step
    if stepInfo.isCurrent then
        pin:SetWidth(24)
        pin:SetHeight(24)
        pin.texture:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
        pin.texture:SetTexCoord(0, 1, 0, 1)
        pin.texture:SetVertexColor(1, 0.82, 0, 1)  -- Gold
    else
        pin:SetWidth(16)
        pin:SetHeight(16)
        pin.texture:SetTexture("Interface\\GossipFrame\\ActiveQuestIcon")
        pin.texture:SetTexCoord(0, 1, 0, 1)
        pin.texture:SetVertexColor(0.7, 0.7, 0.7, 0.8)  -- Gray
    end
    
    pin:Show()
end

-- Hide all pins
function VGuideMapPins:HideAllPins()
    for i = 1, self.maxPins do
        if self.pins[i] then
            self.pins[i]:Hide()
        end
    end
end

-- Toggle pins
function VGuideMapPins:Toggle()
    local s = self:GetSettings()
    s.Enable = not s.Enable
    local status = s.Enable and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Map pins " .. status)
    self:RefreshPins()
end

-- Toggle route display
function VGuideMapPins:ToggleRoute()
    local s = self:GetSettings()
    s.ShowRoute = not s.ShowRoute
    local status = s.ShowRoute and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Route preview " .. status)
    self:RefreshPins()
end

Dv(" VGuide MapPins.lua End")
