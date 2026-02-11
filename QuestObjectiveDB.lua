--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestObjectiveDB.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Quest objective spawn database for VanillaGuide.
    Contains NPC/item spawn locations for quest objectives.
    Shows pins on the world map like pfQuest.
    
    Data format:
    [questId] = {
        name = "Quest Name",
        zone = "Zone Name",
        objectives = {
            { type = "kill|item|talk", name = "Objective", spawns = {{x,y}, {x,y}...} },
        }
    }
------------------------------------------------------
]]--

Dv(" VGuide QuestObjectiveDB.lua Start")

VGuideQuestObjectives = {}

-- Quest objective spawn data
-- Format: [questId] = { name, zone, start = {npc, x, y}, objectives[] }
VGuideQuestObjectives.Data = {

    -----------------------------------------
    -- Durotar Quests
    -----------------------------------------
    
    [4641] = { -- Your Place In The World
        name = "Your Place In The World",
        zone = "Durotar",
        start = { npc = "Kaltunk", x = 42.8, y = 69.2 },
        objectives = {
            { type = "talk", name = "Gornek", spawns = {{42.1, 68.4}} },
        }
    },
    
    [5441] = { -- Cutting Teeth / Lazy Peons
        name = "Cutting Teeth",
        zone = "Durotar",
        start = { npc = "Gornek", x = 42.1, y = 68.4 },
        objectives = {
            { type = "kill", name = "Mottled Boar", spawns = {
                {44.2, 66.8}, {45.1, 69.2}, {43.8, 71.5}, {46.3, 68.1},
                {42.5, 70.3}, {44.9, 72.1}, {45.7, 67.4}, {43.1, 69.8}
            }},
        }
    },
    
    [780] = { -- Sarkoth
        name = "Sarkoth",
        zone = "Durotar",
        start = { npc = "Hana'zua", x = 40.6, y = 66.4 },
        objectives = {
            { type = "kill", name = "Sarkoth", spawns = {{40.6, 62.1}} },
        }
    },
    
    [789] = { -- Sting of the Scorpid
        name = "Sting of the Scorpid",
        zone = "Durotar",
        start = { npc = "Gornek", x = 42.1, y = 68.4 },
        objectives = {
            { type = "kill", name = "Scorpid Worker", spawns = {
                {43.5, 78.2}, {44.1, 79.8}, {45.2, 77.4}, {42.8, 80.1},
                {46.1, 78.9}, {44.7, 81.3}, {43.2, 76.8}
            }},
        }
    },
    
    [792] = { -- Vile Familiars
        name = "Vile Familiars",
        zone = "Durotar",
        start = { npc = "Zureetha Fargaze", x = 42.6, y = 69.1 },
        objectives = {
            { type = "kill", name = "Vile Familiar", spawns = {
                {45.8, 56.2}, {44.3, 55.8}, {46.2, 54.9}, {43.9, 53.7},
                {45.1, 52.4}, {47.2, 55.1}, {44.8, 57.3}
            }},
        }
    },
    
    [794] = { -- Burning Blade Medallion
        name = "Burning Blade Medallion",
        zone = "Durotar",
        start = { npc = "Zureetha Fargaze", x = 42.6, y = 69.1 },
        objectives = {
            { type = "kill", name = "Yarrog Baneshadow", spawns = {{44.9, 53.6}} },
        }
    },
    
    [805] = { -- Report to Sen'jin Village
        name = "Report to Sen'jin Village",
        zone = "Durotar",
        start = { npc = "Gornek", x = 42.1, y = 68.4 },
        objectives = {
            { type = "talk", name = "Master Gadrin", spawns = {{55.9, 74.6}} },
        }
    },
    
    [786] = { -- Thwarting Kolkar Aggression
        name = "Thwarting Kolkar Aggression",
        zone = "Durotar",
        start = { npc = "Master Gadrin", x = 55.9, y = 74.6 },
        objectives = {
            { type = "kill", name = "Kolkar Drudge", spawns = {
                {48.5, 79.3}, {50.1, 78.2}, {49.2, 80.6}, {51.3, 79.8}
            }},
        }
    },
    
    [818] = { -- A Solvent Spirit
        name = "A Solvent Spirit",
        zone = "Durotar",
        start = { npc = "Master Vornal", x = 55.2, y = 75.6 },
        objectives = {
            { type = "kill", name = "Minor Manifestation of Water", spawns = {
                {62.4, 79.2}, {63.1, 81.5}, {64.2, 78.8}, {61.8, 80.4}
            }},
        }
    },
    
    [826] = { -- Zalazane
        name = "Zalazane",
        zone = "Durotar",
        start = { npc = "Master Gadrin", x = 55.9, y = 74.6 },
        objectives = {
            { type = "kill", name = "Zalazane", spawns = {{67.1, 86.9}} },
        }
    },
    
    [834] = { -- Winds in the Desert
        name = "Winds in the Desert",
        zone = "Durotar",
        start = { npc = "Rezlak", x = 46.4, y = 8.4 },
        objectives = {
            { type = "item", name = "Sack of Supplies", spawns = {
                {49.2, 60.1}, {52.3, 58.7}, {54.1, 61.2}, {50.8, 63.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Mulgore Quests
    -----------------------------------------
    
    [747] = { -- The Hunt Begins
        name = "The Hunt Begins",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Plainstrider", spawns = {
                {44.8, 76.2}, {46.1, 78.5}, {43.5, 74.8}, {45.2, 80.1},
                {47.3, 77.4}, {44.1, 82.3}
            }},
        }
    },
    
    [757] = { -- Rite of Strength
        name = "Rite of Strength",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Battleboar", spawns = {
                {50.2, 83.1}, {51.8, 81.4}, {49.5, 84.7}, {52.3, 82.8}
            }},
        }
    },
    
    [761] = { -- Swoop Hunting
        name = "Swoop Hunting",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "kill", name = "Swoop", spawns = {
                {49.3, 58.2}, {51.1, 56.8}, {48.7, 60.1}, {52.4, 59.3},
                {50.2, 62.5}, {53.1, 57.4}
            }},
        }
    },
    
    [766] = { -- Mazzranache
        name = "Mazzranache",
        zone = "Mulgore",
        start = { npc = "Maur Raincaller", x = 47.4, y = 57.0 },
        objectives = {
            { type = "kill", name = "Mazzranache", spawns = {{49.6, 55.8}} },
        }
    },
    
    [745] = { -- Sharing the Land
        name = "Sharing the Land",
        zone = "Mulgore",
        start = { npc = "Baine Bloodhoof", x = 47.0, y = 60.9 },
        objectives = {
            { type = "kill", name = "Palemane Tanner", spawns = {
                {38.5, 52.1}, {39.2, 54.8}, {37.8, 56.3}, {40.1, 53.5}
            }},
            { type = "kill", name = "Palemane Skinner", spawns = {
                {38.1, 55.2}, {40.3, 52.8}, {37.5, 54.1}, {39.8, 56.7}
            }},
            { type = "kill", name = "Palemane Poacher", spawns = {
                {39.5, 53.4}, {38.8, 55.9}, {40.6, 54.2}, {37.2, 52.8}
            }},
        }
    },
    
    -----------------------------------------
    -- Tirisfal Glades Quests
    -----------------------------------------
    
    [363] = { -- Rude Awakening
        name = "Rude Awakening",
        zone = "Tirisfal Glades",
        start = { npc = "Undertaker Mordo", x = 30.2, y = 71.3 },
        objectives = {
            { type = "talk", name = "Shadow Priest Sarvis", spawns = {{38.2, 56.8}} },
        }
    },
    
    [364] = { -- The Mindless Ones
        name = "The Mindless Ones",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "kill", name = "Mindless Zombie", spawns = {
                {32.1, 62.4}, {33.8, 60.2}, {31.5, 58.7}, {34.2, 63.1}
            }},
            { type = "kill", name = "Wretched Zombie", spawns = {
                {32.8, 61.5}, {34.5, 59.8}, {31.2, 63.4}, {33.1, 57.9}
            }},
        }
    },
    
    [380] = { -- Night Web's Hollow
        name = "Night Web's Hollow",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Arren", x = 38.1, y = 56.6 },
        objectives = {
            { type = "kill", name = "Young Night Web Spider", spawns = {
                {26.5, 57.2}, {27.8, 55.8}, {25.4, 59.1}, {28.2, 58.4}
            }},
            { type = "kill", name = "Night Web Spider", spawns = {
                {24.1, 56.8}, {25.8, 54.3}, {23.5, 58.7}, {26.2, 57.1}
            }},
        }
    },
    
    [381] = { -- The Scarlet Crusade
        name = "The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Arren", x = 38.1, y = 56.6 },
        objectives = {
            { type = "kill", name = "Scarlet Warrior", spawns = {
                {35.2, 68.1}, {36.8, 66.5}, {34.5, 69.8}, {37.1, 67.2}
            }},
        }
    },
    
    -----------------------------------------
    -- Elwynn Forest Quests
    -----------------------------------------
    
    [783] = { -- A Threat Within
        name = "A Threat Within",
        zone = "Elwynn Forest",
        start = { npc = "Deputy Willem", x = 48.2, y = 42.8 },
        objectives = {
            { type = "talk", name = "Marshal McBride", spawns = {{48.9, 41.6}} },
        }
    },
    
    [7] = { -- Kobold Camp Cleanup
        name = "Kobold Camp Cleanup",
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "kill", name = "Kobold Vermin", spawns = {
                {47.5, 35.8}, {48.2, 37.1}, {46.8, 34.5}, {49.1, 36.2}
            }},
        }
    },
    
    [15] = { -- Investigate Echo Ridge
        name = "Investigate Echo Ridge",
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "kill", name = "Kobold Worker", spawns = {
                {48.8, 31.2}, {50.1, 29.8}, {47.5, 32.5}, {51.2, 30.4}
            }},
        }
    },
    
    [21] = { -- Skirmish at Echo Ridge  
        name = "Skirmish at Echo Ridge",
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "kill", name = "Kobold Laborer", spawns = {
                {48.2, 28.5}, {49.8, 26.2}, {47.1, 30.1}, {50.5, 27.8}
            }},
        }
    },
    
    [18] = { -- Brotherhood of Thieves
        name = "Brotherhood of Thieves",
        zone = "Elwynn Forest",
        start = { npc = "Deputy Willem", x = 48.2, y = 42.8 },
        objectives = {
            { type = "kill", name = "Defias Thug", spawns = {
                {53.2, 49.1}, {54.8, 47.5}, {52.5, 50.8}, {55.1, 48.2}
            }},
        }
    },
    
    [54] = { -- Report to Goldshire
        name = "Report to Goldshire", 
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "talk", name = "Marshal Dughan", spawns = {{42.1, 65.9}} },
        }
    },
    
    [47] = { -- Gold Dust Exchange
        name = "Gold Dust Exchange",
        zone = "Elwynn Forest",
        start = { npc = "Remy "Two Times"", x = 42.1, y = 67.1 },
        objectives = {
            { type = "item", name = "Gold Dust", spawns = {
                {39.8, 82.1}, {41.2, 80.5}, {38.5, 84.2}, {42.1, 81.8}
            }},
        }
    },
    
    [40] = { -- A Fishy Peril
        name = "A Fishy Peril",
        zone = "Elwynn Forest",
        start = { npc = "Remy "Two Times"", x = 42.1, y = 67.1 },
        objectives = {
            { type = "talk", name = "Marshal Dughan", spawns = {{42.1, 65.9}} },
        }
    },
    
    -----------------------------------------
    -- Teldrassil Quests  
    -----------------------------------------
    
    [456] = { -- The Balance of Nature
        name = "The Balance of Nature",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "kill", name = "Young Nightsaber", spawns = {
                {58.2, 42.1}, {59.5, 40.8}, {57.1, 43.5}, {60.2, 41.2}
            }},
            { type = "kill", name = "Young Thistle Boar", spawns = {
                {57.8, 44.2}, {59.1, 42.8}, {56.5, 45.1}, {60.5, 43.5}
            }},
        }
    },
    
    [457] = { -- The Balance of Nature (2)
        name = "The Balance of Nature",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "kill", name = "Mangy Nightsaber", spawns = {
                {55.2, 46.8}, {56.8, 48.2}, {54.1, 45.5}, {57.5, 47.1}
            }},
            { type = "kill", name = "Thistle Boar", spawns = {
                {54.8, 48.5}, {56.2, 46.1}, {53.5, 49.2}, {57.1, 47.8}
            }},
        }
    },
    
    [458] = { -- The Woodland Protector
        name = "The Woodland Protector",
        zone = "Teldrassil",
        start = { npc = "Melithar Staghelm", x = 59.0, y = 42.4 },
        objectives = {
            { type = "talk", name = "Tarindrella", spawns = {{57.8, 44.6}} },
        }
    },
    
    [459] = { -- The Woodland Protector (2)
        name = "The Woodland Protector",
        zone = "Teldrassil",
        start = { npc = "Tarindrella", x = 57.8, y = 44.6 },
        objectives = {
            { type = "kill", name = "Grell", spawns = {
                {54.2, 39.8}, {55.8, 38.1}, {53.1, 41.2}, {56.5, 40.5}
            }},
            { type = "kill", name = "Grellkin", spawns = {
                {53.8, 40.2}, {55.1, 38.8}, {52.5, 42.1}, {56.2, 39.5}
            }},
        }
    },
    
    -----------------------------------------  
    -- Dun Morogh Quests
    -----------------------------------------
    
    [170] = { -- A New Threat
        name = "A New Threat",
        zone = "Dun Morogh",
        start = { npc = "Balir Frosthammer", x = 29.9, y = 71.2 },
        objectives = {
            { type = "kill", name = "Rockjaw Trogg", spawns = {
                {26.5, 78.2}, {27.8, 76.5}, {25.2, 79.8}, {28.5, 77.1}
            }},
            { type = "kill", name = "Burly Rockjaw Trogg", spawns = {
                {26.1, 77.5}, {28.2, 79.1}, {25.8, 80.2}, {27.5, 78.8}
            }},
        }
    },
    
    [179] = { -- Dwarven Outfitters
        name = "Dwarven Outfitters",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.3 },
        objectives = {
            { type = "kill", name = "Ragged Young Wolf", spawns = {
                {28.2, 71.5}, {29.8, 73.2}, {27.5, 70.1}, {30.1, 72.8}
            }},
        }
    },
    
    [182] = { -- Coldridge Valley Mail Delivery
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 24.8, y = 76.8 },
        objectives = {
            { type = "talk", name = "Talin Keeneye", spawns = {{25.1, 75.2}} },
        }
    },
    
    [183] = { -- Coldridge Valley Mail Delivery (2)
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        start = { npc = "Talin Keeneye", x = 25.1, y = 75.2 },
        objectives = {
            { type = "talk", name = "Grelin Whitebeard", spawns = {{24.8, 76.8}} },
        }
    },
    
    [233] = { -- Frostmane Hold
        name = "Frostmane Hold",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 24.8, y = 76.8 },
        objectives = {
            { type = "kill", name = "Frostmane Troll Whelp", spawns = {
                {19.2, 78.5}, {20.5, 76.8}, {18.1, 79.2}, {21.2, 77.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Westfall Quests (Alliance 10-20)
    -----------------------------------------
    
    [36] = { -- Patrolling Westfall
        name = "Patrolling Westfall",
        zone = "Westfall",
        start = { npc = "Marshal Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "talk", name = "Captain Danuvin", spawns = {{56.3, 47.5}} },
        }
    },
    
    [64] = { -- The Forgotten Heirloom
        name = "The Forgotten Heirloom",
        zone = "Westfall",
        start = { npc = "Farmer Furlbrow", x = 59.9, y = 19.4 },
        objectives = {
            { type = "item", name = "Westfall Deed", spawns = {
                {44.8, 36.2}, {46.1, 35.8}, {45.2, 37.5}
            }},
        }
    },
    
    [102] = { -- The Defias Brotherhood
        name = "The Defias Brotherhood",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Defias Trapper", spawns = {
                {45.2, 68.1}, {46.8, 70.3}, {44.1, 69.5}, {47.5, 67.8}
            }},
            { type = "kill", name = "Defias Smuggler", spawns = {
                {44.8, 71.2}, {46.2, 69.8}, {45.5, 72.1}, {47.1, 70.5}
            }},
        }
    },
    
    [109] = { -- Collecting Kelp
        name = "Collecting Kelp",
        zone = "Westfall",
        start = { npc = "Captain Grayson", x = 30.3, y = 85.6 },
        objectives = {
            { type = "item", name = "Murloc Fin", spawns = {
                {35.2, 48.1}, {36.8, 46.5}, {34.5, 49.8}, {37.2, 47.2},
                {33.8, 50.5}, {38.1, 45.8}
            }},
        }
    },
    
    [153] = { -- The Defias Brotherhood (Chain)
        name = "The Defias Brotherhood",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Defias Messenger", spawns = {
                {44.2, 69.8}, {45.8, 71.2}, {43.5, 72.5}, {46.1, 68.5}
            }},
        }
    },
    
    [155] = { -- Red Leather Bandanas
        name = "Red Leather Bandanas",
        zone = "Westfall",
        start = { npc = "Scout Galiaan", x = 56.5, y = 47.2 },
        objectives = {
            { type = "item", name = "Red Leather Bandana", spawns = {
                {44.5, 70.2}, {45.8, 69.1}, {43.2, 71.8}, {46.5, 68.5},
                {42.8, 72.5}, {47.2, 67.8}
            }},
        }
    },
    
    [184] = { -- Goretusk Liver Pie
        name = "Goretusk Liver Pie",
        zone = "Westfall",
        start = { npc = "Salma Saldean", x = 56.0, y = 31.2 },
        objectives = {
            { type = "kill", name = "Goretusk", spawns = {
                {51.2, 48.5}, {52.8, 46.2}, {50.5, 50.1}, {53.5, 47.8},
                {49.8, 51.5}, {54.2, 45.5}
            }},
        }
    },
    
    [212] = { -- Westfall Stew
        name = "Westfall Stew",
        zone = "Westfall",
        start = { npc = "Salma Saldean", x = 56.0, y = 31.2 },
        objectives = {
            { type = "kill", name = "Harvest Watcher", spawns = {
                {52.5, 32.1}, {54.2, 30.8}, {51.8, 33.5}, {55.1, 31.2}
            }},
        }
    },
    
    -----------------------------------------
    -- Loch Modan Quests (Alliance 10-20)
    -----------------------------------------
    
    [224] = { -- In Defense of the King's Lands
        name = "In Defense of the King's Lands",
        zone = "Loch Modan",
        start = { npc = "Captain Rugelfuss", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Stonesplinter Trogg", spawns = {
                {37.5, 43.2}, {38.8, 41.5}, {36.2, 44.8}, {39.5, 42.1}
            }},
            { type = "kill", name = "Stonesplinter Scout", spawns = {
                {38.1, 42.8}, {37.2, 44.1}, {39.2, 41.8}, {36.8, 43.5}
            }},
        }
    },
    
    [237] = { -- Thelsamar Blood Sausages
        name = "Thelsamar Blood Sausages",
        zone = "Loch Modan",
        start = { npc = "Vidra Hearthstove", x = 34.8, y = 49.2 },
        objectives = {
            { type = "kill", name = "Mountain Boar", spawns = {
                {42.1, 28.5}, {43.5, 27.2}, {41.2, 29.8}, {44.2, 26.5}
            }},
            { type = "kill", name = "Bear", spawns = {
                {28.5, 48.2}, {30.2, 46.8}, {27.1, 50.1}, {31.5, 47.5}
            }},
        }
    },
    
    [267] = { -- In Search of the Excavation Team
        name = "In Search of the Excavation Team",
        zone = "Loch Modan",
        start = { npc = "Jern Hornhelm", x = 37.1, y = 47.4 },
        objectives = {
            { type = "talk", name = "Prospector Ironband", spawns = {{65.1, 65.8}} },
        }
    },
    
    [298] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Chief Engineer Hinderweir VII", x = 45.3, y = 13.2 },
        objectives = {
            { type = "talk", name = "Chief Engineer Hinderweir VII", spawns = {{45.3, 13.2}} },
        }
    },
    
    [416] = { -- Rat Catching
        name = "Rat Catching",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Tunnel Rat Vermin", spawns = {
                {32.5, 72.1}, {33.8, 70.5}, {31.2, 73.8}, {34.5, 71.2}
            }},
            { type = "kill", name = "Tunnel Rat Digger", spawns = {
                {33.1, 71.5}, {32.2, 72.8}, {34.2, 70.1}, {31.8, 74.2}
            }},
        }
    },
    
    -----------------------------------------
    -- Darkshore Quests (Alliance 10-20)
    -----------------------------------------
    
    [947] = { -- Buzzbox 827
        name = "Buzzbox 827",
        zone = "Darkshore",
        start = { npc = "Wizbang Cranktoggle", x = 37.4, y = 43.5 },
        objectives = {
            { type = "kill", name = "Pygmy Tide Crawler", spawns = {
                {36.2, 48.5}, {37.8, 46.2}, {35.5, 50.1}, {38.5, 47.8}
            }},
        }
    },
    
    [958] = { -- The Red Crystal
        name = "The Red Crystal",
        zone = "Darkshore",
        start = { npc = "Sentinel Glynda Nal'Shea", x = 37.2, y = 44.0 },
        objectives = {
            { type = "item", name = "Red Crystal", spawns = {{49.5, 24.8}} },
        }
    },
    
    [983] = { -- Washed Ashore
        name = "Washed Ashore",
        zone = "Darkshore",
        start = { npc = "Gwennyth Bly'Leggonde", x = 36.4, y = 45.6 },
        objectives = {
            { type = "item", name = "Sea Creature Bones", spawns = {{36.2, 54.8}} },
        }
    },
    
    [2098] = { -- Cleansing of the Infected
        name = "Cleansing of the Infected",
        zone = "Darkshore",
        start = { npc = "Tharnariun Treetender", x = 38.3, y = 43.4 },
        objectives = {
            { type = "kill", name = "Rabid Thistle Bear", spawns = {
                {40.5, 57.2}, {42.1, 55.8}, {39.2, 58.5}, {43.5, 56.1}
            }},
        }
    },
    
    -----------------------------------------
    -- The Barrens Quests (Horde 10-25)
    -----------------------------------------
    
    [844] = { -- Plainstrider Menace
        name = "Plainstrider Menace",
        zone = "The Barrens",
        start = { npc = "Sergra Darkthorn", x = 52.2, y = 31.0 },
        objectives = {
            { type = "kill", name = "Zhevra", spawns = {
                {53.2, 26.1}, {54.8, 24.5}, {52.5, 27.8}, {55.5, 25.2},
                {51.8, 28.5}, {56.2, 23.8}
            }},
        }
    },
    
    [845] = { -- The Zhevra
        name = "The Zhevra",
        zone = "The Barrens",
        start = { npc = "Sergra Darkthorn", x = 52.2, y = 31.0 },
        objectives = {
            { type = "kill", name = "Zhevra Runner", spawns = {
                {49.5, 48.2}, {50.8, 46.5}, {48.2, 49.8}, {51.5, 47.1},
                {47.5, 50.5}, {52.2, 45.8}
            }},
        }
    },
    
    [850] = { -- Centaur Bracers
        name = "Centaur Bracers",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Kolkar Wrangler", spawns = {
                {43.5, 79.2}, {44.8, 77.5}, {42.2, 80.8}, {45.5, 78.1}
            }},
            { type = "kill", name = "Kolkar Stormer", spawns = {
                {44.1, 78.5}, {43.2, 80.1}, {45.2, 77.2}, {42.8, 81.5}
            }},
        }
    },
    
    [852] = { -- Raptor Thieves
        name = "Raptor Thieves",
        zone = "The Barrens",
        start = { npc = "Gazrog", x = 51.9, y = 30.7 },
        objectives = {
            { type = "kill", name = "Sunscale Raptor", spawns = {
                {55.2, 30.8}, {56.5, 29.1}, {54.1, 32.5}, {57.2, 28.2},
                {53.5, 33.2}, {58.1, 27.5}
            }},
        }
    },
    
    [865] = { -- Stolen Silver
        name = "Stolen Silver",
        zone = "The Barrens",
        start = { npc = "Gazrog", x = 51.9, y = 30.7 },
        objectives = {
            { type = "item", name = "Stolen Silver", spawns = {
                {53.8, 28.5}, {54.5, 27.2}, {52.8, 29.8}
            }},
        }
    },
    
    [869] = { -- Consumed by Hatred
        name = "Consumed by Hatred",
        zone = "The Barrens",
        start = { npc = "Mankrik", x = 45.1, y = 59.2 },
        objectives = {
            { type = "kill", name = "Bristleback Quilboar", spawns = {
                {41.2, 47.5}, {42.8, 45.8}, {40.5, 49.2}, {43.5, 46.5}
            }},
            { type = "kill", name = "Bristleback Hunter", spawns = {
                {42.1, 46.8}, {41.5, 48.5}, {43.2, 45.2}, {40.8, 50.1}
            }},
        }
    },
    
    [870] = { -- Harpy Raiders
        name = "Harpy Raiders",
        zone = "The Barrens",
        start = { npc = "Darsok Swiftdagger", x = 51.5, y = 30.9 },
        objectives = {
            { type = "kill", name = "Witchwing Harpy", spawns = {
                {41.5, 59.2}, {42.8, 57.5}, {40.2, 60.8}, {43.5, 58.1}
            }},
            { type = "kill", name = "Witchwing Slayer", spawns = {
                {42.1, 58.5}, {41.2, 60.1}, {43.2, 57.2}, {40.5, 61.5}
            }},
        }
    },
    
    [872] = { -- The Stagnant Oasis
        name = "The Stagnant Oasis",
        zone = "The Barrens",
        start = { npc = "Tonga Runetotem", x = 52.2, y = 31.9 },
        objectives = {
            { type = "item", name = "Bubbling Oasis Water", spawns = {{55.2, 42.8}} },
        }
    },
    
    [877] = { -- Echeyakee
        name = "Echeyakee",
        zone = "The Barrens",
        start = { npc = "Sergra Darkthorn", x = 52.2, y = 31.0 },
        objectives = {
            { type = "kill", name = "Echeyakee", spawns = {{56.5, 17.2}} },
        }
    },
    
    [880] = { -- Ishamuhale
        name = "Ishamuhale",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "kill", name = "Ishamuhale", spawns = {{59.2, 30.5}} },
        }
    },
    
    [896] = { -- Samophlange
        name = "Samophlange",
        zone = "The Barrens",
        start = { npc = "Sputtervalve", x = 62.3, y = 38.5 },
        objectives = {
            { type = "talk", name = "Control Console", spawns = {{52.5, 11.2}} },
        }
    },
    
    [903] = { -- Fungal Spores
        name = "Fungal Spores",
        zone = "The Barrens",
        start = { npc = "Apothecary Helbrim", x = 51.5, y = 30.2 },
        objectives = {
            { type = "item", name = "Fungal Spore", spawns = {
                {56.8, 18.5}, {57.5, 17.2}, {55.5, 19.8}, {58.2, 16.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Silverpine Forest Quests (Horde 10-20)
    -----------------------------------------
    
    [430] = { -- The Dead Fields
        name = "The Dead Fields",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Rot Hide Gnoll", spawns = {
                {51.2, 36.5}, {52.8, 34.2}, {50.5, 38.1}, {53.5, 35.5}
            }},
            { type = "kill", name = "Rot Hide Mongrel", spawns = {
                {52.1, 35.8}, {51.5, 37.5}, {53.2, 34.8}, {50.8, 39.1}
            }},
        }
    },
    
    [478] = { -- Prove Your Worth
        name = "Prove Your Worth",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Moonrage Glutton", spawns = {
                {44.5, 39.2}, {45.8, 37.5}, {43.2, 40.8}, {46.5, 38.1}
            }},
        }
    },
    
    [481] = { -- Ivar the Foul
        name = "Ivar the Foul",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Ivar the Foul", spawns = {{46.2, 35.8}} },
        }
    },
    
    [491] = { -- Border Crossings
        name = "Border Crossings",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.4, y = 40.8 },
        objectives = {
            { type = "talk", name = "Shadow Priest Allister", spawns = {{43.8, 40.5}} },
        }
    },
    
    [525] = { -- Arugal's Folly
        name = "Arugal's Folly",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.4, y = 39.5 },
        objectives = {
            { type = "item", name = "Remedy of Arugal", spawns = {
                {47.2, 71.5}, {48.5, 69.8}, {46.1, 72.8}
            }},
        }
    },
    
    -----------------------------------------
    -- Redridge Mountains Quests (Alliance 15-25)
    -----------------------------------------
    
    [20] = { -- Blackrock Menace
        name = "Blackrock Menace",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 29.6, y = 44.4 },
        objectives = {
            { type = "kill", name = "Blackrock Grunt", spawns = {
                {24.5, 31.2}, {25.8, 29.5}, {23.2, 32.8}, {26.5, 30.1}
            }},
            { type = "kill", name = "Blackrock Outrunner", spawns = {
                {25.1, 30.5}, {24.2, 32.1}, {26.2, 29.2}, {23.8, 33.5}
            }},
        }
    },
    
    [91] = { -- Selling Fish
        name = "Selling Fish",
        zone = "Redridge Mountains",
        start = { npc = "Dockmaster Baren", x = 26.8, y = 47.2 },
        objectives = {
            { type = "talk", name = "Dockmaster Baren", spawns = {{26.8, 47.2}} },
        }
    },
    
    [118] = { -- Messenger to Stormwind
        name = "Messenger to Stormwind",
        zone = "Redridge Mountains",
        start = { npc = "Magistrate Solomon", x = 29.8, y = 44.4 },
        objectives = {
            { type = "talk", name = "General Marcus Jonathan", spawns = {{74.2, 55.8}} },
        }
    },
    
    [125] = { -- Missing In Action
        name = "Missing In Action",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 29.6, y = 44.4 },
        objectives = {
            { type = "talk", name = "Corporal Keeshan", spawns = {{26.5, 10.2}} },
        }
    },
    
    [126] = { -- Shadow Magic
        name = "Shadow Magic",
        zone = "Redridge Mountains",
        start = { npc = "Watcher Dodds", x = 26.6, y = 52.6 },
        objectives = {
            { type = "kill", name = "Shadowhide Gnoll", spawns = {
                {30.5, 61.2}, {31.8, 59.5}, {29.2, 62.8}, {32.5, 60.1}
            }},
            { type = "kill", name = "Shadowhide Darkweaver", spawns = {
                {31.1, 60.5}, {30.2, 62.1}, {32.2, 59.2}, {29.8, 63.5}
            }},
        }
    },
    
    [129] = { -- Glyph Chasing
        name = "Glyph Chasing",
        zone = "Redridge Mountains",
        start = { npc = "Watcher Dodds", x = 26.6, y = 52.6 },
        objectives = {
            { type = "item", name = "Shadowhide Pendant", spawns = {
                {32.5, 59.8}, {33.8, 58.2}, {31.2, 61.5}, {34.5, 57.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Hillsbrad Foothills Quests (20-30)
    -----------------------------------------
    
    [500] = { -- Dangerous!
        name = "Dangerous!",
        zone = "Hillsbrad Foothills",
        start = { npc = "Wanted Poster", x = 62.3, y = 20.4 },
        objectives = {
            { type = "kill", name = "Stanley", spawns = {{52.1, 56.8}} },
        }
    },
    
    [506] = { -- Syndicate Assassins
        name = "Syndicate Assassins",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 62.1, y = 20.2 },
        objectives = {
            { type = "kill", name = "Syndicate Footpad", spawns = {
                {36.5, 46.2}, {37.8, 44.5}, {35.2, 47.8}, {38.5, 45.1}
            }},
            { type = "kill", name = "Syndicate Thief", spawns = {
                {37.1, 45.5}, {36.2, 47.1}, {38.2, 44.2}, {35.8, 48.5}
            }},
        }
    },
    
    [513] = { -- Souvenirs of Death
        name = "Souvenirs of Death",
        zone = "Hillsbrad Foothills",
        start = { npc = "Deathguard Samsa", x = 62.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Human", spawns = {
                {32.5, 44.2}, {33.8, 42.5}, {31.2, 45.8}, {34.5, 43.1}
            }},
        }
    },
    
    [527] = { -- Elixir of Suffering
        name = "Elixir of Suffering",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.5, y = 19.1 },
        objectives = {
            { type = "kill", name = "Mudsnout Gnoll", spawns = {
                {45.5, 60.2}, {46.8, 58.5}, {44.2, 61.8}, {47.5, 59.1}
            }},
        }
    },
    
    [542] = { -- Crushridge Bounty
        name = "Crushridge Bounty",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 62.1, y = 20.2 },
        objectives = {
            { type = "item", name = "Crushridge Collar", spawns = {
                {53.5, 78.2}, {54.8, 76.5}, {52.2, 79.8}, {55.5, 77.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Ashenvale Quests (Alliance/Horde 20-30)
    -----------------------------------------
    
    [1016] = { -- The Ashenvale Hunt
        name = "The Ashenvale Hunt",
        zone = "Ashenvale",
        start = { npc = "Senani Thunderheart", x = 73.6, y = 61.5 },
        objectives = {
            { type = "kill", name = "Ashenvale Bear", spawns = {
                {74.2, 70.5}, {75.5, 68.8}, {73.1, 72.1}, {76.2, 69.5}
            }},
        }
    },
    
    [1022] = { -- Stonetalon Standstill
        name = "Stonetalon Standstill",
        zone = "Ashenvale",
        start = { npc = "Kaela Shadowspear", x = 26.9, y = 36.5 },
        objectives = {
            { type = "talk", name = "Kaela Shadowspear", spawns = {{42.5, 71.2}} },
        }
    },
    
    [1054] = { -- The Howling Vale
        name = "The Howling Vale",
        zone = "Ashenvale",
        start = { npc = "Sentinel Melyria Frostshadow", x = 26.5, y = 36.7 },
        objectives = {
            { type = "kill", name = "Terrowulf", spawns = {
                {52.5, 30.2}, {53.8, 28.5}, {51.2, 31.8}, {54.5, 29.1}
            }},
        }
    },
    
    [1056] = { -- Elemental Bracers
        name = "Elemental Bracers",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 34.7, y = 49.8 },
        objectives = {
            { type = "item", name = "Burning Bracer", spawns = {
                {57.2, 36.5}, {58.5, 34.8}, {56.1, 38.1}, {59.2, 35.5}
            }},
        }
    },
    
    [1058] = { -- The Tower of Althalaxx
        name = "The Tower of Althalaxx",
        zone = "Ashenvale",
        start = { npc = "Delgren the Purifier", x = 26.2, y = 38.7 },
        objectives = {
            { type = "talk", name = "Balthule Shadowstrike", spawns = {{26.5, 38.2}} },
        }
    },
    
    -----------------------------------------
    -- Stonetalon Mountains Quests (15-27)
    -----------------------------------------
    
    [1062] = { -- Boulderslide Ravine
        name = "Boulderslide Ravine",
        zone = "Stonetalon Mountains",
        start = { npc = "Ziz Fizziks", x = 59.0, y = 62.6 },
        objectives = {
            { type = "item", name = "Unidentified Ore", spawns = {
                {62.5, 92.1}, {63.8, 90.5}, {61.2, 93.8}, {64.5, 91.2}
            }},
        }
    },
    
    [1083] = { -- Super Reaper 6000
        name = "Super Reaper 6000",
        zone = "Stonetalon Mountains",
        start = { npc = "Ziz Fizziks", x = 59.0, y = 62.6 },
        objectives = {
            { type = "item", name = "Super Reaper 6000 Parts", spawns = {
                {63.2, 38.5}, {64.5, 36.8}, {62.1, 40.1}, {65.2, 37.5}
            }},
        }
    },
    
    [1090] = { -- Arachnophobia
        name = "Arachnophobia",
        zone = "Stonetalon Mountains",
        start = { npc = "Seereth Stonebreak", x = 47.2, y = 61.0 },
        objectives = {
            { type = "kill", name = "Besseleth", spawns = {{54.5, 75.2}} },
        }
    },
    
    [6461] = { -- Gerenzo Wrenchwhistle
        name = "Gerenzo Wrenchwhistle",
        zone = "Stonetalon Mountains",
        start = { npc = "Ziz Fizziks", x = 59.0, y = 62.6 },
        objectives = {
            { type = "kill", name = "Gerenzo Wrenchwhistle", spawns = {{62.8, 41.5}} },
        }
    },
    
    -----------------------------------------
    -- Thousand Needles Quests (25-35)
    -----------------------------------------
    
    [1148] = { -- Pacify the Centaur
        name = "Pacify the Centaur",
        zone = "Thousand Needles",
        start = { npc = "Cliffwatcher Longhorn", x = 21.4, y = 32.2 },
        objectives = {
            { type = "kill", name = "Galak Wrangler", spawns = {
                {39.2, 29.5}, {40.5, 27.8}, {38.1, 31.1}, {41.2, 28.5}
            }},
            { type = "kill", name = "Galak Windchaser", spawns = {
                {40.1, 28.8}, {39.5, 30.5}, {41.2, 27.2}, {38.8, 31.8}
            }},
        }
    },
    
    [1149] = { -- Alien Egg
        name = "Alien Egg",
        zone = "Thousand Needles",
        start = { npc = "Hagar Lightninghoof", x = 21.2, y = 32.4 },
        objectives = {
            { type = "item", name = "Alien Egg", spawns = {{52.5, 53.2}} },
        }
    },
    
    [1176] = { -- Test of Endurance
        name = "Test of Endurance",
        zone = "Thousand Needles",
        start = { npc = "Dorn Plainstalker", x = 21.5, y = 32.0 },
        objectives = {
            { type = "item", name = "Grenka's Claw", spawns = {{29.5, 36.8}} },
        }
    },
    
    [4767] = { -- Salt Flat Venom
        name = "Salt Flat Venom",
        zone = "Thousand Needles",
        start = { npc = "Fizzle Brassbolts", x = 78.1, y = 77.1 },
        objectives = {
            { type = "kill", name = "Saltstone Basilisk", spawns = {
                {72.5, 71.2}, {73.8, 69.5}, {71.2, 72.8}, {74.5, 70.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Stranglethorn Vale Quests (30-45)
    -----------------------------------------
    
    [185] = { -- Raptor Mastery
        name = "Raptor Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "Stranglethorn Raptor", spawns = {
                {31.5, 17.2}, {32.8, 15.5}, {30.2, 18.8}, {33.5, 16.1}
            }},
        }
    },
    
    [189] = { -- Tiger Mastery
        name = "Tiger Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Ajeck Rouack", x = 35.6, y = 10.6 },
        objectives = {
            { type = "kill", name = "Stranglethorn Tiger", spawns = {
                {27.2, 11.5}, {28.5, 9.8}, {26.1, 13.1}, {29.2, 10.5}
            }},
        }
    },
    
    [191] = { -- Panther Mastery
        name = "Panther Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Sir S. J. Erlgadin", x = 35.5, y = 10.5 },
        objectives = {
            { type = "kill", name = "Shadowmaw Panther", spawns = {
                {37.5, 35.2}, {38.8, 33.5}, {36.2, 36.8}, {39.5, 34.1}
            }},
        }
    },
    
    [204] = { -- Big Game Hunter
        name = "Big Game Hunter",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "King Bangalash", spawns = {{29.8, 9.5}} },
        }
    },
    
    [571] = { -- Bloodscalp Ears
        name = "Bloodscalp Ears",
        zone = "Stranglethorn Vale",
        start = { npc = "Kebok", x = 27.1, y = 77.2 },
        objectives = {
            { type = "kill", name = "Bloodscalp Troll", spawns = {
                {33.5, 11.2}, {34.8, 9.5}, {32.2, 12.8}, {35.5, 10.1}
            }},
        }
    },
    
    [577] = { -- Headhunting
        name = "Headhunting",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "kill", name = "Bloodscalp Headhunter", spawns = {
                {32.5, 12.2}, {33.8, 10.5}, {31.2, 13.8}, {34.5, 11.1}
            }},
            { type = "kill", name = "Bloodscalp Hunter", spawns = {
                {33.1, 11.5}, {32.2, 13.1}, {34.2, 10.2}, {31.8, 14.5}
            }},
        }
    },
    
    [581] = { -- Speaking with Nezzliok
        name = "Speaking with Nezzliok",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "talk", name = "Nezzliok the Dire", spawns = {{33.2, 52.8}} },
        }
    },
    
    [586] = { -- The Singing Crystals
        name = "The Singing Crystals",
        zone = "Stranglethorn Vale",
        start = { npc = "Crank Fizzlebub", x = 27.8, y = 77.1 },
        objectives = {
            { type = "item", name = "Singing Blue Crystal", spawns = {
                {27.5, 69.2}, {28.8, 67.5}, {26.2, 70.8}, {29.5, 68.1}
            }},
        }
    },
    
    [597] = { -- Supplies to Private Thorsen
        name = "Supplies to Private Thorsen",
        zone = "Stranglethorn Vale",
        start = { npc = "Corporal Kaleb", x = 37.8, y = 3.4 },
        objectives = {
            { type = "talk", name = "Private Thorsen", spawns = {{38.2, 3.5}} },
        }
    },
    
    [600] = { -- Krazek's Cookery
        name = "Krazek's Cookery",
        zone = "Stranglethorn Vale",
        start = { npc = "Corporal Kaleb", x = 37.8, y = 3.4 },
        objectives = {
            { type = "talk", name = "Krazek", spawns = {{28.5, 77.2}} },
        }
    },
    
    -----------------------------------------
    -- Swamp of Sorrows Quests (35-45)
    -----------------------------------------
    
    [699] = { -- The Atal'ai Exile
        name = "The Atal'ai Exile",
        zone = "Swamp of Sorrows",
        start = { npc = "Brohann Caskbelly", x = 64.6, y = 20.7 },
        objectives = {
            { type = "talk", name = "Atal'ai Exile", spawns = {{62.5, 33.8}} },
        }
    },
    
    [1392] = { -- Galen's Escape
        name = "Galen's Escape",
        zone = "Swamp of Sorrows",
        start = { npc = "Galen Goodward", x = 53.8, y = 29.5 },
        objectives = {
            { type = "talk", name = "Galen Goodward", spawns = {{53.8, 29.5}} },
        }
    },
    
    [1422] = { -- Pool of Tears
        name = "Pool of Tears",
        zone = "Swamp of Sorrows",
        start = { npc = "Holaaru", x = 26.8, y = 33.4 },
        objectives = {
            { type = "item", name = "Atal'ai Artifact", spawns = {
                {65.2, 47.5}, {66.5, 45.8}, {64.1, 49.1}, {67.2, 46.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Badlands Quests (35-45)
    -----------------------------------------
    
    [703] = { -- Badlands Reagent Run
        name = "Badlands Reagent Run",
        zone = "Badlands",
        start = { npc = "Rigglefuzz", x = 42.4, y = 52.8 },
        objectives = {
            { type = "kill", name = "Buzzard", spawns = {
                {10.5, 32.2}, {11.8, 30.5}, {9.2, 33.8}, {12.5, 31.1}
            }},
        }
    },
    
    [705] = { -- Pearl Diving
        name = "Pearl Diving",
        zone = "Badlands",
        start = { npc = "Rigglefuzz", x = 42.4, y = 52.8 },
        objectives = {
            { type = "item", name = "Blue Pearl", spawns = {
                {52.5, 11.2}, {53.8, 9.5}, {51.2, 12.8}, {54.5, 10.1}
            }},
        }
    },
    
    [720] = { -- A Dwarf and His Tools
        name = "A Dwarf and His Tools",
        zone = "Badlands",
        start = { npc = "Prospector Ryedol", x = 53.0, y = 43.2 },
        objectives = {
            { type = "item", name = "Ryedol's Lucky Pick", spawns = {{51.8, 63.2}} },
        }
    },
    
    [733] = { -- Barbecued Buzzard Wings
        name = "Barbecued Buzzard Wings",
        zone = "Badlands",
        start = { npc = "Rigglefuzz", x = 42.4, y = 52.8 },
        objectives = {
            { type = "kill", name = "Giant Buzzard", spawns = {
                {12.5, 41.2}, {13.8, 39.5}, {11.2, 42.8}, {14.5, 40.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Tanaris Quests (40-50)
    -----------------------------------------
    
    [351] = { -- Wanted: Andre Firebeard
        name = "Wanted: Andre Firebeard",
        zone = "Tanaris",
        start = { npc = "Wanted Poster", x = 51.5, y = 26.8 },
        objectives = {
            { type = "kill", name = "Andre Firebeard", spawns = {{72.5, 47.8}} },
        }
    },
    
    [1690] = { -- Thistleshrub Valley
        name = "Thistleshrub Valley",
        zone = "Tanaris",
        start = { npc = "Tran'rek", x = 51.6, y = 26.8 },
        objectives = {
            { type = "kill", name = "Thistleshrub", spawns = {
                {28.5, 67.2}, {29.8, 65.5}, {27.2, 68.8}, {30.5, 66.1}
            }},
        }
    },
    
    [1707] = { -- Southsea Shakedown
        name = "Southsea Shakedown",
        zone = "Tanaris",
        start = { npc = "Security Chief Bilgewhizzle", x = 51.6, y = 28.6 },
        objectives = {
            { type = "kill", name = "Southsea Pirate", spawns = {
                {71.5, 47.2}, {72.8, 45.5}, {70.2, 48.8}, {73.5, 46.1}
            }},
        }
    },
    
    [2781] = { -- Water Pouch Bounty
        name = "Water Pouch Bounty",
        zone = "Tanaris",
        start = { npc = "Chief Engineer Bilgewhizzle", x = 52.5, y = 28.5 },
        objectives = {
            { type = "kill", name = "Wastewander Bandit", spawns = {
                {60.5, 32.2}, {61.8, 30.5}, {59.2, 33.8}, {62.5, 31.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Un'Goro Crater Quests (45-55)
    -----------------------------------------
    
    [3883] = { -- The Apes of Un'Goro
        name = "The Apes of Un'Goro",
        zone = "Un'Goro Crater",
        start = { npc = "Torwa Pathfinder", x = 71.6, y = 76.0 },
        objectives = {
            { type = "kill", name = "U'cha", spawns = {{67.5, 16.2}} },
        }
    },
    
    [4141] = { -- Beware of Pterrordax
        name = "Beware of Pterrordax",
        zone = "Un'Goro Crater",
        start = { npc = "Dadanga", x = 71.4, y = 76.0 },
        objectives = {
            { type = "kill", name = "Pterrordax", spawns = {
                {53.5, 72.2}, {54.8, 70.5}, {52.2, 73.8}, {55.5, 71.1}
            }},
        }
    },
    
    [4284] = { -- Volcanic Activity
        name = "Volcanic Activity",
        zone = "Un'Goro Crater",
        start = { npc = "Scientist Willard Wozzle", x = 55.0, y = 13.8 },
        objectives = {
            { type = "item", name = "Un'Goro Ash", spawns = {
                {50.5, 48.2}, {51.8, 46.5}, {49.2, 49.8}, {52.5, 47.1}
            }},
        }
    },
    
    [4289] = { -- Lost!
        name = "Lost!",
        zone = "Un'Goro Crater",
        start = { npc = "Spraggle Frock", x = 42.5, y = 9.8 },
        objectives = {
            { type = "talk", name = "Spraggle Frock", spawns = {{42.5, 9.8}} },
        }
    },
    
    -----------------------------------------
    -- Felwood Quests (45-55)
    -----------------------------------------
    
    [4101] = { -- Cleansing Felwood
        name = "Cleansing Felwood",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 54.3, y = 86.7 },
        objectives = {
            { type = "item", name = "Corrupted Soul Shard", spawns = {
                {51.5, 82.2}, {52.8, 80.5}, {50.2, 83.8}, {53.5, 81.1}
            }},
        }
    },
    
    [4421] = { -- A Strange Red Key
        name = "A Strange Red Key",
        zone = "Felwood",
        start = { npc = "Item Drop", x = 35.5, y = 59.0 },
        objectives = {
            { type = "item", name = "Blood Red Key", spawns = {{39.5, 58.2}} },
        }
    },
    
    [4441] = { -- Stealing Onar's Scrying Eye
        name = "Stealing Onar's Scrying Eye",
        zone = "Felwood",
        start = { npc = "Onar's Scrying Eye", x = 40.2, y = 59.5 },
        objectives = {
            { type = "item", name = "Onar's Scrying Eye", spawns = {{40.2, 59.5}} },
        }
    },
    
    [5155] = { -- Timbermaw Ally
        name = "Timbermaw Ally",
        zone = "Felwood",
        start = { npc = "Nafien", x = 64.2, y = 8.1 },
        objectives = {
            { type = "kill", name = "Winterfall Runner", spawns = {
                {61.5, 10.2}, {62.8, 8.5}, {60.2, 11.8}, {63.5, 9.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Winterspring Quests (53-60)
    -----------------------------------------
    
    [5082] = { -- Ursius of the Shardtooth
        name = "Ursius of the Shardtooth",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.9, y = 9.8 },
        objectives = {
            { type = "kill", name = "Ursius", spawns = {{57.5, 52.8}} },
        }
    },
    
    [5085] = { -- Brumeran of the Chillwind
        name = "Brumeran of the Chillwind",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.9, y = 9.8 },
        objectives = {
            { type = "kill", name = "Brumeran", spawns = {{59.2, 34.5}} },
        }
    },
    
    [5121] = { -- The Everlook Report
        name = "The Everlook Report",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "talk", name = "Jessara Cordell", spawns = {{62.5, 37.2}} },
        }
    },
    
    [5156] = { -- Winterfall Activity
        name = "Winterfall Activity",
        zone = "Winterspring",
        start = { npc = "Salfa", x = 31.4, y = 45.0 },
        objectives = {
            { type = "kill", name = "Winterfall Shaman", spawns = {
                {67.5, 35.2}, {68.8, 33.5}, {66.2, 36.8}, {69.5, 34.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Western Plaguelands Quests (50-58)
    -----------------------------------------
    
    [5092] = { -- Unfinished Business
        name = "Unfinished Business",
        zone = "Western Plaguelands",
        start = { npc = "Kirsta Deepshadow", x = 42.6, y = 84.0 },
        objectives = {
            { type = "kill", name = "Cauldron Lord Bilemaw", spawns = {{67.2, 49.5}} },
        }
    },
    
    [5097] = { -- All Along the Watchtowers
        name = "All Along the Watchtowers",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 42.9, y = 85.0 },
        objectives = {
            { type = "talk", name = "Hearthglen Tower", spawns = {{43.8, 17.2}} },
        }
    },
    
    [5212] = { -- Alas, Andorhal
        name = "Alas, Andorhal",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 42.9, y = 85.0 },
        objectives = {
            { type = "talk", name = "Andorhal Monument", spawns = {{41.2, 70.5}} },
        }
    },
    
    [5219] = { -- Target: Dalson's Tears
        name = "Target: Dalson's Tears",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "talk", name = "Scourge Cauldron", spawns = {{45.5, 52.8}} },
        }
    },
    
    -----------------------------------------
    -- Eastern Plaguelands Quests (53-60)
    -----------------------------------------
    
    [5281] = { -- Demon Dogs
        name = "Demon Dogs",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "kill", name = "Plaguehound", spawns = {
                {25.5, 78.2}, {26.8, 76.5}, {24.2, 79.8}, {27.5, 77.1}
            }},
        }
    },
    
    [5282] = { -- Blood Tinged Skies
        name = "Blood Tinged Skies",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "kill", name = "Plaguebat", spawns = {
                {26.5, 30.2}, {27.8, 28.5}, {25.2, 31.8}, {28.5, 29.1}
            }},
        }
    },
    
    [5511] = { -- The Restless Souls
        name = "The Restless Souls",
        zone = "Eastern Plaguelands",
        start = { npc = "Caretaker Alen", x = 24.7, y = 74.3 },
        objectives = {
            { type = "talk", name = "Restless Soul", spawns = {
                {20.5, 24.2}, {21.8, 22.5}, {19.2, 25.8}, {22.5, 23.1}
            }},
        }
    },
    
    [5542] = { -- Zaeldarr the Outcast
        name = "Zaeldarr the Outcast",
        zone = "Eastern Plaguelands",
        start = { npc = "Caretaker Alen", x = 24.7, y = 74.3 },
        objectives = {
            { type = "kill", name = "Zaeldarr the Outcast", spawns = {{27.5, 85.2}} },
        }
    },
    
    -----------------------------------------
    -- Burning Steppes Quests (50-58)
    -----------------------------------------
    
    [4122] = { -- A Taste of Flame
        name = "A Taste of Flame",
        zone = "Burning Steppes",
        start = { npc = "Cyrus Therepentous", x = 95.0, y = 31.0 },
        objectives = {
            { type = "kill", name = "Smolderweb", spawns = {
                {40.5, 56.2}, {41.8, 54.5}, {39.2, 57.8}, {42.5, 55.1}
            }},
        }
    },
    
    [4263] = { -- Mother's Milk
        name = "Mother's Milk",
        zone = "Burning Steppes",
        start = { npc = "Tinkee Steamboil", x = 65.2, y = 23.9 },
        objectives = {
            { type = "kill", name = "Incendosaur", spawns = {
                {32.5, 47.2}, {33.8, 45.5}, {31.2, 48.8}, {34.5, 46.1}
            }},
        }
    },
    
    [4726] = { -- Broodling Essence
        name = "Broodling Essence",
        zone = "Burning Steppes",
        start = { npc = "Tinkee Steamboil", x = 65.2, y = 23.9 },
        objectives = {
            { type = "kill", name = "Black Broodling", spawns = {
                {26.5, 38.2}, {27.8, 36.5}, {25.2, 39.8}, {28.5, 37.1}
            }},
        }
    },
}

-- Lookup functions
function VGuideQuestObjectives:GetQuestData(questId)
    return self.Data[questId]
end

function VGuideQuestObjectives:GetObjectivesByZone(zoneName)
    local results = {}
    for questId, data in pairs(self.Data) do
        if data.zone == zoneName then
            for _, obj in ipairs(data.objectives) do
                table.insert(results, {
                    questId = questId,
                    questName = data.name,
                    objective = obj
                })
            end
        end
    end
    return results
end

-- Check if player has quest in log
function VGuideQuestObjectives:PlayerHasQuest(questName)
    local numEntries = GetNumQuestLogEntries()
    for i = 1, numEntries do
        local title, _, _, isHeader = GetQuestLogTitle(i)
        if not isHeader and title == questName then
            return true
        end
    end
    return false
end

-- Get all active quest objectives for a zone
function VGuideQuestObjectives:GetActiveObjectivesForZone(zoneName)
    local results = {}
    for questId, data in pairs(self.Data) do
        if data.zone == zoneName then
            if self:PlayerHasQuest(data.name) then
                for _, obj in ipairs(data.objectives) do
                    -- Skip "start" types for active quests (we already have it)
                    if obj.type ~= "start" then
                        table.insert(results, {
                            questId = questId,
                            questName = data.name,
                            objective = obj
                        })
                    end
                end
            end
        end
    end
    return results
end

-- Get available quests (not yet accepted) for a zone
function VGuideQuestObjectives:GetAvailableQuestsForZone(zoneName)
    local results = {}
    for questId, data in pairs(self.Data) do
        if data.zone == zoneName then
            -- Only show if we don't have the quest
            if not self:PlayerHasQuest(data.name) then
                -- Check if quest has a start location
                if data.start then
                    table.insert(results, {
                        questId = questId,
                        questName = data.name,
                        npc = data.start.npc,
                        x = data.start.x,
                        y = data.start.y
                    })
                end
            end
        end
    end
    return results
end

Di("      - Quest Objective DB loaded with spawn data")
