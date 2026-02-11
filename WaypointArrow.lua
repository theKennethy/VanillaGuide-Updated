--[[--------------------------------------------------
----- VanillaGuide -----
------------------
WaypointArrow.lua
Authors: VanillaGuide Contributors
Version: 1.07.0
------------------------------------------------------
Description: 
    TomTom-style waypoint arrow system for VanillaGuide
    Uses 108-frame texture atlas for smooth rotation
    Features:
    - Direction arrow with pre-rotated frames (TomTom style)
    - Distance display in yards
    - Zone-aware (only shows when in correct zone)
    - Arrival detection
------------------------------------------------------
]]--

Dv(" VGuide WaypointArrow.lua Start")

VGuideArrow = {}
VGuideArrow.__index = VGuideArrow

-- Constants
local ARROW_SIZE = 56
local UPDATE_INTERVAL = 0.03  -- ~30 FPS for smooth rotation
local ARRIVAL_DISTANCE = 5   -- yards
local PI = math.pi
local TWO_PI = PI * 2

-- Yard conversion factor (approximate for WoW vanilla)
local YARDS_PER_UNIT = 4.57

function VGuideArrow:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    
    -- Current waypoint data
    obj.waypoint = nil  -- { x, y, zone, title, description }
    obj.enabled = true
    
    -- Timing
    obj.lastUpdate = 0
    
    -- Player facing cache
    obj.playerFacing = 0
    
    ---------------------------------------
    -- Frame Creation
    ---------------------------------------
    
    local function CreateArrowFrame()
        local frame = CreateFrame("Frame", "VGuideArrowFrame", UIParent)
        frame:SetWidth(ARROW_SIZE + 100)  -- Extra width for text
        frame:SetHeight(ARROW_SIZE + 50)
        frame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", function() this:StartMoving() end)
        frame:SetScript("OnDragStop", function() 
            this:StopMovingOrSizing()
            -- Save position
            local point, _, relPoint, xOfs, yOfs = this:GetPoint()
            if obj.Settings and obj.Settings.db and obj.Settings.db.char then
                obj.Settings.db.char.Arrow = obj.Settings.db.char.Arrow or {}
                obj.Settings.db.char.Arrow.point = point
                obj.Settings.db.char.Arrow.relPoint = relPoint
                obj.Settings.db.char.Arrow.x = xOfs
                obj.Settings.db.char.Arrow.y = yOfs
            end
        end)
        frame:SetFrameStrata("HIGH")
        frame:Hide()
        
        -- Background (semi-transparent circle)
        local bg = frame:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetTexture(0, 0, 0, 0.6)
        frame.bg = bg
        
        -- Arrow container
        local arrowFrame = CreateFrame("Frame", nil, frame)
        arrowFrame:SetWidth(ARROW_SIZE)
        arrowFrame:SetHeight(ARROW_SIZE)
        arrowFrame:SetPoint("TOP", frame, "TOP", 0, -5)
        frame.arrowFrame = arrowFrame
        
        -- Arrow texture - use built-in WoW texture
        local arrow = arrowFrame:CreateTexture(nil, "ARTWORK")
        arrow:SetWidth(ARROW_SIZE)
        arrow:SetHeight(ARROW_SIZE)
        arrow:SetTexture("Interface\\Minimap\\MinimapArrow")
        arrow:SetAllPoints(arrowFrame)
        arrow:SetVertexColor(0, 1, 0)  -- Green
        frame.arrow = arrow
        
        -- Title text
        local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        titleText:SetPoint("TOP", arrowFrame, "BOTTOM", 0, -2)
        titleText:SetTextColor(1, 0.82, 0)  -- Gold
        titleText:SetText("")
        frame.titleText = titleText
        
        -- Distance text
        local distText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        distText:SetPoint("TOP", titleText, "BOTTOM", 0, -2)
        distText:SetTextColor(0.2, 1, 0.2)  -- Green
        distText:SetText("")
        frame.distText = distText
        
        -- Status text (wrong zone, arrived, etc.)
        local statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        statusText:SetPoint("TOP", distText, "BOTTOM", 0, -2)
        statusText:SetTextColor(1, 0.5, 0)  -- Orange
        statusText:SetText("")
        frame.statusText = statusText
        
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
        frame.closeBtn = closeBtn
        
        return frame
    end
    
    obj.frame = CreateArrowFrame()
    
    ---------------------------------------
    -- Arrow Rotation (TexCoord-based)
    ---------------------------------------
    
    -- Rotate arrow to point in direction using SetTexCoord
    -- Angle is in radians, 0 = up, positive = clockwise
    obj.SetArrowDirection = function(self, angle)
        -- Normalize angle to 0-2PI
        while angle < 0 do angle = angle + TWO_PI end
        while angle >= TWO_PI do angle = angle - TWO_PI end
        
        local sin = math.sin(angle)
        local cos = math.cos(angle)
        
        -- Rotate texture coordinates around center (0.5, 0.5)
        local ofs = 0.5
        
        -- Calculate rotated corner positions for SetTexCoord
        -- SetTexCoord expects: ULx, ULy, LLx, LLy, URx, URy, LRx, LRy
        local ULx = ofs - ofs * cos - ofs * sin
        local ULy = ofs + ofs * sin - ofs * cos
        local LLx = ofs - ofs * cos + ofs * sin
        local LLy = ofs + ofs * sin + ofs * cos
        local URx = ofs + ofs * cos - ofs * sin
        local URy = ofs - ofs * sin - ofs * cos
        local LRx = ofs + ofs * cos + ofs * sin
        local LRy = ofs - ofs * sin + ofs * cos
        
        obj.frame.arrow:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy)
    end
    
    ---------------------------------------
    -- Distance Calculation
    ---------------------------------------
    
    -- Get player position (returns x, y in 0-100 scale, or nil if unavailable)
    obj.GetPlayerPosition = function(self)
        -- SetMapToCurrentZone() first to ensure we're reading right map
        SetMapToCurrentZone()
        local x, y = GetPlayerMapPosition("player")
        if x and y and (x ~= 0 or y ~= 0) then
            return x * 100, y * 100
        end
        return nil, nil
    end
    
    -- Get current zone name
    obj.GetPlayerZone = function(self)
        return GetRealZoneText() or GetZoneText() or ""
    end
    
    -- Calculate distance between two points (in yards)
    obj.CalculateDistance = function(self, x1, y1, x2, y2)
        if not x1 or not y1 or not x2 or not y2 then return nil end
        local dx = x2 - x1
        local dy = y2 - y1
        -- Distance in coordinate units, convert to yards
        local dist = math.sqrt(dx * dx + dy * dy)
        return dist * YARDS_PER_UNIT
    end
    
    -- Calculate angle from player to waypoint (in radians)
    -- Returns angle where 0 = north, positive = clockwise
    obj.CalculateAngle = function(self, playerX, playerY, waypointX, waypointY)
        if not playerX or not waypointX then return 0 end
        
        local dx = waypointX - playerX
        local dy = waypointY - playerY
        
        -- atan2 gives angle from positive X axis (east)
        -- We want angle from north (up on map = negative Y in WoW coords)
        -- Map coords: X increases right, Y increases down
        local angle = math.atan2(dx, -dy)
        
        return angle
    end
    
    -- Get camera/player facing direction (radians, 0 = north)
    -- Uses minimap rotation which follows camera when "rotate minimap" is on
    obj.GetCameraFacing = function(self)
        -- Try to get minimap rotation (follows camera)
        local minimapRotation = 0
        if MinimapCompassTexture and MinimapCompassTexture.IsVisible and MinimapCompassTexture:IsVisible() then
            -- Minimap is rotating with camera
            minimapRotation = MiniMapCompassRing and MiniMapCompassRing:GetFacing() or 0
        end
        
        -- Fallback to GetPlayerFacing (works when rotate minimap is off)
        local facing = GetPlayerFacing and GetPlayerFacing() or 0
        
        -- GetPlayerFacing returns radians where 0 = north, increases counter-clockwise
        -- Negate for our clockwise system
        return -facing
    end
    
    ---------------------------------------
    -- Update Logic
    ---------------------------------------
    
    obj.Update = function(self, elapsed)
        if not obj.enabled or not obj.waypoint then
            obj.frame:Hide()
            return
        end
        
        -- Throttle updates
        obj.lastUpdate = obj.lastUpdate + elapsed
        if obj.lastUpdate < UPDATE_INTERVAL then return end
        obj.lastUpdate = 0
        
        local wp = obj.waypoint
        local playerX, playerY = obj:GetPlayerPosition()
        local playerZone = obj:GetPlayerZone()
        
        -- Check if we're in the right zone
        local inCorrectZone = (playerZone == wp.zone)
        
        if not inCorrectZone then
            -- Show "wrong zone" message
            obj.frame:Show()
            obj.frame.arrow:Hide()
            obj.frame.titleText:SetText(wp.title or "Waypoint")
            obj.frame.distText:SetText("")
            obj.frame.statusText:SetText("Go to: " .. (wp.zone or "Unknown"))
            return
        end
        
        if not playerX or not playerY then
            obj.frame.statusText:SetText("Position unavailable")
            return
        end
        
        -- Calculate distance
        local distance = obj:CalculateDistance(playerX, playerY, wp.x, wp.y)
        
        if not distance then
            obj.frame:Hide()
            return
        end
        
        obj.frame:Show()
        obj.frame.arrow:Show()
        
        -- Check if arrived
        if distance < ARRIVAL_DISTANCE then
            obj.frame.titleText:SetText(wp.title or "Waypoint")
            obj.frame.distText:SetText("|cff00ff00Arrived!|r")
            obj.frame.statusText:SetText("")
            obj:SetArrowDirection(0)  -- Point up when arrived
            return
        end
        
        -- Calculate direction
        local angleToWaypoint = obj:CalculateAngle(playerX, playerY, wp.x, wp.y)
        local cameraFacing = obj:GetCameraFacing()
        
        -- Arrow should point relative to camera/player facing
        local arrowAngle = angleToWaypoint - cameraFacing
        
        obj:SetArrowDirection(arrowAngle)
        
        -- Update text
        obj.frame.titleText:SetText(wp.title or "Waypoint")
        
        -- Format distance
        local distStr
        if distance >= 1000 then
            distStr = string.format("%.1f km", distance / 1000)
        else
            distStr = string.format("%.0f yards", distance)
        end
        obj.frame.distText:SetText(distStr)
        obj.frame.statusText:SetText("")
    end
    
    ---------------------------------------
    -- Public API
    ---------------------------------------
    
    -- Set a waypoint
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFFVGuide Arrow:|r SetWaypoint called")
        
        if not x or not y or not zone then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000VGuide Arrow:|r Invalid data - x=" .. tostring(x) .. " y=" .. tostring(y) .. " zone=" .. tostring(zone))
            return false
        end
        
        x = tonumber(x)
        y = tonumber(y)
        if not x or not y then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000VGuide Arrow:|r Invalid coordinate values")
            return false
        end
        
        obj.waypoint = {
            x = x,
            y = y,
            zone = zone,
            title = title or "Waypoint",
            description = description or ""
        }
        
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VGuide Arrow:|r Waypoint set to " .. zone .. " (" .. x .. ", " .. y .. ")")
        
        obj.frame:Show()
        obj.frame.arrow:Show()
        return true
    end
    
    -- Clear current waypoint
    obj.ClearWaypoint = function(self)
        obj.waypoint = nil
        obj.frame:Hide()
        Dv("    VGuideArrow: Waypoint cleared")
    end
    
    -- Check if a waypoint is set
    obj.HasWaypoint = function(self)
        return obj.waypoint ~= nil
    end
    
    -- Get current waypoint
    obj.GetWaypoint = function(self)
        return obj.waypoint
    end
    
    -- Enable/disable the arrow
    obj.SetEnabled = function(self, enabled)
        obj.enabled = enabled
        if not enabled then
            obj.frame:Hide()
        elseif obj.waypoint then
            obj.frame:Show()
        end
    end
    
    -- Check if enabled
    obj.IsEnabled = function(self)
        return obj.enabled
    end
    
    -- Toggle visibility
    obj.Toggle = function(self)
        if obj.frame:IsShown() then
            obj.frame:Hide()
        elseif obj.waypoint then
            obj.frame:Show()
        end
    end
    
    ---------------------------------------
    -- Frame Scripts
    ---------------------------------------
    
    obj.frame:SetScript("OnUpdate", function()
        obj:Update(arg1)
    end)
    
    -- Restore saved position
    obj.RestorePosition = function(self)
        if obj.Settings and obj.Settings.db and obj.Settings.db.char and obj.Settings.db.char.Arrow then
            local saved = obj.Settings.db.char.Arrow
            if saved.point and saved.relPoint then
                obj.frame:ClearAllPoints()
                obj.frame:SetPoint(saved.point, UIParent, saved.relPoint, saved.x or 0, saved.y or 0)
            end
        end
    end
    
    -- Restore position on creation
    obj:RestorePosition()
    
    return obj
end

Dv(" VGuide WaypointArrow.lua End")
