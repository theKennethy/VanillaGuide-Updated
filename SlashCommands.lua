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

return VGuide