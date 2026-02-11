--[[--------------------------------------------------
----- VanillaGuide -----
------------------
SlashCommands.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: 
      This file handles Slash Commands using Ace2 lib
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
			1.99x for a beta release was a weird choise.
	1.04.1
		-- no changes at all ;)
	1.04.2
		-- no changes in here for this revision
	1.04.3
		-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

local VGuide = VGuide

local options = { 
    type='group',
    args = {
			toggle = {
				type = 'toggle',
				name = 'toggle',
				desc = 'This Toggle VanillaGuide Main Frame visibility',
				get = "IsMFVisible",
				set = "ToggleMFVisibility"
			},
			suggest = {
				type = 'execute',
				name = 'suggest',
				desc = 'Switch to suggested guide for your level',
				func = "SuggestGuide"
			},
			skip = {
				type = 'execute',
				name = 'skip',
				desc = 'Skip to the next incomplete step',
				func = "SkipCompleted"
			},
			complete = {
				type = 'execute',
				name = 'complete',
				desc = 'Mark current step as completed',
				func = "MarkComplete"
			},
			quests = {
				type = 'execute',
				name = 'quests',
				desc = 'Toggle quest list pop-out',
				func = "ToggleQuestList"
			},
			arrow = {
				type = 'toggle',
				name = 'arrow',
				desc = 'Toggle waypoint arrow visibility',
				get = "IsArrowVisible",
				set = "ToggleArrow"
			},
			autoquest = {
				type = 'toggle',
				name = 'autoquest',
				desc = 'Toggle auto accept/turn-in for guide quests',
				get = "IsAutoQuestEnabled",
				set = "ToggleAutoQuest"
			},
			mappins = {
				type = 'toggle',
				name = 'mappins',
				desc = 'Toggle map pins on world map',
				get = "IsMapPinsEnabled",
				set = "ToggleMapPins"
			},
			route = {
				type = 'toggle',
				name = 'route',
				desc = 'Toggle route preview on world map',
				get = "IsRouteEnabled",
				set = "ToggleRoute"
			},
			npcviewer = {
				type = 'toggle',
				name = 'npcviewer',
				desc = 'Toggle NPC model viewer',
				get = "IsNPCViewerEnabled",
				set = "ToggleNPCViewer"
			},
			minimap = {
				type = 'toggle',
				name = 'minimap',
				desc = 'Toggle minimap button visibility',
				get = "IsMinimapButtonVisible",
				set = "ToggleMinimapButton"
			},
			resetminimap = {
				type = 'execute',
				name = 'resetminimap',
				desc = 'Reset minimap button position',
				func = "ResetMinimapButton"
			},
			compass = {
				type = 'toggle',
				name = 'compass',
				desc = 'Toggle minimap compass (N/E/S/W)',
				get = "IsCompassVisible",
				set = "ToggleCompass"
			},
			questpins = {
				type = 'toggle',
				name = 'questpins',
				desc = 'Toggle quest objective pins on world map (like pfQuest)',
				get = "IsQuestPinsVisible",
				set = "ToggleQuestPins"
			},
			minimapmobs = {
				type = 'toggle',
				name = 'minimapmobs',
				desc = 'Toggle quest objective dots on minimap (like pfQuest)',
				get = "IsMinimapObjectivesVisible",
				set = "ToggleMinimapObjectives"
			},
			progress = {
				type = 'execute',
				name = 'progress',
				desc = 'Show current guide progress',
				func = "ShowProgress"
			},
			markdone = {
				type = 'execute',
				name = 'markdone',
				desc = 'Mark current step as completed',
				func = "MarkStepDone"
			},
			resetprogress = {
				type = 'execute',
				name = 'resetprogress',
				desc = 'Reset progress for current guide',
				func = "ResetProgress"
			},
			testarrow = {
				type = 'execute',
				name = 'testarrow',
				desc = 'Test waypoint arrow with current location',
				func = "TestArrow"
			},
			arrowdebug = {
				type = 'execute',
				name = 'arrowdebug',
				desc = 'Show arrow debug info',
				func = "ArrowDebug"
			},
	},
}

VGuide:RegisterChatCommand({"/vguide", "/vg"}, options)

function VGuide:IsMFVisible()
	local frame = getglobal("VG_MainFrame")
    return frame:IsVisible()
end

function VGuide:ToggleMFVisibility()
    local frame = getglobal("VG_MainFrame")
	local fSettings = getglobal("VG_SettingsFrame")
    if frame:IsVisible() then
        frame:Hide()
		if fSettings:IsVisible() then
			fSettings.showthis = true
			fSettings:Hide()
		end
    else
        frame:Show()
		if fSettings.showthis then
			fSettings:Show()
		end
    end
end

function VGuide:SuggestGuide()
    if VGuideLevelDetect then
        VGuideLevelDetect:SwitchToSuggestedGuide()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Level detector not initialized")
    end
end

function VGuide:SkipCompleted()
    if VGuideLevelDetect then
        local skipped = VGuideLevelDetect:SkipCompletedSteps()
        if not skipped then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r No completed steps to skip")
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Level detector not initialized")
    end
end

function VGuide:MarkComplete()
    if VGuideLevelDetect then
        VGuideLevelDetect:MarkCurrentStepCompleted()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Level detector not initialized")
    end
end

function VGuide:IsMinimapButtonVisible()
    if VGuideMinimapButton and VGuideMinimapButton.frame then
        return VGuideMinimapButton.frame:IsVisible()
    end
    return false
end

function VGuide:ToggleMinimapButton()
    if VGuideMinimapButton then
        VGuideMinimapButton:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap button not initialized")
    end
end

function VGuide:ResetMinimapButton()
    if VGuideMinimapButton then
        VGuideMinimapButton:ResetPosition()
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap button position reset")
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap button not initialized")
    end
end

function VGuide:IsCompassVisible()
    if VGuideCompass then
        return VGuideCompass.enabled
    end
    return false
end

function VGuide:ToggleCompass()
    if VGuideCompass then
        VGuideCompass:Toggle()
        if VGuideCompass.enabled then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Compass enabled")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Compass disabled")
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Compass not initialized")
    end
end

function VGuide:IsQuestPinsVisible()
    if VGuideQuestMapPins then
        return VGuideQuestMapPins.enabled
    end
    return false
end

function VGuide:ToggleQuestPins()
    if VGuideQuestMapPins then
        VGuideQuestMapPins:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest pins not initialized")
    end
end

function VGuide:IsMinimapObjectivesVisible()
    if VGuideMinimapObjectives then
        return VGuideMinimapObjectives.enabled
    end
    return false
end

function VGuide:ToggleMinimapObjectives()
    if VGuideMinimapObjectives then
        VGuideMinimapObjectives:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap objectives not initialized")
    end
end

function VGuide:ShowProgress()
    if VGuideProgress then
        local summary = VGuideProgress:GetProgressSummary()
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r " .. summary)
        
        -- Also show stats
        local stats = VGuideProgress:GetStats()
        if stats then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Total steps completed: " .. stats.totalStepsCompleted)
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Progress tracker not initialized")
    end
end

function VGuide:MarkStepDone()
    if VGuideProgress then
        VGuideProgress:MarkCurrentCompleted()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Progress tracker not initialized")
    end
end

function VGuide:ResetProgress()
    if VGuideProgress and self.Display then
        local guideID = self.Display:GetCurrentGuideID()
        VGuideProgress:ResetGuideProgress(guideID)
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Progress tracker not initialized")
    end
end

function VGuide:ToggleQuestList()
    if VGuideQuestListObj then
        VGuideQuestListObj:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest list not initialized")
    end
end

function VGuide:IsArrowVisible()
    if VGuideWaypointArrow then
        return VGuideWaypointArrow:IsEnabled()
    end
    return false
end

function VGuide:ToggleArrow()
    if VGuideWaypointArrow then
        local enabled = VGuideWaypointArrow:IsEnabled()
        VGuideWaypointArrow:SetEnabled(not enabled)
        if enabled then
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint arrow disabled")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint arrow enabled")
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint arrow not initialized")
    end
end

function VGuide:IsAutoQuestEnabled()
    if VGuideAutoQuestObj then
        return VGuideAutoQuestObj:IsEnabled()
    end
    return false
end

function VGuide:ToggleAutoQuest()
    if VGuideAutoQuestObj then
        VGuideAutoQuestObj:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Auto Quest not initialized")
    end
end

function VGuide:IsMapPinsEnabled()
    if VGuideMapPinsObj then
        return VGuideMapPinsObj:IsEnabled()
    end
    return false
end

function VGuide:ToggleMapPins()
    if VGuideMapPinsObj then
        VGuideMapPinsObj:Toggle()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Map pins not initialized")
    end
end

function VGuide:IsRouteEnabled()
    if VGuideMapPinsObj then
        return VGuideMapPinsObj:ShowRoute()
    end
    return false
end

function VGuide:ToggleRoute()
    if VGuideMapPinsObj then
        VGuideMapPinsObj:ToggleRoute()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Map pins not initialized")
    end
end

function VGuide:IsNPCViewerEnabled()
    if VGuideNPCViewerObj then
        return VGuideNPCViewerObj:IsEnabled()
    end
    return false
end

function VGuide:ToggleNPCViewer()
    if VGuideNPCViewerObj then
        VGuideNPCViewerObj:ToggleEnabled()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r NPC Viewer not initialized")
    end
end

function VGuide:TestArrow()
    if not VGuideWaypointArrow then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint arrow not initialized")
        return
    end
    
    -- Get current player position
    SetMapToCurrentZone()
    local x, y = GetPlayerMapPosition("player")
    local zone = GetRealZoneText() or GetZoneText() or "Unknown"
    
    if not x or x == 0 then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Cannot get player position")
        return
    end
    
    -- Set waypoint 10 units north of player
    local testX = x * 100
    local testY = (y * 100) - 5  -- 5 units north
    
    if testY < 0 then testY = 5 end
    
    VGuideWaypointArrow:SetEnabled(true)
    local success = VGuideWaypointArrow:SetWaypoint(testX, testY, zone, "Test Waypoint", "Walk north to test")
    
    if success then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Test waypoint set! Walk north to find it.")
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Zone: " .. zone .. " (".. testX .. ", " .. testY .. ")")
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Failed to set test waypoint")
    end
end

function VGuide:ArrowDebug()
    if not VGuideWaypointArrow then
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Arrow Error:|r VGuideWaypointArrow is nil")
        return
    end
    
    local msg = "|cFF00FF00Arrow Debug:|r "
    
    -- Check enabled status
    local enabled = VGuideWaypointArrow:IsEnabled()
    msg = msg .. "Enabled=" .. tostring(enabled) .. ", "
    
    -- Check frame
    if VGuideWaypointArrow.frame then
        local visible = VGuideWaypointArrow.frame:IsVisible()
        msg = msg .. "FrameVisible=" .. tostring(visible) .. ", "
    else
        msg = msg .. "Frame=nil, "
    end
    
    -- Check waypoint
    if VGuideWaypointArrow:HasWaypoint() then
        local wp = VGuideWaypointArrow:GetWaypoint()
        if type(wp) == "table" then
            msg = msg .. "WP=" .. (wp.zone or "?") .. "(" .. (wp.x or "?") .. "," .. (wp.y or "?") .. ")"
        else
            msg = msg .. "WP=" .. tostring(wp)
        end
    else
        msg = msg .. "WP=none"
    end
    
    DEFAULT_CHAT_FRAME:AddMessage(msg)
    
    -- Check player position
    SetMapToCurrentZone()
    local x, y = GetPlayerMapPosition("player")
    local zone = GetRealZoneText() or "?"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Player:|r " .. zone .. " (" .. (x and x*100 or "?") .. ", " .. (y and y*100 or "?") .. ")")
    
    -- Check GetPlayerFacing
    local facing = GetPlayerFacing and GetPlayerFacing() or "N/A"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Facing:|r " .. tostring(facing))
end

return VGuide