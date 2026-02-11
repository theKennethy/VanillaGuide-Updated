--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestMapPins.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Quest objective pins on the world map (like pfQuest).
    Shows spawn locations for active quest objectives.
------------------------------------------------------
]]--

Dv(" VGuide QuestMapPins.lua Start")

VGuideQuestMapPins = {}
VGuideQuestMapPins.pins = {}
VGuideQuestMapPins.maxPins = 100
VGuideQuestMapPins.enabled = true
VGuideQuestMapPins.initialized = false

-- Colors for different objective types
local PIN_COLORS = {
    kill = {1, 0.2, 0.2},     -- Red for kill objectives
    item = {0.2, 0.8, 1},     -- Cyan for item objectives
    talk = {0.2, 1, 0.2},     -- Green for talk/turn in
}

function VGuideQuestMapPins:Initialize()
    if self.initialized then return end
    
    -- Create pin frames
    self:CreatePins()
    
    -- Hook WorldMapFrame
    self:HookWorldMap()
    
    self.initialized = true
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest objective pins enabled")
end

function VGuideQuestMapPins:CreatePins()
    for i = 1, self.maxPins do
        local pin = CreateFrame("Button", "VGuideQuestPin"..i, WorldMapButton)
        pin:SetWidth(12)
        pin:SetHeight(12)
        pin:SetFrameStrata("TOOLTIP")
        pin:Hide()
        
        -- Create texture
        local tex = pin:CreateTexture(nil, "OVERLAY")
        tex:SetAllPoints(pin)
        tex:SetTexture("Interface\\Minimap\\ObjectIcons")
        -- Default to yellow dot (quest objective)
        tex:SetTexCoord(0.125, 0.25, 0, 0.25)  -- Quest objective icon
        pin.texture = tex
        
        -- Tooltip
        pin:SetScript("OnEnter", function()
            if this.questName then
                GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
                GameTooltip:AddLine(this.questName, 1, 0.82, 0)
                if this.objectiveName then
                    local typeText = ""
                    if this.objectiveType == "kill" then
                        typeText = "|cFFFF3333Kill:|r "
                    elseif this.objectiveType == "item" then
                        typeText = "|cFF33CCFFLoot:|r "
                    elseif this.objectiveType == "talk" then
                        typeText = "|cFF33FF33Talk:|r "
                    end
                    GameTooltip:AddLine(typeText .. this.objectiveName, 1, 1, 1)
                end
                GameTooltip:Show()
            end
        end)
        
        pin:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        
        -- Click to set waypoint
        pin:SetScript("OnClick", function()
            if this.x and this.y and this.zone then
                if VGuideArrowInstance then
                    VGuideArrowInstance:SetWaypoint(this.x, this.y, this.zone, this.objectiveName)
                    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Waypoint set to " .. this.objectiveName)
                end
            end
        end)
        
        self.pins[i] = pin
    end
end

function VGuideQuestMapPins:HookWorldMap()
    -- Hook into WorldMapFrame to update pins
    local originalShow = WorldMapFrame:GetScript("OnShow")
    WorldMapFrame:SetScript("OnShow", function()
        if originalShow then originalShow() end
        VGuideQuestMapPins:RefreshPins()
    end)
    
    -- Update periodically while map is open
    local updateFrame = CreateFrame("Frame")
    updateFrame:SetScript("OnUpdate", function()
        if WorldMapFrame:IsVisible() then
            this.elapsed = (this.elapsed or 0) + arg1
            if this.elapsed > 0.5 then
                this.elapsed = 0
                VGuideQuestMapPins:RefreshPins()
            end
        end
    end)
end

function VGuideQuestMapPins:HidePins()
    for i = 1, self.maxPins do
        if self.pins[i] then
            self.pins[i]:Hide()
        end
    end
end

function VGuideQuestMapPins:RefreshPins()
    if not self.enabled then
        self:HidePins()
        return
    end
    
    -- Hide all pins first
    self:HidePins()
    
    -- Get current zone from map
    local currentZone = GetZoneText()
    
    -- Check if quest objective DB exists
    if not VGuideQuestObjectives then return end
    
    -- Get active objectives for this zone
    local objectives = VGuideQuestObjectives:GetActiveObjectivesForZone(currentZone)
    
    local pinIndex = 1
    
    for _, objData in ipairs(objectives) do
        local objective = objData.objective
        
        if objective.spawns then
            for _, spawn in ipairs(objective.spawns) do
                if pinIndex <= self.maxPins then
                    local pin = self.pins[pinIndex]
                    
                    -- Position the pin on the map
                    local x = spawn[1] / 100
                    local y = spawn[2] / 100
                    
                    -- Get map dimensions
                    local mapWidth = WorldMapButton:GetWidth()
                    local mapHeight = WorldMapButton:GetHeight()
                    
                    pin:ClearAllPoints()
                    pin:SetPoint("CENTER", WorldMapButton, "TOPLEFT", x * mapWidth, -y * mapHeight)
                    
                    -- Set pin data
                    pin.questName = objData.questName
                    pin.questId = objData.questId
                    pin.objectiveName = objective.name
                    pin.objectiveType = objective.type
                    pin.x = spawn[1]
                    pin.y = spawn[2]
                    pin.zone = currentZone
                    
                    -- Set color based on type
                    local color = PIN_COLORS[objective.type] or {1, 1, 0}
                    pin.texture:SetVertexColor(color[1], color[2], color[3])
                    
                    -- Set icon based on type
                    if objective.type == "kill" then
                        -- Skull icon for kills
                        pin.texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8")
                        pin.texture:SetTexCoord(0, 1, 0, 1)
                        pin:SetWidth(14)
                        pin:SetHeight(14)
                    elseif objective.type == "item" then
                        -- Chest/loot icon
                        pin.texture:SetTexture("Interface\\Minimap\\ObjectIcons")
                        pin.texture:SetTexCoord(0.25, 0.375, 0, 0.25)
                        pin:SetWidth(12)
                        pin:SetHeight(12)
                    elseif objective.type == "talk" then
                        -- Question mark for turn-in
                        pin.texture:SetTexture("Interface\\Minimap\\ObjectIcons")
                        pin.texture:SetTexCoord(0, 0.125, 0.25, 0.5)
                        pin:SetWidth(14)
                        pin:SetHeight(14)
                    end
                    
                    pin:Show()
                    pinIndex = pinIndex + 1
                end
            end
        end
    end
end

function VGuideQuestMapPins:Toggle()
    self.enabled = not self.enabled
    if self.enabled then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest pins enabled")
        self:RefreshPins()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600VanillaGuide:|r Quest pins disabled")
        self:HidePins()
    end
end

-- Initialize when addon loads
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:SetScript("OnEvent", function()
    this:UnregisterAllEvents()
    -- Slight delay for other systems to load
    local delayFrame = CreateFrame("Frame")
    delayFrame.elapsed = 0
    delayFrame:SetScript("OnUpdate", function()
        this.elapsed = this.elapsed + arg1
        if this.elapsed > 1 then
            this:Hide()
            VGuideQuestMapPins:Initialize()
        end
    end)
end)

Di("      - Quest Map Pins system loaded")
