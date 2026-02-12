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
                -- Smart anchor: position tooltip away from pin based on map position
                local anchor = "ANCHOR_RIGHT"
                if this.x and this.x > 70 then
                    anchor = "ANCHOR_LEFT"
                end
                if this.y and this.y > 80 then
                    anchor = "ANCHOR_TOP"
                elseif this.y and this.y < 20 then
                    anchor = "ANCHOR_BOTTOM"
                end
                GameTooltip:SetOwner(this, anchor)
                if this.objectiveType == "start" then
                    -- Quest giver tooltip
                    GameTooltip:AddLine("|cFFFFCC00!|r " .. this.questName, 1, 0.82, 0)
                    if this.objectiveName then
                        GameTooltip:AddLine("Accept from: " .. this.objectiveName, 0.8, 0.8, 0.8)
                    end
                else
                    -- Quest objective tooltip
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
    if not currentZone then return end
    
    -- Check if quest objective DB exists
    if not VGuideQuestObjectives then return end
    
    -- Get active objectives for this zone
    local objectives = VGuideQuestObjectives:GetActiveObjectivesForZone(currentZone)
    if not objectives then return end
    
    local pinIndex = 1
    
    for _, objData in ipairs(objectives) do
        local objective = objData and objData.objective
        
        if objective and objective.spawns then
            for _, spawn in ipairs(objective.spawns) do
                if pinIndex <= self.maxPins and spawn and spawn[1] and spawn[2] then
                    local pin = self.pins[pinIndex]
                    if not pin then break end
                    
                    -- Position the pin on the map
                    local x = spawn[1] / 100
                    local y = spawn[2] / 100
                    
                    -- Get map dimensions
                    local mapWidth = WorldMapButton:GetWidth()
                    local mapHeight = WorldMapButton:GetHeight()
                    
                    pin:ClearAllPoints()
                    pin:SetPoint("CENTER", WorldMapButton, "TOPLEFT", x * mapWidth, -y * mapHeight)
                    
                    -- Set pin data
                    pin.questName = objData.questName or "Unknown Quest"
                    pin.questId = objData.questId
                    pin.objectiveName = objective.name or "Objective"
                    pin.objectiveType = objective.type or "kill"
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
                        pin.texture:SetTexture("Interface\\GossipFrame\\ActiveQuestIcon")
                        pin.texture:SetTexCoord(0, 1, 0, 1)
                        pin:SetWidth(14)
                        pin:SetHeight(14)
                    elseif objective.type == "start" then
                        -- Exclamation mark for quest pickup
                        pin.texture:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
                        pin.texture:SetTexCoord(0, 1, 0, 1)
                        pin:SetWidth(16)
                        pin:SetHeight(16)
                    end
                    
                    pin:Show()
                    pinIndex = pinIndex + 1
                end
            end
        end
    end
    
    -- Also show available quests (quest givers with "!" icon)
    local availableQuests = VGuideQuestObjectives:GetAvailableQuestsForZone(currentZone)
    
    for _, questData in ipairs(availableQuests) do
        if pinIndex <= self.maxPins and questData.x and questData.y then
            local pin = self.pins[pinIndex]
            
            local x = questData.x / 100
            local y = questData.y / 100
            
            local mapWidth = WorldMapButton:GetWidth()
            local mapHeight = WorldMapButton:GetHeight()
            
            pin:ClearAllPoints()
            pin:SetPoint("CENTER", WorldMapButton, "TOPLEFT", x * mapWidth, -y * mapHeight)
            
            pin.questName = questData.questName
            pin.questId = questData.questId
            pin.objectiveName = questData.npc or "Quest Giver"
            pin.objectiveType = "start"
            pin.x = questData.x
            pin.y = questData.y
            pin.zone = currentZone
            
            -- Yellow exclamation mark for available quests
            pin.texture:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
            pin.texture:SetTexCoord(0, 1, 0, 1)
            pin.texture:SetVertexColor(1, 1, 0)  -- Bright yellow
            pin:SetWidth(18)
            pin:SetHeight(18)
            
            pin:Show()
            pinIndex = pinIndex + 1
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
