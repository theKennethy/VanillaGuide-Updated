--[[--------------------------------------------------
----- VanillaGuide -----
------------------
MinimapObjectives.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Shows quest objective dots on the minimap (like pfQuest).
    Displays nearby spawn locations as colored dots.
------------------------------------------------------
]]--

Dv(" VGuide MinimapObjectives.lua Start")

VGuideMinimapObjectives = {}
VGuideMinimapObjectives.dots = {}
VGuideMinimapObjectives.maxDots = 50
VGuideMinimapObjectives.enabled = true
VGuideMinimapObjectives.initialized = false
VGuideMinimapObjectives.updateInterval = 0.2
VGuideMinimapObjectives.lastUpdate = 0

-- Zone sizes for coordinate conversion (in yards)
local ZoneSizes = {
    -- Eastern Kingdoms
    ["Elwynn Forest"] = { w = 3470, h = 2315 },
    ["Dun Morogh"] = { w = 4925, h = 3283 },
    ["Tirisfal Glades"] = { w = 4519, h = 3012 },
    ["Westfall"] = { w = 3500, h = 2333 },
    ["Loch Modan"] = { w = 2758, h = 1839 },
    ["Silverpine Forest"] = { w = 4200, h = 2800 },
    ["Redridge Mountains"] = { w = 2170, h = 1447 },
    ["Duskwood"] = { w = 2700, h = 1800 },
    ["Hillsbrad Foothills"] = { w = 3200, h = 2133 },
    ["Wetlands"] = { w = 4135, h = 2756 },
    ["Stranglethorn Vale"] = { w = 6381, h = 4254 },
    -- Kalimdor
    ["Durotar"] = { w = 3525, h = 2350 },
    ["Mulgore"] = { w = 4370, h = 2915 },
    ["Teldrassil"] = { w = 2925, h = 1950 },
    ["Darkshore"] = { w = 4366, h = 2910 },
    ["The Barrens"] = { w = 10133, h = 6756 },
    ["Ashenvale"] = { w = 5766, h = 3843 },
    ["Stonetalon Mountains"] = { w = 4883, h = 3256 },
    ["Thousand Needles"] = { w = 4399, h = 2933 },
}

-- Dot colors by objective type
local DOT_COLORS = {
    kill = {1, 0.2, 0.2, 0.9},     -- Red
    item = {0.2, 0.8, 1, 0.9},     -- Cyan
    talk = {0.2, 1, 0.2, 0.9},     -- Green
}

function VGuideMinimapObjectives:Initialize()
    if self.initialized then return end
    
    self:CreateDots()
    self:CreateUpdateFrame()
    
    self.initialized = true
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap objectives enabled")
end

function VGuideMinimapObjectives:CreateDots()
    for i = 1, self.maxDots do
        local dot = CreateFrame("Frame", "VGuideMiniDot"..i, Minimap)
        dot:SetWidth(6)
        dot:SetHeight(6)
        dot:SetFrameStrata("HIGH")
        dot:Hide()
        
        local tex = dot:CreateTexture(nil, "OVERLAY")
        tex:SetAllPoints(dot)
        tex:SetTexture("Interface\\AddOns\\VanillaGuide\\Textures\\Buttons\\dot")
        -- Fallback to a simple colored square if texture missing
        if not tex:GetTexture() then
            tex:SetTexture(1, 1, 1, 1)
        end
        dot.texture = tex
        
        -- Tooltip on mouseover
        dot:EnableMouse(true)
        dot:SetScript("OnEnter", function()
            if this.objectiveName then
                GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                GameTooltip:AddLine(this.questName or "Quest", 1, 0.82, 0)
                GameTooltip:AddLine(this.objectiveName, 1, 1, 1)
                GameTooltip:Show()
            end
        end)
        dot:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        
        self.dots[i] = dot
    end
end

function VGuideMinimapObjectives:CreateUpdateFrame()
    local obj = self
    local updateFrame = CreateFrame("Frame")
    updateFrame:SetScript("OnUpdate", function()
        obj.lastUpdate = obj.lastUpdate + arg1
        if obj.lastUpdate < obj.updateInterval then return end
        obj.lastUpdate = 0
        
        if obj.enabled then
            obj:UpdateDots()
        end
    end)
end

function VGuideMinimapObjectives:HideDots()
    for i = 1, self.maxDots do
        if self.dots[i] then
            self.dots[i]:Hide()
        end
    end
end

function VGuideMinimapObjectives:UpdateDots()
    -- Hide all dots first
    self:HideDots()
    
    -- Check prerequisites
    if not VGuideQuestObjectives then return end
    
    -- Get current zone
    local currentZone = GetZoneText()
    local zoneSize = ZoneSizes[currentZone]
    if not zoneSize then return end
    
    -- Get player position
    SetMapToCurrentZone()
    local px, py = GetPlayerMapPosition("player")
    if px == 0 and py == 0 then return end
    
    -- Convert to world coordinates
    local playerX = px * zoneSize.w
    local playerY = py * zoneSize.h
    
    -- Get minimap zoom (yards visible)
    local minimapZoom = Minimap:GetZoom()
    local minimapYards = 150 + (minimapZoom * 50)  -- Approximate yards visible
    
    -- Get active objectives
    local objectives = VGuideQuestObjectives:GetActiveObjectivesForZone(currentZone)
    if not objectives then return end
    
    local dotIndex = 1
    
    for _, objData in ipairs(objectives) do
        local objective = objData and objData.objective
        
        if objective and objective.spawns then
            for _, spawn in ipairs(objective.spawns) do
                if dotIndex <= self.maxDots and spawn and spawn[1] and spawn[2] then
                    -- Convert spawn coords to world coords
                    local spawnX = (spawn[1] / 100) * zoneSize.w
                    local spawnY = (spawn[2] / 100) * zoneSize.h
                    
                    -- Calculate distance to spawn
                    local dx = spawnX - playerX
                    local dy = spawnY - playerY
                    local distance = math.sqrt(dx * dx + dy * dy)
                    
                    -- Only show if within minimap range
                    if distance < minimapYards then
                        local dot = self.dots[dotIndex]
                        if not dot then break end
                        
                        -- Calculate position on minimap
                        local minimapRadius = Minimap:GetWidth() / 2
                        local scale = minimapRadius / minimapYards
                        
                        local dotX = dx * scale
                        local dotY = -dy * scale  -- Invert Y because minimap Y is flipped
                        
                        -- Check if within minimap circle
                        local dotDist = math.sqrt(dotX * dotX + dotY * dotY)
                        if dotDist < minimapRadius - 3 then
                            dot:ClearAllPoints()
                            dot:SetPoint("CENTER", Minimap, "CENTER", dotX, dotY)
                            
                            -- Set color based on type
                            local color = DOT_COLORS[objective.type] or {1, 1, 0, 0.9}
                            dot.texture:SetVertexColor(color[1], color[2], color[3], color[4])
                            
                            -- Store data for tooltip
                            dot.questName = objData.questName or "Unknown Quest"
                            dot.objectiveName = objective.name or "Objective"
                            dot.objectiveType = objective.type or "kill"
                            
                            dot:Show()
                            dotIndex = dotIndex + 1
                        end
                    end
                end
            end
        end
    end
end

function VGuideMinimapObjectives:Toggle()
    self.enabled = not self.enabled
    if self.enabled then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Minimap objectives enabled")
    else
        self:HideDots()
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6600VanillaGuide:|r Minimap objectives disabled")
    end
end

-- Initialize on load
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:SetScript("OnEvent", function()
    this:UnregisterAllEvents()
    local delayFrame = CreateFrame("Frame")
    delayFrame.elapsed = 0
    delayFrame:SetScript("OnUpdate", function()
        this.elapsed = this.elapsed + arg1
        if this.elapsed > 1.5 then
            this:Hide()
            VGuideMinimapObjectives:Initialize()
        end
    end)
end)

Di("      - Minimap Objectives system loaded")
