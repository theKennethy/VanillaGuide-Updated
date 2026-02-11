--[[--------------------------------------------------
----- VanillaGuide -----
------------------
ProgressTracker.lua
------------------------------------------------------
Description: 
    Progress Persistence for VanillaGuide
    Saves and restores:
    - Completed steps per guide
    - Manually skipped steps
    - Last visited step per guide
    - Achievement tracking
------------------------------------------------------
]]--

Dv(" VGuide ProgressTracker.lua Start")

VGuideProgressTracker = {}
VGuideProgressTracker.__index = VGuideProgressTracker

function VGuideProgressTracker:new(oSettings, oDisplay)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.Display = oDisplay
    obj.db = nil
    
    return obj
end

function VGuideProgressTracker:Initialize()
    -- Initialize saved vars
    if not VanillaGuideDBPC then
        VanillaGuideDBPC = {}
    end
    
    if not VanillaGuideDBPC.progress then
        VanillaGuideDBPC.progress = {
            -- Guide progress: [guideID] = { completed = {}, lastStep = 1, manuallySkipped = {} }
            guides = {},
            -- Statistics
            stats = {
                totalStepsCompleted = 0,
                guidesCompleted = 0,
                startTime = time(),
                totalPlayTime = 0,
            },
            -- Settings
            settings = {
                trackCompleted = true,
                trackManualSkips = true,
                showProgress = true,
            },
        }
    end
    
    self.db = VanillaGuideDBPC.progress
    
    Dv(" VGuideProgressTracker: Initialized")
end

-- Get progress data for a specific guide
function VGuideProgressTracker:GetGuideProgress(guideID)
    if not self.db or not guideID then return nil end
    
    if not self.db.guides[guideID] then
        self.db.guides[guideID] = {
            completed = {},       -- Step numbers that are completed
            manuallySkipped = {}, -- Step numbers manually skipped
            lastStep = 1,         -- Last step visited
            firstVisit = time(),  -- First time this guide was opened
            lastVisit = time(),   -- Last time this guide was opened
        }
    end
    
    return self.db.guides[guideID]
end

-- Mark a step as completed
function VGuideProgressTracker:MarkStepCompleted(guideID, stepNum)
    if not guideID or not stepNum then return end
    
    local progress = self:GetGuideProgress(guideID)
    
    -- Check if already completed
    for _, step in ipairs(progress.completed) do
        if step == stepNum then
            return -- Already completed
        end
    end
    
    table.insert(progress.completed, stepNum)
    
    -- Update stats
    self.db.stats.totalStepsCompleted = self.db.stats.totalStepsCompleted + 1
    
    Dv(" VGuideProgressTracker: Marked step " .. stepNum .. " completed in guide " .. guideID)
end

-- Check if a step is completed
function VGuideProgressTracker:IsStepCompleted(guideID, stepNum)
    if not guideID or not stepNum then return false end
    
    local progress = self:GetGuideProgress(guideID)
    
    for _, step in ipairs(progress.completed) do
        if step == stepNum then
            return true
        end
    end
    
    return false
end

-- Mark a step as manually skipped
function VGuideProgressTracker:MarkStepSkipped(guideID, stepNum)
    if not guideID or not stepNum then return end
    
    local progress = self:GetGuideProgress(guideID)
    
    -- Check if already skipped
    for _, step in ipairs(progress.manuallySkipped) do
        if step == stepNum then
            return -- Already skipped
        end
    end
    
    table.insert(progress.manuallySkipped, stepNum)
end

-- Check if a step is manually skipped
function VGuideProgressTracker:IsStepSkipped(guideID, stepNum)
    if not guideID or not stepNum then return false end
    
    local progress = self:GetGuideProgress(guideID)
    
    for _, step in ipairs(progress.manuallySkipped) do
        if step == stepNum then
            return true
        end
    end
    
    return false
end

-- Check if a step should be shown as done (completed or skipped)
function VGuideProgressTracker:IsStepDone(guideID, stepNum)
    return self:IsStepCompleted(guideID, stepNum) or self:IsStepSkipped(guideID, stepNum)
end

-- Update last visited step
function VGuideProgressTracker:UpdateLastStep(guideID, stepNum)
    if not guideID or not stepNum then return end
    
    local progress = self:GetGuideProgress(guideID)
    progress.lastStep = stepNum
    progress.lastVisit = time()
end

-- Get last visited step for a guide
function VGuideProgressTracker:GetLastStep(guideID)
    if not guideID then return 1 end
    
    local progress = self:GetGuideProgress(guideID)
    return progress.lastStep or 1
end

-- Get number of completed steps in a guide
function VGuideProgressTracker:GetCompletedCount(guideID)
    if not guideID then return 0 end
    
    local progress = self:GetGuideProgress(guideID)
    return getn(progress.completed) or 0
end

-- Get progress percentage for a guide
function VGuideProgressTracker:GetProgressPercent(guideID, totalSteps)
    if not guideID or not totalSteps or totalSteps == 0 then return 0 end
    
    local completed = self:GetCompletedCount(guideID)
    return math.floor((completed / totalSteps) * 100)
end

-- Reset progress for a specific guide
function VGuideProgressTracker:ResetGuideProgress(guideID)
    if not guideID or not self.db then return end
    
    self.db.guides[guideID] = nil
    
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00VanillaGuide:|r Progress reset for guide " .. guideID)
end

-- Reset all progress
function VGuideProgressTracker:ResetAllProgress()
    if not self.db then return end
    
    self.db.guides = {}
    self.db.stats.totalStepsCompleted = 0
    self.db.stats.guidesCompleted = 0
    
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00VanillaGuide:|r All progress has been reset")
end

-- Get overall statistics
function VGuideProgressTracker:GetStats()
    if not self.db then return nil end
    
    return {
        totalStepsCompleted = self.db.stats.totalStepsCompleted,
        guidesCompleted = self.db.stats.guidesCompleted,
        guidesInProgress = 0,
        startTime = self.db.stats.startTime,
    }
end

-- Get progress summary string
function VGuideProgressTracker:GetProgressSummary()
    if not self.Display then return "Progress: Unknown" end
    
    local guideID = self.Display:GetCurrentGuideID()
    local totalSteps = self.Display:GetCurrentStepCount()
    
    if not guideID or not totalSteps then
        return "Progress: N/A"
    end
    
    local completed = self:GetCompletedCount(guideID)
    local percent = self:GetProgressPercent(guideID, totalSteps)
    
    return string.format("Progress: %d/%d (%d%%)", completed, totalSteps, percent)
end

-- Auto-complete step based on quest status (called from QuestLogTracker)
function VGuideProgressTracker:OnQuestCompleted(questName)
    if not self.Display then return end
    
    local guideID = self.Display:GetCurrentGuideID()
    local currentStep = self.Display:GetCurrentStep()
    local stepLabel = self.Display:GetStepLabel()
    
    -- Check if the quest is mentioned in the current step
    if stepLabel and questName then
        if string.find(stepLabel, questName, 1, true) then
            self:MarkStepCompleted(guideID, currentStep)
        end
    end
end

-- Called when changing guides - restore last position
function VGuideProgressTracker:OnGuideChanged(guideID)
    if not guideID then return end
    
    local progress = self:GetGuideProgress(guideID)
    
    -- Update visit time
    progress.lastVisit = time()
    
    -- Return last step position (Display will use this)
    return progress.lastStep
end

-- Called when step changes - save position
function VGuideProgressTracker:OnStepChanged()
    if not self.Display then return end
    
    local guideID = self.Display:GetCurrentGuideID()
    local stepNum = self.Display:GetCurrentStep()
    
    self:UpdateLastStep(guideID, stepNum)
end

-- Get colored status indicator for a step
function VGuideProgressTracker:GetStepStatusIndicator(guideID, stepNum)
    if self:IsStepCompleted(guideID, stepNum) then
        return "|cff00ff00[DONE]|r "  -- Green
    elseif self:IsStepSkipped(guideID, stepNum) then
        return "|cffffff00[SKIP]|r "  -- Yellow
    else
        return ""
    end
end

-- Mark current step as completed (manual)
function VGuideProgressTracker:MarkCurrentCompleted()
    if not self.Display then return end
    
    local guideID = self.Display:GetCurrentGuideID()
    local stepNum = self.Display:GetCurrentStep()
    
    self:MarkStepCompleted(guideID, stepNum)
    
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00VanillaGuide:|r Step " .. stepNum .. " marked as completed")
    
    -- Refresh UI
    if VGuide and VGuide.UI and VGuide.UI.MainFrame then
        VGuide.UI.MainFrame:RefreshScrollFrame()
    end
end

-- Skip current step (manual)
function VGuideProgressTracker:SkipCurrentStep()
    if not self.Display then return end
    
    local guideID = self.Display:GetCurrentGuideID()
    local stepNum = self.Display:GetCurrentStep()
    
    self:MarkStepSkipped(guideID, stepNum)
    
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00VanillaGuide:|r Step " .. stepNum .. " marked as skipped")
    
    -- Move to next step
    self.Display:NextStep()
    
    -- Refresh UI
    if VGuide and VGuide.UI and VGuide.UI.MainFrame then
        VGuide.UI.MainFrame:RefreshData(false)
    end
end

-- Make available globally
_G.VGuideProgressTracker = VGuideProgressTracker

Dv(" VGuide ProgressTracker.lua End")
