--[[--------------------------------------------------
----- VanillaGuide -----
------------------
WaypointArrow.lua
Authors: VanillaGuide Contributors
Version: 1.08.0
------------------------------------------------------
Description: 
    Waypoint arrow system for VanillaGuide
    Integrates with TomTom if available, otherwise uses built-in arrow
------------------------------------------------------
]]--

Dv(" VGuide WaypointArrow.lua Start")

VGuideArrow = {}
VGuideArrow.__index = VGuideArrow

-- Constants
local ARROW_SIZE = 56
local UPDATE_INTERVAL = 0.05
local ARRIVAL_DISTANCE = 10
local PI = math.pi
local TWO_PI = PI * 2
local YARDS_PER_UNIT = 4.57

function VGuideArrow:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.waypoint = nil
    obj.enabled = true
    obj.lastUpdate = 0
    obj.useTomTom = false
    obj.tomtomWaypoint = nil
    
    -- Check if TomTom is available
    if TomTom and TomTom.AddZWaypoint then
        obj.useTomTom = true
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r TomTom detected, using TomTom for waypoints")
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Using built-in waypoint arrow")
    end
    
    ---------------------------------------
    -- Built-in Arrow Frame (when TomTom not available)
    ---------------------------------------
    
    if not obj.useTomTom then
        local frame = CreateFrame("Frame", "VGuideArrowFrame", UIParent)
        frame:SetWidth(160)
        frame:SetHeight(80)
        frame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", function() this:StartMoving() end)
        frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
        frame:SetFrameStrata("HIGH")
        frame:Hide()
        
        -- Background
        local bg = frame:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetTexture(0, 0, 0, 0.7)
        
        -- Arrow texture
        local arrow = frame:CreateTexture(nil, "ARTWORK")
        arrow:SetWidth(ARROW_SIZE)
        arrow:SetHeight(ARROW_SIZE)
        arrow:SetPoint("TOP", frame, "TOP", 0, -5)
        arrow:SetTexture("Interface\\Minimap\\MinimapArrow")
        arrow:SetVertexColor(0, 1, 0)
        frame.arrow = arrow
        
        -- Title text
        local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        titleText:SetPoint("TOP", arrow, "BOTTOM", 0, -2)
        titleText:SetWidth(150)
        titleText:SetTextColor(1, 0.82, 0)
        frame.titleText = titleText
        
        -- Distance/status text
        local distText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        distText:SetPoint("TOP", titleText, "BOTTOM", 0, -2)
        distText:SetTextColor(0.2, 1, 0.2)
        frame.distText = distText
        
        -- Close button
        local closeBtn = CreateFrame("Button", nil, frame)
        closeBtn:SetWidth(16)
        closeBtn:SetHeight(16)
        closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
        closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
        closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
        closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
        closeBtn:SetScript("OnClick", function()
            obj:ClearWaypoint()
        end)
        
        obj.frame = frame
        
        -- Update script
        frame:SetScript("OnUpdate", function()
            obj:Update(arg1)
        end)
    end
    
    ---------------------------------------
    -- Arrow Rotation
    ---------------------------------------
    
    obj.SetArrowDirection = function(self, angle)
        if obj.useTomTom or not obj.frame then return end
        
        while angle < 0 do angle = angle + TWO_PI end
        while angle >= TWO_PI do angle = angle - TWO_PI end
        
        local sin = math.sin(angle)
        local cos = math.cos(angle)
        
        -- Rotate texture using 8-arg SetTexCoord
        local ULx = 0.5 - 0.5*cos + 0.5*sin
        local ULy = 0.5 - 0.5*sin - 0.5*cos
        local LLx = 0.5 - 0.5*cos - 0.5*sin
        local LLy = 0.5 - 0.5*sin + 0.5*cos
        local URx = 0.5 + 0.5*cos + 0.5*sin
        local URy = 0.5 + 0.5*sin - 0.5*cos
        local LRx = 0.5 + 0.5*cos - 0.5*sin
        local LRy = 0.5 + 0.5*sin + 0.5*cos
        
        obj.frame.arrow:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy)
    end
    
    ---------------------------------------
    -- Position/Zone Helpers
    ---------------------------------------
    
    obj.GetPlayerPosition = function(self)
        SetMapToCurrentZone()
        local x, y = GetPlayerMapPosition("player")
        if x and y and (x ~= 0 or y ~= 0) then
            return x * 100, y * 100
        end
        return nil, nil
    end
    
    obj.GetPlayerZone = function(self)
        return GetRealZoneText() or GetZoneText() or ""
    end
    
    obj.CalculateDistance = function(self, x1, y1, x2, y2)
        if not x1 or not y1 or not x2 or not y2 then return nil end
        local dx = x2 - x1
        local dy = y2 - y1
        return math.sqrt(dx * dx + dy * dy) * YARDS_PER_UNIT
    end
    
    obj.CalculateAngle = function(self, playerX, playerY, waypointX, waypointY)
        if not playerX or not waypointX then return 0 end
        local dx = waypointX - playerX
        local dy = waypointY - playerY
        return math.atan2(dx, -dy)
    end
    
    obj.GetPlayerFacing = function(self)
        if GetPlayerFacing then
            return GetPlayerFacing()
        end
        return 0
    end
    
    ---------------------------------------
    -- Update (built-in arrow only)
    ---------------------------------------
    
    obj.Update = function(self, elapsed)
        if obj.useTomTom then return end
        if not obj.enabled or not obj.waypoint then
            if obj.frame then obj.frame:Hide() end
            return
        end
        
        obj.lastUpdate = obj.lastUpdate + elapsed
        if obj.lastUpdate < UPDATE_INTERVAL then return end
        obj.lastUpdate = 0
        
        local wp = obj.waypoint
        local playerX, playerY = obj:GetPlayerPosition()
        local playerZone = obj:GetPlayerZone()
        
        -- Zone check
        if playerZone ~= wp.zone then
            obj.frame:Show()
            obj.frame.arrow:Hide()
            obj.frame.titleText:SetText(wp.title or "Waypoint")
            obj.frame.distText:SetText("|cffff8800Go to: " .. (wp.zone or "?") .. "|r")
            return
        end
        
        if not playerX or not playerY then
            obj.frame.distText:SetText("Position unavailable")
            return
        end
        
        local distance = obj:CalculateDistance(playerX, playerY, wp.x, wp.y)
        if not distance then
            obj.frame:Hide()
            return
        end
        
        obj.frame:Show()
        obj.frame.arrow:Show()
        
        if distance < ARRIVAL_DISTANCE then
            obj.frame.titleText:SetText(wp.title or "Waypoint")
            obj.frame.distText:SetText("|cff00ff00Arrived!|r")
            obj:SetArrowDirection(0)
            return
        end
        
        -- Calculate arrow direction
        local angleToWP = obj:CalculateAngle(playerX, playerY, wp.x, wp.y)
        local facing = obj:GetPlayerFacing()
        local arrowAngle = angleToWP + facing
        
        obj:SetArrowDirection(arrowAngle)
        
        obj.frame.titleText:SetText(wp.title or "Waypoint")
        if distance >= 1000 then
            obj.frame.distText:SetText(string.format("%.1f km", distance / 1000))
        else
            obj.frame.distText:SetText(string.format("%.0f yards", distance))
        end
    end
    
    ---------------------------------------
    -- Public API
    ---------------------------------------
    
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        if not x or not y or not zone then return false end
        
        x = tonumber(x)
        y = tonumber(y)
        if not x or not y then return false end
        
        -- Clear existing TomTom waypoint
        if obj.useTomTom and obj.tomtomWaypoint then
            if TomTom.RemoveWaypoint then
                TomTom:RemoveWaypoint(obj.tomtomWaypoint)
            end
            obj.tomtomWaypoint = nil
        end
        
        obj.waypoint = {
            x = x,
            y = y,
            zone = zone,
            title = title or "Waypoint",
            description = description or ""
        }
        
        -- Use TomTom if available
        if obj.useTomTom and TomTom.AddZWaypoint then
            -- TomTom expects coords in 0-100 format
            obj.tomtomWaypoint = TomTom:AddZWaypoint(zone, x, y, title or "VGuide Waypoint")
        elseif obj.frame then
            obj.frame:Show()
        end
        
        return true
    end
    
    obj.ClearWaypoint = function(self)
        if obj.useTomTom and obj.tomtomWaypoint then
            if TomTom.RemoveWaypoint then
                TomTom:RemoveWaypoint(obj.tomtomWaypoint)
            end
            obj.tomtomWaypoint = nil
        end
        
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
        if obj.frame and obj.frame:IsShown() then
            obj.frame:Hide()
        elseif obj.waypoint and obj.frame then
            obj.frame:Show()
        end
    end
    
    obj.IsTomTomActive = function(self)
        return obj.useTomTom
    end
    
    return obj
end

Dv(" VGuide WaypointArrow.lua End")
