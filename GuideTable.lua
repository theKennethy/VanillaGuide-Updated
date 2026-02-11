--[[--------------------------------------------------
----- VanillaGuide -----
------------------
GuideTable.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: 
    	Object Handling the Guides
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
    		1.99x for a beta release was a weird choise.
	1.04.1
		-- This will be the place where we "prepare" the guides, 
			upon player login.
			We'll include all the needed guides here and we'll provide
			function to retrive informations too
	1.04.2
		-- no changes in here for this revision
	1.04.3
		-- Fixed typo for Loch Modan and Redridge Mountains
------------------------------------------------------
Connection:
--]]--------------------------------------------------

--local VGuide = VGuide
Dv(" VGuide GuideTable.lua Start")

objGuideTable = {}
objGuideTable.__index = objGuideTable

function objGuideTable:new(oSettings)
	local obj = {}
    setmetatable(obj, self)

	local function TablesMerge(t1, t2)
	    for k, v in pairs(t2) do
	        if (type(v) == "table") and (type(t1[k] or false) == "table") then
	            TablesMerge(t1[k], t2[k])
	        else
	            t1[k] = v
	        end
	    end
	    return t1
	end

	-- Parse coordinates from step text and auto-fill missing x/y/zone
	-- Supports formats: "(at 42.68)", "(42,68)", "(42.68, 55.74)", "at 42.68"
	local function ParseAndFillCoordinates(t1, defaultZone)
		for k1, _ in pairs(t1) do
			if type(t1[k1].items) == "table" then
				-- Try to determine zone from guide title
				local guideZone = defaultZone
				if t1[k1].title then
					-- Extract zone from title like "1-6 Durotar" or "12-15 Barrens"
					local _, _, titleZone = string.find(t1[k1].title, "%d+%-%d+%s+(.+)")
					if titleZone then
						-- Map common title zones to full zone names
						local zoneMap = {
							["Durotar"] = "Durotar",
							["Mulgore"] = "Mulgore",
							["DeathKnell"] = "Tirisfal Glades",
							["Tirisfal Glades"] = "Tirisfal Glades",
							["Elwynn Forest"] = "Elwynn Forest",
							["Dun Morogh"] = "Dun Morogh",
							["Teldrassil"] = "Teldrassil",
							["Barrens"] = "The Barrens",
							["Westfall"] = "Westfall",
							["Loch Modan"] = "Loch Modan",
							["Darkshore"] = "Darkshore",
							["Silverpine Forest"] = "Silverpine Forest",
							["Redridge Mountains"] = "Redridge Mountains",
							["Stonetalon Mountains"] = "Stonetalon Mountains",
							["Ashenvale"] = "Ashenvale",
							["Thousand Needles"] = "Thousand Needles",
							["Hillsbrad Foothills"] = "Hillsbrad Foothills",
							["Arathi Highlands"] = "Arathi Highlands",
							["Stranglethorn Vale"] = "Stranglethorn Vale",
							["Desolace"] = "Desolace",
							["Dustwallow Marsh"] = "Dustwallow Marsh",
							["Badlands"] = "Badlands",
							["Swamp of Sorrows"] = "Swamp of Sorrows",
							["Tanaris"] = "Tanaris",
							["Feralas"] = "Feralas",
							["Hinterlands"] = "The Hinterlands",
							["Searing Gorge"] = "Searing Gorge",
							["Blasted Lands"] = "Blasted Lands",
							["Burning Steppes"] = "Burning Steppes",
							["Un'Goro Crater"] = "Un'Goro Crater",
							["Felwood"] = "Felwood",
							["Winterspring"] = "Winterspring",
							["Azshara"] = "Azshara",
							["Western Plaguelands"] = "Western Plaguelands",
							["Eastern Plaguelands"] = "Eastern Plaguelands",
							["Silithus"] = "Silithus",
						}
						guideZone = zoneMap[titleZone] or titleZone
					end
				end
				
				for k2, v2 in pairs(t1[k1].items) do
					if v2 and v2.str then
						-- Only fill if coordinates are missing
						if not v2.x or not v2.y then
							local x, y = nil, nil
							local _
							
							-- Pattern 1: "(at 42.68)" or "(at 42,68)"
							_, _, x, y = string.find(v2.str, "%(at%s+(%d+)[%.,](%d+)%)")
							
							-- Pattern 2: "(42.68)" or "(42,68)" standalone
							if not x then
								_, _, x, y = string.find(v2.str, "%((%d+)[%.,](%d+)%)")
							end
							
							-- Pattern 3: "at 42.68" without parentheses
							if not x then
								_, _, x, y = string.find(v2.str, "at%s+(%d+)[%.,](%d+)")
							end
							
							-- Pattern 4: "42,68" or "42.68" at end of line
							if not x then
								_, _, x, y = string.find(v2.str, "(%d+)[%.,](%d+)%s*$")
							end
							
							-- Pattern 5: "around 42.68" or "around 42,68"
							if not x then
								_, _, x, y = string.find(v2.str, "around%s+(%d+)[%.,](%d+)")
							end
							
							if x and y then
								t1[k1].items[k2].x = tonumber(x)
								t1[k1].items[k2].y = tonumber(y)
								Dv("    Auto-filled coords: " .. x .. "," .. y .. " for step " .. k2)
							end
						end
						
						-- Fill zone if coordinates exist but zone is missing
						if t1[k1].items[k2].x and t1[k1].items[k2].y and not t1[k1].items[k2].zone then
							t1[k1].items[k2].zone = guideZone
							Dv("    Auto-filled zone: " .. (guideZone or "nil") .. " for step " .. k2)
						end
						
						-- Try to extract quest ID from quest name
						if VGuideQuestDB and VGuideQuestDB.GetQuestId then
							local _, _, questName = string.find(v2.str, '#ACCEPT"([^"]+)"')
							if not questName then
								_, _, questName = string.find(v2.str, '#DOQUEST"([^"]+)"')
							end
							if not questName then
								_, _, questName = string.find(v2.str, '#TURNIN"([^"]+)"')
							end
							
							if questName and not t1[k1].items[k2].questId then
								local qId = VGuideQuestDB:GetQuestId(questName)
								if qId then
									t1[k1].items[k2].questId = qId
									Dv("    Auto-filled questId: " .. qId .. " for " .. questName)
								end
							end
						end
					end
				end
			end
		end
		return t1
	end

	local function ColorizeTable(t1)
		for k1, _ in pairs(t1) do
			if type(t1[k1].items) == "table" then
				for k2, v2 in pairs(t1[k1].items) do
					if v2 then
						local opentext = {
							[1] = {
								["find"] = "#ACCEPT",
								["replace"] = "|c0000ffff"
							},
							[2] = {
								["find"] = "#DOQUEST",
								["replace"] = "|c000079d2"
							},
							[3] = {
								["find"] = "#TURNIN",
								["replace"] = "|c0000ff00"
							},
							[4] = {
								["find"] = "#NPC",
								["replace"] = "|c00ff00ff"
							},
							[5] = {
								["find"] = "#COORDS",
								["replace"] = "|c00ffff00"
							},
							[6] = {
								["find"] = "#VIDEO",
								["replace"] = "|c00ff0000"
							},
							[7] = {
								["find"] = "#PICTURE",
								["replace"] = "|c00fca742"
							},
							[8] = {
								["find"] = "#HUNTER", 
								["replace"] = "|c00a80000"
							},
						}
						for n = 1, getn(opentext) do
							t1[k1].items[k2].str = gsub(t1[k1].items[k2].str, opentext[n]["find"],opentext[n]["replace"])
						end
						t1[k1].items[k2].str = gsub(t1[k1].items[k2].str, "#","|r")
					end
				end
			end
		end
		return t1
	end

	-- Process a guide table: parse coordinates, fill quest IDs, then colorize
	-- This should be called instead of ColorizeTable directly
	local function ProcessTable(t1)
		t1 = ParseAndFillCoordinates(t1)
		t1 = ColorizeTable(t1)
		return t1
	end

	obj.TableDDM = {
		lvl1 = {
			{ "v", "Introduction", id = 1},
			{ "s", "Starting Zones" },
			{ "s", "Later Leveling" },
			{ "s", "Profession Guides" },
			{ "s", "Dungeon Guides" },
			{ "s", "Gold Making" },
			{ "s", "Reputation Guides" },
			{ "s", "Talent Guides" },
			{ "s", "Gear Guides" },
		},
		lvl2 = {
			["Later Leveling"] = {
				{ "s", "12-20" },
				{ "s", "20-30" },
				{ "s", "30-40" },
				{ "s", "40-50" },
				{ "s", "50-60" },
			},
			["Profession Guides"] = {
				{ "v", "Alchemy", id = nil },
				{ "v", "Blacksmithing", id = nil },
				{ "v", "[H] Cooking", id = nil },
				{ "v", "[A] Cooking", id = nil },
				{ "v", "Enchanting", id = nil },
				{ "v", "Engineering", id = nil },
				{ "v", "Leatherworking", id = nil },
				{ "v", "Tailoring", id = nil },
				{ "v", "First Aid", id = nil },
				{ "v", "Fishing", id = nil }
			},
			["Dungeon Guides"] = {
				{ "v", "Ragefire Chasm (13-18)", id = nil },
				{ "v", "Deadmines (17-26)", id = nil },
				{ "v", "Wailing Caverns (17-24)", id = nil },
				{ "v", "Shadowfang Keep (22-30)", id = nil },
				{ "v", "Blackfathom Deeps (24-32)", id = nil },
				{ "v", "Gnomeregan (29-38)", id = nil },
				{ "v", "Scarlet Monastery - Graveyard (28-33)", id = nil },
				{ "v", "Scarlet Monastery - Library (29-39)", id = nil },
				{ "v", "Scarlet Monastery - Armory (32-42)", id = nil },
				{ "v", "Scarlet Monastery - Cathedral (35-45)", id = nil },
				{ "v", "Razorfen Kraul (29-38)", id = nil },
				{ "v", "Uldaman (41-51)", id = nil },
				{ "v", "Zul'Farrak (44-54)", id = nil },
				{ "v", "Maraudon (46-55)", id = nil },
				{ "v", "Sunken Temple (50-60)", id = nil },
				{ "v", "Blackrock Depths (52-60)", id = nil },
				{ "v", "Lower Blackrock Spire (55-60)", id = nil },
				{ "v", "Upper Blackrock Spire (58-60)", id = nil },
				{ "v", "Stratholme (58-60)", id = nil },
				{ "v", "Scholomance (58-60)", id = nil },
				{ "v", "Dire Maul East (55-60)", id = nil },
				{ "v", "Dire Maul West (55-60)", id = nil },
				{ "v", "Dire Maul North - Tribute (55-60)", id = nil },
			},
			["Gold Making"] = {
				{ "v", "Gold Making - General Tips", id = nil },
				{ "v", "Auction House Mastery", id = nil },
				{ "v", "Farming Spots: Level 30-40", id = nil },
				{ "v", "Farming Spots: Level 40-50", id = nil },
				{ "v", "Farming Spots: Level 50-60", id = nil },
				{ "v", "Dungeon Gold Farms", id = nil },
				{ "v", "Profession Gold Making", id = nil },
				{ "v", "Vendor Tricks & Flipping", id = nil },
				{ "v", "Epic Mount Gold Guide", id = nil },
				{ "v", "Raid Consumables Farming", id = nil },
			},
			["Reputation Guides"] = {
				{ "v", "Argent Dawn Reputation", id = nil },
				{ "v", "Timbermaw Hold Reputation", id = nil },
				{ "v", "Cenarion Circle Reputation", id = nil },
				{ "v", "Thorium Brotherhood Reputation", id = nil },
				{ "v", "Hydraxian Waterlords Reputation", id = nil },
				{ "v", "Brood of Nozdormu Reputation", id = nil },
				{ "v", "Zandalar Tribe Reputation", id = nil },
				{ "v", "Steamwheedle Cartel / Bloodsail", id = nil },
				{ "v", "Wintersaber Trainers (Alliance)", id = nil },
				{ "v", "Home City Reputation", id = nil },
				{ "v", "Shen'dralar Reputation", id = nil },
			},
			["Talent Guides"] = {
				{ "v", "Warrior - Fury DPS Talents", id = nil },
				{ "v", "Warrior - Arms PvP Talents", id = nil },
				{ "v", "Warrior - Protection Tank Talents", id = nil },
				{ "v", "Rogue - Combat Swords Talents", id = nil },
				{ "v", "Rogue - Dagger Talents", id = nil },
				{ "v", "Mage - Frost Leveling Talents", id = nil },
				{ "v", "Mage - Fire Raid Talents", id = nil },
				{ "v", "Priest - Shadow Leveling Talents", id = nil },
				{ "v", "Priest - Holy Healing Talents", id = nil },
				{ "v", "Warlock - SM/Ruin Talents", id = nil },
				{ "v", "Warlock - DS/Ruin Talents", id = nil },
				{ "v", "Hunter - Marksmanship Talents", id = nil },
				{ "v", "Hunter - Beast Mastery Talents", id = nil },
				{ "v", "Druid - Feral Leveling/Tank Talents", id = nil },
				{ "v", "Druid - Restoration Healing Talents", id = nil },
				{ "v", "Shaman - Enhancement Leveling Talents", id = nil },
				{ "v", "Shaman - Restoration Talents", id = nil },
				{ "v", "Paladin - Holy Healing Talents", id = nil },
				{ "v", "Paladin - Retribution Leveling Talents", id = nil },
			},
			["Gear Guides"] = {
				{ "v", "Gearing Guide - Overview", id = nil },
				{ "v", "Warrior - Pre-Raid BiS (Fury DPS)", id = nil },
				{ "v", "Warrior - Pre-Raid BiS (Prot Tank)", id = nil },
				{ "v", "Rogue - Pre-Raid BiS", id = nil },
				{ "v", "Mage - Pre-Raid BiS", id = nil },
				{ "v", "Healer - Pre-Raid BiS", id = nil },
				{ "v", "Hunter - Pre-Raid BiS", id = nil },
				{ "v", "Warlock - Pre-Raid BiS", id = nil },
				{ "v", "Leveling Gear - Key Upgrades", id = nil },
			},
			["[H] Starting Zones"] = {
				{ "s", "Orcs & Trolls" },
				{ "s", "Taurens" },
				{ "s", "Undeads" },
			},
			["[A] Starting Zones"] = {
				{ "s", "Humans" },
				{ "s", "Dwarves & Gnomes" },
				{ "s", "Night Elves" },
			},
		},
		lvl3 = {
			["Orcs & Trolls"] = {
				{ "v", "1-6 Durotar", id = nil },
				{ "v", "6-9 Durotar", id = nil },
				{ "v", "9-12 Durotar", id = nil },
			},
			["Taurens"] = {
				{ "v", "1-6 Mulgore", id = nil },
				{ "v", "6-10 Mulgore", id = nil },
				{ "v", "10-12 Mulgore", id = nil },
			},
			["Undeads"] = {
				{ "v", "1-6 DeathKnell", id = nil },
				{ "v", "6-10 Tirisfal Glades", id = nil },
				{ "v", "10-12 Tirisfal Glades", id = nil },          
			},
			["[H] 12-20"] = {
				{ "v", "12-15 Barrens", id = nil },
				{ "v", "15-16 Stonetalon Mountains", id = nil },
				{ "v", "16-20 Barrens (part 1)", id = nil },
				{ "v", "16-20 Barrens (part 2)", id = nil },
			},
			["[H] 20-30"] = {
				{ "v", "20-21 Stonetalon Mountains", id = nil },
				{ "v", "21-21 Ashenvale", id = nil },
				{ "v", "22-23 Southern Barrens", id = nil },
				{ "v", "23-25 Stonetalon Mountains", id = nil },
				{ "v", "25-25 Southern Barrens", id = nil },
				{ "v", "25-26 Thousand Needles", id = nil },
				{ "v", "26-27 Ashenvale", id = nil },
				{ "v", "27-27 Stonetalon Mountains", id = nil },
				{ "v", "27-29 Thousand Needles", id = nil },
				{ "v", "29-30 Hillsbrad Foothills", id = nil },
			},
			["[H] 30-40"] = {
				{ "v", "30-30 Alterac Mountains", id = nil },
				{ "v", "30-30 Arathi Highlands", id = nil },
				{ "v", "30-31 Stranglethorn Vale", id = nil },
				{ "v", "31-32 TN (Shimmering Flats)", id = nil },
				{ "v", "32-34 Desolace", id = nil },
				{ "v", "34-35 Stranglethorn Vale", id = nil },
				{ "v", "35-37 Arathi Highlands", id = nil },
				{ "v", "37-37 Alterac Mountains", id = nil },
				{ "v", "37-37 Thousand Needles", id = nil },
				{ "v", "37-38 Dustwallow Marsh", id = nil },
				{ "v", "38-40 Stranglethorn Vale", id = nil },
			},
			["[H] 40-50"] = {
				{ "v", "40-41 Badlands", id = nil },
				{ "v", "41-42 Swamp of Sorrows", id = nil },
				{ "v", "42-43 Stranglethorn Vale", id = nil },
				{ "v", "43-43 Desolace", id = nil },
				{ "v", "43-43 Dustwallow Marsh", id = nil },
				{ "v", "43-44 Tanaris", id = nil },
				{ "v", "44-46 Feralas", id = nil },
				{ "v", "46-46 Azshara", id = nil },
				{ "v", "46-47 Hinterlands", id = nil },
				{ "v", "47-47 Stranglethorn Vale", id = nil },
				{ "v", "47-48 Searing Gorge", id = nil },
				{ "v", "48-48 Swamp of Sorrows", id = nil },
				{ "v", "48-49 Ferelas", id = nil },
				{ "v", "49-50 Tanaris", id = nil },
			},
			["[H] 50-60"] = {
				{ "v", "50-50 Azshara", id = nil },
				{ "v", "50-50 Hinterlands", id = nil },
				{ "v", "50-51 Blasted Lands", id = nil },
				{ "v", "51-52 Un'Goro Crater", id = nil },
				{ "v", "52-53 Burning Steppes", id = nil },
				{ "v", "53-54 Azshara", id = nil },
				{ "v", "54-54 Felwood", id = nil },
				{ "v", "54-55 Winterspring", id = nil },
				{ "v", "55-55 Felwood", id = nil },
				{ "v", "55-55 Silithus", id = nil },
				{ "v", "55-56 Western Plaguelands", id = nil },
				{ "v", "56-57 Eastern Plaguelands", id = nil },
				{ "v", "57-58 Western Plaguelands", id = nil },
				{ "v", "58-60 Winterspring", id = nil },
			},

			["Humans"] = {
				{ "v", "1-10 Elwynn Forest", id = nil },
				{ "v", "10-12 Westfall and Loch Modan", id = nil },
			},
			["Dwarves & Gnomes"] = {
				{ "v", "1-6 Cold Ridge Valley", id = nil },
				{ "v", "6-12 Dun Morogh", id = nil },
			},
			["Night Elves"] = {
				{ "v", "1-6 Teldrassil", id = nil },
				{ "v", "6-12 Teldrassil", id = nil },
			},
			["[A] 12-20"] = {
				{ "v", "12-14 Darkshore", id = nil },
				{ "v", "14-17 Darkshore", id = nil },
				{ "v", "17-18 Loch Modan", id = nil },
				{ "v", "18-20 Redridge Mountains", id = nil },
			},
			["[A] 20-30"] = {
				{ "v", "20-21 Darkshore", id = nil },
				{ "v", "21-22 Ashenvale", id = nil },
				{ "v", "22-23 Stonetalon Mountains", id = nil },
				{ "v", "23-24 Darkshore", id = nil },
				{ "v", "24-25 Ashenvale", id = nil },
				{ "v", "25-27 Wetlands", id = nil },
				{ "v", "27-28 Lakeshire", id = nil },
				{ "v", "28-29 Duskwood", id = nil },
				{ "v", "29-30 Ashenvale", id = nil },
				{ "v", "30-30 Wetlands", id = nil },
			},
			["[A] 30-40"] = {
				{ "v", "30-31 Hillsbrad Foothills", id = nil },
				{ "v", "31-31 Alterac Mountains", id = nil },
				{ "v", "31-32 Arathi Highlands", id = nil },
				{ "v", "32-32 Stranglethorn Vale", id = nil },
				{ "v", "32-33 Thousand Needles (Shimmering Flats)", id = nil },
				{ "v", "33-33 Stonetalon Mountains", id = nil },
				{ "v", "33-35 Desolace", id = nil },
				{ "v", "35-36 Stranglethorn Vale", id = nil },
				{ "v", "36-37 Alterac Mountains", id = nil },
				{ "v", "37-38 Arathi Highlands", id = nil },
				{ "v", "38-38 Dustwallow Marsh", id = nil },
				{ "v", "38-40 Stranglethorn Vale", id = nil },
			},
			["[A] 40-50"] = {
				{ "v", "40-41 Badlands", id = nil },
				{ "v", "41-41 Swamp of Sorrows", id = nil },
				{ "v", "41-42 Desolace", id = nil },
				{ "v", "42-43 Stranglethron Vale", id = nil },
				{ "v", "43-43 Tanaris", id = nil },
				{ "v", "43-45 Feralas", id = nil },
				{ "v", "45-46 Uldaman", id = nil },
				{ "v", "46-47 The Hinterlands", id = nil },
				{ "v", "47-47 Feralas", id = nil },
				{ "v", "47-48 Tanaris", id = nil },
				{ "v", "48-48 The Hinterlands", id = nil },
				{ "v", "48-49 Stranglethorn Vale", id = nil },
				{ "v", "49-50 Blasted Lands", id = nil },
			},
			["[A] 50-60"] = {
				{ "v", "50-51 Searing Gorge", id = nil },
				{ "v", "51-52 Un’Goro Crater", id = nil },
				{ "v", "52-53 Azshara", id = nil },
				{ "v", "53-54 Felwood", id = nil },
				{ "v", "54-54 Tanaris", id = nil },
				{ "v", "54-54 Felwood", id = nil },
				{ "v", "54-55 Winterspring", id = nil },
				{ "v", "55-56 Burning Steppes", id = nil },
				{ "v", "56-56 Tanaris", id = nil },
				{ "v", "56-56 Silithus", id = nil },
				{ "v", "56-57 Western Plaguelands", id = nil },
				{ "v", "57-58 Eastern Plaguelands", id = nil },
				{ "v", "58-58 Western Plaguelands", id = nil },
				{ "v", "58-58 Eastern Plaguelands", id = nil },
				{ "v", "58-59 Western Plaguelands", id = nil },
				{ "v", "59-60 Winterspring", id = nil },
			},
		},
	}

	local tCharInfo = oSettings:GetSettingsCharInfo()

	obj.Guide = {}
	obj.NoGuide = {}
	obj.GuideCount = 0
	obj.NoGuideCount = 0
	obj.Faction = tCharInfo.Faction
	obj.Race = tCharInfo.Race
	tCharInfo = nil

	-- Guides Praparation methods
	obj.PrepareGuidesTableHorde = function(self, tRace)
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_001_Introduction))
		if tRace == "Tauren" then 
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_Mulgore))
		elseif tRace == "Undead" then 
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_TirisfalGlades))
		else 
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_Durotar))
		end
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Horde_12to20))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Horde_20to30))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Horde_30to40))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Horde_40to50))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Horde_50to60))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_004_Professions))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_005_Dungeons))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_006_GoldFarming))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_007_Reputation))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_008_TalentGuides))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_009_GearGuides))
	end

	obj.PrepareNoGuidesTableHorde = function(self, tRace)
		-- we normilize here, cause "indexes" will clash otherwise 
		if tRace == "Tauren" then 
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_TirisfalGlades))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Durotar))
		elseif tRace == "Undead" then 
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Durotar))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Mulgore))			
		else
			
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Mulgore))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_TirisfalGlades))
		end
	end

	obj.PrepareGuidesTableAlliance = function(self, tRace)
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_001_Introduction))
		if tRace == "Human" then
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_ElwynnForest))
		elseif tRace == "Night Elf" then
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_Teldrassil))
		else
			obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_002_DunMorogh))
		end
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Alliance_12to20))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Alliance_20to30))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Alliance_30to40))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Alliance_40to50))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_003_Alliance_50to60))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_004_Professions))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_005_Dungeons))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_006_GoldFarming))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_007_Reputation))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_008_TalentGuides))
		obj.Guide = TablesMerge(obj.Guide, ProcessTable(Table_009_GearGuides))
	end

	obj.PrepareNoGuidesTableAlliance = function(self, tRace)
		-- we normilize here, cause "indexes" will clash otherwise 
		if tRace == "Human" then
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_DunMorogh))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Teldrassil))
		elseif tRace == "Night Elf" then
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_ElwynnForest))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_DunMorogh))
		else
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_Teldrassil))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ProcessTable(Table_002_ElwynnForest))
		end
	end

	obj.NormalizeGuide = function(self, t, offset)
		if not offset then offset = 0 end

		-- the index_table will store all the guideIDs, as they are readen from file.
		-- then, once done, those IDs are sorted (from lower to higer)
		local index_table = {}
		for i,_ in pairs(t) do
			table.insert(index_table, i)
		end
		table.sort(index_table)

		-- this for-cicle will sort the tables, so we'll have them listed from lower to higer
		-- Every ID will be converted from its original value to a new incremental index
		-- starting from 1 (Introduction)
		local c = 0 + offset
		for _,v in ipairs(index_table) do
			c = c + 1
			t[c] = t[v]
			if v ~= c then
				t[v] = nil
			end
		end

		return t, c - offset
	end

	-- DropDownMenu Preparation methods
	local function xSearchID(tDDMsection)
		for _,v1 in ipairs(tDDMsection) do
			for k,v2 in ipairs(obj.Guide) do
				-- we use the "plain" method here, as in those "title" string
				-- we could find special characters like "-" and "["
				if string.find(v2.title, v1[2], 1, true) then 
					v1.id = k
				end
			end
		end
	end
	
	obj.DefineDDMProfessionsSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Profession Guides"])
	end

	obj.DefineDDMStartingZonesSubMenu = function(self, tFaction)
		if tFaction == "Horde" then
			xSearchID(obj.TableDDM.lvl3["Orcs & Trolls"])
			xSearchID(obj.TableDDM.lvl3["Taurens"])
			xSearchID(obj.TableDDM.lvl3["Undeads"])
		else
			xSearchID(obj.TableDDM.lvl3["Humans"])
			xSearchID(obj.TableDDM.lvl3["Night Elves"])
			xSearchID(obj.TableDDM.lvl3["Dwarves & Gnomes"])
		end
	end

	obj.DefineDDMLaterLevelingSubMenu = function(self, tFaction)
		if tFaction == "Horde" then
			xSearchID(obj.TableDDM.lvl3["[H] 12-20"])
			xSearchID(obj.TableDDM.lvl3["[H] 20-30"])
			xSearchID(obj.TableDDM.lvl3["[H] 30-40"])
			xSearchID(obj.TableDDM.lvl3["[H] 40-50"])
			xSearchID(obj.TableDDM.lvl3["[H] 50-60"])
		else
			xSearchID(obj.TableDDM.lvl3["[A] 12-20"])
			xSearchID(obj.TableDDM.lvl3["[A] 20-30"])
			xSearchID(obj.TableDDM.lvl3["[A] 30-40"])
			xSearchID(obj.TableDDM.lvl3["[A] 40-50"])
			xSearchID(obj.TableDDM.lvl3["[A] 50-60"])
		end
	end

	obj.DefineDDMDungeonGuidesSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Dungeon Guides"])
	end

	obj.DefineDDMGoldMakingSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Gold Making"])
	end

	obj.DefineDDMReputationGuidesSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Reputation Guides"])
	end

	obj.DefineDDMTalentGuidesSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Talent Guides"])
	end

	obj.DefineDDMGearGuidesSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Gear Guides"])
	end

	-- Clear Tables read from .toc
	obj.ClearInitialTablesContent = function(self)
		Table_001_Introduction = nil
		Table_002_Durotar = nil
		Table_002_Mulgore = nil
		Table_002_TirisfalGlades = nil
		Table_002_DunMorogh = nil
		Table_002_Teldrassil = nil
		Table_002_ElwynnForest = nil
		Table_003_Horde_12to20 = nil
		Table_003_Horde_20to30 = nil
		Table_003_Horde_30to40 = nil
		Table_003_Horde_40to50 = nil
		Table_003_Horde_50to60 = nil
		Table_003_Alliance_12to20 = nil
		Table_003_Alliance_20to30 = nil
		Table_003_Alliance_30to40 = nil
		Table_003_Alliance_40to50 = nil
		Table_003_Alliance_50to60 = nil
		Table_004_Professions = nil
		Table_005_Dungeons = nil
		Table_006_GoldFarming = nil
		Table_007_Reputation = nil
		Table_008_TalentGuides = nil
		Table_009_GearGuides = nil
	end

	-- Query object methods
	obj.GetGuide = function(self, nGuideID)
		if not obj.GuideCount then
			Dv(" -- GuideCount is nil!")
			return nil
		end
		if not nGuideID then
			Dv(" -- nGuideID is nil!")
			return nil
		end
		if nGuideID > obj.GuideCount then 
			Dv(" -- Guide not present! ID exceed the GuideCount value!")
		elseif nGuideID < 1 then
			Dv(" -- negative or zero ID! Are you joking?")
		else
			return obj.Guide[nGuideID]
		end
	end

	obj.GetTableDDM = function(self)
		return obj.TableDDM
	end

	-- Constructor Main
	if obj.Faction == "Horde" then
		obj:PrepareGuidesTableHorde(obj.Race)
		obj:PrepareNoGuidesTableHorde(obj.Race)
	else
		obj:PrepareGuidesTableAlliance(obj.Race)
		obj:PrepareNoGuidesTableAlliance(obj.Race)
	end
	
	-- we use a HUGE offset here, so we know those NoGuide will end up at the end!
	obj.NoGuide, obj.NoGuideCount = obj:NormalizeGuide(obj.NoGuide, 100500)
	obj.Guide = TablesMerge(obj.Guide, obj.NoGuide)
	
	obj.Guide, obj.GuideCount = obj:NormalizeGuide(obj.Guide, nil)

	obj:DefineDDMProfessionsSubMenu()
	obj:DefineDDMStartingZonesSubMenu(obj.Faction)
	obj:DefineDDMLaterLevelingSubMenu(obj.Faction)
	obj:DefineDDMDungeonGuidesSubMenu()
	obj:DefineDDMGoldMakingSubMenu()
	obj:DefineDDMReputationGuidesSubMenu()
	obj:DefineDDMTalentGuidesSubMenu()
	obj:DefineDDMGearGuidesSubMenu()

	obj:ClearInitialTablesContent()

	return obj
end

Dv(" VGuide GuideTable.lua Start")
--return VGuide

--[[
do
-----------------------------------------------------------------
	Table_001_Introduction = {
		[0001] = {	title = "Introduction" },
	}
-----------------------------------------------------------------
	Table_002_Durotar = {
		[0106] = {	title = "1-6 Durotar" },
		[0609] = {	title = "6-9 Durotar" },
		[0912] = {	title = "9-12 Durotar" },
	}
	Table_002_Mulgore = {
		[0106] = {	title = "1-6 Mulgore" },
		[0610] = {	title = "6-10 Mulgore" },
		[1012] = {	title = "10-12 Mulgore" },
	}
	Table_002_TirisfalGlades = {
		[0106] = {	title = "1-6 DeathKnell (Tirisfal Glades)" },
		[0610] = {	title = "6-10 Tirisfal Glades" },
		[1012] = {	title = "10-12 Tirisfal Glades" },
	}
-----------------------------------------------------------------	
	Table_002_DunMorogh = {
		[0106] = {	title = "1-6 Cold Ridge Valley" },
        [0612] = {	title = "6-12 Dun Morogh" },
    }
	Table_002_Teldrassil = {
		[0106] = {	title = "1-6 Teldrassil" },
		[0612] = {	title = "6-12 Teldrassil" },
	}
	Table_002_ElwynnForest = {
		[0110] = {	title = "1-10 Elwynn Forest" },
		[1012] = {	title = "10-12 Westfall and Loch Modan" },
	}
-----------------------------------------------------------------
	Table_003_Horde_12to20 = {
		[1215] = {	title = "12-15 Barrens" },
		[1516] = {	title = "15-16 Stonetalon Mountains" },
		[1618] = {	title = "16-20 Barrens Part 1" },
		[1820] = {	title = "16-20 Barrens Part 2" },
	}
	Table_003_Horde_20to30 = {
		[2021] = { title = "20-21 Stonetalon Mountains" },
		[2121] = {	title = "21-21 Ashenvale" },
		[2223] = {	title = "22-23 Southern Barrens" },
		[2325] = {	title = "23-25 Stonetalon Mountains" },
		[2525] = {	title = "25-25 Southern Barrens" },
		[2526] = {	title = "25-26 Thousand Needles" },
		[2627] = {	title = "26-27 Ashenvale" },
		[2727] = {	title = "27-27 Stonetalon Mountains" },
		[2729] = {	title = "27-29 Thousand Needles" },
		[2930] = {	title = "29-30 Hillsbrad Foothills" },
	}
	Table_003_Horde_30to40 = {
		[3029] = {	title = "30-30 Alterac Mountains" },
		[3030] = {	title = "30-30 Arathi Highlands" },
		[3031] = {	title = "30-31 Stranglethorn Vale" },
		[3132] = {	title = "31-32 TN (Shimmering Flats)" },
		[3234] = {	title = "32-34 Desolace" },
		[3435] = {	title = "34-35 Stranglethorn Vale" },
		[3537] = {	title = "35-37 Arathi Highlands" },
		[3736] = {	title = "37-37 Alterac Mountains" },
		[3737] = {	title = "37-37 Thousand Needles" },
		[3738] = {	title = "37-38 Dustwallow Marsh" },
		[3840] = {	title = "38-40 Stranglethorn Vale" },
	}
	Table_003_Horde_40to50 = {
		[4041] = {	title = "40-41 Badlands" },
		[4142] = {	title = "41-42 Swamp of Sorrows" },
		[4243] = {	title = "42-43 Stranglethorn Vale" },
		[4342] = {	title = "43-43 Desolace" },
		[4343] = {	title = "43-43 Dustwallow Marsh" },
		[4344] = {	title = "43-44 Tanaris" },
		[4446] = {	title = "44-46 Feralas" },
		[4646] = {	title = "46-46 Azshara" },
		[4647] = {	title = "46-47 Hinterlands" },
		[4747] = {	title = "47-47 Stranglethorn Vale" },
		[4748] = {	title = "47-48 Searing Gorge" },
		[4848] = {	title = "48-48 Swamp of Sorrows" },
		[4849] = {	title = "48-49 Feralas" },
		[4950] = {	title = "49-50 Tanaris" },
	}
	Table_003_Horde_50to60 = {
		[5049] = {	title = "50-50 Azshara" },
		[5050] = {	title = "50-50 Hinterlands" },
		[5051] = {	title = "50-51 Blasted Lands" },
		[5152] = {	title = "51-52 Un'Goro Crater" },
		[5253] = {	title = "52-53 Burning Steppes" },
		[5354] = {	title = "53-54 Azshara" },
		[5454] = {	title = "54-54 Felwood" },
		[5455] = {	title = "54-55 Winterspring" },
		[5554] = {	title = "55-55 Felwood" },
		[5555] = {	title = "55-55 Silithus" },
		[5556] = {	title = "55-56 Western Plaguelands" },
		[5657] = {	title = "56-57 Eastern Plaguelands" },
		[5758] = {	title = "57-58 Western Plaguelands" },
		[5860] = {	title = "58-60 Winterspring" },
	}
-----------------------------------------------------------------
	Table_003_Alliance_12to20 = {
		[1214] = {	title = "12-14 Darkshore" },
		[1417] = {	title = "14-17 Darkshore" },
		[1718] = {	title = "17-18 Loch Modan" },
		[1820] = {	title = "18-20 Redridge Mountains" },
	}
	Table_003_Alliance_20to30 = {
		[2021] = {  title = "20-21 Darkshore" },
        [2122] = {  title = "21-22 Ashenvale" },
        [2223] = {  title = "22-23 Stonetalon Mountains" },
        [2324] = {  title = "23-24 Darkshore" },
        [2425] = {  title = "24-25 Ashenvale" },
        [2526] = {  title = "25-27 Wetlands" },
        [2728] = {  title = "27-28 Lakeshire" },
        [2829] = {  title = "28-29 Duskwood" },
        [2930] = {	title = "29-30 Ashenvale" },
		[3030] = {  title = "30-30 Wetlands" },
	}
	Table_003_Alliance_30to40 = {
		[3031] = {	title = "30-31 Hillsbrad Foothills" },
		[3131] = {	title = "31-31 Alterac Mountains" },
		[3132] = {	title = "31-32 Arathi Highlands" },
		[3232] = {	title = "32-32 Stranglethorn Vale" },
		[3233] = {	title = "32-33 Thousand Needles (Shimmering Flats)" },
		[3333] = {	title = "33-33 Stonetalon Mountains" },
		[3335] = {	title = "33-35 Desolace" },
		[3536] = {	title = "35-36 Stranglethorn Vale" },
		[3637] = {	title = "36-37 Alterac Mountains" },
		[3738] = {  title = "37-38 Arathi Highlands" },
	    [3838] = {	title = "38-38 Dustwallow Marsh", }
		[3840] = {	title = "38-40 Stranglethorn Vale" },
	}
	Table_003_Alliance_40to50 = {
		[4041] = {	title = "40-41 Badlands" },
		[4141] = {	title = "41-41 Swamp of Sorrows" },
		[4142] = {	title = "41-42 Desolace" },
		[4243] = {	title = "42-43 Stranglethron Vale" },
		[4343] = {	title = "43-43 Tanaris" },
		[4345] = {	title = "43-45 Feralas" },
		[4546] = {	title = "45-46 Uldaman" },
		[4647] = {	title = "46-47 The Hinterlands" },
		[4747] = {	title = "47-47 Feralas" },
		[4748] = {	title = "47-48 Tanaris" },
		[4848] = {	title = "48-48 The Hinterlands" },
		[4849] = {	title = "48-49 Stranglethorn Vale" },
		[4950] = {	title = "49-50 Blasted Lands" },
	}
	Table_003_Alliance_50to60 = {
		[5051] = {	title = "50-51 Searing Gorge" },
		[5152] = {	title = "51-52 Un’Goro Crater" },
		[5253] = {	title = "52-53 Azshara" },
		[5354] = {	title = "53-54 Felwood" },
		[5453] = {	title = "54-54 Tanaris" },
		[5454] = {	title = "54-54 Felwood" },
		[5455] = {	title = "54-55 Winterspring" },
		[5556] = {	title = "55-56 Burning Steppes" },
		[5655] = {	title = "56-56 Tanaris" },
		[5656] = {	title = "56-56 Silithus" },
		[5657] = {	title = "56-57 Western Plaguelands" },
		[5758] = {	title = "57-58 Eastern Plaguelands" },
		[5857] = {	title = "58-58 Western Plaguelands" },
		[5858] = {	title = "58-58 Eastern Plaguelands" },
		[5859] = {	title = "58-59 Western Plaguelands" },
		[5960] = {	title = "59-60 Winterspring" },
	}
-----------------------------------------------------------------
	Table_004_Professions = {
		[7002] = {	title = "1-300 Alchemy" },
		[7003] = {	title = "1-300 Blacksmithing" },
		[7004] = {	title = "1-300 Cooking (Horde)" },
		[7005] = {	title = "1-300 Cooking (Alliance)" },
		[7006] = {	title = "1-300 Enchanting" },
		[7007] = {	title = "1-300 Engineering" },
		[7008] = {	title = "1-300 Leatherworking" },
		[7009] = {	title = "1-300 Tailoring" },
	}
end
]]
