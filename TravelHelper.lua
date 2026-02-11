--[[--------------------------------------------------
----- VanillaGuide -----
------------------
TravelHelper.lua
------------------------------------------------------
Description: 
    Smart Travel Suggestions for VanillaGuide
    Provides contextual hints for:
    - Flight paths to take
    - Hearthstone bind locations
    - Travel shortcuts
    - Zone transitions
------------------------------------------------------
]]--

Dv(" VGuide TravelHelper.lua Start")

VGuideTravelHelper = {}
VGuideTravelHelper.__index = VGuideTravelHelper

-- Flight Master locations by zone (name and coordinates)
-- Format: [zone] = { { name = "Location", faction = "both/horde/alliance", connects = {"zone1", "zone2"} }, ... }
local FlightMasters = {
    -- Eastern Kingdoms - Alliance
    ["Elwynn Forest"] = { { name = "Goldshire", faction = "alliance", connects = {"Stormwind", "Westfall", "Redridge"} } },
    ["Westfall"] = { { name = "Sentinel Hill", faction = "alliance", connects = {"Stormwind", "Darkshire", "Lakeshire"} } },
    ["Loch Modan"] = { { name = "Thelsamar", faction = "alliance", connects = {"Ironforge", "Menethil Harbor"} } },
    ["Redridge Mountains"] = { { name = "Lakeshire", faction = "alliance", connects = {"Stormwind", "Darkshire"} } },
    ["Duskwood"] = { { name = "Darkshire", faction = "alliance", connects = {"Stormwind", "Sentinel Hill", "Booty Bay"} } },
    ["Wetlands"] = { { name = "Menethil Harbor", faction = "alliance", connects = {"Ironforge", "Theramore"} } },
    ["Stranglethorn Vale"] = { 
        { name = "Booty Bay", faction = "both", connects = {"Darkshire", "Grom'gol"} },
        { name = "Rebel Camp", faction = "alliance", connects = {"Darkshire"} }
    },
    ["Arathi Highlands"] = { { name = "Refuge Pointe", faction = "alliance", connects = {"Ironforge", "Southshore"} } },
    ["Hillsbrad Foothills"] = { { name = "Southshore", faction = "alliance", connects = {"Ironforge", "Aerie Peak"} } },
    ["The Hinterlands"] = { { name = "Aerie Peak", faction = "alliance", connects = {"Ironforge", "Southshore"} } },
    ["Western Plaguelands"] = { { name = "Chillwind Camp", faction = "alliance", connects = {"Ironforge", "Light's Hope"} } },
    ["Eastern Plaguelands"] = { { name = "Light's Hope Chapel", faction = "both", connects = {"Ironforge", "Undercity"} } },
    ["Blasted Lands"] = { { name = "Nethergarde Keep", faction = "alliance", connects = {"Stormwind"} } },
    ["Burning Steppes"] = { { name = "Morgan's Vigil", faction = "alliance", connects = {"Ironforge", "Stormwind"} } },
    ["Searing Gorge"] = { { name = "Thorium Point", faction = "both", connects = {"Ironforge", "Morgan's Vigil", "Kargath"} } },
    
    -- Eastern Kingdoms - Horde
    ["Tirisfal Glades"] = { { name = "Brill", faction = "horde", connects = {"Undercity", "The Sepulcher"} } },
    ["Silverpine Forest"] = { { name = "The Sepulcher", faction = "horde", connects = {"Undercity", "Tarren Mill"} } },
    ["Badlands"] = { { name = "Kargath", faction = "horde", connects = {"Orgrimmar", "Hammerfall", "Flame Crest"} } },
    ["Swamp of Sorrows"] = { { name = "Stonard", faction = "horde", connects = {"Grom'gol", "Flame Crest"} } },
    
    -- Kalimdor - Horde
    ["Durotar"] = { { name = "Razor Hill", faction = "horde", connects = {"Orgrimmar", "Thunder Bluff"} } },
    ["The Barrens"] = { 
        { name = "Crossroads", faction = "horde", connects = {"Orgrimmar", "Thunder Bluff", "Ratchet"} },
        { name = "Camp Taurajo", faction = "horde", connects = {"Thunder Bluff", "Crossroads"} },
        { name = "Ratchet", faction = "both", connects = {"Booty Bay"} }
    },
    ["Mulgore"] = { { name = "Bloodhoof Village", faction = "horde", connects = {"Thunder Bluff"} } },
    ["Thousand Needles"] = { { name = "Freewind Post", faction = "horde", connects = {"Thunder Bluff", "Gadgetzan"} } },
    ["Stonetalon Mountains"] = { { name = "Sun Rock Retreat", faction = "horde", connects = {"Orgrimmar", "Crossroads"} } },
    ["Ashenvale"] = { 
        { name = "Splintertree Post", faction = "horde", connects = {"Orgrimmar", "Crossroads"} },
        { name = "Zoram'gar Outpost", faction = "horde", connects = {"Orgrimmar"} }
    },
    ["Desolace"] = { { name = "Shadowprey Village", faction = "horde", connects = {"Thunder Bluff", "Orgrimmar"} } },
    ["Dustwallow Marsh"] = { { name = "Brackenwall Village", faction = "horde", connects = {"Orgrimmar", "Crossroads"} } },
    ["Feralas"] = { 
        { name = "Camp Mojache", faction = "horde", connects = {"Thunder Bluff", "Orgrimmar"} },
        { name = "Feathermoon Stronghold", faction = "alliance", connects = {"Darnassus", "Gadgetzan"} }
    },
    ["Tanaris"] = { { name = "Gadgetzan", faction = "both", connects = {"Thunder Bluff", "Theramore", "Cenarion Hold"} } },
    ["Un'Goro Crater"] = { { name = "Marshal's Refuge", faction = "both", connects = {"Gadgetzan", "Cenarion Hold"} } },
    ["Silithus"] = { { name = "Cenarion Hold", faction = "both", connects = {"Gadgetzan", "Marshal's Refuge"} } },
    ["Felwood"] = { 
        { name = "Bloodvenom Post", faction = "horde", connects = {"Orgrimmar", "Thunder Bluff"} },
        { name = "Talonbranch Glade", faction = "alliance", connects = {"Darnassus", "Everlook"} }
    },
    ["Winterspring"] = { { name = "Everlook", faction = "both", connects = {"Darnassus", "Orgrimmar"} } },
    ["Azshara"] = { 
        { name = "Azshara (Horde)", faction = "horde", connects = {"Orgrimmar"} },
        { name = "Talrendis Point", faction = "alliance", connects = {"Darnassus"} }
    },
    
    -- Kalimdor - Alliance
    ["Teldrassil"] = { { name = "Rut'theran Village", faction = "alliance", connects = {"Darnassus", "Auberdine"} } },
    ["Darkshore"] = { { name = "Auberdine", faction = "alliance", connects = {"Darnassus", "Astranaar", "Menethil Harbor"} } },
}

-- Recommended hearthstone bind locations by level range and faction
local HearthstoneBinds = {
    alliance = {
        { minLevel = 1, maxLevel = 12, zone = "Stormwind City", reason = "Central hub, trainers" },
        { minLevel = 12, maxLevel = 18, zone = "Westfall", location = "Sentinel Hill", reason = "Deadmines access" },
        { minLevel = 18, maxLevel = 25, zone = "Redridge Mountains", location = "Lakeshire", reason = "Close to multiple quest hubs" },
        { minLevel = 25, maxLevel = 30, zone = "Duskwood", location = "Darkshire", reason = "Central questline hub" },
        { minLevel = 30, maxLevel = 35, zone = "Stranglethorn Vale", location = "Booty Bay", reason = "Good quest density" },
        { minLevel = 35, maxLevel = 40, zone = "Dustwallow Marsh", location = "Theramore", reason = "Close to multiple zones" },
        { minLevel = 40, maxLevel = 45, zone = "Tanaris", location = "Gadgetzan", reason = "ZF access, central desert hub" },
        { minLevel = 45, maxLevel = 50, zone = "Tanaris", location = "Gadgetzan", reason = "Near Un'Goro and Silithus" },
        { minLevel = 50, maxLevel = 55, zone = "Felwood", location = "Talonbranch Glade", reason = "Close to Winterspring entry" },
        { minLevel = 55, maxLevel = 60, zone = "Eastern Plaguelands", location = "Light's Hope Chapel", reason = "Endgame quests and dungeons" },
    },
    horde = {
        { minLevel = 1, maxLevel = 12, zone = "Orgrimmar", reason = "Central hub, trainers" },
        { minLevel = 12, maxLevel = 20, zone = "The Barrens", location = "Crossroads", reason = "WC access, central Barrens" },
        { minLevel = 20, maxLevel = 25, zone = "Ashenvale", location = "Splintertree Post", reason = "BFD access" },
        { minLevel = 25, maxLevel = 30, zone = "Thousand Needles", location = "Freewind Post", reason = "Quest hub" },
        { minLevel = 30, maxLevel = 35, zone = "Desolace", location = "Shadowprey Village", reason = "Maraudon prep" },
        { minLevel = 35, maxLevel = 40, zone = "Dustwallow Marsh", location = "Brackenwall Village", reason = "Close to multiple zones" },
        { minLevel = 40, maxLevel = 45, zone = "Tanaris", location = "Gadgetzan", reason = "ZF access, central desert hub" },
        { minLevel = 45, maxLevel = 50, zone = "Feralas", location = "Camp Mojache", reason = "DM prep, good quests" },
        { minLevel = 50, maxLevel = 55, zone = "Felwood", location = "Bloodvenom Post", reason = "Close to Winterspring entry" },
        { minLevel = 55, maxLevel = 60, zone = "Eastern Plaguelands", location = "Light's Hope Chapel", reason = "Endgame quests and dungeons" },
    },
}

-- Zone travel shortcuts/tips
local TravelTips = {
    -- Boats and Zeppelins
    { from = "Stormwind", to = "Menethil Harbor", tip = "Take the Deeprun Tram to Ironforge, then fly" },
    { from = "Menethil Harbor", to = "Theramore", tip = "Take the boat from Menethil Harbor docks" },
    { from = "Menethil Harbor", to = "Auberdine", tip = "Take the boat from Menethil Harbor docks" },
    { from = "Auberdine", to = "Darnassus", tip = "Take boat to Rut'theran, then portal to Darnassus" },
    { from = "Ratchet", to = "Booty Bay", tip = "Take the boat from Ratchet docks" },
    { from = "Orgrimmar", to = "Undercity", tip = "Take the Zeppelin from Orgrimmar (west tower)" },
    { from = "Orgrimmar", to = "Grom'gol", tip = "Take the Zeppelin from Orgrimmar (east tower)" },
    { from = "Undercity", to = "Grom'gol", tip = "Take the Zeppelin outside Undercity" },
    
    -- Portals and quick travel
    { from = "Stormwind", to = "Ironforge", tip = "Use the Deeprun Tram in Dwarven District" },
    { from = "Ironforge", to = "Stormwind", tip = "Use the Deeprun Tram in Tinker Town" },
    { from = "any", to = "Moonglade", tip = "Druids: Use Teleport: Moonglade" },
    
    -- Common mistakes to avoid
    { from = "Darnassus", to = "Eastern Kingdoms", tip = "Fly Darnassus->Auberdine, boat to Menethil" },
}

function VGuideTravelHelper:new(oSettings)
    local obj = {}
    setmetatable(obj, self)
    
    obj.Settings = oSettings
    obj.currentZone = nil
    obj.faction = nil
    
    return obj
end

function VGuideTravelHelper:Initialize()
    -- Get player faction
    self.faction = string.lower(UnitFactionGroup("player") or "alliance")
    self.currentZone = GetZoneText()
end

-- Get suggested hearthstone bind for player's level
function VGuideTravelHelper:GetHearthstoneSuggestion()
    local level = UnitLevel("player")
    local binds = HearthstoneBinds[self.faction]
    
    if not binds then return nil end
    
    for _, bind in ipairs(binds) do
        if level >= bind.minLevel and level <= bind.maxLevel then
            return bind
        end
    end
    
    -- Default to last suggestion for 60+
    return binds[getn(binds)]
end

-- Check if player should rebind hearthstone
function VGuideTravelHelper:ShouldSuggestHearthBind()
    local suggestion = self:GetHearthstoneSuggestion()
    if not suggestion then return false, nil end
    
    local currentBind = GetBindLocation()
    if not currentBind then return false, nil end
    
    -- Check if already bound to suggested location
    if suggestion.location then
        if string.find(currentBind, suggestion.location, 1, true) then
            return false, nil
        end
    end
    if string.find(currentBind, suggestion.zone, 1, true) then
        return false, nil
    end
    
    return true, suggestion
end

-- Get flight path suggestion for traveling to a zone
function VGuideTravelHelper:GetFlightSuggestion(targetZone)
    if not targetZone then return nil end
    
    -- Check if target zone has flight masters
    local targetFMs = FlightMasters[targetZone]
    if not targetFMs then return nil end
    
    -- Find compatible flight master
    for _, fm in ipairs(targetFMs) do
        if fm.faction == "both" or fm.faction == self.faction then
            return {
                destination = fm.name,
                zone = targetZone,
                tip = "Fly to " .. fm.name .. " in " .. targetZone
            }
        end
    end
    
    return nil
end

-- Get travel tip for source to destination
function VGuideTravelHelper:GetTravelTip(fromZone, toZone)
    if not fromZone or not toZone then return nil end
    
    for _, tip in ipairs(TravelTips) do
        if (tip.from == fromZone or tip.from == "any") and tip.to == toZone then
            return tip.tip
        end
    end
    
    return nil
end

-- Analyze a guide step text for travel-related actions
function VGuideTravelHelper:AnalyzeStepForTravel(stepText)
    if not stepText then return nil end
    
    local suggestions = {}
    
    -- Look for zone mentions in the text
    local zones = {
        "Stormwind", "Orgrimmar", "Ironforge", "Thunder Bluff", "Undercity", "Darnassus",
        "Westfall", "Barrens", "Darkshore", "Silverpine", "Loch Modan", "Durotar",
        "Stranglethorn", "Tanaris", "Felwood", "Winterspring", "Un'Goro", "Silithus",
        "Eastern Plaguelands", "Western Plaguelands", "Burning Steppes", "Searing Gorge",
        "Feralas", "Dustwallow", "Desolace", "Thousand Needles", "Ashenvale",
        "The Hinterlands", "Arathi", "Hillsbrad", "Badlands", "Blasted Lands",
    }
    
    local lowerText = string.lower(stepText)
    
    for _, zone in ipairs(zones) do
        if string.find(lowerText, string.lower(zone), 1, true) then
            -- Check if this is different from current zone
            if zone ~= self.currentZone then
                local flightSuggestion = self:GetFlightSuggestion(zone)
                if flightSuggestion then
                    table.insert(suggestions, flightSuggestion.tip)
                end
                
                local travelTip = self:GetTravelTip(self.currentZone, zone)
                if travelTip then
                    table.insert(suggestions, travelTip)
                end
            end
        end
    end
    
    -- Look for hearthstone-related keywords
    if string.find(lowerText, "hearth") or 
       string.find(lowerText, "bind") or
       string.find(lowerText, "innkeeper") then
        local shouldBind, suggestion = self:ShouldSuggestHearthBind()
        if shouldBind and suggestion then
            local bindTip = "Consider binding hearthstone in " .. suggestion.zone
            if suggestion.location then
                bindTip = bindTip .. " at " .. suggestion.location
            end
            bindTip = bindTip .. " - " .. suggestion.reason
            table.insert(suggestions, bindTip)
        end
    end
    
    return suggestions
end

-- Get travel suggestion message for display
function VGuideTravelHelper:GetTravelSuggestionMessage()
    local shouldBind, suggestion = self:ShouldSuggestHearthBind()
    
    if shouldBind and suggestion then
        local msg = "|cff00ccffTravel Tip:|r Bind your hearthstone in " .. suggestion.zone
        if suggestion.location then
            msg = msg .. " (" .. suggestion.location .. ")"
        end
        msg = msg .. " - " .. suggestion.reason
        return msg
    end
    
    return nil
end

-- Update current zone tracking
function VGuideTravelHelper:OnZoneChanged()
    local newZone = GetZoneText()
    if newZone ~= self.currentZone then
        self.currentZone = newZone
        
        -- Check for hearthstone suggestion
        local msg = self:GetTravelSuggestionMessage()
        if msg then
            DEFAULT_CHAT_FRAME:AddMessage(msg)
        end
    end
end

-- Make available globally
_G.VGuideTravelHelper = VGuideTravelHelper

Dv(" VGuide TravelHelper.lua End")
