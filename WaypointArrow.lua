--[[--------------------------------------------------
----- VanillaGuide -----
------------------
WaypointArrow.lua
Authors: VanillaGuide Contributors
Version: 1.09.0
------------------------------------------------------
Description: 
    TomTom integration for VanillaGuide waypoints
    Requires TomTom addon to be installed
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
    ["Wetlands"] = { c = 2, z = 9 },
    ["Alterac Mountains"] = { c = 2, z = 10 },
    ["Arathi Highlands"] = { c = 2, z = 11 },
    ["Stranglethorn Vale"] = { c = 2, z = 12 },
    ["Badlands"] = { c = 2, z = 13 },
    ["Swamp of Sorrows"] = { c = 2, z = 14 },
    ["The Hinterlands"] = { c = 2, z = 15 },
    ["Searing Gorge"] = { c = 2, z = 16 },
    ["Blasted Lands"] = { c = 2, z = 17 },
    ["Burning Steppes"] = { c = 2, z = 18 },
    ["Western Plaguelands"] = { c = 2, z = 19 },
    ["Eastern Plaguelands"] = { c = 2, z = 20 },
    ["Silverpine Forest"] = { c = 2, z = 21 },
    ["Stormwind City"] = { c = 2, z = 22 },
    ["Ironforge"] = { c = 2, z = 23 },
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
    ["Dustwallow Marsh"] = { c = 1, z = 11 },
    ["Tanaris"] = { c = 1, z = 12 },
    ["Azshara"] = { c = 1, z = 13 },
    ["Felwood"] = { c = 1, z = 14 },
    ["Un'Goro Crater"] = { c = 1, z = 15 },
    ["Silithus"] = { c = 1, z = 16 },
    ["Winterspring"] = { c = 1, z = 17 },
    ["Moonglade"] = { c = 1, z = 18 },
    ["Orgrimmar"] = { c = 1, z = 19 },
    ["Thunder Bluff"] = { c = 1, z = 20 },
    ["Darnassus"] = { c = 1, z = 21 },
}

VGuideArrow = {}
VGuideArrow.__index = VGuideArrow

function VGuideArrow:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.waypoint = nil
    obj.enabled = true
    obj.tomtomWaypoint = nil
    obj.tomtomAvailable = false
    
    -- Check if TomTom is available
    if TomTom then
        obj.tomtomAvailable = true
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r TomTom detected!")
        -- Debug: List available TomTom functions
        local funcs = ""
        for k, v in pairs(TomTom) do
            if type(v) == "function" then
                funcs = funcs .. k .. ", "
            end
        end
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF TomTom functions:|r " .. funcs)
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600VanillaGuide:|r TomTom not found. Install TomTom for waypoint arrows.")
    end
    
    ---------------------------------------
    -- Public API
    ---------------------------------------
    
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        if not obj.tomtomAvailable then 
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000VGuide:|r TomTom not available")
            return false 
        end
        if not x or not y or not zone then 
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000VGuide:|r Missing coordinates")
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
        
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VGuide:|r Setting waypoint: " .. zone .. " (" .. x .. ", " .. y .. ")")
        
        -- Get continent and zone indices from lookup table
        local c, z
        local zoneInfo = ZoneLookup[zone]
        if zoneInfo then
            c, z = zoneInfo.c, zoneInfo.z
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF  Zone lookup: " .. zone .. " => c=" .. c .. ", z=" .. z .. "|r")
        else
            -- Fallback to current map zone
            c, z = GetCurrentMapContinent(), GetCurrentMapZone()
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600  Zone '" .. zone .. "' not in lookup, using current map: c=" .. tostring(c) .. ", z=" .. tostring(z) .. "|r")
        end
        
        -- Try various TomTom API methods
        local success = false
        
        -- Method 1: AddZWaypoint with continent, zone, x, y, desc (vanilla TomTom format)
        if TomTom.AddZWaypoint then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF  Trying AddZWaypoint(c=" .. tostring(c) .. ", z=" .. tostring(z) .. ")...|r")
            local ok, result = pcall(function() return TomTom:AddZWaypoint(c, z, x, y, title or "VGuide") end)
            if ok and result then
                obj.tomtomWaypoint = result
                success = true
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  Success!|r")
            elseif ok then
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600  AddZWaypoint returned nil|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000  AddZWaypoint error: " .. tostring(result) .. "|r")
            end
        end
        
        -- Method 2: AddWaypoint with continent, zone, x, y, desc
        if not success and TomTom.AddWaypoint then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF  Trying AddWaypoint(c,z,x,y)...|r")
            local ok, result = pcall(function() return TomTom:AddWaypoint(c, z, x, y, title or "VGuide") end)
            if ok and result then
                obj.tomtomWaypoint = result
                success = true
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  Success!|r")
            elseif ok then
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600  AddWaypoint returned nil|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000  AddWaypoint error: " .. tostring(result) .. "|r")
            end
        end
        
        -- Method 3: SetCrazyArrow (some TomTom versions)
        if not success and TomTom.SetCrazyArrow then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF  Trying SetCrazyArrow...|r")
            local ok, result = pcall(function() return TomTom:SetCrazyArrow(c, z, x, y, title or "VGuide") end)
            if ok then
                success = true
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  Success!|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000  SetCrazyArrow error: " .. tostring(result) .. "|r")
            end
        end
        
        -- Method 4: Try with x/100, y/100 normalization if above failed  
        if not success and TomTom.AddWaypoint then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF  Trying AddWaypoint with normalized coords...|r")
            local ok, result = pcall(function() return TomTom:AddWaypoint(c, z, x/100, y/100, title or "VGuide") end)
            if ok and result then
                obj.tomtomWaypoint = result
                success = true
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  Success!|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000  Normalized AddWaypoint error: " .. tostring(result) .. "|r")
            end
        end
        
        if not success then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000VGuide:|r No compatible TomTom API found")
        end
        
        return success
    end
    
    obj.ClearWaypoint = function(self)
        if obj.tomtomWaypoint and TomTom then
            pcall(function()
                if TomTom.RemoveWaypoint then
                    TomTom:RemoveWaypoint(obj.tomtomWaypoint)
                elseif TomTom.ClearWaypoint then
                    TomTom:ClearWaypoint(obj.tomtomWaypoint)
                end
            end)
        end
        obj.tomtomWaypoint = nil
        obj.waypoint = nil
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
        return obj.enabled and obj.tomtomAvailable
    end
    
    obj.Toggle = function(self)
        -- TomTom handles its own visibility
    end
    
    obj.IsTomTomAvailable = function(self)
        return obj.tomtomAvailable
    end
    
    return obj
end

Dv(" VGuide WaypointArrow.lua End")
