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
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600VanillaGuide:|r TomTom not found. Install TomTom for waypoint arrows.")
    end
    
    ---------------------------------------
    -- Public API
    ---------------------------------------
    
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        if not obj.tomtomAvailable then return false end
        if not x or not y or not zone then return false end
        
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
        
        -- Add TomTom waypoint
        if TomTom.AddZWaypoint then
            obj.tomtomWaypoint = TomTom:AddZWaypoint(zone, x, y, title or "VGuide")
        elseif TomTom.AddWaypoint then
            -- Alternative API
            obj.tomtomWaypoint = TomTom:AddWaypoint(x, y, title or "VGuide", zone)
        end
        
        return true
    end
    
    obj.ClearWaypoint = function(self)
        if obj.tomtomWaypoint and TomTom then
            if TomTom.RemoveWaypoint then
                TomTom:RemoveWaypoint(obj.tomtomWaypoint)
            elseif TomTom.ClearWaypoint then
                TomTom:ClearWaypoint(obj.tomtomWaypoint)
            end
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
