--[[--------------------------------------------------
----- VanillaGuide -----
------------------
WaypointArrow.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Custom waypoint arrow for VanillaGuide
    Works like TomTom but built-in for vanilla 1.12.1
------------------------------------------------------
]]--

Dv(" VGuide WaypointArrow.lua Start")

-- Zone name to continent/zone ID lookup for vanilla 1.12.1
-- Continent: 1 = Kalimdor, 2 = Eastern Kingdoms
local ZoneLookup = {
    -- Eastern Kingdoms (Continent 2)
    ["Elwynn Forest"] = { c = 2, z = 1 },
    ["Dun Morogh"] = { c = 2, z = 2 },
    ["Tirisfal Glades"] = { c = 2, z = 3 },
    ["Loch Modan"] = { c = 2, z = 4 },
    ["Westfall"] = { c = 2, z = 5 },
    ["Redridge Mountains"] = { c = 2, z = 6 },
    ["Duskwood"] = { c = 2, z = 7 },
    ["Hillsbrad Foothills"] = { c = 2, z = 8 },
    ["Hillsbard Foothills"] = { c = 2, z = 8 },
    ["Tarren Mill"] = { c = 2, z = 8 },
    ["Wetlands"] = { c = 2, z = 9 },
    ["Alterac Mountains"] = { c = 2, z = 10 },
    ["Arathi Highlands"] = { c = 2, z = 11 },
    ["Stranglethorn Vale"] = { c = 2, z = 12 },
    ["Badlands"] = { c = 2, z = 13 },
    ["Swamp of Sorrows"] = { c = 2, z = 14 },
    ["Swamp of Sorrow"] = { c = 2, z = 14 },
    ["The Hinterlands"] = { c = 2, z = 15 },
    ["Hinterlands"] = { c = 2, z = 15 },
    ["Searing Gorge"] = { c = 2, z = 16 },
    ["Blasted Lands"] = { c = 2, z = 17 },
    ["Burning Steppes"] = { c = 2, z = 18 },
    ["Burning Steps"] = { c = 2, z = 18 },
    ["Western Plaguelands"] = { c = 2, z = 19 },
    ["Eastern Plaguelands"] = { c = 2, z = 20 },
    ["Silverpine Forest"] = { c = 2, z = 21 },
    ["Stormwind City"] = { c = 2, z = 22 },
    ["Stormwind"] = { c = 2, z = 22 },
    ["Ironforge"] = { c = 2, z = 23 },
    ["Iron Forge"] = { c = 2, z = 23 },
    ["Undercity"] = { c = 2, z = 24 },
    ["Deadwind Pass"] = { c = 2, z = 25 },
    
    -- Kalimdor (Continent 1)
    ["Durotar"] = { c = 1, z = 1 },
    ["Mulgore"] = { c = 1, z = 2 },
    ["The Barrens"] = { c = 1, z = 3 },
    ["Teldrassil"] = { c = 1, z = 4 },
    ["Darkshore"] = { c = 1, z = 5 },
    ["Ashenvale"] = { c = 1, z = 6 },
    ["Thousand Needles"] = { c = 1, z = 7 },
    ["Stonetalon Mountains"] = { c = 1, z = 8 },
    ["Desolace"] = { c = 1, z = 9 },
    ["Feralas"] = { c = 1, z = 10 },
    ["Felalas"] = { c = 1, z = 10 },
    ["Dustwallow Marsh"] = { c = 1, z = 11 },
    ["Duskwallow Marsh"] = { c = 1, z = 11 },
    ["Tanaris"] = { c = 1, z = 12 },
    ["Azshara"] = { c = 1, z = 13 },
    ["Felwood"] = { c = 1, z = 14 },
    ["Un'Goro Crater"] = { c = 1, z = 15 },
    ["Un'Goro"] = { c = 1, z = 15 },
    ["Silithus"] = { c = 1, z = 16 },
    ["Winterspring"] = { c = 1, z = 17 },
    ["Moonglade"] = { c = 1, z = 18 },
    ["Moodglade"] = { c = 1, z = 18 },
    ["Orgrimmar"] = { c = 1, z = 19 },
    ["Thunder Bluff"] = { c = 1, z = 20 },
    ["Darnassus"] = { c = 1, z = 21 },
    ["darnassus"] = { c = 1, z = 21 },
}

-- Zone sizes in yards for distance calculation (approximate)
local ZoneSizes = {
    -- Eastern Kingdoms
    [2] = {
        [1] = { w = 3470, h = 2316 },   -- Elwynn Forest
        [2] = { w = 4925, h = 3283 },   -- Dun Morogh
        [3] = { w = 4518, h = 3012 },   -- Tirisfal Glades
        [4] = { w = 2758, h = 1839 },   -- Loch Modan
        [5] = { w = 3500, h = 2333 },   -- Westfall
        [6] = { w = 2170, h = 1447 },   -- Redridge Mountains
        [7] = { w = 2700, h = 1800 },   -- Duskwood
        [8] = { w = 3200, h = 2133 },   -- Hillsbrad Foothills
        [9] = { w = 4135, h = 2756 },   -- Wetlands
        [10] = { w = 2733, h = 1822 },  -- Alterac Mountains
        [11] = { w = 3600, h = 2400 },  -- Arathi Highlands
        [12] = { w = 6554, h = 4369 },  -- Stranglethorn Vale
        [13] = { w = 2487, h = 1658 },  -- Badlands
        [14] = { w = 2293, h = 1529 },  -- Swamp of Sorrows
        [15] = { w = 3850, h = 2566 },  -- The Hinterlands
        [16] = { w = 2231, h = 1487 },  -- Searing Gorge
        [17] = { w = 3310, h = 2206 },  -- Blasted Lands
        [18] = { w = 2929, h = 1952 },  -- Burning Steppes
        [19] = { w = 4300, h = 2866 },  -- Western Plaguelands
        [20] = { w = 4031, h = 2687 },  -- Eastern Plaguelands
        [21] = { w = 4680, h = 3120 },  -- Silverpine Forest
        [22] = { w = 1737, h = 1158 },  -- Stormwind City
        [23] = { w = 1264, h = 842 },   -- Ironforge
        [24] = { w = 959, h = 640 },    -- Undercity
        [25] = { w = 2499, h = 1666 },  -- Deadwind Pass
    },
    -- Kalimdor
    [1] = {
        [1] = { w = 3525, h = 2350 },   -- Durotar
        [2] = { w = 4370, h = 2913 },   -- Mulgore
        [3] = { w = 10133, h = 6755 },  -- The Barrens
        [4] = { w = 4925, h = 3283 },   -- Teldrassil
        [5] = { w = 6550, h = 4366 },   -- Darkshore
        [6] = { w = 5766, h = 3843 },   -- Ashenvale
        [7] = { w = 4600, h = 3066 },   -- Thousand Needles
        [8] = { w = 4675, h = 3116 },   -- Stonetalon Mountains
        [9] = { w = 4495, h = 2997 },   -- Desolace
        [10] = { w = 6950, h = 4633 },  -- Feralas
        [11] = { w = 3500, h = 2333 },  -- Dustwallow Marsh
        [12] = { w = 6950, h = 4633 },  -- Tanaris
        [13] = { w = 5070, h = 3380 },  -- Azshara
        [14] = { w = 5625, h = 3750 },  -- Felwood
        [15] = { w = 3677, h = 2451 },  -- Un'Goro Crater
        [16] = { w = 3483, h = 2322 },  -- Silithus
        [17] = { w = 7100, h = 4733 },  -- Winterspring
        [18] = { w = 1539, h = 1026 },  -- Moonglade
        [19] = { w = 1402, h = 935 },   -- Orgrimmar
        [20] = { w = 1043, h = 695 },   -- Thunder Bluff
        [21] = { w = 1058, h = 705 },   -- Darnassus
    },
}

-- Math helpers for vanilla Lua 5.0
local PI = 3.14159265358979323846
local TWO_PI = PI * 2

local function atan2(y, x)
    if x > 0 then
        return math.atan(y / x)
    elseif x < 0 then
        if y >= 0 then
            return math.atan(y / x) + PI
        else
            return math.atan(y / x) - PI
        end
    else
        if y > 0 then
            return PI / 2
        elseif y < 0 then
            return -PI / 2
        else
            return 0
        end
    end
end

VGuideArrow = {}
VGuideArrow.__index = VGuideArrow

function VGuideArrow:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.waypoint = nil
    obj.enabled = true
    obj.frame = nil
    obj.arrow = nil
    obj.distanceText = nil
    obj.titleText = nil
    obj.lastUpdate = 0
    obj.updateInterval = 0.1 -- Update 10 times per second
    
    ---------------------------------------
    -- Arrow Rotation via SetTexCoord
    ---------------------------------------
    
    -- Rotate texture using SetTexCoord (vanilla compatible)
    local function RotateTexture(texture, angle)
        -- angle in radians, 0 = up, positive = clockwise
        local cos = math.cos(angle)
        local sin = math.sin(angle)
        
        -- Calculate rotated corners (centered at 0.5, 0.5)
        local function rotate(x, y)
            local rx = cos * (x - 0.5) - sin * (y - 0.5) + 0.5
            local ry = sin * (x - 0.5) + cos * (y - 0.5) + 0.5
            return rx, ry
        end
        
        -- Original corners: UL, LL, UR, LR
        local ulx, uly = rotate(0, 0)
        local llx, lly = rotate(0, 1)
        local urx, ury = rotate(1, 0)
        local lrx, lry = rotate(1, 1)
        
        texture:SetTexCoord(ulx, uly, llx, lly, urx, ury, lrx, lry)
    end
    
    obj.RotateArrow = RotateTexture
    
    ---------------------------------------
    -- Frame Creation
    ---------------------------------------
    
    -- Main frame
    local frame = CreateFrame("Frame", "VGuideWaypointFrame", UIParent)
    frame:SetWidth(120)
    frame:SetHeight(90)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() this:StartMoving() end)
    frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
    frame:SetFrameStrata("HIGH")
    frame:Hide()
    
    -- Background (semi-transparent)
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(frame)
    bg:SetTexture(0, 0, 0, 0.6)
    obj.background = bg
    
    -- Border
    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.8)
    frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
    
    -- Arrow texture (green arrow pointing up)
    local arrow = frame:CreateTexture(nil, "ARTWORK")
    arrow:SetWidth(40)
    arrow:SetHeight(40)
    arrow:SetPoint("CENTER", frame, "CENTER", 0, 5)
    arrow:SetTexture("Interface\\Minimap\\ROTATING-MINIMAPARROW")
    arrow:SetVertexColor(0.2, 1, 0.2) -- Green tint
    obj.arrow = arrow
    
    -- Title text
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    title:SetPoint("TOP", frame, "TOP", 0, -8)
    title:SetWidth(110)
    title:SetJustifyH("CENTER")
    title:SetText("")
    title:SetTextColor(1, 0.82, 0) -- Gold
    obj.titleText = title
    
    -- Distance text
    local dist = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dist:SetPoint("BOTTOM", frame, "BOTTOM", 0, 18)
    dist:SetWidth(110)
    dist:SetJustifyH("CENTER")
    dist:SetText("")
    dist:SetTextColor(1, 1, 1)
    obj.distanceText = dist
    
    -- ETA text
    local eta = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    eta:SetPoint("BOTTOM", frame, "BOTTOM", 0, 6)
    eta:SetWidth(110)
    eta:SetJustifyH("CENTER")
    eta:SetText("")
    eta:SetTextColor(0.7, 0.7, 0.7)
    obj.etaText = eta
    
    -- Arrived text (shown when close)
    local arrived = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    arrived:SetPoint("CENTER", frame, "CENTER", 0, 5)
    arrived:SetText("ARRIVED")
    arrived:SetTextColor(0, 1, 0)
    arrived:Hide()
    obj.arrivedText = arrived
    
    -- Close button
    local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close:SetWidth(20)
    close:SetHeight(20)
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    close:SetScript("OnClick", function()
        obj:ClearWaypoint()
    end)
    
    obj.frame = frame
    
    ---------------------------------------
    -- Update Logic
    ---------------------------------------
    
    frame:SetScript("OnUpdate", function()
        if not obj.waypoint then return end
        if not obj.enabled then return end
        
        obj.lastUpdate = obj.lastUpdate + arg1
        if obj.lastUpdate < obj.updateInterval then return end
        obj.lastUpdate = 0
        
        -- Get player position on current map
        local px, py = GetPlayerMapPosition("player")
        
        -- If player position is 0,0, we're not on the map or in instance
        if px == 0 and py == 0 then
            obj.distanceText:SetText("Open map")
            obj.distanceText:SetTextColor(1, 0.5, 0)
            obj.arrow:Hide()
            obj.arrivedText:Hide()
            obj.etaText:SetText("")
            return
        end
        
        -- Check if we're in the same zone
        local currentZone = GetZoneText()
        local waypointZone = obj.waypoint.zone
        local inCorrectZone = (currentZone == waypointZone)
        
        -- Also check subzone
        if not inCorrectZone then
            local subZone = GetSubZoneText()
            if subZone == waypointZone then
                inCorrectZone = true
            end
        end
        
        if not inCorrectZone then
            obj.distanceText:SetText("Go to:")
            obj.titleText:SetText(waypointZone)
            obj.distanceText:SetTextColor(1, 0.5, 0)
            obj.arrow:Hide()
            obj.arrivedText:Hide()
            obj.etaText:SetText("")
            return
        end
        
        -- Restore title if in correct zone
        local displayTitle = obj.waypoint.title or waypointZone
        if string.len(displayTitle) > 18 then
            displayTitle = string.sub(displayTitle, 1, 15) .. "..."
        end
        obj.titleText:SetText(displayTitle)
        
        obj.distanceText:SetTextColor(1, 1, 1)
        obj.arrow:Show()
        
        -- Waypoint position (convert from 0-100 to 0-1)
        local wx = obj.waypoint.x / 100
        local wy = obj.waypoint.y / 100
        
        -- Calculate direction to waypoint
        local dx = wx - px
        local dy = wy - py
        
        -- Calculate distance in yards (using zone size)
        local distance = 0
        local zoneInfo = ZoneLookup[waypointZone]
        if zoneInfo then
            local sizes = ZoneSizes[zoneInfo.c] and ZoneSizes[zoneInfo.c][zoneInfo.z]
            if sizes then
                local distX = dx * sizes.w
                local distY = dy * sizes.h
                distance = math.sqrt(distX * distX + distY * distY)
            else
                -- Fallback: assume ~5000 yard zone
                distance = math.sqrt(dx * dx + dy * dy) * 5000
            end
        else
            distance = math.sqrt(dx * dx + dy * dy) * 5000
        end
        
        -- Check if arrived (within 15 yards)
        if distance < 15 then
            obj.arrow:Hide()
            obj.arrivedText:Show()
            obj.distanceText:SetText("0 yards")
            obj.distanceText:SetTextColor(0, 1, 0)
            obj.etaText:SetText("")
            return
        else
            obj.arrivedText:Hide()
            obj.arrow:Show()
        end
        
        -- Format distance
        if distance > 1000 then
            obj.distanceText:SetText(string.format("%.1f km", distance / 1000))
        else
            obj.distanceText:SetText(string.format("%d yards", math.floor(distance)))
        end
        
        -- Color based on distance
        if distance < 50 then
            obj.distanceText:SetTextColor(0, 1, 0) -- Green
            obj.arrow:SetVertexColor(0.2, 1, 0.2)
        elseif distance < 200 then
            obj.distanceText:SetTextColor(1, 1, 0) -- Yellow
            obj.arrow:SetVertexColor(1, 1, 0.2)
        else
            obj.distanceText:SetTextColor(1, 1, 1) -- White
            obj.arrow:SetVertexColor(0.2, 1, 0.2)
        end
        
        -- Calculate angle to waypoint
        -- Map: +x = East, +y = South (y increases downward on map)
        local angleToWaypoint = atan2(dx, -dy)  -- negative dy because map y is inverted
        
        -- Get player facing (radians, 0 = North, increases counterclockwise)
        local playerFacing = 0
        if GetPlayerFacing then
            playerFacing = GetPlayerFacing()
        end
        
        -- Calculate rotation needed for arrow
        -- Arrow points in direction of waypoint relative to camera/player facing
        local rotation = angleToWaypoint - playerFacing
        
        -- Normalize to 0 to 2*PI
        while rotation < 0 do rotation = rotation + TWO_PI end
        while rotation >= TWO_PI do rotation = rotation - TWO_PI end
        
        -- Rotate the arrow texture
        obj.RotateArrow(obj.arrow, rotation)
        
        -- ETA calculation (running ~7 yards/sec, mounted ~14 yards/sec)
        local speed = 7
        local eta = distance / speed
        if eta > 3600 then
            obj.etaText:SetText(string.format("ETA: %.1f hr", eta / 3600))
        elseif eta > 60 then
            obj.etaText:SetText(string.format("ETA: %d min", math.floor(eta / 60)))
        else
            obj.etaText:SetText(string.format("ETA: %d sec", math.floor(eta)))
        end
    end)
    
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint arrow ready!")
    
    ---------------------------------------
    -- Public API
    ---------------------------------------
    
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        if not x or not y or not zone then 
            return false 
        end
        
        x = tonumber(x)
        y = tonumber(y)
        if not x or not y then return false end
        
        -- Clear existing waypoint
        obj:ClearWaypoint()
        
        obj.waypoint = {
            x = x,
            y = y,
            zone = zone,
            title = title or "Waypoint",
            description = description or ""
        }
        
        -- Update title
        local displayTitle = title or zone
        if string.len(displayTitle) > 18 then
            displayTitle = string.sub(displayTitle, 1, 15) .. "..."
        end
        obj.titleText:SetText(displayTitle)
        
        -- Show frame
        obj.frame:Show()
        
        return true
    end
    
    obj.ClearWaypoint = function(self)
        obj.waypoint = nil
        if obj.frame then
            obj.frame:Hide()
        end
    end
    
    obj.HasWaypoint = function(self)
        return obj.waypoint ~= nil
    end
    
    obj.GetWaypoint = function(self)
        return obj.waypoint
    end
    
    obj.SetEnabled = function(self, enabled)
        obj.enabled = enabled
        if not enabled then
            obj:ClearWaypoint()
        end
    end
    
    obj.IsEnabled = function(self)
        return obj.enabled
    end
    
    obj.Toggle = function(self)
        if obj.frame:IsVisible() then
            obj.frame:Hide()
        else
            if obj.waypoint then
                obj.frame:Show()
            end
        end
    end
    
    obj.Show = function(self)
        if obj.waypoint then
            obj.frame:Show()
        end
    end
    
    obj.Hide = function(self)
        obj.frame:Hide()
    end
    
    return obj
end

Dv(" VGuide WaypointArrow.lua End")
