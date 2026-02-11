--[[--------------------------------------------------
----- VanillaGuide -----
------------------
pfQuestIntegration.lua
Authors: VanillaGuide Contributors
Version: 1.05.0
------------------------------------------------------
Description: 
    Integration module for pfQuest and pfUI addons
    Provides:
    - Quest tracking via pfQuest
    - Waypoint arrows via pfQuest's arrow system
    - Map node display for quest objectives
    - pfUI skin compatibility
------------------------------------------------------
API Reference:
    pfQuest uses pfMap for map nodes and pfDatabase for quest data
    Key functions:
    - pfMap:ShowNode(coords, title, texture)
    - pfMap:DeleteNode(nodeName)
    - pfQuest:Show(questId) 
    - pfQuest_history / pfQuest_config for state management
------------------------------------------------------
]]--

Dv(" VGuide pfQuestIntegration.lua Start")

VGuidePfQuest = {}
VGuidePfQuest.__index = VGuidePfQuest

function VGuidePfQuest:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    -- Store reference to settings
    obj.Settings = oSettings
    
    -- Detection flags
    obj.pfQuestPresent = false
    obj.pfUIPresent = false
    obj.pfMapPresent = false
    obj.pfDatabasePresent = false
    
    -- Current waypoint tracking
    obj.currentWaypoint = nil
    obj.currentQuestNodes = {}
    
    -- Node name prefix for cleanup
    obj.nodePrefix = "VGuide_"
    
    ---------------------------------------
    -- Detection Functions
    ---------------------------------------
    
    obj.DetectAddons = function(self)
        Dv("    pfQuest Integration - Detecting addons:")
        
        -- Check for pfQuest
        if IsAddOnLoaded("pfQuest") or IsAddOnLoaded("pfQuest-turtle") then
            obj.pfQuestPresent = true
            Di("      - pfQuest detected")
            
            -- Check for pfMap (part of pfQuest)
            if pfMap and pfMap.AddNode then
                obj.pfMapPresent = true
                Di("      - pfMap API available")
            end
            
            -- Check for pfDatabase (quest/npc database)
            if pfDatabase or pfDB then
                obj.pfDatabasePresent = true
                Di("      - pfDatabase available")
            end
        else
            Di("      - pfQuest not detected")
        end
        
        -- Check for pfUI
        if IsAddOnLoaded("pfUI") then
            obj.pfUIPresent = true
            Di("      - pfUI detected")
        else
            Di("      - pfUI not detected")
        end
        
        return obj.pfQuestPresent, obj.pfUIPresent
    end
    
    obj.IsAvailable = function(self)
        return obj.pfQuestPresent
    end
    
    obj.IspfUIAvailable = function(self)
        return obj.pfUIPresent
    end
    
    ---------------------------------------
    -- Waypoint/Arrow Functions
    ---------------------------------------
    
    -- Set a waypoint arrow pointing to coordinates
    -- Uses pfQuest's arrow system if available
    obj.SetWaypoint = function(self, x, y, zone, title, description)
        if not obj.pfQuestPresent then return false end
        if not x or not y or not zone then 
            Dv("    SetWaypoint: Missing coordinates (x=" .. tostring(x) .. ", y=" .. tostring(y) .. ", zone=" .. tostring(zone) .. ")")
            return false 
        end
        
        -- Ensure x and y are numbers
        x = tonumber(x)
        y = tonumber(y)
        if not x or not y then
            Dv("    SetWaypoint: Invalid coordinate values")
            return false
        end
        
        -- Normalize coordinates (VanillaGuide uses 0-100, pfQuest uses 0-1)
        local normX = x / 100
        local normY = y / 100
        
        Dv("    Setting pfQuest waypoint: " .. zone .. " (" .. x .. ", " .. y .. ")")
        
        -- Clear existing waypoint first
        obj:ClearWaypoint()
        
        -- Store current waypoint info
        obj.currentWaypoint = {
            x = normX,
            y = normY,
            zone = zone,
            title = title or "VanillaGuide",
            description = description or ""
        }
        
        -- Method 1: Use pfQuest's arrow directly if available
        if pfQuest and pfQuest.route and pfQuest.route.AddNode then
            local node = {
                x = normX,
                y = normY,
                zone = zone,
                title = title or "VanillaGuide Waypoint",
                spawn = normX .. ":" .. normY
            }
            local success, err = pcall(function() pfQuest.route:AddNode(node) end)
            if success then
                return true
            else
                Dv("    pfQuest.route:AddNode failed: " .. tostring(err))
            end
        end
        
        -- Method 2: Use pfMap to add a visible node
        if pfMap and pfMap.AddNode then
            local mapID = obj:GetMapIDForZone(zone)
            if mapID and normX and normY then
                local nodeName = obj.nodePrefix .. "waypoint"
                local nodeData = {
                    title = title or "VanillaGuide",
                    spawn = tostring(normX) .. ":" .. tostring(normY),
                    zone = zone,
                    x = normX,
                    y = normY,
                    layer = "TOOLTIP",
                    texture = "Interface\\AddOns\\pfQuest\\img\\node",
                }
                local success, err = pcall(function() pfMap:AddNode(mapID, normX, normY, nodeData, nodeName) end)
                if success then
                    return true
                else
                    Dv("    pfMap:AddNode failed: " .. tostring(err))
                end
            end
        end
        
        -- Method 3: Use global arrow frame if pfQuest exposes it
        if pfQuestArrow and pfQuestArrow.SetTarget then
            local success, err = pcall(function() pfQuestArrow:SetTarget(normX, normY, zone, title) end)
            if success then
                return true
            else
                Dv("    pfQuestArrow:SetTarget failed: " .. tostring(err))
            end
        end
        
        return false
    end
    
    -- Clear current waypoint
    obj.ClearWaypoint = function(self)
        if not obj.pfQuestPresent then return end
        
        obj.currentWaypoint = nil
        
        -- Clear from pfQuest route
        if pfQuest and pfQuest.route and pfQuest.route.Reset then
            -- Don't reset entire route, just our nodes
            Dv("    Clearing pfQuest waypoint")
        end
        
        -- Clear from pfMap
        if pfMap and pfMap.DeleteNode then
            local nodeName = obj.nodePrefix .. "waypoint"
            pfMap:DeleteNode(nodeName)
        end
        
        -- Clear arrow if using direct arrow
        if pfQuestArrow and pfQuestArrow.ClearTarget then
            pfQuestArrow:ClearTarget()
        end
    end
    
    ---------------------------------------
    -- Quest Tracking Functions  
    ---------------------------------------
    
    -- Parse quest name from guide step text
    obj.ParseQuestName = function(self, stepText)
        if not stepText then return nil end
        
        -- Look for quest names in various formats used by VanillaGuide
        -- Format: #ACCEPT"Quest Name"# or #DOQUEST"Quest Name"# or #TURNIN"Quest Name"#
        local _, _, questName = string.find(stepText, '#ACCEPT"([^"]+)"')
        if not questName then
            _, _, questName = string.find(stepText, '#DOQUEST"([^"]+)"')
        end
        if not questName then
            _, _, questName = string.find(stepText, '#TURNIN"([^"]+)"')
        end
        
        return questName
    end
    
    -- Show quest objectives on map via pfQuest
    obj.ShowQuestOnMap = function(self, questName)
        if not obj.pfQuestPresent or not questName then return false end
        
        Dv("    Showing quest on map: " .. questName)
        
        -- First, try to get quest ID from our database
        local questId = nil
        if VGuideQuestDB and VGuideQuestDB.GetQuestId then
            questId = VGuideQuestDB:GetQuestId(questName)
            if questId then
                Dv("    Found quest ID: " .. questId .. " for " .. questName)
            end
        end
        
        -- Use pfQuest's quest tracking with ID if available
        if pfQuest then
            -- Method 1: Show by quest ID (most reliable)
            if questId and pfQuest.ShowQuestById then
                pfQuest:ShowQuestById(questId)
                return true
            end
            
            -- Method 2: Show by quest name
            if pfQuest.Show then
                pfQuest:Show(questName)
                return true
            end
        end
        
        -- Alternative: Search pfDatabase and show manually
        if obj.pfDatabasePresent and pfDB and pfDB.quests then
            local questData = obj:FindQuestInDatabase(questName, questId)
            if questData then
                obj:ShowQuestNodes(questData)
                return true
            end
        end
        
        return false
    end
    
    -- Find quest in pfDatabase
    obj.FindQuestInDatabase = function(self, questName, questId)
        if not pfDB or not pfDB.quests then return nil end
        
        -- If we have a quest ID, try direct lookup first
        if questId then
            for lang, quests in pairs(pfDB.quests) do
                if type(quests) == "table" and quests[questId] then
                    return {
                        id = questId,
                        name = quests[questId].T or questName,
                        data = quests[questId]
                    }
                end
            end
        end
        
        -- Search through quest database by name
        for lang, quests in pairs(pfDB.quests) do
            if type(quests) == "table" then
                for id, quest in pairs(quests) do
                    if quest and quest.T and string.find(string.lower(quest.T), string.lower(questName)) then
                        return {
                            id = id,
                            name = quest.T,
                            data = quest
                        }
                    end
                end
            end
        end
        
        return nil
    end
    
    -- Display quest nodes on map
    obj.ShowQuestNodes = function(self, questData)
        if not questData or not pfMap then return end
        
        -- Clear previous quest nodes
        obj:ClearQuestNodes()
        
        -- This would add nodes based on quest objectives
        -- The actual implementation depends on pfQuest's internal structure
        Dv("    Adding quest nodes for: " .. (questData.name or "Unknown"))
    end
    
    -- Clear all quest nodes we've added
    obj.ClearQuestNodes = function(self)
        if not pfMap then return end
        
        -- Clear all nodes with our prefix
        for nodeName, _ in pairs(obj.currentQuestNodes) do
            if pfMap.DeleteNode then
                pfMap:DeleteNode(nodeName)
            end
        end
        obj.currentQuestNodes = {}
    end
    
    ---------------------------------------
    -- Map/Zone Utilities
    ---------------------------------------
    
    -- Convert zone name to map ID for pfMap
    obj.GetMapIDForZone = function(self, zoneName)
        if not zoneName then return nil end
        
        -- Zone name to map ID mapping for vanilla zones
        local zoneMap = {
            -- Kalimdor
            ["Durotar"] = 1411,
            ["Mulgore"] = 1412,
            ["The Barrens"] = 1413,
            ["Teldrassil"] = 1438,
            ["Darkshore"] = 1439,
            ["Ashenvale"] = 1440,
            ["Thousand Needles"] = 1441,
            ["Stonetalon Mountains"] = 1442,
            ["Desolace"] = 1443,
            ["Feralas"] = 1444,
            ["Dustwallow Marsh"] = 1445,
            ["Tanaris"] = 1446,
            ["Azshara"] = 1447,
            ["Felwood"] = 1448,
            ["Un'Goro Crater"] = 1449,
            ["Moonglade"] = 1450,
            ["Silithus"] = 1451,
            ["Winterspring"] = 1452,
            ["Orgrimmar"] = 1454,
            ["Thunder Bluff"] = 1456,
            
            -- Eastern Kingdoms
            ["Tirisfal Glades"] = 1420,
            ["Silverpine Forest"] = 1421,
            ["Western Plaguelands"] = 1422,
            ["Eastern Plaguelands"] = 1423,
            ["Hillsbrad Foothills"] = 1424,
            ["The Hinterlands"] = 1425,
            ["Dun Morogh"] = 1426,
            ["Searing Gorge"] = 1427,
            ["Burning Steppes"] = 1428,
            ["Elwynn Forest"] = 1429,
            ["Deadwind Pass"] = 1430,
            ["Duskwood"] = 1431,
            ["Loch Modan"] = 1432,
            ["Redridge Mountains"] = 1433,
            ["Stranglethorn Vale"] = 1434,
            ["Swamp of Sorrows"] = 1435,
            ["Westfall"] = 1436,
            ["Wetlands"] = 1437,
            ["Alterac Mountains"] = 1416,
            ["Arathi Highlands"] = 1417,
            ["Badlands"] = 1418,
            ["Blasted Lands"] = 1419,
            ["Ironforge"] = 1455,
            ["Stormwind City"] = 1453,
            ["Undercity"] = 1458,
        }
        
        return zoneMap[zoneName]
    end
    
    ---------------------------------------
    -- pfUI Skin Integration
    ---------------------------------------
    
    -- Apply pfUI skin to a VanillaGuide frame
    obj.SkinFrame = function(self, frame)
        if not obj.pfUIPresent or not frame then return end
        
        -- Check if pfUI skin API is available
        if pfUI and pfUI.api and pfUI.api.CreateBackdrop then
            pfUI.api.CreateBackdrop(frame, nil, true)
            Dv("    Applied pfUI skin to frame")
            return true
        end
        
        return false
    end
    
    -- Skin a button with pfUI style
    obj.SkinButton = function(self, button)
        if not obj.pfUIPresent or not button then return end
        
        if pfUI and pfUI.api and pfUI.api.SkinButton then
            pfUI.api.SkinButton(button)
            return true
        end
        
        return false
    end
    
    ---------------------------------------
    -- Step Integration
    ---------------------------------------
    
    -- Process a guide step and update pfQuest accordingly
    obj.ProcessGuideStep = function(self, stepData, stepText)
        if not obj.pfQuestPresent then return end
        
        -- Extract coordinates from step data
        local x = stepData and stepData.x
        local y = stepData and stepData.y
        local zone = stepData and stepData.zone
        
        -- Set waypoint if coordinates exist
        if x and y and zone then
            local settings = obj.Settings:GetSettingsPfQuest()
            if settings and settings.WaypointEnable then
                obj:SetWaypoint(x, y, zone, "VanillaGuide", stepText)
            end
        end
        
        -- Try to show quest on map
        if stepText then
            local questName = obj:ParseQuestName(stepText)
            if questName then
                local settings = obj.Settings:GetSettingsPfQuest()
                if settings and settings.QuestTrackingEnable then
                    obj:ShowQuestOnMap(questName)
                end
            end
        end
    end
    
    -- Cleanup when changing guides or steps
    obj.Cleanup = function(self)
        obj:ClearWaypoint()
        obj:ClearQuestNodes()
    end
    
    ---------------------------------------
    -- Initialization
    ---------------------------------------
    
    -- Run detection on creation
    obj:DetectAddons()
    
    return obj
end

Dv(" VGuide pfQuestIntegration.lua End")
