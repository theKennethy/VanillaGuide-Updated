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

return VGuide