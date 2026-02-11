--[[--------------------------------------------------
----- VanillaGuide -----
------------------
DungeonDetector.lua
------------------------------------------------------
Description: 
    Dungeon Auto-Detection for VanillaGuide
    Automatically switches to dungeon guide when entering an instance.
    Returns to previous guide when leaving.
------------------------------------------------------
]]--

Dv(" VGuide DungeonDetector.lua Start")

VGuideDungeonDetector = {}
VGuideDungeonDetector.__index = VGuideDungeonDetector

-- Maps instance names to their guide IDs (from 005_Dungeons.lua)
local DungeonGuideMap = {
    -- Classic Dungeons
    ["Ragefire Chasm"] = 8001,
    ["Wailing Caverns"] = 8002,
    ["The Deadmines"] = 8003,
    ["Shadowfang Keep"] = 8004,
    ["Blackfathom Deeps"] = 8005,
    ["The Stockade"] = 8006,
    ["Gnomeregan"] = 8007,
    ["Razorfen Kraul"] = 8008,
    ["Scarlet Monastery"] = 8009,        -- Generic SM guide
    ["Scarlet Monastery Graveyard"] = 8009,
    ["Scarlet Monastery Library"] = 8009,
    ["Scarlet Monastery Armory"] = 8009,
    ["Scarlet Monastery Cathedral"] = 8009,
    ["Razorfen Downs"] = 8010,
    ["Uldaman"] = 8011,
    ["Zul'Farrak"] = 8012,
    ["Maraudon"] = 8013,
    ["Temple of Atal'Hakkar"] = 8014,     -- Sunken Temple
    ["Sunken Temple"] = 8014,
    ["Blackrock Depths"] = 8015,
    ["Lower Blackrock Spire"] = 8016,
    ["Upper Blackrock Spire"] = 8017,
    ["Dire Maul"] = 8018,                  -- Generic DM guide
    ["Dire Maul East"] = 8018,
    ["Dire Maul West"] = 8018,
    ["Dire Maul North"] = 8018,
    ["Stratholme"] = 8019,
    ["Scholomance"] = 8020,
    
    -- Alternative instance names that might appear
    ["Deadmines"] = 8003,
    ["SM"] = 8009,
    ["BFD"] = 8005,
    ["BRD"] = 8015,
    ["LBRS"] = 8016,
    ["UBRS"] = 8017,
    ["DM"] = 8018,
    ["Scholo"] = 8020,
    ["Strat"] = 8019,
}

-- Dungeon minimum level recommendations
local DungeonLevelRange = {
    [8001] = { min = 13, max = 18, name = "Ragefire Chasm" },
    [8002] = { min = 15, max = 25, name = "Wailing Caverns" },
    [8003] = { min = 17, max = 26, name = "The Deadmines" },
    [8004] = { min = 18, max = 28, name = "Shadowfang Keep" },
    [8005] = { min = 20, max = 32, name = "Blackfathom Deeps" },
    [8006] = { min = 22, max = 30, name = "The Stockade" },
    [8007] = { min = 24, max = 34, name = "Gnomeregan" },
    [8008] = { min = 25, max = 35, name = "Razorfen Kraul" },
    [8009] = { min = 26, max = 45, name = "Scarlet Monastery" },
    [8010] = { min = 33, max = 45, name = "Razorfen Downs" },
    [8011] = { min = 35, max = 47, name = "Uldaman" },
    [8012] = { min = 42, max = 50, name = "Zul'Farrak" },
    [8013] = { min = 40, max = 52, name = "Maraudon" },
    [8014] = { min = 45, max = 55, name = "Sunken Temple" },
    [8015] = { min = 48, max = 60, name = "Blackrock Depths" },
    [8016] = { min = 53, max = 60, name = "Lower Blackrock Spire" },
    [8017] = { min = 55, max = 60, name = "Upper Blackrock Spire" },
    [8018] = { min = 54, max = 60, name = "Dire Maul" },
    [8019] = { min = 55, max = 60, name = "Stratholme" },
    [8020] = { min = 55, max = 60, name = "Scholomance" },
}

function VGuideDungeonDetector:new(oSettings, oGuideTable, oDisplay)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.GuideTable = oGuideTable
    obj.Display = oDisplay
    
    -- State tracking
    obj.isInInstance = false
    obj.currentInstance = nil
    obj.previousGuideID = nil
    obj.previousStep = nil
    obj.enabled = true
    
    return obj
end

function VGuideDungeonDetector:Initialize()
    -- Initialize saved vars
    if not VanillaGuideDBPC then
        VanillaGuideDBPC = {}
    end
    if not VanillaGuideDBPC.dungeonDetector then
        VanillaGuideDBPC.dungeonDetector = {
            enabled = true,
            autoSwitch = true,
            showNotification = true,
        }
    end
    self.db = VanillaGuideDBPC.dungeonDetector
    self.enabled = self.db.enabled
    
    -- Check if we're already in an instance (login/reload)
    self:CheckCurrentZone()
    
    Dv(" VGuideDungeonDetector: Initialized")
end

-- Check if current zone is an instance
function VGuideDungeonDetector:CheckCurrentZone()
    local inInstance, instanceType = IsInInstance()
    
    if inInstance then
        local zoneName = GetRealZoneText() or GetZoneText()
        self:OnEnterInstance(zoneName)
    elseif self.isInInstance then
        self:OnLeaveInstance()
    end
end

-- Called when entering an instance
function VGuideDungeonDetector:OnEnterInstance(instanceName)
    if not self.enabled or not self.db.autoSwitch then return end
    
    self.isInInstance = true
    self.currentInstance = instanceName
    
    -- Look up the dungeon guide ID
    local guideID = DungeonGuideMap[instanceName]
    
    -- Try partial match if exact match fails
    if not guideID then
        for name, id in pairs(DungeonGuideMap) do
            if string.find(string.lower(instanceName), string.lower(name), 1, true) or
               string.find(string.lower(name), string.lower(instanceName), 1, true) then
                guideID = id
                break
            end
        end
    end
    
    if guideID and self.Display then
        -- Save current guide state
        self.previousGuideID = self.Display:GetCurrentGuideID()
        self.previousStep = self.Display:GetCurrentStep()
        
        -- Don't switch if already in a dungeon guide
        if self.previousGuideID >= 8001 and self.previousGuideID <= 8020 then
            Dv(" VGuideDungeonDetector: Already viewing a dungeon guide")
            return
        end
        
        -- Switch to dungeon guide
        self.Display:GuideByID(guideID)
        
        -- Notify user
        if self.db.showNotification then
            local msg = "|cff00ff00VanillaGuide:|r Switched to dungeon guide for " .. instanceName
            DEFAULT_CHAT_FRAME:AddMessage(msg)
            UIErrorsFrame:AddMessage("VGuide: " .. instanceName .. " guide loaded", 0, 1, 0, 1, 3)
        end
        
        -- Refresh UI
        if VGuide and VGuide.UI and VGuide.UI.MainFrame then
            VGuide.UI.MainFrame:RefreshData(true)
        end
        
        Dv(" VGuideDungeonDetector: Switched to guide " .. guideID .. " for " .. instanceName)
    else
        Dv(" VGuideDungeonDetector: No guide found for " .. (instanceName or "unknown"))
    end
end

-- Called when leaving an instance
function VGuideDungeonDetector:OnLeaveInstance()
    if not self.isInInstance then return end
    
    self.isInInstance = false
    
    -- Restore previous guide if we have one saved
    if self.previousGuideID and self.Display and self.db.autoSwitch then
        -- Only restore if we're still viewing a dungeon guide
        local currentGuide = self.Display:GetCurrentGuideID()
        if currentGuide >= 8001 and currentGuide <= 8020 then
            self.Display:GuideByID(self.previousGuideID)
            
            -- Restore step position
            if self.previousStep then
                self.Display:StepByID(self.previousStep)
            end
            
            -- Notify user
            if self.db.showNotification then
                local msg = "|cff00ff00VanillaGuide:|r Returned to previous guide"
                DEFAULT_CHAT_FRAME:AddMessage(msg)
            end
            
            -- Refresh UI
            if VGuide and VGuide.UI and VGuide.UI.MainFrame then
                VGuide.UI.MainFrame:RefreshData(true)
            end
            
            Dv(" VGuideDungeonDetector: Restored guide " .. self.previousGuideID)
        end
    end
    
    -- Clear saved state
    self.currentInstance = nil
    self.previousGuideID = nil
    self.previousStep = nil
end

-- Get dungeon recommendation based on player level
function VGuideDungeonDetector:GetRecommendedDungeon()
    local level = UnitLevel("player")
    local faction = UnitFactionGroup("player")
    
    local recommendations = {}
    
    for guideID, info in pairs(DungeonLevelRange) do
        if level >= info.min and level <= info.max then
            -- Check faction restrictions
            local factionOk = true
            if guideID == 8001 then -- RFC
                factionOk = (faction == "Horde")
            elseif guideID == 8003 or guideID == 8006 then -- Deadmines, Stockade
                factionOk = (faction == "Alliance")
            end
            
            if factionOk then
                table.insert(recommendations, {
                    guideID = guideID,
                    name = info.name,
                    min = info.min,
                    max = info.max,
                })
            end
        end
    end
    
    return recommendations
end

-- Toggle dungeon auto-detection
function VGuideDungeonDetector:Toggle()
    self.db.enabled = not self.db.enabled
    self.enabled = self.db.enabled
    return self.enabled
end

-- Enable/disable auto-switch
function VGuideDungeonDetector:SetAutoSwitch(enabled)
    self.db.autoSwitch = enabled
end

function VGuideDungeonDetector:IsAutoSwitchEnabled()
    return self.db.autoSwitch
end

-- Enable/disable notifications
function VGuideDungeonDetector:SetShowNotification(enabled)
    self.db.showNotification = enabled
end

-- Make available globally
_G.VGuideDungeonDetector = VGuideDungeonDetector

Dv(" VGuide DungeonDetector.lua End")
