--[[--------------------------------------------------
----- VanillaGuide -----
------------------
NPCDatabase.lua
Authors: GitHub Copilot
Version: 1.08.0
------------------------------------------------------
Description: 
    Database of NPC names to displayID for model viewer
    Curated list of common quest NPCs for leveling
------------------------------------------------------
]]--

Dv(" VGuide NPCDatabase.lua Start")

-- NPC Name -> DisplayID mapping
-- DisplayIDs from vanilla WoW database
VGuideNPCDatabase = {
    -- == ALLIANCE STARTING ZONES ==
    
    -- Elwynn Forest
    ["Marshal McBride"] = 338,
    ["Deputy Willem"] = 338,
    ["Eagan Peltskinner"] = 3244,
    ["Milly Osworth"] = 1267,
    ["Brother Neals"] = 1207,
    ["Marshal Dughan"] = 3244,
    ["Sara Timberlain"] = 2058,
    ["Remy Two-Times"] = 3244,
    ["Guard Thomas"] = 3244,
    ["William Pestle"] = 3244,
    ["Brother Wilhelm"] = 1207,
    ["Quartermaster Lewis"] = 2600,
    
    -- Dun Morogh
    ["Mountaineer Barleybrew"] = 2977,
    ["Sten Stoutarm"] = 2977,
    ["Balir Frosthammer"] = 2977,
    ["Nori Pridedrift"] = 2106,
    ["Talin Keeneye"] = 2977,
    ["Pilot Bellowfiz"] = 4714,
    ["Grelin Whitebeard"] = 2977,
    ["Senator Mehr Stonehallow"] = 2977,
    ["Hands Springsprocket"] = 4714,
    ["Tharek Blackstone"] = 2977,
    
    -- Teldrassil
    ["Conservator Ilthalaine"] = 7860,
    ["Gilshalan Windwalker"] = 7854,
    ["Porthannius"] = 7854,
    ["Denalan"] = 7860,
    ["Syral Bladeleaf"] = 7854,
    ["Sentinel Amara Nightblade"] = 7856,
    ["Arch Druid Fandral Staghelm"] = 8013,
    ["Tyrande Whisperwind"] = 8016,
    ["Corithras Moonrage"] = 7860,
    ["Athridas Bearmantle"] = 7860,
    
    -- == HORDE STARTING ZONES ==
    
    -- Durotar
    ["Kaltunk"] = 10218,
    ["Gornek"] = 10218,
    ["Zureetha Fargaze"] = 9636,
    ["Galgar"] = 10218,
    ["Thazz'ril"] = 10218,
    ["Sarkoth"] = 10218,
    ["Foreman Thazz'ril"] = 10218,
    ["Gar'Thok"] = 10218,
    ["Innkeeper Grosk"] = 10218,
    ["Sen'jin Village"] = 10218,
    ["Master Gadrin"] = 1478,
    ["Vol'jin"] = 10357,
    ["Thrall"] = 10278,
    
    -- Mulgore
    ["Chief Hawkwind"] = 6538,
    ["Grull Hawkwind"] = 6538,
    ["Seer Graytongue"] = 6538,
    ["Baine Bloodhoof"] = 6538,
    ["Cairne Bloodhoof"] = 6857,
    ["Maur Raincaller"] = 6538,
    ["Morin Cloudstalker"] = 6538,
    ["Harken Windtotem"] = 6538,
    ["Mull Thunderhorn"] = 6538,
    
    -- Tirisfal Glades
    ["Undertaker Mordo"] = 770,
    ["Shadow Priest Sarvis"] = 5765,
    ["Novice Elreth"] = 5766,
    ["Deathguard Saltain"] = 5766,
    ["Executor Zygand"] = 5766,
    ["Magistrate Sevren"] = 5765,
    ["Coleman Farthing"] = 5765,
    ["Bethor Iceshard"] = 5765,
    ["Lady Sylvanas Windrunner"] = 11657,
    ["Varimathras"] = 12273,
    
    -- == MAJOR CITIES ==
    
    -- Stormwind
    ["King Varian Wrynn"] = 31291,
    ["Anduin Wrynn"] = 7540,
    ["Highlord Bolvar Fordragon"] = 3244,
    ["Lady Katrana Prestor"] = 8655,
    ["Archbishop Benedictus"] = 1206,
    ["General Marcus Jonathan"] = 3244,
    ["Master Mathias Shaw"] = 3244,
    
    -- Ironforge
    ["King Magni Bronzebeard"] = 5598,
    ["High Tinker Mekkatorque"] = 4714,
    ["Muradin Bronzebeard"] = 2977,
    ["Moira Bronzebeard"] = 2105,
    
    -- Darnassus
    ["High Priestess Tyrande Whisperwind"] = 8016,
    ["Archdruid Fandral Staghelm"] = 8013,
    
    -- Orgrimmar
    ["Warchief Thrall"] = 10278,
    ["Eitrigg"] = 10218,
    ["Nazgrel"] = 10218,
    ["Saurfang"] = 10218,
    
    -- Thunder Bluff
    ["High Chieftain Cairne Bloodhoof"] = 6857,
    ["Hamuul Runetotem"] = 8410,
    ["Magatha Grimtotem"] = 6538,
    
    -- Undercity
    ["Dark Lady Sylvanas Windrunner"] = 11657,
    ["Lord Varimathras"] = 12273,
    
    -- == COMMON QUEST NPCS BY ZONE ==
    
    -- Westfall
    ["Gryan Stoutmantle"] = 3244,
    ["Captain Danuvin"] = 3244,
    ["Sentinel Hill Guard"] = 3244,
    ["Old Blanchy"] = 2410,
    ["Farmer Furlbrow"] = 3244,
    ["Verna Furlbrow"] = 2058,
    ["Marshal Gryan Stoutmantle"] = 3244,
    
    -- Loch Modan
    ["Mountaineer Stormpike"] = 2977,
    ["Pilot Hammerfoot"] = 4714,
    ["Magistrate Bluntnose"] = 2977,
    ["Mountaineer Cobbleflint"] = 2977,
    
    -- Darkshore
    ["Thundris Windweaver"] = 7860,
    ["Sentinel Elissa Starbreeze"] = 7856,
    ["Barithras Moonshade"] = 7860,
    
    -- Barrens
    ["Regthar Deathgate"] = 10218,
    ["Mankrik"] = 10218,
    ["Sergra Darkthorn"] = 9636,
    ["Thork"] = 10218,
    ["Gazlowe"] = 3167,
    
    -- Silverpine Forest
    ["High Executor Hadrec"] = 5766,
    ["Apothecary Renferrel"] = 5765,
    ["Dalar Dawnweaver"] = 5765,
    
    -- Hillsbrad Foothills
    ["High Executor Darthalia"] = 5766,
    ["Krusk"] = 10218,
    
    -- Redridge Mountains
    ["Magistrate Solomon"] = 3244,
    ["Marshal Marris"] = 3244,
    
    -- Duskwood
    ["Lord Ello Ebonlocke"] = 3244,
    ["Clerk Daltry"] = 3244,
    ["Commander Althea Ebonlocke"] = 2057,
    ["Sven Yorgen"] = 3244,
    ["Abercrombie"] = 5756,
    
    -- Ashenvale
    ["Raene Wolfrunner"] = 7856,
    ["Sentinel Thenysil"] = 7856,
    ["Orendil Broadleaf"] = 7860,
    
    -- Stonetalon Mountains
    ["Keeper Albagorm"] = 7860,
    ["Braelyn Firehand"] = 9639,
    
    -- Wetlands
    ["Captain Stoutfist"] = 2977,
    ["Mountaineer Kadrell"] = 2977,
    
    -- Thousand Needles
    ["Prate Cloudseer"] = 6538,
    ["Cliffwatcher Longhorn"] = 6538,
    
    -- Stranglethorn Vale
    ["Hemet Nesingwary"] = 2977,
    ["Sir S. J. Erlgadin"] = 3244,
    ["Ajeck Rouack"] = 2058,
    ["Baron Revilgaz"] = 2479,
    
    -- Arathi Highlands
    ["Captain Nials"] = 3244,
    ["Skuerto"] = 2448,
    
    -- Desolace
    ["Corporal Melkins"] = 3244,
    ["Ghost Walker Brave"] = 6538,
    
    -- Dustwallow Marsh
    ["Lady Jaina Proudmoore"] = 8655,
    ["Captain Garran Vimes"] = 3244,
    
    -- Badlands
    ["Prospector Ryedol"] = 2977,
    ["Sigrun Ironhew"] = 2977,
    ["Theldurin the Lost"] = 2977,
    
    -- Swamp of Sorrows
    ["Watcher Biggs"] = 3244,
    ["Fallen Hero of the Horde"] = 10218,
    
    -- Hinterlands
    ["Gryphon Master Talonaxe"] = 2977,
    ["Wildhammer Sentry"] = 2977,
    ["Primal Torntusk"] = 1478,
    
    -- Feralas
    ["Pratt McGrubben"] = 2977,
    ["Ginro Hearthkindle"] = 7860,
    
    -- Tanaris
    ["Marin Noggenfogger"] = 4714,
    ["Curgle Cranklehop"] = 4714,
    ["Chief Engineer Bilgewhizzle"] = 4714,
    ["Tran'rek"] = 1478,
    
    -- Searing Gorge
    ["Kalaran Windblade"] = 7854,
    ["Dorius Stonetender"] = 2977,
    
    -- Burning Steppes
    ["Marshal Maxwell"] = 3244,
    ["Helendis Riverhorn"] = 7860,
    
    -- Un'Goro Crater
    ["Torwa Pathfinder"] = 6538,
    ["Williden Marshal"] = 3244,
    ["Larion"] = 7860,
    
    -- Felwood
    ["Greta Mosshoof"] = 7856,
    ["Eridan Bluewind"] = 7860,
    ["Trull Failbane"] = 6538,
    
    -- Winterspring
    ["Donova Snowden"] = 7856,
    ["Rivern Frostwind"] = 7860,
    
    -- Western Plaguelands
    ["Commander Ashlam Valorfist"] = 3244,
    ["High Priestess MacDonnell"] = 2057,
    
    -- Eastern Plaguelands
    ["Tirion Fordring"] = 3244,
    ["Maxwell Tyrosus"] = 3244,
    ["Duke Nicholas Zverenhoff"] = 3244,
    
    -- Silithus
    ["Cenarion Hold"] = 7860,
    ["Commander Mar'alith"] = 7860,
    
    -- == DUNGEON NPCS ==
    
    -- Deadmines
    ["Edwin VanCleef"] = 2433,
    ["Mr. Smite"] = 6869,
    
    -- Wailing Caverns
    ["Mutanus the Devourer"] = 7885,
    
    -- Shadowfang Keep
    ["Archmage Arugal"] = 11196,
    
    -- Blackfathom Deeps
    ["Twilight Lord Kelris"] = 7996,
    
    -- Scarlet Monastery
    ["High Inquisitor Whitemane"] = 5767,
    ["Scarlet Commander Mograine"] = 5766,
    
    -- Razorfen Kraul
    ["Charlga Razorflank"] = 4866,
    
    -- Razorfen Downs
    ["Amnennar the Coldbringer"] = 7919,
    
    -- Uldaman
    ["Archaedas"] = 10861,
    
    -- Zul'Farrak
    ["Chief Ukorz Sandscalp"] = 2480,
    
    -- Maraudon
    ["Princess Theradras"] = 11441,
    
    -- Sunken Temple
    ["Avatar of Hakkar"] = 8053,
    
    -- Blackrock Depths
    ["Emperor Dagran Thaurissan"] = 4529,
    ["Princess Moira Bronzebeard"] = 2105,
    
    -- Lower Blackrock Spire
    ["Overlord Wyrmthalak"] = 9816,
    
    -- Upper Blackrock Spire
    ["General Drakkisath"] = 10074,
    ["Warchief Rend Blackhand"] = 12205,
    
    -- Dire Maul
    ["King Gordok"] = 11584,
    ["Immol'thar"] = 11609,
    
    -- Stratholme
    ["Baron Rivendare"] = 10729,
    ["Grand Crusader Dathrohan"] = 1203,
    
    -- Scholomance
    ["Darkmaster Gandling"] = 11070,
    ["Ras Frostwhisper"] = 11076,
    
    -- == RAID BOSSES ==
    
    -- Molten Core
    ["Ragnaros"] = 11121,
    ["Majordomo Executus"] = 11001,
    
    -- Blackwing Lair
    ["Nefarian"] = 11380,
    
    -- Onyxia's Lair
    ["Onyxia"] = 8570,
    
    -- Zul'Gurub
    ["Hakkar the Soulflayer"] = 8053,
    
    -- AQ20/40
    ["C'Thun"] = 15556,
    
    -- Naxxramas
    ["Kel'Thuzad"] = 11070,
    
    -- == GENERIC/RACE MODELS ==
    
    ["Human Male"] = 49,
    ["Human Female"] = 50,
    ["Orc Male"] = 51,
    ["Orc Female"] = 52,
    ["Dwarf Male"] = 53,
    ["Dwarf Female"] = 54,
    ["Night Elf Male"] = 55,
    ["Night Elf Female"] = 56,
    ["Undead Male"] = 57,
    ["Undead Female"] = 58,
    ["Tauren Male"] = 59,
    ["Tauren Female"] = 60,
    ["Gnome Male"] = 1563,
    ["Gnome Female"] = 1564,
    ["Troll Male"] = 1478,
    ["Troll Female"] = 1479,
    
    -- Common Creatures
    ["Wolf"] = 604,
    ["Bear"] = 822,
    ["Boar"] = 510,
    ["Spider"] = 1608,
    ["Murloc"] = 905,
    ["Kobold"] = 520,
    ["Gnoll"] = 1088,
    ["Defias"] = 2433,
    ["Quilboar"] = 1142,
    ["Centaur"] = 2155,
    ["Harpy"] = 4181,
    ["Ogre"] = 1122,
}

Dv(" VGuide NPCDatabase.lua End")
