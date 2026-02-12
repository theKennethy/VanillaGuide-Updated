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
    
    [781] = { -- Sarkoth (Part 2)
        name = "Sarkoth",
        zone = "Durotar",
        start = { npc = "Hana'zua", x = 40.6, y = 62.1 },
        objectives = {
            { type = "talk", name = "Gornek", spawns = {{42.1, 68.4}} },
        }
    },
    
    [790] = { -- Thazz'ril's Pick
        name = "Thazz'ril's Pick",
        zone = "Durotar",
        start = { npc = "Foreman Thazz'ril", x = 44.6, y = 68.6 },
        objectives = {
            { type = "item", name = "Thazz'ril's Pick", spawns = {{43.1, 53.8}} },
        }
    },
    
    [791] = { -- Carry Your Weight
        name = "Carry Your Weight",
        zone = "Durotar",
        start = { npc = "Furl Scornbrow", x = 52.2, y = 43.2 },
        objectives = {
            { type = "item", name = "Canvas Scraps", spawns = {
                {57.4, 55.1}, {58.2, 56.8}, {59.1, 54.3}, {60.3, 57.2}
            }},
        }
    },
    
    [806] = { -- Dark Storms
        name = "Dark Storms",
        zone = "Durotar",
        start = { npc = "Orgnil Soulscar", x = 52.4, y = 43.5 },
        objectives = {
            { type = "kill", name = "Fizzle Darkstorm", spawns = {{41.4, 26.2}} },
        }
    },
    
    [808] = { -- Minshina's Skull
        name = "Minshina's Skull",
        zone = "Durotar",
        start = { npc = "Master Gadrin", x = 55.9, y = 74.6 },
        objectives = {
            { type = "item", name = "Minshina's Skull", spawns = {{67.2, 87.6}} },
        }
    },
    
    [815] = { -- Break a Few Eggs
        name = "Break a Few Eggs",
        zone = "Durotar",
        start = { npc = "Ostok Highmountain", x = 51.9, y = 42.8 },
        objectives = {
            { type = "item", name = "Raptor Egg", spawns = {
                {62.4, 84.2}, {63.8, 82.1}, {65.1, 85.7}, {64.2, 88.3}
            }},
        }
    },
    
    [816] = { -- Lost But Not Forgotten
        name = "Lost But Not Forgotten",
        zone = "Durotar",
        start = { npc = "Misha Tor'kren", x = 43.3, y = 30.3 },
        objectives = {
            { type = "item", name = "Kron's Amulet", spawns = {
                {40.2, 32.1}, {38.8, 35.4}, {37.5, 33.8}, {39.1, 30.6}
            }},
        }
    },
    
    [817] = { -- Practical Prey
        name = "Practical Prey",
        zone = "Durotar",
        start = { npc = "Vel'rin Fang", x = 55.1, y = 75.5 },
        objectives = {
            { type = "kill", name = "Durotar Tiger", spawns = {
                {59.2, 84.1}, {61.4, 82.6}, {63.1, 85.3}, {60.8, 87.2}
            }},
        }
    },
    
    [823] = { -- Report to Orgnil
        name = "Report to Orgnil",
        zone = "Durotar",
        start = { npc = "Master Gadrin", x = 55.9, y = 74.6 },
        objectives = {
            { type = "talk", name = "Orgnil Soulscar", spawns = {{52.4, 43.5}} },
        }
    },
    
    [825] = { -- From The Wreckage....
        name = "From The Wreckage....",
        zone = "Durotar",
        start = { npc = "Orgnil Soulscar", x = 52.4, y = 43.5 },
        objectives = {
            { type = "item", name = "Gnomish Tools", spawns = {
                {60.8, 50.2}, {62.1, 48.5}, {63.4, 51.8}, {61.5, 53.1}
            }},
        }
    },
    
    [784] = { -- Vanquish the Betrayers
        name = "Vanquish the Betrayers",
        zone = "Durotar",
        start = { npc = "Orgnil Soulscar", x = 52.4, y = 43.5 },
        objectives = {
            { type = "kill", name = "Kul Tiras Sailor", spawns = {
                {57.2, 55.4}, {58.6, 57.1}, {59.8, 54.8}, {56.4, 56.2}
            }},
            { type = "kill", name = "Kul Tiras Marine", spawns = {
                {58.1, 56.3}, {59.4, 55.6}, {60.2, 57.8}, {57.6, 54.1}
            }},
        }
    },
    
    [830] = { -- The Admiral's Orders
        name = "The Admiral's Orders",
        zone = "Durotar",
        start = { npc = "Benedict", x = 59.6, y = 58.3 },
        objectives = {
            { type = "talk", name = "Orgnil Soulscar", spawns = {{52.4, 43.5}} },
        }
    },
    
    [837] = { -- Encroachment
        name = "Encroachment",
        zone = "Durotar",
        start = { npc = "Gar'Thok", x = 52.2, y = 43.4 },
        objectives = {
            { type = "kill", name = "Razormane Quilboar", spawns = {
                {49.2, 49.5}, {50.1, 48.2}, {48.6, 51.3}, {51.4, 50.8}
            }},
            { type = "kill", name = "Razormane Scout", spawns = {
                {49.8, 50.1}, {47.5, 48.6}, {48.2, 52.4}, {50.6, 49.2}
            }},
        }
    },
    
    [840] = { -- Securing the Lines
        name = "Securing the Lines",
        zone = "Durotar",
        start = { npc = "Rezlak", x = 46.4, y = 22.6 },
        objectives = {
            { type = "kill", name = "Dustwind Harpy", spawns = {
                {50.2, 23.1}, {51.8, 21.4}, {49.5, 24.8}, {52.4, 22.6}
            }},
            { type = "kill", name = "Dustwind Pillager", spawns = {
                {50.8, 22.5}, {52.1, 24.2}, {49.2, 21.8}, {51.4, 23.6}
            }},
        }
    },
    
    [2161] = { -- A Peon's Burden
        name = "A Peon's Burden",
        zone = "Durotar",
        start = { npc = "Ukor", x = 52.6, y = 68.4 },
        objectives = {
            { type = "talk", name = "Innkeeper Grosk", spawns = {{51.6, 41.6}} },
        }
    },
    
    [4402] = { -- Galgar's Cactus Apple Surprise
        name = "Galgar's Cactus Apple Surprise",
        zone = "Durotar",
        start = { npc = "Galgar", x = 42.8, y = 67.4 },
        objectives = {
            { type = "item", name = "Cactus Apple", spawns = {
                {44.8, 62.1}, {46.2, 58.4}, {45.1, 60.8}, {47.4, 59.2}
            }},
        }
    },
    
    [5261] = { -- Lazy Peons
        name = "Lazy Peons",
        zone = "Durotar",
        start = { npc = "Foreman Thazz'ril", x = 44.6, y = 68.6 },
        objectives = {
            { type = "talk", name = "Lazy Peon", spawns = {
                {45.2, 65.8}, {46.4, 63.1}, {44.1, 61.5}, {47.8, 64.2}
            }},
        }
    },
    
    [812] = { -- Need for a Cure
        name = "Need for a Cure",
        zone = "Durotar",
        start = { npc = "Kor'ghan", x = 40.8, y = 18.6 },
        objectives = {
            { type = "talk", name = "Rhinag", spawns = {{46.2, 52.8}} },
        }
    },
    
    [813] = { -- Finding the Antidote
        name = "Finding the Antidote",
        zone = "Durotar",
        start = { npc = "Rhinag", x = 46.2, y = 52.8 },
        objectives = {
            { type = "item", name = "Venomtail Poison Sac", spawns = {
                {47.2, 19.4}, {49.1, 17.8}, {48.4, 21.2}, {50.2, 18.6}
            }},
        }
    },
    
    [838] = { -- Margoz
        name = "Margoz",
        zone = "Durotar",
        start = { npc = "Orgnil Soulscar", x = 52.4, y = 43.5 },
        objectives = {
            { type = "talk", name = "Margoz", spawns = {{56.4, 20.2}} },
        }
    },
    
    [827] = { -- Skull Rock
        name = "Skull Rock",
        zone = "Durotar",
        start = { npc = "Margoz", x = 56.4, y = 20.2 },
        objectives = {
            { type = "item", name = "Searing Collar", spawns = {
                {55.2, 10.8}, {54.1, 9.4}, {56.8, 11.2}, {53.4, 12.1}
            }},
        }
    },
    
    [829] = { -- Neeru Fireblade
        name = "Neeru Fireblade",
        zone = "Durotar",
        start = { npc = "Margoz", x = 56.4, y = 20.2 },
        objectives = {
            { type = "talk", name = "Neeru Fireblade", spawns = {{49.6, 50.4}} },
        }
    },
    
    [842] = { -- Conscript of the Horde
        name = "Conscript of the Horde",
        zone = "Durotar",
        start = { npc = "Takrin Pathseeker", x = 50.8, y = 43.6 },
        objectives = {
            { type = "talk", name = "Kargal Battlescar", spawns = {{62.2, 19.4}} },
        }
    },
    
    -----------------------------------------
    -- Mulgore Quests (Complete)
    -----------------------------------------
    
    -- ===== Camp Narache / Red Cloud Mesa Quests =====
    
    [747] = { -- The Hunt Begins
        name = "The Hunt Begins",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Plainstrider", spawns = {
                {44.8, 76.2}, {46.1, 78.5}, {43.5, 74.8}, {45.2, 80.1},
                {47.3, 77.4}, {44.1, 82.3}, {48.2, 79.1}, {42.9, 77.8}
            }},
        }
    },
    
    [750] = { -- The Hunt Continues
        name = "The Hunt Continues",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "item", name = "Flatland Cougar Femur", spawns = {
                {56.2, 76.4}, {58.1, 74.8}, {54.8, 78.2}, {57.5, 80.1}
            }},
            { type = "item", name = "Plainstrider Talon", spawns = {
                {44.8, 76.2}, {46.1, 78.5}, {43.5, 74.8}, {45.2, 80.1}
            }},
            { type = "item", name = "Swoop Gizzard", spawns = {
                {48.5, 72.1}, {50.2, 74.8}, {47.1, 70.5}, {51.8, 73.2}
            }},
        }
    },
    
    [751] = { -- The Battleboars
        name = "The Battleboars",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Battleboar", spawns = {
                {50.2, 83.1}, {51.8, 81.4}, {49.5, 84.7}, {52.3, 82.8},
                {48.9, 85.2}, {53.1, 80.5}
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
    
    [752] = { -- Break Sharptusk!
        name = "Break Sharptusk!",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Chief Sharptusk Thornmantle", spawns = {{53.2, 84.5}} },
        }
    },
    
    [748] = { -- A Humble Task
        name = "A Humble Task",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "talk", name = "Greatmother Hawkwind", spawns = {{49.9, 80.8}} },
        }
    },
    
    [753] = { -- A Humble Task (Part 2)
        name = "A Humble Task",
        zone = "Mulgore",
        start = { npc = "Greatmother Hawkwind", x = 49.9, y = 80.8 },
        objectives = {
            { type = "item", name = "Water Pitcher", spawns = {{48.8, 79.2}} },
        }
    },
    
    [754] = { -- Rites of the Earthmother
        name = "Rites of the Earthmother",
        zone = "Mulgore",
        start = { npc = "Greatmother Hawkwind", x = 49.9, y = 80.8 },
        objectives = {
            { type = "talk", name = "Chief Hawkwind", spawns = {{44.6, 76.1}} },
        }
    },
    
    [755] = { -- Rite of Vision
        name = "Rite of Vision",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "item", name = "Ambercorn", spawns = {
                {48.5, 78.2}, {50.1, 76.8}, {47.2, 80.1}, {51.8, 79.4}
            }},
            { type = "item", name = "Well Stone", spawns = {{52.4, 71.2}} },
        }
    },
    
    [756] = { -- Rite of Vision (Part 2)
        name = "Rite of Vision",
        zone = "Mulgore",
        start = { npc = "Ritual Fire", x = 46.5, y = 67.0 },
        objectives = {
            { type = "talk", name = "Ancestral Spirit", spawns = {
                {46.5, 65.2}, {44.1, 59.8}, {38.5, 55.4}, {32.8, 50.1}
            }},
        }
    },
    
    [758] = { -- Rite of Wisdom
        name = "Rite of Wisdom",
        zone = "Mulgore",
        start = { npc = "Ancestral Spirit", x = 32.8, y = 50.1 },
        objectives = {
            { type = "talk", name = "Seer Graytongue", spawns = {{32.5, 49.8}} },
        }
    },
    
    [759] = { -- Journey into Thunder Bluff
        name = "Journey into Thunder Bluff",
        zone = "Mulgore",
        start = { npc = "Seer Graytongue", x = 32.5, y = 49.8 },
        objectives = {
            { type = "talk", name = "Cairne Bloodhoof", spawns = {{40.2, 52.8}} },
        }
    },
    
    [749] = { -- Rites of the Earthmother (Part 2)
        name = "Rites of the Earthmother",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "talk", name = "Baine Bloodhoof", spawns = {{47.0, 60.9}} },
        }
    },
    
    -- ===== Bloodhoof Village Quests =====
    
    [746] = { -- A Task Unfinished
        name = "A Task Unfinished",
        zone = "Mulgore",
        start = { npc = "Antur Fallow", x = 45.8, y = 63.6 },
        objectives = {
            { type = "talk", name = "Innkeeper Kauth", spawns = {{46.8, 60.5}} },
        }
    },
    
    [761] = { -- Swoop Hunting
        name = "Swoop Hunting",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "kill", name = "Swoop", spawns = {
                {49.3, 58.2}, {51.1, 56.8}, {48.7, 60.1}, {52.4, 59.3},
                {50.2, 62.5}, {53.1, 57.4}, {47.8, 64.2}, {54.5, 61.8}
            }},
        }
    },
    
    [765] = { -- Thunderhorn Totem
        name = "Thunderhorn Totem",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "kill", name = "Flatland Thunderer", spawns = {
                {51.2, 48.5}, {53.8, 46.2}, {50.1, 50.8}, {54.5, 44.1},
                {48.9, 52.3}, {55.2, 48.7}
            }},
        }
    },
    
    [764] = { -- Thunderhorn Cleansing
        name = "Thunderhorn Cleansing",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "talk", name = "Thunderhorn Totem", spawns = {{52.8, 48.2}} },
            { type = "item", name = "Thunderhorn Cleansed", spawns = {{52.8, 48.2}} },
        }
    },
    
    [760] = { -- Wildmane Totem
        name = "Wildmane Totem",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "kill", name = "Wildmane Cat", spawns = {
                {58.2, 60.1}, {60.5, 58.4}, {56.8, 62.5}, {61.2, 56.8},
                {57.5, 64.2}, {62.8, 59.1}
            }},
        }
    },
    
    [762] = { -- Wildmane Cleansing
        name = "Wildmane Cleansing",
        zone = "Mulgore",
        start = { npc = "Harken Windtotem", x = 47.6, y = 62.1 },
        objectives = {
            { type = "talk", name = "Wildmane Well", spawns = {{51.8, 66.4}} },
            { type = "item", name = "Wildmane Cleansed", spawns = {{51.8, 66.4}} },
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
    
    [743] = { -- Poison Water
        name = "Poison Water",
        zone = "Mulgore",
        start = { npc = "Mull Thunderhorn", x = 47.5, y = 60.1 },
        objectives = {
            { type = "item", name = "Plainstrider Kidney", spawns = {
                {44.8, 76.2}, {46.1, 78.5}, {50.2, 62.5}, {52.8, 58.1}
            }},
        }
    },
    
    [744] = { -- Winterhoof Cleansing
        name = "Winterhoof Cleansing",
        zone = "Mulgore",
        start = { npc = "Mull Thunderhorn", x = 47.5, y = 60.1 },
        objectives = {
            { type = "talk", name = "Winterhoof Well", spawns = {{53.2, 66.1}} },
            { type = "item", name = "Winterhoof Cleansed", spawns = {{53.2, 66.1}} },
        }
    },
    
    [767] = { -- Kyle's Gone Missing!
        name = "Kyle's Gone Missing!",
        zone = "Mulgore",
        start = { npc = "Ahab Wheathoof", x = 48.4, y = 53.1 },
        objectives = {
            { type = "item", name = "Tender Strider Meat", spawns = {
                {44.8, 76.2}, {46.1, 78.5}, {50.2, 62.5}, {52.8, 58.1}
            }},
            { type = "talk", name = "Kyle the Frenzied", spawns = {
                {46.2, 51.8}, {48.5, 54.1}, {44.8, 56.2}, {50.1, 52.5}
            }},
        }
    },
    
    -- ===== Venture Co. / Bristleback Quests =====
    
    [770] = { -- The Venture Co.
        name = "The Venture Co.",
        zone = "Mulgore",
        start = { npc = "Morin Cloudstalker", x = 48.5, y = 53.0 },
        objectives = {
            { type = "kill", name = "Venture Co. Worker", spawns = {
                {60.8, 47.2}, {62.1, 45.8}, {59.5, 48.5}, {63.2, 44.1}
            }},
            { type = "kill", name = "Venture Co. Supervisor", spawns = {
                {61.5, 46.5}, {63.8, 43.2}, {60.2, 49.1}, {62.5, 47.8}
            }},
        }
    },
    
    [771] = { -- Supervisor Fizsprocket
        name = "Supervisor Fizsprocket",
        zone = "Mulgore",
        start = { npc = "Morin Cloudstalker", x = 48.5, y = 53.0 },
        objectives = {
            { type = "kill", name = "Supervisor Fizsprocket", spawns = {{62.5, 44.8}} },
        }
    },
    
    [772] = { -- The Ravaged Caravan
        name = "The Ravaged Caravan",
        zone = "Mulgore",
        start = { npc = "Morin Cloudstalker", x = 48.5, y = 53.0 },
        objectives = {
            { type = "item", name = "Venture Co. Documents", spawns = {{53.8, 48.2}} },
        }
    },
    
    [773] = { -- The Ravaged Caravan (Part 2)
        name = "The Ravaged Caravan",
        zone = "Mulgore",
        start = { npc = "Sealed Supply Crate", x = 53.8, y = 48.2 },
        objectives = {
            { type = "talk", name = "Morin Cloudstalker", spawns = {{48.5, 53.0}} },
        }
    },
    
    [14438] = { -- Dwarven Digging
        name = "Dwarven Digging",
        zone = "Mulgore",
        start = { npc = "Baine Bloodhoof", x = 47.0, y = 60.9 },
        objectives = {
            { type = "item", name = "Prospector's Pick", spawns = {
                {32.5, 48.5}, {33.8, 46.2}, {31.2, 50.1}, {34.5, 47.8}
            }},
        }
    },
    
    -- ===== Bristleback Quests =====
    
    [769] = { -- The Demon Scarred Cloak
        name = "The Demon Scarred Cloak",
        zone = "Mulgore",
        start = { npc = "Demon Scarred Cloak (Item Drop)", x = 38.5, y = 52.0 },
        objectives = {
            { type = "talk", name = "Baine Bloodhoof", spawns = {{47.0, 60.9}} },
        }
    },
    
    [768] = { -- Rite of Courage
        name = "Rite of Courage",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Bristleback Shaman", spawns = {
                {67.2, 79.5}, {68.5, 77.8}, {66.1, 81.2}, {69.8, 76.4}
            }},
            { type = "kill", name = "Bristleback Battleboar", spawns = {
                {66.8, 80.1}, {68.2, 78.5}, {65.5, 82.4}, {70.1, 77.2}
            }},
        }
    },
    
    [763] = { -- Attack on Camp Narache
        name = "Attack on Camp Narache",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "kill", name = "Bristleback Interloper", spawns = {
                {45.8, 73.2}, {47.2, 74.5}, {44.5, 75.8}, {46.8, 72.1}
            }},
        }
    },
    
    -- ===== Class Trainer Quests =====
    
    [3091] = { -- Rellian Greenspyre (Druid)
        name = "Rellian Greenspyre",
        zone = "Mulgore",
        start = { npc = "Gennia Runetotem", x = 48.8, y = 59.0 },
        objectives = {
            { type = "talk", name = "Rellian Greenspyre", spawns = {{40.2, 52.8}} },
        }
    },
    
    [3092] = { -- Path of Defense (Warrior)
        name = "Path of Defense",
        zone = "Mulgore",
        start = { npc = "Harutt Thunderhorn", x = 42.1, y = 78.5 },
        objectives = {
            { type = "item", name = "Bristleback Belt", spawns = {
                {67.2, 79.5}, {68.5, 77.8}, {66.1, 81.2}, {69.8, 76.4}
            }},
        }
    },
    
    [3093] = { -- Verdant Note (Druid)
        name = "Verdant Note",
        zone = "Mulgore",
        start = { npc = "Gart Mistrunner", x = 48.5, y = 60.1 },
        objectives = {
            { type = "talk", name = "Gennia Runetotem", spawns = {{48.8, 59.0}} },
        }
    },
    
    [3094] = { -- Etched Note (Warrior)
        name = "Etched Note",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "talk", name = "Harutt Thunderhorn", spawns = {{42.1, 78.5}} },
        }
    },
    
    [3095] = { -- Hallowed Note (Shaman)
        name = "Hallowed Note",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "talk", name = "Seer Ravenfeather", spawns = {{43.5, 76.8}} },
        }
    },
    
    [3096] = { -- Glyphic Note (Hunter)
        name = "Glyphic Note",
        zone = "Mulgore",
        start = { npc = "Chief Hawkwind", x = 44.6, y = 76.1 },
        objectives = {
            { type = "talk", name = "Lanka Farshot", spawns = {{45.4, 78.2}} },
        }
    },
    
    [3097] = { -- Simple Note (Shaman)
        name = "Simple Note",
        zone = "Mulgore",
        start = { npc = "Seer Ravenfeather", x = 43.5, y = 76.8 },
        objectives = {
            { type = "talk", name = "Meela Dawnstrider", spawns = {{48.1, 59.5}} },
        }
    },
    
    [6061] = { -- Taming the Beast (Hunter - Tauren)
        name = "Taming the Beast",
        zone = "Mulgore",
        start = { npc = "Yaw Sharpmane", x = 47.2, y = 55.8 },
        objectives = {
            { type = "kill", name = "Adult Plainstrider", spawns = {
                {50.2, 58.1}, {52.8, 56.4}, {48.5, 60.2}, {54.1, 54.8}
            }},
        }
    },
    
    [6062] = { -- Taming the Beast (Part 2 - Tauren)
        name = "Taming the Beast",
        zone = "Mulgore",
        start = { npc = "Yaw Sharpmane", x = 47.2, y = 55.8 },
        objectives = {
            { type = "kill", name = "Prairie Stalker", spawns = {
                {45.8, 46.2}, {48.2, 44.5}, {43.5, 48.1}, {50.1, 42.8}
            }},
        }
    },
    
    [6063] = { -- Taming the Beast (Part 3 - Tauren)
        name = "Taming the Beast",
        zone = "Mulgore",
        start = { npc = "Yaw Sharpmane", x = 47.2, y = 55.8 },
        objectives = {
            { type = "kill", name = "Swoop", spawns = {
                {49.3, 58.2}, {51.1, 56.8}, {48.7, 60.1}, {52.4, 59.3}
            }},
        }
    },
    
    [6064] = { -- Training the Beast (Hunter - Tauren)
        name = "Training the Beast",
        zone = "Mulgore",
        start = { npc = "Yaw Sharpmane", x = 47.2, y = 55.8 },
        objectives = {
            { type = "talk", name = "Holt Thunderhorn", spawns = {{49.5, 58.5}} },
        }
    },
    
    [476] = { -- Weapons of Choice
        name = "Weapons of Choice",
        zone = "Mulgore",
        start = { npc = "Lanka Farshot", x = 45.4, y = 78.2 },
        objectives = {
            { type = "kill", name = "Swooping Plainstrider", spawns = {
                {45.0, 76.0}, {47.2, 78.5}, {43.5, 74.8}, {49.1, 80.1}
            }},
        }
    },
    
    -- ===== Miscellaneous Quests =====
    
    [824] = { -- The Hunter's Way
        name = "The Hunter's Way",
        zone = "Mulgore",
        start = { npc = "Melor Stonehoof", x = 61.5, y = 80.8 },
        objectives = {
            { type = "kill", name = "Flatland Prowler", spawns = {
                {56.8, 62.4}, {58.2, 60.1}, {55.5, 64.8}, {59.8, 58.5}
            }},
        }
    },
    
    [861] = { -- The Hunter's Way (Part 2)
        name = "The Hunter's Way",
        zone = "Mulgore",
        start = { npc = "Melor Stonehoof", x = 61.5, y = 80.8 },
        objectives = {
            { type = "kill", name = "Flatland Cougar", spawns = {
                {56.2, 76.4}, {58.1, 74.8}, {54.8, 78.2}, {57.5, 80.1}
            }},
        }
    },
    
    [6361] = { -- Dangers of the Windfury
        name = "Dangers of the Windfury",
        zone = "Mulgore",
        start = { npc = "Ruul Eagletalon", x = 47.8, y = 58.2 },
        objectives = {
            { type = "kill", name = "Windfury Matriarch", spawns = {
                {48.2, 31.5}, {50.1, 29.8}, {46.5, 33.2}, {51.8, 28.1}
            }},
            { type = "kill", name = "Windfury Wind Witch", spawns = {
                {47.5, 32.1}, {49.8, 30.5}, {45.8, 34.2}, {52.2, 29.5}
            }},
            { type = "kill", name = "Windfury Sorceress", spawns = {
                {48.8, 31.8}, {50.5, 28.2}, {46.2, 33.8}, {51.5, 27.5}
            }},
        }
    },
    
    [833] = { -- Mulgore Quillboar
        name = "Mulgore",
        zone = "Mulgore",
        start = { npc = "Arch Druid Hamuul Runetotem", x = 40.5, y = 52.1 },
        objectives = {
            { type = "kill", name = "Bristleback Quilboar", spawns = {
                {67.2, 79.5}, {68.5, 77.8}, {66.1, 81.2}, {69.8, 76.4}
            }},
        }
    },
    
    [20441] = { -- Rite of the Winds
        name = "Rite of the Winds",
        zone = "Mulgore",
        start = { npc = "Zarlman Two-Moons", x = 47.5, y = 61.5 },
        objectives = {
            { type = "talk", name = "Ancestral Spirit", spawns = {{38.2, 55.8}} },
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

    [376] = { -- Rattling the Rattlecages
        name = "Rattling the Rattlecages",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "kill", name = "Rattlecage Skeleton", spawns = {
                {30.8, 65.2}, {31.5, 63.8}, {29.4, 66.5}, {32.1, 64.1}
            }},
        }
    },

    [383] = { -- Scavenging Deathknell
        name = "Scavenging Deathknell",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Saltain", x = 38.5, y = 56.9 },
        objectives = {
            { type = "item", name = "Scavenged Goods", spawns = {
                {29.8, 68.5}, {31.2, 66.1}, {28.5, 69.2}, {32.4, 67.8}
            }},
        }
    },

    [374] = { -- Gloom Weed
        name = "Gloom Weed",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "item", name = "Doom Weed", spawns = {
                {35.2, 60.1}, {36.8, 58.5}, {34.1, 61.8}, {37.5, 59.2}
            }},
        }
    },

    [375] = { -- Marla's Last Wish
        name = "Marla's Last Wish",
        zone = "Tirisfal Glades",
        start = { npc = "Novice Elreth", x = 38.8, y = 56.4 },
        objectives = {
            { type = "item", name = "Sunflower", spawns = {
                {39.2, 50.8}, {40.5, 52.1}, {38.1, 49.5}, {41.2, 51.4}
            }},
        }
    },

    [412] = { -- Deaths in the Family
        name = "Deaths in the Family",
        zone = "Tirisfal Glades",
        start = { npc = "Coleman Farthing", x = 61.5, y = 51.8 },
        objectives = {
            { type = "kill", name = "Thurman Agamand", spawns = {{48.2, 28.1}} },
            { type = "kill", name = "Gregor Agamand", spawns = {{53.5, 26.4}} },
        }
    },

    [365] = { -- The Damned
        name = "The Damned",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "item", name = "Tattered Wolfhide", spawns = {
                {38.4, 60.2}, {39.8, 58.5}, {37.1, 61.4}, {40.5, 59.8}
            }},
        }
    },

    [410] = { -- Fields of Grief
        name = "Fields of Grief",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "item", name = "Tirisfal Pumpkin", spawns = {
                {36.2, 52.5}, {37.8, 54.1}, {35.1, 51.2}, {38.5, 53.4}
            }},
        }
    },

    [411] = { -- Fields of Grief
        name = "Fields of Grief",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "talk", name = "Apothecary Johaan", spawns = {{59.4, 52.3}} },
        }
    },

    [382] = { -- The Red Messenger
        name = "The Red Messenger",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Arren", x = 38.1, y = 56.6 },
        objectives = {
            { type = "kill", name = "Meven Korgal", spawns = {{37.8, 70.2}} },
            { type = "item", name = "Scarlet Crusade Documents", spawns = {{37.8, 70.2}} },
        }
    },

    [5481] = { -- Garments of Darkness
        name = "Garments of Darkness",
        zone = "Tirisfal Glades",
        start = { npc = "Dark Cleric Duesten", x = 38.4, y = 56.5 },
        objectives = {
            { type = "talk", name = "Deathguard Kel", spawns = {{45.8, 55.2}} },
        }
    },

    [1470] = { -- Encrypted Scroll
        name = "Encrypted Scroll",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "talk", name = "David Trias", spawns = {{38.5, 56.4}} },
        }
    },

    [1468] = { -- Tainted Scroll
        name = "Tainted Scroll",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "talk", name = "Maximillion", spawns = {{38.1, 56.2}} },
        }
    },

    [1475] = { -- Simple Scroll
        name = "Simple Scroll",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "talk", name = "Dannal Stern", spawns = {{38.8, 56.1}} },
        }
    },

    [1478] = { -- Glyphic Scroll
        name = "Glyphic Scroll",
        zone = "Tirisfal Glades",
        start = { npc = "Shadow Priest Sarvis", x = 38.2, y = 56.8 },
        objectives = {
            { type = "talk", name = "Cain Firesong", spawns = {{38.2, 56.4}} },
        }
    },

    [405] = { -- Return of the Scarlet Crusade
        name = "Return of the Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Dillinger", x = 61.2, y = 52.8 },
        objectives = {
            { type = "kill", name = "Scarlet Warrior", spawns = {
                {78.5, 30.2}, {79.8, 32.1}, {77.2, 28.5}, {80.4, 31.4}
            }},
            { type = "kill", name = "Scarlet Missionary", spawns = {
                {79.1, 29.8}, {78.2, 31.5}, {80.8, 30.4}, {77.5, 32.8}
            }},
        }
    },

    [370] = { -- At War With The Scarlet Crusade
        name = "At War With The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Zygand", x = 60.5, y = 51.5 },
        objectives = {
            { type = "kill", name = "Scarlet Warrior", spawns = {
                {52.4, 67.8}, {53.8, 66.2}, {51.1, 69.4}, {54.5, 68.5}
            }},
        }
    },

    [371] = { -- At War With The Scarlet Crusade
        name = "At War With The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Zygand", x = 60.5, y = 51.5 },
        objectives = {
            { type = "kill", name = "Scarlet Zealot", spawns = {
                {52.1, 68.4}, {53.5, 65.8}, {50.8, 70.1}, {54.2, 67.2}
            }},
            { type = "kill", name = "Scarlet Friar", spawns = {
                {51.8, 69.2}, {53.2, 66.5}, {50.5, 68.8}, {52.8, 70.4}
            }},
        }
    },

    [372] = { -- At War With The Scarlet Crusade
        name = "At War With The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Zygand", x = 60.5, y = 51.5 },
        objectives = {
            { type = "kill", name = "Scarlet Magician", spawns = {
                {81.2, 29.4}, {82.5, 31.2}, {80.1, 28.1}, {83.4, 30.5}
            }},
            { type = "kill", name = "Scarlet Sentry", spawns = {
                {82.1, 28.8}, {81.5, 30.4}, {83.2, 29.1}, {80.8, 31.8}
            }},
        }
    },

    [373] = { -- At War With The Scarlet Crusade
        name = "At War With The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Zygand", x = 60.5, y = 51.5 },
        objectives = {
            { type = "kill", name = "Captain Perrine", spawns = {{83.5, 30.2}} },
        }
    },

    [427] = { -- The Mills Overrun
        name = "The Mills Overrun",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Linnea", x = 52.6, y = 54.8 },
        objectives = {
            { type = "kill", name = "Rot Hide Brute", spawns = {
                {63.2, 26.8}, {64.5, 28.1}, {62.1, 25.4}, {65.8, 27.5}
            }},
            { type = "kill", name = "Rot Hide Plague Weaver", spawns = {
                {62.8, 27.4}, {64.1, 25.8}, {63.5, 29.1}, {61.8, 26.2}
            }},
        }
    },

    [428] = { -- The Haunted Mills
        name = "The Haunted Mills",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Linnea", x = 52.6, y = 54.8 },
        objectives = {
            { type = "kill", name = "Haunted Servitor", spawns = {
                {64.2, 27.1}, {63.5, 25.8}, {65.1, 28.4}, {62.8, 26.5}
            }},
            { type = "kill", name = "Haunting Vision", spawns = {
                {63.8, 26.4}, {64.8, 28.8}, {62.4, 25.1}, {65.5, 27.8}
            }},
        }
    },

    [429] = { -- Speak with Sevren
        name = "Speak with Sevren",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Linnea", x = 52.6, y = 54.8 },
        objectives = {
            { type = "talk", name = "Magistrate Sevren", spawns = {{60.8, 52.6}} },
        }
    },

    [354] = { -- Delivery to Silverpine Forest
        name = "Delivery to Silverpine Forest",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "talk", name = "Apothecary Renferrel", spawns = {{42.1, 40.8}} },
        }
    },

    [358] = { -- Gordo's Task
        name = "Gordo's Task",
        zone = "Tirisfal Glades",
        start = { npc = "Junior Apothecary Holland", x = 61.8, y = 52.1 },
        objectives = {
            { type = "item", name = "Gloom Weed", spawns = {
                {58.4, 34.2}, {60.1, 36.5}, {56.8, 33.1}, {61.5, 35.8}
            }},
        }
    },

    [409] = { -- Forsaken Duties
        name = "Forsaken Duties",
        zone = "Tirisfal Glades",
        start = { npc = "Deathguard Simmer", x = 61.4, y = 52.4 },
        objectives = {
            { type = "talk", name = "High Executor Hadrec", spawns = {{43.5, 40.5}} },
        }
    },

    [5725] = { -- A New Plague
        name = "A New Plague",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "item", name = "Vicious Night Web Spider Venom", spawns = {
                {67.8, 52.4}, {68.5, 54.1}, {66.2, 51.8}, {69.1, 53.5}
            }},
        }
    },

    [5726] = { -- A New Plague
        name = "A New Plague",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "item", name = "Vile Fin Scale", spawns = {
                {68.2, 42.5}, {69.5, 44.8}, {67.1, 41.2}, {70.4, 43.8}
            }},
        }
    },

    [5727] = { -- A New Plague
        name = "A New Plague",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "talk", name = "Apothecary Renferrel", spawns = {{42.1, 40.8}} },
        }
    },

    [366] = { -- Wanted: Murloc Poachers
        name = "Wanted: Murloc Poachers",
        zone = "Tirisfal Glades",
        start = { npc = "Wanted Poster", x = 60.9, y = 52.5 },
        objectives = {
            { type = "kill", name = "Vile Fin Puddlejumper", spawns = {
                {69.1, 42.8}, {70.4, 44.5}, {67.8, 41.2}, {71.2, 43.1}
            }},
            { type = "kill", name = "Vile Fin Minor Oracle", spawns = {
                {68.5, 43.5}, {70.1, 45.2}, {67.2, 42.1}, {71.8, 44.8}
            }},
        }
    },

    [357] = { -- Going North
        name = "Going North",
        zone = "Tirisfal Glades",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 },
        objectives = {
            { type = "talk", name = "Sentinel Leader Bast", spawns = {{52.4, 27.8}} },
        }
    },

    [352] = { -- Return to the Magistrate
        name = "Return to the Magistrate",
        zone = "Tirisfal Glades",
        start = { npc = "Bethor Iceshard", x = 62.1, y = 48.2 },
        objectives = {
            { type = "talk", name = "Magistrate Sevren", spawns = {{60.8, 52.6}} },
        }
    },

    [362] = { -- The Chill of Death
        name = "The Chill of Death",
        zone = "Tirisfal Glades",
        start = { npc = "Gretchen Dedmar", x = 60.2, y = 52.1 },
        objectives = {
            { type = "item", name = "Duskbat Pelt", spawns = {
                {65.8, 42.1}, {67.2, 43.8}, {64.5, 40.5}, {68.1, 44.2}
            }},
        }
    },

    [361] = { -- A Letter Undelivered
        name = "A Letter Undelivered",
        zone = "Tirisfal Glades",
        start = { npc = "Sevren Blackwing", x = 60.8, y = 52.6 },
        objectives = {
            { type = "talk", name = "Yvette Farthing", spawns = {{61.5, 51.4}} },
        }
    },

    [360] = { -- No Cure For Death
        name = "No Cure For Death",
        zone = "Tirisfal Glades",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "item", name = "Tirisfal Pumpkin", spawns = {
                {36.2, 52.8}, {37.8, 54.1}, {35.5, 51.4}, {38.4, 53.5}
            }},
            { type = "item", name = "Duskbat Wing", spawns = {
                {65.8, 42.1}, {67.2, 43.8}, {64.5, 40.5}, {68.1, 44.2}
            }},
        }
    },

    [1654] = { -- Gnashing
        name = "Gnashing",
        zone = "Tirisfal Glades",
        start = { npc = "Quinn Yorick", x = 52.4, y = 54.2 },
        objectives = {
            { type = "kill", name = "Murloc", spawns = {
                {69.1, 42.8}, {70.4, 44.5}, {67.8, 41.2}, {71.2, 43.1}
            }},
        }
    },

    [386] = { -- At War With The Scarlet Crusade
        name = "At War With The Scarlet Crusade",
        zone = "Tirisfal Glades",
        start = { npc = "Executor Arren", x = 38.1, y = 56.6 },
        objectives = {
            { type = "kill", name = "Scarlet Convert", spawns = {
                {35.8, 68.5}, {37.1, 66.2}, {34.2, 69.1}, {36.5, 70.4}
            }},
        }
    },

    [426] = { -- The Lich's Identity
        name = "The Lich's Identity",
        zone = "Tirisfal Glades",
        start = { npc = "Bethor Iceshard", x = 62.1, y = 48.2 },
        objectives = {
            { type = "talk", name = "Gunther Arcanus", spawns = {{68.2, 42.1}} },
        }
    },

    [430] = { -- The Prodigal Lich
        name = "The Prodigal Lich",
        zone = "Tirisfal Glades",
        start = { npc = "Bethor Iceshard", x = 62.1, y = 48.2 },
        objectives = {
            { type = "talk", name = "Gunther Arcanus", spawns = {{68.2, 42.1}} },
        }
    },

    [431] = { -- The Prodigal Lich Returns
        name = "The Prodigal Lich Returns",
        zone = "Tirisfal Glades",
        start = { npc = "Gunther Arcanus", x = 68.2, y = 42.1 },
        objectives = {
            { type = "talk", name = "Bethor Iceshard", spawns = {{62.1, 48.2}} },
        }
    },

    [408] = { -- The Family Crypt
        name = "The Family Crypt",
        zone = "Tirisfal Glades",
        start = { npc = "Coleman Farthing", x = 61.5, y = 51.8 },
        objectives = {
            { type = "kill", name = "Captain Dargol", spawns = {{50.8, 26.4}} },
            { type = "item", name = "Dargol's Skull", spawns = {{50.8, 26.4}} },
        }
    },

    [402] = { -- Spectar's End
        name = "Spectar's End",
        zone = "Tirisfal Glades",
        start = { npc = "Magistrate Sevren", x = 60.8, y = 52.6 },
        objectives = {
            { type = "kill", name = "Spectar", spawns = {{64.1, 25.8}} },
        }
    },

    [359] = { -- Gordo's Task
        name = "Gordo's Task",
        zone = "Tirisfal Glades",
        start = { npc = "Gordo", x = 52.8, y = 55.4 },
        objectives = {
            { type = "talk", name = "Junior Apothecary Holland", spawns = {{61.8, 52.1}} },
        }
    },

    -----------------------------------------
    -- Silverpine Forest Quests (Horde 10-20)
    -----------------------------------------

    [421] = { -- Proving Allegiance
        name = "Proving Allegiance",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Ravenclaw Guardian", spawns = {
                {52.1, 71.4}, {53.8, 69.2}, {50.5, 73.1}, {54.2, 70.8}
            }},
        }
    },

    [422] = { -- Proving Allegiance
        name = "Proving Allegiance",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "item", name = "Ravenclaw Talon", spawns = {
                {52.1, 71.4}, {53.8, 69.2}, {50.5, 73.1}, {54.2, 70.8}
            }},
        }
    },

    [423] = { -- Proving Allegiance
        name = "Proving Allegiance",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Lord Malathrom", spawns = {{53.5, 70.5}} },
        }
    },

    [424] = { -- The Decrepit Ferry
        name = "The Decrepit Ferry",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "item", name = "Decrepit Ferry Schedule", spawns = {{51.2, 36.8}} },
        }
    },

    [425] = { -- Return to the Sepulcher
        name = "Return to the Sepulcher",
        zone = "Silverpine Forest",
        start = { npc = "Decrepit Ferry Schedule", x = 51.2, y = 36.8 },
        objectives = {
            { type = "talk", name = "High Executor Darthalia", spawns = {{43.4, 40.8}} },
        }
    },

    [429] = { -- The Assassination of Harold Lane
        name = "The Assassination of Harold Lane",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Harold Lane", spawns = {{51.8, 36.4}} },
        }
    },

    [430] = { -- Escorting Erland
        name = "Escorting Erland",
        zone = "Silverpine Forest",
        start = { npc = "Erland", x = 51.5, y = 36.2 },
        objectives = {
            { type = "talk", name = "Rane Yorick", spawns = {{54.2, 29.5}} },
        }
    },

    [450] = { -- Pyrewood Ambush
        name = "Pyrewood Ambush",
        zone = "Silverpine Forest",
        start = { npc = "Deathstalker Faerleia", x = 43.2, y = 41.2 },
        objectives = {
            { type = "kill", name = "Pyrewood Elder", spawns = {
                {44.8, 72.5}, {46.2, 71.1}, {43.5, 73.8}, {47.1, 70.2}
            }},
            { type = "kill", name = "Pyrewood Sentry", spawns = {
                {45.2, 71.8}, {46.8, 72.4}, {44.1, 73.1}, {47.5, 71.5}
            }},
        }
    },

    [451] = { -- Pyrewood Councilman
        name = "Pyrewood Councilman",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 },
        objectives = {
            { type = "kill", name = "Pyrewood Council", spawns = {
                {44.8, 72.5}, {46.2, 71.1}, {43.5, 73.8}, {47.1, 70.2}
            }},
        }
    },

    [452] = { -- Arugal's Folly
        name = "Arugal's Folly",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.2, y = 39.5 },
        objectives = {
            { type = "item", name = "Remedy of Arugal", spawns = {
                {63.1, 62.8}, {64.5, 61.2}, {62.2, 64.1}
            }},
        }
    },

    [453] = { -- Arugal's Folly
        name = "Arugal's Folly",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.2, y = 39.5 },
        objectives = {
            { type = "talk", name = "Gorefang", spawns = {{42.8, 51.2}} },
            { type = "item", name = "Gorefang's Claw", spawns = {{42.8, 51.2}} },
        }
    },

    [454] = { -- Arugal's Folly
        name = "Arugal's Folly",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.2, y = 39.5 },
        objectives = {
            { type = "kill", name = "Moonrage Whitescalp", spawns = {
                {41.5, 50.2}, {42.8, 48.5}, {40.2, 51.8}, {43.5, 49.1}
            }},
            { type = "kill", name = "Moonrage Darkrunner", spawns = {
                {42.1, 49.8}, {43.2, 47.5}, {41.8, 52.1}, {44.1, 50.5}
            }},
        }
    },

    [455] = { -- Arugal's Folly
        name = "Arugal's Folly",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.2, y = 39.5 },
        objectives = {
            { type = "talk", name = "Archmage Arugal", spawns = {{44.8, 68.2}} },
        }
    },

    [478] = { -- Maps and Runes
        name = "Maps and Runes",
        zone = "Silverpine Forest",
        start = { npc = "Shadow Priest Allister", x = 43.0, y = 41.8 },
        objectives = {
            { type = "item", name = "Dalaran Tome", spawns = {{55.8, 69.4}} },
            { type = "item", name = "Dalaran Rune", spawns = {{57.1, 72.5}} },
        }
    },

    [480] = { -- Border Crossings
        name = "Border Crossings",
        zone = "Silverpine Forest",
        start = { npc = "Shadow Priest Allister", x = 43.0, y = 41.8 },
        objectives = {
            { type = "talk", name = "Apothecary Renferrel", spawns = {{42.0, 40.5}} },
        }
    },

    [481] = { -- Maps and Runes
        name = "Maps and Runes",
        zone = "Silverpine Forest",
        start = { npc = "Shadow Priest Allister", x = 43.0, y = 41.8 },
        objectives = {
            { type = "item", name = "Dalaran Pendant", spawns = {{55.1, 73.8}} },
        }
    },

    [482] = { -- Ambermill Relic
        name = "Ambermill Relic",
        zone = "Silverpine Forest",
        start = { npc = "Shadow Priest Allister", x = 43.0, y = 41.8 },
        objectives = {
            { type = "item", name = "Ambermill Relic", spawns = {{56.2, 68.1}} },
        }
    },

    [483] = { -- Dalaran's Intentions
        name = "Dalaran's Intentions",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "kill", name = "Dalaran Apprentice", spawns = {
                {54.8, 71.2}, {56.4, 69.5}, {53.5, 72.8}, {57.1, 70.1}
            }},
            { type = "kill", name = "Dalaran Theurgist", spawns = {
                {55.2, 70.5}, {56.8, 68.8}, {54.1, 71.8}, {57.5, 69.2}
            }},
        }
    },

    [442] = { -- Rot Hide Origins
        name = "Rot Hide Origins",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "kill", name = "Rot Hide Gnoll", spawns = {
                {33.5, 15.2}, {35.1, 13.8}, {32.2, 16.5}, {36.4, 14.1}
            }},
            { type = "item", name = "Rot Hide Ichor", spawns = {
                {33.5, 15.2}, {35.1, 13.8}, {32.2, 16.5}, {36.4, 14.1}
            }},
        }
    },

    [443] = { -- Rot Hide Gnolls
        name = "Rot Hide Gnolls",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "kill", name = "Rot Hide Graverobber", spawns = {
                {34.2, 16.8}, {35.5, 14.5}, {33.1, 17.2}, {36.8, 15.1}
            }},
            { type = "kill", name = "Rot Hide Brute", spawns = {
                {33.8, 15.8}, {35.8, 13.2}, {32.5, 17.5}, {37.1, 14.8}
            }},
        }
    },

    [444] = { -- Ivar's Head
        name = "Ivar's Head",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "kill", name = "Ivar the Foul", spawns = {{44.2, 18.5}} },
            { type = "item", name = "Ivar's Head", spawns = {{44.2, 18.5}} },
        }
    },

    [445] = { -- The Dead Fields
        name = "The Dead Fields",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Ravenclaw Servant", spawns = {
                {49.8, 73.5}, {51.2, 71.8}, {48.5, 75.1}, {52.1, 72.4}
            }},
            { type = "kill", name = "Ravenclaw Slave", spawns = {
                {50.2, 72.8}, {51.8, 70.5}, {49.1, 74.2}, {52.5, 71.1}
            }},
        }
    },

    [446] = { -- The Dead Fields
        name = "The Dead Fields",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Ravenclaw Drudger", spawns = {
                {50.5, 73.2}, {52.1, 71.5}, {49.2, 74.8}, {53.1, 72.1}
            }},
        }
    },

    [447] = { -- The Worn Doll
        name = "The Worn Doll",
        zone = "Silverpine Forest",
        start = { npc = "Ravenclaw Drudger", x = 50.5, y = 73.2 },
        objectives = {
            { type = "talk", name = "High Executor Darthalia", spawns = {{43.4, 40.8}} },
        }
    },

    [1797] = { -- Deathstalkers in Shadowfang
        name = "Deathstalkers in Shadowfang",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 },
        objectives = {
            { type = "talk", name = "Deathstalker Adamant", spawns = {{43.8, 68.4}} },
        }
    },

    [1798] = { -- The Book of Ur
        name = "The Book of Ur",
        zone = "Silverpine Forest",
        start = { npc = "Keeper Bel'dugur", x = 63.8, y = 47.2 },
        objectives = {
            { type = "item", name = "The Book of Ur", spawns = {{44.5, 68.8}} },
        }
    },

    [1013] = { -- A Wand for Bethor
        name = "A Wand for Bethor",
        zone = "Silverpine Forest",
        start = { npc = "Dalar Dawnweaver", x = 44.2, y = 39.5 },
        objectives = {
            { type = "talk", name = "Bethor Iceshard", spawns = {{62.1, 48.2}} },
        }
    },

    [1014] = { -- The Engraved Ring
        name = "The Engraved Ring",
        zone = "Silverpine Forest",
        start = { npc = "Engraved Ring", x = 62.4, y = 64.8 },
        objectives = {
            { type = "talk", name = "Magistrate Sevren", spawns = {{60.8, 52.6}} },
        }
    },

    [1004] = { -- The Weaver
        name = "The Weaver",
        zone = "Silverpine Forest",
        start = { npc = "Rane Yorick", x = 54.2, y = 29.5 },
        objectives = {
            { type = "kill", name = "The Weaver", spawns = {{49.5, 31.2}} },
        }
    },

    [1002] = { -- Lost Deathstalkers
        name = "Lost Deathstalkers",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 },
        objectives = {
            { type = "talk", name = "Deathstalker Lesh", spawns = {{61.8, 28.5}} },
        }
    },

    [1003] = { -- Wild Hearts
        name = "Wild Hearts",
        zone = "Silverpine Forest",
        start = { npc = "Rane Yorick", x = 54.2, y = 29.5 },
        objectives = {
            { type = "kill", name = "Mottled Worg", spawns = {
                {48.2, 32.8}, {49.5, 30.5}, {47.1, 34.1}, {50.2, 31.2}
            }},
            { type = "item", name = "Worg Heart", spawns = {
                {48.2, 32.8}, {49.5, 30.5}, {47.1, 34.1}, {50.2, 31.2}
            }},
        }
    },

    [1000] = { -- Supplying the Sepulcher
        name = "Supplying the Sepulcher",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Johaan", x = 59.4, y = 52.3 },
        objectives = {
            { type = "talk", name = "Apothecary Renferrel", spawns = {{42.0, 40.5}} },
        }
    },

    [1001] = { -- Journey to Undercity
        name = "Journey to Undercity",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "talk", name = "Varimathras", spawns = {{56.1, 92.1}} },
        }
    },

    [435] = { -- Front Lines
        name = "Front Lines",
        zone = "Silverpine Forest",
        start = { npc = "Executor Arren", x = 38.1, y = 56.6 },
        objectives = {
            { type = "talk", name = "High Executor Darthalia", spawns = {{43.4, 40.8}} },
        }
    },

    [479] = { -- A Recipe For Death
        name = "A Recipe For Death",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "item", name = "Sample of Rot", spawns = {{33.5, 15.2}} },
        }
    },

    [477] = { -- A Recipe For Death
        name = "A Recipe For Death",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "kill", name = "Moss Stalker", spawns = {
                {52.8, 24.5}, {54.1, 22.8}, {51.5, 25.8}, {55.2, 23.1}
            }},
            { type = "item", name = "Moss Stalker Fang", spawns = {
                {52.8, 24.5}, {54.1, 22.8}, {51.5, 25.8}, {55.2, 23.1}
            }},
        }
    },

    [476] = { -- A Recipe For Death
        name = "A Recipe For Death",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "talk", name = "Master Apothecary Faranell", spawns = {{48.8, 69.5}} },
        }
    },

    [491] = { -- Fenris Isle
        name = "Fenris Isle",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "item", name = "Thule's Phylactery", spawns = {{62.5, 33.8}} },
        }
    },

    [492] = { -- Destroy the Legion
        name = "Destroy the Legion",
        zone = "Silverpine Forest",
        start = { npc = "Shadow Priest Allister", x = 43.0, y = 41.8 },
        objectives = {
            { type = "kill", name = "Son of Arugal", spawns = {
                {40.8, 48.2}, {42.5, 46.5}, {39.5, 49.8}, {43.2, 47.1}
            }},
        }
    },

    [493] = { -- The Weavers
        name = "The Weavers",
        zone = "Silverpine Forest",
        start = { npc = "Rane Yorick", x = 54.2, y = 29.5 },
        objectives = {
            { type = "kill", name = "Black Widow", spawns = {
                {50.1, 28.8}, {51.5, 26.2}, {48.8, 30.5}, {52.2, 27.1}
            }},
            { type = "item", name = "Black Widow Venom", spawns = {
                {50.1, 28.8}, {51.5, 26.2}, {48.8, 30.5}, {52.2, 27.1}
            }},
        }
    },

    [494] = { -- Earth and Earth
        name = "Earth and Earth",
        zone = "Silverpine Forest",
        start = { npc = "Rane Yorick", x = 54.2, y = 29.5 },
        objectives = {
            { type = "kill", name = "Earthcaller", spawns = {
                {76.2, 62.5}, {77.8, 60.8}, {75.1, 63.8}, {78.5, 61.2}
            }},
            { type = "item", name = "Earthcaller Staff", spawns = {
                {76.2, 62.5}, {77.8, 60.8}, {75.1, 63.8}, {78.5, 61.2}
            }},
        }
    },

    [523] = { -- Thule Ravenclaw
        name = "Thule Ravenclaw",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "kill", name = "Thule Ravenclaw", spawns = {{62.2, 33.5}} },
        }
    },

    [524] = { -- Report to Hadrec
        name = "Report to Hadrec",
        zone = "Silverpine Forest",
        start = { npc = "Thule Ravenclaw", x = 62.2, y = 33.5 },
        objectives = {
            { type = "talk", name = "High Executor Hadrec", spawns = {{43.5, 40.5}} },
        }
    },

    [440] = { -- Silverpine Moss
        name = "Silverpine Moss",
        zone = "Silverpine Forest",
        start = { npc = "Apothecary Renferrel", x = 42.0, y = 40.5 },
        objectives = {
            { type = "item", name = "Silverpine Moss", spawns = {
                {35.8, 15.2}, {37.2, 13.8}, {34.5, 16.5}, {38.1, 14.1}
            }},
        }
    },

    [441] = { -- Journey to Hillsbrad Foothills
        name = "Journey to Hillsbrad Foothills",
        zone = "Silverpine Forest",
        start = { npc = "High Executor Darthalia", x = 43.4, y = 40.8 },
        objectives = {
            { type = "talk", name = "High Executor Darthalia", spawns = {{62.5, 20.1}} },
        }
    },

    [448] = { -- Resting in Pieces
        name = "Resting in Pieces",
        zone = "Silverpine Forest",
        start = { npc = "Rane Yorick", x = 54.2, y = 29.5 },
        objectives = {
            { type = "item", name = "Deliah's Ring", spawns = {{49.8, 35.2}} },
        }
    },

    [449] = { -- Return the Ring
        name = "Return the Ring",
        zone = "Silverpine Forest",
        start = { npc = "Deliah's Ring", x = 49.8, y = 35.2 },
        objectives = {
            { type = "talk", name = "Rane Yorick", spawns = {{54.2, 29.5}} },
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
    
    [6] = { -- Eagan Peltskinner
        name = "Eagan Peltskinner",
        zone = "Elwynn Forest",
        start = { npc = "Llane Beshere", x = 50.2, y = 42.3 },
        objectives = {
            { type = "talk", name = "Eagan Peltskinner", spawns = {{48.1, 40.2}} },
        }
    },
    
    [33] = { -- Wolves Across the Border
        name = "Wolves Across the Border",
        zone = "Elwynn Forest",
        start = { npc = "Eagan Peltskinner", x = 48.1, y = 40.2 },
        objectives = {
            { type = "kill", name = "Young Wolf", spawns = {
                {46.5, 37.8}, {45.2, 39.1}, {44.8, 36.5}, {47.2, 38.5}
            }},
        }
    },
    
    [52] = { -- Bounty on Garrick Padfoot
        name = "Bounty on Garrick Padfoot",
        zone = "Elwynn Forest",
        start = { npc = "Deputy Willem", x = 48.2, y = 42.8 },
        objectives = {
            { type = "kill", name = "Garrick Padfoot", spawns = {{57.5, 48.5}} },
        }
    },
    
    [60] = { -- Report to Marshal McBride
        name = "Report to Marshal McBride",
        zone = "Elwynn Forest",
        start = { npc = "Sergeant Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "talk", name = "Marshal McBride", spawns = {{48.9, 41.6}} },
        }
    },
    
    [76] = { -- Milly Osworth
        name = "Milly Osworth",
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "talk", name = "Milly Osworth", spawns = {{50.5, 39.2}} },
        }
    },
    
    [3903] = { -- Milly's Harvest
        name = "Milly's Harvest",
        zone = "Elwynn Forest",
        start = { npc = "Milly Osworth", x = 50.5, y = 39.2 },
        objectives = {
            { type = "item", name = "Milly's Harvest", spawns = {
                {54.1, 48.5}, {55.2, 47.1}, {53.5, 49.8}, {56.1, 46.2}
            }},
        }
    },
    
    [3904] = { -- Grape Manifest
        name = "Grape Manifest",
        zone = "Elwynn Forest",
        start = { npc = "Milly Osworth", x = 50.5, y = 39.2 },
        objectives = {
            { type = "talk", name = "Brother Neals", spawns = {{49.6, 40.2}} },
        }
    },
    
    [85] = { -- Lost Necklace
        name = "Lost Necklace",
        zone = "Elwynn Forest",
        start = { npc = "Billy Maclure", x = 43.2, y = 85.8 },
        objectives = {
            { type = "talk", name = "Maybell Maclure", spawns = {{43.2, 89.5}} },
        }
    },
    
    [86] = { -- Pie for Billy
        name = "Pie for Billy",
        zone = "Elwynn Forest",
        start = { npc = "Maybell Maclure", x = 43.2, y = 89.5 },
        objectives = {
            { type = "item", name = "Pork Belly Pie", spawns = {{34.5, 84.2}} },
        }
    },
    
    [87] = { -- Back to Billy
        name = "Back to Billy",
        zone = "Elwynn Forest",
        start = { npc = "Gramma Stonefield", x = 34.5, y = 84.2 },
        objectives = {
            { type = "talk", name = "Billy Maclure", spawns = {{43.2, 85.8}} },
        }
    },
    
    [106] = { -- Young Lovers
        name = "Young Lovers",
        zone = "Elwynn Forest",
        start = { npc = "Maybell Maclure", x = 43.2, y = 89.5 },
        objectives = {
            { type = "talk", name = "Tommy Joe Stonefield", spawns = {{29.8, 86.0}} },
        }
    },
    
    [111] = { -- Speak with Gramma
        name = "Speak with Gramma",
        zone = "Elwynn Forest",
        start = { npc = "Tommy Joe Stonefield", x = 29.8, y = 86.0 },
        objectives = {
            { type = "talk", name = "Gramma Stonefield", spawns = {{34.5, 84.2}} },
        }
    },
    
    [107] = { -- Note to William
        name = "Note to William",
        zone = "Elwynn Forest",
        start = { npc = "Gramma Stonefield", x = 34.5, y = 84.2 },
        objectives = {
            { type = "talk", name = "William Pestle", spawns = {{41.8, 67.2}} },
        }
    },
    
    [112] = { -- Collecting Kelp
        name = "Collecting Kelp",
        zone = "Elwynn Forest",
        start = { npc = "William Pestle", x = 41.8, y = 67.2 },
        objectives = {
            { type = "item", name = "Crystal Kelp Frond", spawns = {
                {52.1, 88.5}, {53.8, 91.2}, {50.2, 89.8}
            }},
        }
    },
    
    [114] = { -- The Escape
        name = "The Escape",
        zone = "Elwynn Forest",
        start = { npc = "William Pestle", x = 41.8, y = 67.2 },
        objectives = {
            { type = "talk", name = "Maybell Maclure", spawns = {{43.2, 89.5}} },
        }
    },
    
    [176] = { -- Wanted: "Hogger"
        name = "Wanted: \"Hogger\"",
        zone = "Elwynn Forest",
        start = { npc = "Wanted Poster", x = 42.1, y = 65.5 },
        objectives = {
            { type = "kill", name = "Hogger", spawns = {{28.5, 80.0}} },
        }
    },
    
    [83] = { -- Westbrook Garrison Needs Help!
        name = "Westbrook Garrison Needs Help!",
        zone = "Elwynn Forest",
        start = { npc = "Marshal Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "talk", name = "Deputy Rainer", spawns = {{24.2, 74.5}} },
        }
    },
    
    [239] = { -- Riverpaw Gnoll Bounty
        name = "Riverpaw Gnoll Bounty",
        zone = "Elwynn Forest",
        start = { npc = "Deputy Rainer", x = 24.2, y = 74.5 },
        objectives = {
            { type = "item", name = "Painted Gnoll Armband", spawns = {
                {24.5, 78.2}, {22.1, 80.5}, {25.8, 76.1}, {21.5, 82.5}
            }},
        }
    },
    
    [39] = { -- The Fargodeep Mine
        name = "The Fargodeep Mine",
        zone = "Elwynn Forest",
        start = { npc = "Marshal Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "explore", name = "Fargodeep Mine", spawns = {{39.8, 82.1}} },
        }
    },
    
    [62] = { -- The Jasperlode Mine
        name = "The Jasperlode Mine",
        zone = "Elwynn Forest",
        start = { npc = "Marshal Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "explore", name = "Jasperlode Mine", spawns = {{60.5, 50.2}} },
        }
    },
    
    [59] = { -- Finishing Training
        name = "Finishing Training",
        zone = "Elwynn Forest",
        start = { npc = "Class Trainer", x = 48.9, y = 41.6 },
        objectives = {
            { type = "talk", name = "Goldshire Inn Trainer", spawns = {{42.8, 65.8}} },
        }
    },
    
    [46] = { -- Further Concerns
        name = "Further Concerns",
        zone = "Elwynn Forest",
        start = { npc = "Marshal Dughan", x = 42.1, y = 65.9 },
        objectives = {
            { type = "talk", name = "Guard Thomas", spawns = {{73.8, 72.2}} },
        }
    },
    
    [71] = { -- A Bundle of Trouble
        name = "A Bundle of Trouble",
        zone = "Elwynn Forest",
        start = { npc = "Supervisor Raelen", x = 81.5, y = 66.5 },
        objectives = {
            { type = "item", name = "Bundle of Wood", spawns = {
                {84.2, 78.5}, {85.8, 76.2}, {83.1, 80.1}, {86.5, 74.8}
            }},
        }
    },
    
    [45] = { -- Find the Lost Guards
        name = "Find the Lost Guards",
        zone = "Elwynn Forest",
        start = { npc = "Guard Thomas", x = 73.8, y = 72.2 },
        objectives = {
            { type = "explore", name = "Guard's Body", spawns = {{72.5, 60.2}} },
        }
    },
    
    [37] = { -- Discover Rolf's Fate
        name = "Discover Rolf's Fate",
        zone = "Elwynn Forest",
        start = { npc = "Guard's Corpse", x = 72.5, y = 60.2 },
        objectives = {
            { type = "explore", name = "Rolf's Corpse", spawns = {{79.8, 55.5}} },
        }
    },
    
    [35] = { -- Report to Thomas
        name = "Report to Thomas",
        zone = "Elwynn Forest",
        start = { npc = "Rolf's Corpse", x = 79.8, y = 55.5 },
        objectives = {
            { type = "talk", name = "Guard Thomas", spawns = {{73.8, 72.2}} },
        }
    },
    
    [71] = { -- Deliver Thomas' Report
        name = "Deliver Thomas' Report",
        zone = "Elwynn Forest",
        start = { npc = "Guard Thomas", x = 73.8, y = 72.2 },
        objectives = {
            { type = "talk", name = "Marshal Dughan", spawns = {{42.1, 65.9}} },
        }
    },
    
    [61] = { -- Cloth and Leather Armor
        name = "Cloth and Leather Armor",
        zone = "Elwynn Forest",
        start = { npc = "Guard Thomas", x = 73.8, y = 72.2 },
        objectives = {
            { type = "talk", name = "Sara Timberlain", spawns = {{79.5, 68.8}} },
        }
    },
    
    [5545] = { -- Red Linen Goods
        name = "Red Linen Goods",
        zone = "Elwynn Forest",
        start = { npc = "Sara Timberlain", x = 79.5, y = 68.8 },
        objectives = {
            { type = "item", name = "Red Linen Bandana", spawns = {
                {86.5, 78.2}, {84.2, 80.5}, {88.1, 76.8}
            }},
        }
    },
    
    [84] = { -- Princess Must Die!
        name = "Princess Must Die!",
        zone = "Elwynn Forest",
        start = { npc = "Ma Stonefield", x = 34.5, y = 84.2 },
        objectives = {
            { type = "kill", name = "Princess", spawns = {{43.2, 86.8}} },
        }
    },
    
    [88] = { -- Goldtooth
        name = "Goldtooth",
        zone = "Elwynn Forest",
        start = { npc = "Billy Maclure", x = 43.2, y = 85.8 },
        objectives = {
            { type = "kill", name = "Goldtooth", spawns = {{42.1, 78.5}} },
        }
    },
    
    [3100] = { -- A Warrior's Training
        name = "A Warrior's Training",
        zone = "Elwynn Forest",
        start = { npc = "Llane Beshere", x = 50.2, y = 42.3 },
        objectives = {
            { type = "talk", name = "Harry Burlguard", spawns = {{41.8, 65.5}} },
        }
    },
    
    [3101] = { -- A Rogue's Training
        name = "A Rogue's Training",
        zone = "Elwynn Forest",
        start = { npc = "Jorik Kerridan", x = 50.5, y = 42.5 },
        objectives = {
            { type = "talk", name = "Keryn Sylvius", spawns = {{43.8, 65.8}} },
        }
    },
    
    [3102] = { -- A Paladin's Training
        name = "A Paladin's Training",
        zone = "Elwynn Forest",
        start = { npc = "Brother Sammuel", x = 50.8, y = 42.2 },
        objectives = {
            { type = "talk", name = "Brother Wilhelm", spawns = {{42.1, 65.9}} },
        }
    },
    
    [3103] = { -- A Mage's Training
        name = "A Mage's Training",
        zone = "Elwynn Forest",
        start = { npc = "Khelden Bremen", x = 49.8, y = 39.5 },
        objectives = {
            { type = "talk", name = "Zaldimar Wefhellt", spawns = {{43.5, 66.2}} },
        }
    },
    
    [3104] = { -- A Priest's Training
        name = "A Priest's Training",
        zone = "Elwynn Forest",
        start = { npc = "Priestess Anetta", x = 49.8, y = 42.1 },
        objectives = {
            { type = "talk", name = "Priestess Josetta", spawns = {{43.2, 65.5}} },
        }
    },
    
    [5623] = { -- Rest and Relaxation
        name = "Rest and Relaxation",
        zone = "Elwynn Forest",
        start = { npc = "Marshal McBride", x = 48.9, y = 41.6 },
        objectives = {
            { type = "talk", name = "Innkeeper Farley", spawns = {{43.8, 65.5}} },
        }
    },
    
    [131] = { -- Stormwind Wine
        name = "Stormwind Wine",
        zone = "Elwynn Forest",
        start = { npc = "Innkeeper Farley", x = 43.8, y = 65.5 },
        objectives = {
            { type = "talk", name = "William Pestle", spawns = {{41.8, 67.2}} },
        }
    },
    
    [129] = { -- Wine Shop Advert
        name = "Wine Shop Advert",
        zone = "Elwynn Forest",
        start = { npc = "William Pestle", x = 41.8, y = 67.2 },
        objectives = {
            { type = "talk", name = "Stormwind Wine Merchant", spawns = {{41.8, 67.2}} },
        }
    },
    
    [115] = { -- A Husband's Last Battle
        name = "A Husband's Last Battle",
        zone = "Elwynn Forest",
        start = { npc = "Gramma Stonefield", x = 34.5, y = 84.2 },
        objectives = {
            { type = "item", name = "Parker's Lunch", spawns = {
                {24.8, 76.5}
            }},
        }
    },
    
    -----------------------------------------
    -- Teldrassil Quests (Complete - Shadowglen, Dolanaar, Lake Al'Ameth, Ban'ethil Barrow Den)
    -----------------------------------------
    
    -- ========================================
    -- SHADOWGLEN (Level 1-6)
    -- ========================================
    
    [456] = { -- The Balance of Nature (Part 1)
        name = "The Balance of Nature",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "kill", name = "Young Nightsaber", spawns = {
                {58.2, 42.1}, {59.5, 40.8}, {57.1, 43.5}, {60.2, 41.2},
                {56.8, 42.8}, {61.1, 43.1}, {57.5, 44.8}, {59.8, 42.5}
            }},
            { type = "kill", name = "Young Thistle Boar", spawns = {
                {57.8, 44.2}, {59.1, 42.8}, {56.5, 45.1}, {60.5, 43.5},
                {58.5, 46.2}, {55.8, 44.5}, {61.2, 45.8}, {57.2, 47.1}
            }},
        }
    },
    
    [457] = { -- The Balance of Nature (Part 2)
        name = "The Balance of Nature",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "kill", name = "Mangy Nightsaber", spawns = {
                {55.2, 46.8}, {56.8, 48.2}, {54.1, 45.5}, {57.5, 47.1},
                {53.8, 48.8}, {58.2, 46.5}, {55.5, 49.2}, {52.8, 47.5}
            }},
            { type = "kill", name = "Thistle Boar", spawns = {
                {54.8, 48.5}, {56.2, 46.1}, {53.5, 49.2}, {57.1, 47.8},
                {52.8, 50.1}, {55.1, 51.5}, {58.2, 49.8}, {54.2, 52.2}
            }},
        }
    },
    
    [458] = { -- The Woodland Protector (Part 1)
        name = "The Woodland Protector",
        zone = "Teldrassil",
        start = { npc = "Melithar Staghelm", x = 59.0, y = 42.4 },
        objectives = {
            { type = "talk", name = "Tarindrella", spawns = {{60.7, 46.1}} },
        }
    },
    
    [459] = { -- The Woodland Protector (Part 2)
        name = "The Woodland Protector",
        zone = "Teldrassil",
        start = { npc = "Tarindrella", x = 60.7, y = 46.1 },
        objectives = {
            { type = "kill", name = "Grell", spawns = {
                {54.2, 39.8}, {55.8, 38.1}, {53.1, 41.2}, {56.5, 40.5},
                {52.5, 38.8}, {57.2, 39.2}, {54.8, 37.5}, {55.5, 41.8}
            }},
            { type = "kill", name = "Grellkin", spawns = {
                {53.8, 40.2}, {55.1, 38.8}, {52.5, 42.1}, {56.2, 39.5},
                {51.8, 40.8}, {57.5, 38.2}, {54.2, 41.5}, {53.1, 39.5}
            }},
        }
    },
    
    [3116] = { -- Webwood Venom
        name = "Webwood Venom",
        zone = "Teldrassil",
        start = { npc = "Gilshalan Windwalker", x = 57.8, y = 41.6 },
        objectives = {
            { type = "kill", name = "Webwood Spider", spawns = {
                {55.2, 32.8}, {56.5, 34.2}, {54.1, 33.5}, {57.2, 31.8},
                {53.8, 35.1}, {58.1, 33.2}, {55.8, 30.5}, {56.2, 35.8}
            }},
        }
    },
    
    [3117] = { -- Webwood Corruption
        name = "Webwood Corruption",
        zone = "Teldrassil",
        start = { npc = "Gilshalan Windwalker", x = 57.8, y = 41.6 },
        objectives = {
            { type = "kill", name = "Githyiss the Vile", spawns = {{57.1, 28.5}} },
        }
    },
    
    [3118] = { -- Tenaron's Summons
        name = "Tenaron's Summons",
        zone = "Teldrassil",
        start = { npc = "Gilshalan Windwalker", x = 57.8, y = 41.6 },
        objectives = {
            { type = "talk", name = "Tenaron Stormgrip", spawns = {{59.2, 39.4}} },
        }
    },
    
    [930] = { -- Crown of the Earth (Part 1)
        name = "Crown of the Earth",
        zone = "Teldrassil",
        start = { npc = "Tenaron Stormgrip", x = 59.2, y = 39.4 },
        objectives = {
            { type = "item", name = "Filled Jade Phial", spawns = {{59.9, 42.5}} },
        }
    },
    
    [5923] = { -- A Good Friend
        name = "A Good Friend",
        zone = "Teldrassil",
        start = { npc = "Iverron", x = 54.4, y = 50.8 },
        objectives = {
            { type = "talk", name = "Dirania Silvershine", spawns = {{59.8, 42.2}} },
        }
    },
    
    [5924] = { -- A Friend in Need
        name = "A Friend in Need",
        zone = "Teldrassil",
        start = { npc = "Dirania Silvershine", x = 59.8, y = 42.2 },
        objectives = {
            { type = "item", name = "Iverron's Antidote", spawns = {{54.4, 50.8}} },
        }
    },
    
    -- Class Sigils (Shadowglen)
    [3519] = { -- Simple Sigil (Warrior)
        name = "Simple Sigil",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "talk", name = "Alyissia", spawns = {{59.6, 40.4}} },
        }
    },
    
    [3520] = { -- Encrypted Sigil (Rogue)
        name = "Encrypted Sigil",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "talk", name = "Frahun Shadewhisper", spawns = {{59.6, 38.6}} },
        }
    },
    
    [3521] = { -- Etched Sigil (Hunter)
        name = "Etched Sigil",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "talk", name = "Ayanna Everstride", spawns = {{59.2, 40.2}} },
        }
    },
    
    [3522] = { -- Glyphic Sigil (Priest)
        name = "Glyphic Sigil",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "talk", name = "Shanda", spawns = {{59.4, 40.6}} },
        }
    },
    
    [2159] = { -- The Verdant Sigil (Druid)
        name = "The Verdant Sigil",
        zone = "Teldrassil",
        start = { npc = "Conservator Ilthalaine", x = 58.6, y = 44.5 },
        objectives = {
            { type = "talk", name = "Mardant Strongoak", spawns = {{59.8, 39.8}} },
        }
    },
    
    -- ========================================
    -- DOLANAAR (Level 5-12)
    -- ========================================
    
    [931] = { -- Crown of the Earth (Part 2)
        name = "Crown of the Earth",
        zone = "Teldrassil",
        start = { npc = "Corithras Moonrage", x = 56.0, y = 61.8 },
        objectives = {
            { type = "item", name = "Filled Amethyst Phial", spawns = {{63.2, 58.1}} },
        }
    },
    
    [933] = { -- Crown of the Earth (Part 3)
        name = "Crown of the Earth",
        zone = "Teldrassil",
        start = { npc = "Corithras Moonrage", x = 56.0, y = 61.8 },
        objectives = {
            { type = "item", name = "Filled Crystal Phial", spawns = {{51.4, 44.2}} },
        }
    },
    
    [935] = { -- Crown of the Earth (Part 4)
        name = "Crown of the Earth",
        zone = "Teldrassil",
        start = { npc = "Corithras Moonrage", x = 56.0, y = 61.8 },
        objectives = {
            { type = "item", name = "Filled Tourmaline Phial", spawns = {{41.2, 34.5}} },
        }
    },
    
    [937] = { -- Crown of the Earth (Part 5)
        name = "Crown of the Earth",
        zone = "Teldrassil",
        start = { npc = "Corithras Moonrage", x = 56.0, y = 61.8 },
        objectives = {
            { type = "talk", name = "Arch Druid Fandral Staghelm", spawns = {{34.8, 8.2}} },
        }
    },

    [475] = { -- A Troubling Breeze
        name = "A Troubling Breeze",
        zone = "Teldrassil",
        start = { npc = "Athridas Bearmantle", x = 56.0, y = 57.3 },
        objectives = {
            { type = "talk", name = "Gaerolas Talvethren", spawns = {{66.2, 58.4}} },
        }
    },
    
    [476] = { -- Gnarlpine Corruption
        name = "Gnarlpine Corruption",
        zone = "Teldrassil",
        start = { npc = "Gaerolas Talvethren", x = 66.2, y = 58.4 },
        objectives = {
            { type = "talk", name = "Athridas Bearmantle", spawns = {{56.0, 57.3}} },
        }
    },
    
    [483] = { -- The Emerald Dreamcatcher
        name = "The Emerald Dreamcatcher",
        zone = "Teldrassil",
        start = { npc = "Tallonkai Swiftroot", x = 55.4, y = 56.3 },
        objectives = {
            { type = "item", name = "Emerald Dreamcatcher", spawns = {{68.1, 59.2}} },
        }
    },
    
    [486] = { -- Ferocitas the Dream Eater
        name = "Ferocitas the Dream Eater",
        zone = "Teldrassil",
        start = { npc = "Tallonkai Swiftroot", x = 55.4, y = 56.3 },
        objectives = {
            { type = "kill", name = "Ferocitas the Dream Eater", spawns = {{68.5, 53.2}} },
        }
    },
    
    [2438] = { -- The Road to Darnassus
        name = "The Road to Darnassus",
        zone = "Teldrassil",
        start = { npc = "Moon Priestess Amara", x = 55.8, y = 59.8 },
        objectives = {
            { type = "kill", name = "Gnarlpine Ambusher", spawns = {
                {49.2, 52.5}, {47.8, 54.2}, {50.5, 51.8}, {48.5, 53.5},
                {46.2, 55.8}, {51.2, 50.2}, {49.8, 54.8}, {47.5, 51.2}
            }},
        }
    },
    
    [2399] = { -- Seek Redemption!
        name = "Seek Redemption!",
        zone = "Teldrassil",
        start = { npc = "Syral Bladeleaf", x = 56.2, y = 59.7 },
        objectives = {
            { type = "item", name = "Fel Cone", spawns = {
                {51.5, 48.5}, {48.2, 52.8}, {53.1, 46.2}, {49.8, 50.5},
                {52.5, 44.8}, {47.5, 54.1}, {50.2, 47.2}, {54.2, 48.8}
            }},
        }
    },
    
    [2518] = { -- Recipe of the Kaldorei
        name = "Recipe of the Kaldorei",
        zone = "Teldrassil",
        start = { npc = "Zarrin", x = 57.1, y = 61.3 },
        objectives = {
            { type = "item", name = "Small Spider Leg", spawns = {
                {55.2, 52.8}, {56.8, 54.2}, {54.1, 53.5}, {57.5, 51.8},
                {53.5, 55.1}, {58.2, 53.5}, {55.8, 50.8}, {56.5, 55.5}
            }},
        }
    },
    
    [488] = { -- Zenn's Bidding
        name = "Zenn's Bidding",
        zone = "Teldrassil",
        start = { npc = "Zenn Foulhoof", x = 60.6, y = 56.5 },
        objectives = {
            { type = "item", name = "Nightsaber Fang", spawns = {
                {52.5, 62.8}, {54.2, 61.5}, {51.8, 64.2}, {55.5, 63.1}
            }},
            { type = "item", name = "Strigid Owl Feather", spawns = {
                {61.2, 60.5}, {62.8, 58.2}, {60.5, 62.1}, {63.5, 61.8}
            }},
            { type = "item", name = "Webwood Ichor", spawns = {
                {55.2, 32.8}, {56.5, 34.2}, {54.1, 33.5}, {57.2, 31.8}
            }},
        }
    },
    
    [489] = { -- Oakenscowl
        name = "Oakenscowl",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "kill", name = "Oakenscowl", spawns = {{53.5, 74.8}} },
        }
    },
    
    [997] = { -- Sharing the Land
        name = "Sharing the Land",
        zone = "Teldrassil",
        start = { npc = "Neram Longclaw", x = 55.2, y = 55.0 },
        objectives = {
            { type = "kill", name = "Gnarlpine Pathfinder", spawns = {
                {45.5, 61.2}, {44.2, 63.5}, {46.8, 60.5}, {43.5, 62.8}
            }},
            { type = "kill", name = "Gnarlpine Gardener", spawns = {
                {44.8, 64.1}, {46.2, 61.8}, {43.2, 63.2}, {45.5, 62.5}
            }},
        }
    },
    
    [940] = { -- Mist
        name = "Mist",
        zone = "Teldrassil",
        start = { npc = "Sentinel Kysra", x = 51.2, y = 60.6 },
        objectives = {
            { type = "talk", name = "Mist", spawns = {{49.8, 52.8}} },
        }
    },
    
    [3119] = { -- Teldrassil: The Burden of the Kaldorei
        name = "Teldrassil: The Burden of the Kaldorei",
        zone = "Teldrassil",
        start = { npc = "Tenaron Stormgrip", x = 59.2, y = 39.4 },
        objectives = {
            { type = "talk", name = "Corithras Moonrage", spawns = {{56.0, 61.8}} },
        }
    },
    
    -- ========================================
    -- LAKE AL'AMETH & STARBREEZE VILLAGE (Denalan's Quests)
    -- ========================================
    
    [918] = { -- Denalan's Earth
        name = "Denalan's Earth",
        zone = "Teldrassil",
        start = { npc = "Syral Bladeleaf", x = 56.2, y = 59.7 },
        objectives = {
            { type = "talk", name = "Denalan", spawns = {{60.4, 68.5}} },
        }
    },
    
    [919] = { -- Rellian Greenspyre
        name = "Rellian Greenspyre",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "talk", name = "Rellian Greenspyre", spawns = {{38.5, 21.8}} },
        }
    },
    
    [922] = { -- Timberling Seeds
        name = "Timberling Seeds",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "item", name = "Timberling Seed", spawns = {
                {43.2, 58.5}, {45.5, 57.2}, {42.8, 60.1}, {46.2, 58.8},
                {44.5, 59.5}, {41.8, 61.5}, {47.2, 57.5}, {43.8, 56.2}
            }},
        }
    },
    
    [927] = { -- Timberling Sprouts
        name = "Timberling Sprouts",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "item", name = "Timberling Sprout", spawns = {
                {42.8, 61.2}, {44.5, 60.5}, {41.5, 62.8}, {45.8, 59.2},
                {43.5, 58.8}, {40.8, 64.1}, {46.5, 61.5}, {42.1, 63.5}
            }},
        }
    },
    
    [923] = { -- The Moss-twined Heart
        name = "The Moss-twined Heart",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "item", name = "Moss-twined Heart", spawns = {{46.2, 58.5}} },
        }
    },
    
    [2499] = { -- The Glowing Fruit
        name = "The Glowing Fruit",
        zone = "Teldrassil",
        start = { npc = "Glowing Fruit", x = 42.5, y = 67.5 },
        objectives = {
            { type = "talk", name = "Denalan", spawns = {{60.4, 68.5}} },
        }
    },
    
    [2178] = { -- Planting the Heart
        name = "Planting the Heart",
        zone = "Teldrassil",
        start = { npc = "Denalan", x = 60.4, y = 68.5 },
        objectives = {
            { type = "talk", name = "Denalan", spawns = {{60.4, 68.5}} },
        }
    },
    
    [929] = { -- Tumors
        name = "Tumors",
        zone = "Teldrassil",
        start = { npc = "Rellian Greenspyre", x = 38.5, y = 21.8 },
        objectives = {
            { type = "item", name = "Mossy Tumor", spawns = {
                {42.5, 57.2}, {44.8, 59.5}, {43.2, 61.1}, {46.1, 58.2},
                {41.8, 60.5}, {45.5, 57.8}, {42.8, 63.2}, {47.2, 60.8}
            }},
        }
    },
    
    [2498] = { -- The Shimmering Frond
        name = "The Shimmering Frond",
        zone = "Teldrassil",
        start = { npc = "Strange Fruited Plant", x = 34.5, y = 29.5 },
        objectives = {
            { type = "talk", name = "Denalan", spawns = {{60.4, 68.5}} },
        }
    },
    
    -- ========================================
    -- BAN'ETHIL BARROW DEN (Level 8-12)
    -- ========================================
    
    [2541] = { -- The Sleeping Druid
        name = "The Sleeping Druid",
        zone = "Teldrassil",
        start = { npc = "Oben Rageclaw", x = 45.2, y = 61.4 },
        objectives = {
            { type = "item", name = "Shaman Voodoo Charm", spawns = {{44.8, 57.5}} },
        }
    },
    
    [2459] = { -- Druid of the Claw
        name = "Druid of the Claw",
        zone = "Teldrassil",
        start = { npc = "Oben Rageclaw", x = 45.2, y = 61.4 },
        objectives = {
            { type = "kill", name = "Rageclaw", spawns = {{45.8, 57.2}} },
        }
    },
    
    [2561] = { -- Relics of Wakening
        name = "Relics of Wakening",
        zone = "Teldrassil",
        start = { npc = "Athridas Bearmantle", x = 56.0, y = 57.3 },
        objectives = {
            { type = "item", name = "Raven Claw Talisman", spawns = {{44.2, 61.5}} },
            { type = "item", name = "Black Feather Quill", spawns = {{43.8, 58.2}} },
            { type = "item", name = "Sapphire of Sky", spawns = {{45.5, 59.8}} },
            { type = "item", name = "Rune of Nesting", spawns = {{44.5, 60.2}} },
        }
    },
    
    -- ========================================
    -- ORACLE GLADE (Level 8-12)
    -- ========================================
    
    [932] = { -- Twisted Hatred
        name = "Twisted Hatred",
        zone = "Teldrassil",
        start = { npc = "Sentinel Tysha Moonblade", x = 39.0, y = 29.5 },
        objectives = {
            { type = "kill", name = "Lord Melenas", spawns = {{48.5, 36.5}} },
        }
    },
    
    [491] = { -- Ursal the Mauler
        name = "Ursal the Mauler",
        zone = "Teldrassil",
        start = { npc = "Athridas Bearmantle", x = 56.0, y = 57.3 },
        objectives = {
            { type = "kill", name = "Ursal the Mauler", spawns = {{39.2, 34.5}} },
        }
    },
    
    [938] = { -- The Enchanted Glade
        name = "The Enchanted Glade",
        zone = "Teldrassil",
        start = { npc = "Sentinel Arynia Cloudsbreak", x = 39.0, y = 29.5 },
        objectives = {
            { type = "kill", name = "Bloodfeather Harpy", spawns = {
                {35.2, 28.5}, {36.8, 30.2}, {34.5, 31.8}, {37.5, 27.2}
            }},
            { type = "kill", name = "Bloodfeather Rogue", spawns = {
                {35.8, 29.8}, {37.2, 31.5}, {34.2, 28.2}, {36.5, 32.1}
            }},
            { type = "kill", name = "Bloodfeather Sorceress", spawns = {
                {36.2, 27.8}, {34.8, 30.5}, {37.8, 29.2}, {35.5, 32.5}
            }},
            { type = "kill", name = "Bloodfeather Fury", spawns = {
                {36.5, 28.2}, {35.1, 31.2}, {37.2, 30.8}, {34.5, 29.5}
            }},
        }
    },
    
    [939] = { -- Teldrassil: Crown of Azeroth
        name = "Teldrassil: Crown of Azeroth",
        zone = "Teldrassil",
        start = { npc = "Corithras Moonrage", x = 56.0, y = 61.8 },
        objectives = {
            { type = "talk", name = "Arch Druid Fandral Staghelm", spawns = {{34.8, 8.2}} },
        }
    },
    
    -- ========================================
    -- WELLSPRING LAKE & POOLS OF ARLITHRIEN
    -- ========================================
    
    [934] = { -- The Waters of Teldrassil
        name = "The Waters of Teldrassil",
        zone = "Teldrassil",
        start = { npc = "Sentinel Arynia Cloudsbreak", x = 39.0, y = 29.5 },
        objectives = {
            { type = "item", name = "Filled Tourmaline Phial", spawns = {{41.2, 34.5}} },
        }
    },
    
    [2519] = { -- Tears of the Moon
        name = "Tears of the Moon",
        zone = "Teldrassil",
        start = { npc = "Pelturas Whitemoon", x = 56.5, y = 59.8 },
        objectives = {
            { type = "item", name = "Lady Sathrah's Silvery Spinnerets", spawns = {{51.4, 44.2}} },
        }
    },
    
    [2520] = { -- Sathrah's Sacrifice
        name = "Sathrah's Sacrifice",
        zone = "Teldrassil",
        start = { npc = "Pelturas Whitemoon", x = 56.5, y = 59.8 },
        objectives = {
            { type = "talk", name = "Shrine of the Moon", spawns = {{39.5, 24.5}} },
        }
    },
    
    -- ========================================
    -- CLASS QUESTS (Level 4-10)
    -- ========================================
    
    [5621] = { -- The Hunter's Path (Hunter)
        name = "The Hunter's Path",
        zone = "Teldrassil",
        start = { npc = "Ayanna Everstride", x = 59.2, y = 40.2 },
        objectives = {
            { type = "talk", name = "Dazalar", spawns = {{56.8, 60.2}} },
        }
    },
    
    [5622] = { -- Taming the Beast (Hunter Part 1)
        name = "Taming the Beast",
        zone = "Teldrassil",
        start = { npc = "Dazalar", x = 56.8, y = 60.2 },
        objectives = {
            { type = "kill", name = "Webwood Lurker", spawns = {
                {55.2, 32.8}, {56.5, 34.2}, {54.1, 33.5}, {57.2, 31.8}
            }},
        }
    },
    
    [5623] = { -- Taming the Beast (Hunter Part 2)
        name = "Taming the Beast",
        zone = "Teldrassil",
        start = { npc = "Dazalar", x = 56.8, y = 60.2 },
        objectives = {
            { type = "kill", name = "Nightsaber Stalker", spawns = {
                {52.5, 62.8}, {54.2, 61.5}, {51.8, 64.2}, {55.5, 63.1}
            }},
        }
    },
    
    [5624] = { -- Taming the Beast (Hunter Part 3)
        name = "Taming the Beast",
        zone = "Teldrassil",
        start = { npc = "Dazalar", x = 56.8, y = 60.2 },
        objectives = {
            { type = "kill", name = "Strigid Screecher", spawns = {
                {41.2, 52.8}, {43.5, 51.5}, {40.8, 54.2}, {44.2, 52.1}
            }},
        }
    },
    
    [5625] = { -- Training the Beast (Hunter)
        name = "Training the Beast",
        zone = "Teldrassil",
        start = { npc = "Dazalar", x = 56.8, y = 60.2 },
        objectives = {
            { type = "talk", name = "Dazalar", spawns = {{56.8, 60.2}} },
        }
    },
    
    [5932] = { -- Heeding the Call (Druid)
        name = "Heeding the Call",
        zone = "Teldrassil",
        start = { npc = "Mardant Strongoak", x = 59.8, y = 39.8 },
        objectives = {
            { type = "talk", name = "Turak Runetotem", spawns = {{56.0, 57.3}} },
        }
    },
    
    [5930] = { -- Body and Heart (Druid)
        name = "Body and Heart",
        zone = "Teldrassil",
        start = { npc = "Mathrengyl Bearwalker", x = 35.5, y = 9.8 },
        objectives = {
            { type = "kill", name = "Lunaclaw", spawns = {{42.5, 58.2}} },
        }
    },
    
    [6125] = { -- Lessons Anew (Rogue)
        name = "Lessons Anew",
        zone = "Teldrassil",
        start = { npc = "Frahun Shadewhisper", x = 59.6, y = 38.6 },
        objectives = {
            { type = "talk", name = "Syurna", spawns = {{36.8, 13.2}} },
        }
    },
    
    [6062] = { -- Returning Home (Warrior)
        name = "Returning Home",
        zone = "Teldrassil",
        start = { npc = "Alyissia", x = 59.6, y = 40.4 },
        objectives = {
            { type = "talk", name = "Kyra Windblade", spawns = {{56.5, 60.8}} },
        }
    },
    
    [6063] = { -- In Favor of the Light (Priest)
        name = "In Favor of the Light",
        zone = "Teldrassil",
        start = { npc = "Laurna Morninglight", x = 55.6, y = 56.9 },
        objectives = {
            { type = "talk", name = "Priestess A'moora", spawns = {{39.2, 31.5}} },
        }
    },
    
    -- ========================================
    -- DARNASSUS RELATED QUESTS
    -- ========================================
    
    [6343] = { -- Nessa Shadowsong
        name = "Nessa Shadowsong",
        zone = "Teldrassil",
        start = { npc = "Nyoma", x = 56.2, y = 92.5 },
        objectives = {
            { type = "talk", name = "Nessa Shadowsong", spawns = {{56.2, 92.5}} },
        }
    },
    
    [6344] = { -- The Bounty of Teldrassil
        name = "The Bounty of Teldrassil",
        zone = "Teldrassil",
        start = { npc = "Nessa Shadowsong", x = 56.2, y = 92.5 },
        objectives = {
            { type = "talk", name = "Vesprystus", spawns = {{26.5, 93.8}} },
        }
    },
    
    [6341] = { -- Flight to Auberdine
        name = "Flight to Auberdine",
        zone = "Teldrassil",
        start = { npc = "Vesprystus", x = 58.5, y = 94.0 },
        objectives = {
            { type = "talk", name = "Nessa Shadowsong", spawns = {{56.2, 92.5}} },
        }
    },
    
    [3561] = { -- Dolanaar Delivery
        name = "Dolanaar Delivery",
        zone = "Teldrassil",
        start = { npc = "Porthannius", x = 56.8, y = 53.2 },
        objectives = {
            { type = "talk", name = "Innkeeper Keldamyr", spawns = {{55.5, 60.1}} },
        }
    },
    
    [730] = { -- Trouble in Darkshore?
        name = "Trouble in Darkshore?",
        zone = "Teldrassil",
        start = { npc = "Arch Druid Fandral Staghelm", x = 34.8, y = 8.2 },
        objectives = {
            { type = "talk", name = "Thundris Windweaver", spawns = {{37.2, 40.5}} },
        }
    },
    
    [921] = { -- Grove of the Ancients
        name = "Grove of the Ancients",
        zone = "Teldrassil",
        start = { npc = "Arch Druid Fandral Staghelm", x = 34.8, y = 8.2 },
        objectives = {
            { type = "talk", name = "Onu", spawns = {{43.5, 76.5}} },
        }
    },

    -----------------------------------------  
    -- Dun Morogh Quests (Complete - Coldridge Valley, Kharanos, Brewnall)
    -----------------------------------------
    
    -- ========================================
    -- COLDRIDGE VALLEY (Level 1-6)
    -- ========================================
    
    [179] = { -- Dwarven Outfitters
        name = "Dwarven Outfitters",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "kill", name = "Ragged Young Wolf", spawns = {
                {28.2, 71.5}, {29.8, 73.2}, {27.5, 70.1}, {30.1, 72.8},
                {31.5, 74.1}, {26.8, 69.5}, {32.2, 71.8}, {27.1, 73.5}
            }},
        }
    },
    
    [170] = { -- A New Threat
        name = "A New Threat",
        zone = "Dun Morogh",
        start = { npc = "Balir Frosthammer", x = 29.9, y = 71.6 },
        objectives = {
            { type = "kill", name = "Rockjaw Trogg", spawns = {
                {26.5, 78.2}, {27.8, 76.5}, {25.2, 79.8}, {28.5, 77.1},
                {24.8, 78.5}, {29.1, 76.2}, {26.2, 80.1}, {27.5, 75.8}
            }},
            { type = "kill", name = "Burly Rockjaw Trogg", spawns = {
                {26.1, 77.5}, {28.2, 79.1}, {25.8, 80.2}, {27.5, 78.8},
                {24.5, 79.5}, {29.2, 77.8}, {26.8, 81.2}, {25.1, 76.5}
            }},
        }
    },
    
    [218] = { -- The Troll Cave
        name = "The Troll Cave",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 25.0, y = 74.2 },
        objectives = {
            { type = "item", name = "Troll Seer's Tunic", spawns = {{26.2, 79.5}} },
        }
    },
    
    [182] = { -- Coldridge Valley Mail Delivery
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        start = { npc = "Talin Keeneye", x = 22.6, y = 71.4 },
        objectives = {
            { type = "talk", name = "Grelin Whitebeard", spawns = {{25.0, 74.2}} },
        }
    },
    
    [233] = { -- Coldridge Valley Mail Delivery (Part 2)
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 25.0, y = 74.2 },
        objectives = {
            { type = "talk", name = "Mountaineer Thalos", spawns = {{29.9, 71.6}} },
        }
    },
    
    [282] = { -- Trolls of Coldridge Valley
        name = "Trolls of Coldridge Valley",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 25.0, y = 74.2 },
        objectives = {
            { type = "kill", name = "Frostmane Troll Whelp", spawns = {
                {24.5, 79.2}, {25.8, 78.1}, {23.2, 80.5}, {26.5, 77.5},
                {24.1, 81.2}, {27.2, 78.8}, {22.8, 79.5}, {25.1, 80.8}
            }},
        }
    },
    
    [287] = { -- Felix's Box
        name = "Felix's Box",
        zone = "Dun Morogh",
        start = { npc = "Felix Whindlebolt", x = 30.4, y = 72.2 },
        objectives = {
            { type = "item", name = "Felix's Box", spawns = {{25.0, 75.6}} },
        }
    },
    
    [227] = { -- Felix's Box (Return)
        name = "Felix's Box",
        zone = "Dun Morogh",
        start = { npc = "Grelin Whitebeard", x = 25.0, y = 74.2 },
        objectives = {
            { type = "talk", name = "Felix Whindlebolt", spawns = {{30.4, 72.2}} },
        }
    },
    
    [315] = { -- Scalding Mornbrew Delivery
        name = "Scalding Mornbrew Delivery",
        zone = "Dun Morogh",
        start = { npc = "Nori Pridedrift", x = 28.8, y = 74.1 },
        objectives = {
            { type = "talk", name = "Durnan Furcutter", spawns = {{29.7, 71.2}} },
        }
    },
    
    [291] = { -- Simple Rune
        name = "Simple Rune",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Thran Khorman", spawns = {{28.5, 67.4}} },
        }
    },
    
    [3107] = { -- A Refugee's Quandary
        name = "A Refugee's Quandary",
        zone = "Dun Morogh",
        start = { npc = "Felix Whindlebolt", x = 30.4, y = 72.2 },
        objectives = {
            { type = "item", name = "Felix's Chest", spawns = {{25.2, 75.2}} },
            { type = "item", name = "Felix's Bucket of Bolts", spawns = {{26.1, 74.8}} },
            { type = "item", name = "Felix's Box", spawns = {{24.8, 76.5}} },
        }
    },
    
    [3361] = { -- Gnome Betterment
        name = "Gnome Betterment",
        zone = "Dun Morogh",
        start = { npc = "Grundel Harkin", x = 29.2, y = 70.5 },
        objectives = {
            { type = "talk", name = "High Tinker Mekkatorque", spawns = {{68.3, 9.2}} },
        }
    },
    
    [469] = { -- Encrypted Rune
        name = "Encrypted Rune",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Solm Hansen", spawns = {{28.6, 67.2}} },
        }
    },
    
    [3106] = { -- Etched Rune
        name = "Etched Rune",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Thorgas Grimson", spawns = {{28.4, 68.8}} },
        }
    },
    
    [5625] = { -- Glyphic Rune
        name = "Glyphic Rune",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Marryk Nurribit", spawns = {{28.7, 66.9}} },
        }
    },
    
    [3112] = { -- Consecrated Rune
        name = "Consecrated Rune",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Branstock Khalder", spawns = {{28.9, 68.1}} },
        }
    },
    
    [592] = { -- Simple Sigil
        name = "Simple Sigil",
        zone = "Dun Morogh",
        start = { npc = "Sten Stoutarm", x = 29.7, y = 71.2 },
        objectives = {
            { type = "talk", name = "Gremlock Pilsnor", spawns = {{28.1, 67.5}} },
        }
    },
    
    [175] = { -- Miner's Gear
        name = "Miner's Gear",
        zone = "Dun Morogh",
        start = { npc = "Pilot Stonegear", x = 28.5, y = 66.2 },
        objectives = {
            { type = "item", name = "Miner's Gear", spawns = {
                {25.2, 72.5}, {26.8, 73.1}, {24.5, 71.8}
            }},
        }
    },
    
    -- ========================================
    -- KHARANOS AND SURROUNDING AREA (Level 6-12)
    -- ========================================
    
    [384] = { -- Beer Basted Boar Ribs
        name = "Beer Basted Boar Ribs",
        zone = "Dun Morogh",
        start = { npc = "Ragnar Thunderbrew", x = 46.8, y = 52.4 },
        objectives = {
            { type = "kill", name = "Crag Boar", spawns = {
                {43.2, 56.5}, {44.8, 58.2}, {42.5, 54.8}, {45.5, 57.1},
                {41.8, 55.5}, {46.2, 59.2}, {40.5, 53.8}, {47.5, 60.1}
            }},
        }
    },
    
    [314] = { -- Those Blasted Troggs!
        name = "Those Blasted Troggs!",
        zone = "Dun Morogh",
        start = { npc = "Foreman Stonebrow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "kill", name = "Rockjaw Skullthumper", spawns = {
                {65.2, 54.8}, {66.5, 56.2}, {64.8, 53.5}, {67.2, 55.5},
                {63.5, 52.8}, {68.1, 57.2}, {64.2, 55.1}, {66.8, 53.8}
            }},
        }
    },
    
    [313] = { -- The Grizzled Den
        name = "The Grizzled Den",
        zone = "Dun Morogh",
        start = { npc = "Pilot Bellowfiz", x = 49.4, y = 48.2 },
        objectives = {
            { type = "kill", name = "Wendigo", spawns = {
                {42.5, 53.8}, {41.2, 52.5}, {43.8, 54.5}, {40.5, 51.8},
                {44.5, 55.2}, {39.8, 50.5}, {45.2, 56.1}, {38.5, 49.8}
            }},
            { type = "kill", name = "Young Wendigo", spawns = {
                {43.1, 52.8}, {42.5, 54.2}, {44.2, 53.5}, {41.8, 51.5},
                {45.5, 55.8}, {40.2, 50.2}, {46.1, 56.5}
            }},
        }
    },
    
    [307] = { -- Protect the Frontier
        name = "Protect the Frontier",
        zone = "Dun Morogh",
        start = { npc = "Captain Tharran", x = 46.4, y = 53.5 },
        objectives = {
            { type = "kill", name = "Ice Claw Bear", spawns = {
                {42.8, 55.2}, {44.5, 56.8}, {41.2, 53.5}, {45.8, 58.1},
                {40.5, 52.1}, {46.5, 59.5}, {43.5, 54.8}
            }},
            { type = "kill", name = "Elder Crag Boar", spawns = {
                {48.2, 55.8}, {49.5, 57.2}, {47.5, 54.5}, {50.2, 58.5},
                {46.8, 53.8}, {51.1, 59.8}
            }},
        }
    },
    
    [400] = { -- A Favor for Evershine
        name = "A Favor for Evershine",
        zone = "Dun Morogh",
        start = { npc = "Rejold Barleybrew", x = 46.9, y = 52.2 },
        objectives = {
            { type = "talk", name = "Pilot Bellowfiz", spawns = {{49.4, 48.2}} },
        }
    },
    
    [310] = { -- Stout to Kadrell
        name = "Stout to Kadrell",
        zone = "Dun Morogh",
        start = { npc = "Rejold Barleybrew", x = 46.9, y = 52.2 },
        objectives = {
            { type = "talk", name = "Mountaineer Kadrell", spawns = {{84.2, 51.6}} },
        }
    },
    
    [312] = { -- The Stolen Journal
        name = "The Stolen Journal",
        zone = "Dun Morogh",
        start = { npc = "Thamner Pol", x = 47.1, y = 52.6 },
        objectives = {
            { type = "item", name = "Stolen Journal", spawns = {{35.8, 38.5}} },
        }
    },
    
    [283] = { -- The Stolen Journal (Return)
        name = "The Stolen Journal",
        zone = "Dun Morogh",
        start = { npc = "Rynthariel the Keymaster", x = 34.8, y = 37.2 },
        objectives = {
            { type = "talk", name = "Thamner Pol", spawns = {{47.1, 52.6}} },
        }
    },
    
    [432] = { -- Stocking Jetsteam
        name = "Stocking Jetsteam",
        zone = "Dun Morogh",
        start = { npc = "Pilot Bellowfiz", x = 49.4, y = 48.2 },
        objectives = {
            { type = "item", name = "Chunk of Boar Meat", spawns = {
                {43.5, 57.2}, {45.2, 58.5}, {42.8, 55.8}, {46.5, 60.1}
            }},
            { type = "item", name = "Tough Wolf Meat", spawns = {
                {40.2, 51.5}, {41.8, 52.8}, {39.5, 50.2}, {42.5, 54.1}
            }},
        }
    },
    
    [403] = { -- Shimmer Stout
        name = "Shimmer Stout",
        zone = "Dun Morogh",
        start = { npc = "Rejold Barleybrew", x = 46.9, y = 52.2 },
        objectives = {
            { type = "talk", name = "Marleth Barleybrew", spawns = {{54.6, 50.5}} },
        }
    },
    
    [317] = { -- Senir's Observations
        name = "Senir's Observations",
        zone = "Dun Morogh",
        start = { npc = "Mountaineer Thalos", x = 29.9, y = 71.6 },
        objectives = {
            { type = "talk", name = "Senir Whitebeard", spawns = {{46.5, 53.8}} },
        }
    },
    
    [413] = { -- Senir's Observations (Part 2)
        name = "Senir's Observations",
        zone = "Dun Morogh",
        start = { npc = "Senir Whitebeard", x = 46.5, y = 53.8 },
        objectives = {
            { type = "talk", name = "Grelin Whitebeard", spawns = {{25.0, 74.2}} },
        }
    },
    
    [436] = { -- Frostmane Menace
        name = "Frostmane Menace",
        zone = "Dun Morogh",
        start = { npc = "Senir Whitebeard", x = 46.5, y = 53.8 },
        objectives = {
            { type = "kill", name = "Frostmane Troll", spawns = {
                {34.2, 47.5}, {35.5, 48.8}, {33.5, 46.2}, {36.2, 49.5},
                {32.8, 45.5}, {37.1, 50.2}, {34.8, 48.2}
            }},
            { type = "kill", name = "Frostmane Snowstrider", spawns = {
                {35.8, 46.5}, {34.2, 47.8}, {36.5, 48.2}, {33.2, 45.8},
                {37.2, 49.5}, {32.5, 44.8}
            }},
        }
    },
    
    [404] = { -- A Dark Threat Looms (Part 1)
        name = "A Dark Threat Looms",
        zone = "Dun Morogh",
        start = { npc = "Pilot Bellowfiz", x = 49.4, y = 48.2 },
        objectives = {
            { type = "talk", name = "Senator Mehr Stonehallow", spawns = {{47.2, 52.8}} },
        }
    },
    
    [405] = { -- A Dark Threat Looms (Part 2)
        name = "A Dark Threat Looms",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "kill", name = "Mo'grosh Ogre", spawns = {
                {73.5, 57.2}, {74.8, 58.5}, {72.2, 55.8}, {75.5, 59.2}
            }},
            { type = "item", name = "Mo'grosh Crystal", spawns = {
                {72.8, 56.5}, {74.2, 57.8}, {73.5, 58.8}
            }},
        }
    },
    
    [406] = { -- A Dark Threat Looms (Part 3)
        name = "A Dark Threat Looms",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "item", name = "Powder Keg", spawns = {{76.1, 53.2}} },
        }
    },
    
    [407] = { -- A Dark Threat Looms (Part 4)
        name = "A Dark Threat Looms",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "item", name = "Place Powder Keg", spawns = {{75.5, 55.8}} },
        }
    },
    
    [467] = { -- The Lost Pilot
        name = "The Lost Pilot",
        zone = "Dun Morogh",
        start = { npc = "Pilot Hammerfoot", x = 49.4, y = 48.2 },
        objectives = {
            { type = "talk", name = "Pilot Longbeard", spawns = {{34.5, 49.2}} },
        }
    },
    
    [419] = { -- A Pilot's Revenge
        name = "A Pilot's Revenge",
        zone = "Dun Morogh",
        start = { npc = "Pilot Longbeard", x = 34.5, y = 49.2 },
        objectives = {
            { type = "kill", name = "Mangeclaw", spawns = {{33.8, 48.5}} },
        }
    },
    
    [431] = { -- The Public Servant
        name = "The Public Servant",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "kill", name = "Rockjaw Bonesnapper", spawns = {
                {66.2, 55.5}, {67.5, 56.8}, {65.5, 54.2}, {68.2, 57.5},
                {64.8, 53.5}, {69.1, 58.2}
            }},
        }
    },
    
    [291] = { -- Operation Recombobulation
        name = "Operation Recombobulation",
        zone = "Dun Morogh",
        start = { npc = "Razzle Sprysprocket", x = 47.5, y = 52.5 },
        objectives = {
            { type = "item", name = "Gyromechanic Gear", spawns = {
                {77.2, 12.5}, {78.5, 13.8}, {76.8, 11.2}
            }},
        }
    },
    
    [466] = { -- Operation Recombobulation (Part 2)
        name = "Operation Recombobulation",
        zone = "Dun Morogh",
        start = { npc = "Razzle Sprysprocket", x = 47.5, y = 52.5 },
        objectives = {
            { type = "item", name = "Functional Gear", spawns = {
                {75.2, 9.8}, {76.5, 10.5}, {77.8, 11.2}
            }},
        }
    },
    
    [318] = { -- The Reports
        name = "The Reports",
        zone = "Dun Morogh",
        start = { npc = "Senir Whitebeard", x = 46.5, y = 53.8 },
        objectives = {
            { type = "talk", name = "Senator Barin Redstone", spawns = {{69.5, 55.2}} },
        }
    },
    
    -- ========================================
    -- BREWNALL VILLAGE QUESTS
    -- ========================================
    
    [315] = { -- Bitter Rivals
        name = "Bitter Rivals",
        zone = "Dun Morogh",
        start = { npc = "Rejold Barleybrew", x = 46.9, y = 52.2 },
        objectives = {
            { type = "talk", name = "Marleth Barleybrew", spawns = {{54.6, 50.5}} },
        }
    },
    
    [308] = { -- Return to Marleth
        name = "Return to Marleth",
        zone = "Dun Morogh",
        start = { npc = "Innkeeper Belm", x = 46.8, y = 52.5 },
        objectives = {
            { type = "talk", name = "Marleth Barleybrew", spawns = {{54.6, 50.5}} },
        }
    },
    
    [311] = { -- The Perfect Stout
        name = "The Perfect Stout",
        zone = "Dun Morogh",
        start = { npc = "Marleth Barleybrew", x = 54.6, y = 50.5 },
        objectives = {
            { type = "kill", name = "Shimmerglace Frostlings", spawns = {
                {41.2, 35.8}, {42.5, 37.2}, {40.5, 34.5}, {43.2, 38.5}
            }},
        }
    },
    
    [319] = { -- The Horn of Northman
        name = "The Horn of Northman",
        zone = "Dun Morogh",
        start = { npc = "Durnan Furcutter", x = 29.7, y = 71.2 },
        objectives = {
            { type = "item", name = "Horn of Northman", spawns = {{25.5, 48.2}} },
        }
    },
    
    -- ========================================
    -- SHIMMER RIDGE / GNOMEREGAN AREA
    -- ========================================
    
    [937] = { -- The Day After
        name = "The Day After",
        zone = "Dun Morogh",
        start = { npc = "Ozzie Togglevolt", x = 45.8, y = 49.5 },
        objectives = {
            { type = "talk", name = "Rejold Barleybrew", spawns = {{46.9, 52.2}} },
        }
    },
    
    [2926] = { -- Report to Ironforge
        name = "Report to Ironforge",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "talk", name = "High Tinker Mekkatorque", spawns = {{68.3, 9.2}} },
        }
    },
    
    [2927] = { -- The Crystal Cave
        name = "The Crystal Cave",
        zone = "Dun Morogh",
        start = { npc = "High Tinker Mekkatorque", x = 68.3, y = 9.2 },
        objectives = {
            { type = "item", name = "Crystal of Power", spawns = {
                {42.5, 37.2}, {43.8, 38.5}, {41.2, 35.8}, {44.5, 39.2}
            }},
        }
    },
    
    [2928] = { -- Shimmerglace
        name = "Shimmerglace",
        zone = "Dun Morogh",
        start = { npc = "High Tinker Mekkatorque", x = 68.3, y = 9.2 },
        objectives = {
            { type = "kill", name = "Shimmerglace", spawns = {{42.8, 36.5}} },
        }
    },
    
    [2929] = { -- Return to High Tinker Mekkatorque
        name = "Return to High Tinker Mekkatorque",
        zone = "Dun Morogh",
        start = { npc = "Shimmerglace Shard", x = 42.8, y = 36.5 },
        objectives = {
            { type = "talk", name = "High Tinker Mekkatorque", spawns = {{68.3, 9.2}} },
        }
    },
    
    -- ========================================
    -- HELM'S BED LAKE QUESTS
    -- ========================================
    
    [420] = { -- Ice and Fire
        name = "Ice and Fire",
        zone = "Dun Morogh",
        start = { npc = "Frostmane Seer", x = 58.2, y = 48.5 },
        objectives = {
            { type = "item", name = "Ice and Fire Scrolls", spawns = {
                {57.8, 47.2}, {58.5, 49.5}, {59.2, 48.1}
            }},
        }
    },
    
    [438] = { -- Frozen Trogg's Head
        name = "Frozen Trogg's Head",
        zone = "Dun Morogh",
        start = { npc = "Frozen Trogg Head", x = 57.5, y = 46.8 },
        objectives = {
            { type = "talk", name = "Captain Tharran", spawns = {{46.4, 53.5}} },
        }
    },
    
    -- ========================================
    -- GOL'BOLAR QUARRY QUESTS
    -- ========================================
    
    [433] = { -- Reclaiming the Quarry
        name = "Reclaiming the Quarry",
        zone = "Dun Morogh",
        start = { npc = "Foreman Stonebrow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "kill", name = "Rockjaw Ambusher", spawns = {
                {66.5, 55.8}, {67.8, 57.2}, {65.8, 54.5}, {68.5, 58.1},
                {65.2, 53.8}, {69.2, 59.5}
            }},
        }
    },
    
    [435] = { -- Roadblock
        name = "Roadblock",
        zone = "Dun Morogh",
        start = { npc = "Captain Tharran", x = 46.4, y = 53.5 },
        objectives = {
            { type = "kill", name = "Frostmane Headhunter", spawns = {
                {37.2, 40.5}, {38.5, 41.8}, {36.5, 39.2}, {39.2, 42.5},
                {35.8, 38.5}, {40.1, 43.2}
            }},
            { type = "kill", name = "Frostmane Hideskinner", spawns = {
                {36.8, 41.2}, {38.2, 40.5}, {35.5, 39.8}, {39.5, 42.8},
                {34.8, 38.2}, {40.5, 43.5}
            }},
        }
    },
    
    -- ========================================
    -- SOUTH GATE / NORTH GATE PASS QUESTS
    -- ========================================
    
    [437] = { -- The North Gate Outpost
        name = "The North Gate Outpost",
        zone = "Dun Morogh",
        start = { npc = "Captain Tharran", x = 46.4, y = 53.5 },
        objectives = {
            { type = "talk", name = "Mountaineer Barleybrew", spawns = {{86.5, 48.8}} },
        }
    },
    
    [412] = { -- South Gate Status Report
        name = "South Gate Status Report",
        zone = "Dun Morogh",
        start = { npc = "Captain Tharran", x = 46.4, y = 53.5 },
        objectives = {
            { type = "talk", name = "Mountaineer Grugelm", spawns = {{84.8, 51.2}} },
        }
    },
    
    [414] = { -- Mountaineer Stormpike's Orders
        name = "Mountaineer Stormpike's Orders",
        zone = "Dun Morogh",
        start = { npc = "Mountaineer Grugelm", x = 84.8, y = 51.2 },
        objectives = {
            { type = "talk", name = "Captain Tharran", spawns = {{46.4, 53.5}} },
        }
    },
    
    [416] = { -- Continuing Operations
        name = "Continuing Operations",
        zone = "Dun Morogh",
        start = { npc = "Mountaineer Barleybrew", x = 86.5, y = 48.8 },
        objectives = {
            { type = "kill", name = "Tunnel Rat", spawns = {
                {82.5, 53.2}, {83.8, 54.5}, {81.2, 51.8}, {84.5, 55.2}
            }},
        }
    },
    
    [433] = { -- Trouble at the Lake
        name = "Trouble at the Lake",
        zone = "Dun Morogh",
        start = { npc = "Mountaineer Barleybrew", x = 86.5, y = 48.8 },
        objectives = {
            { type = "kill", name = "Ice Elemental", spawns = {
                {79.2, 58.5}, {80.5, 59.8}, {78.5, 57.2}, {81.2, 60.5}
            }},
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - HUNTER
    -- ========================================
    
    [6064] = { -- Taming the Beast
        name = "Taming the Beast",
        zone = "Dun Morogh",
        start = { npc = "Grif Wildheart", x = 46.1, y = 53.5 },
        objectives = {
            { type = "kill", name = "Large Crag Boar", spawns = {
                {43.5, 56.2}, {44.8, 57.5}, {42.2, 54.8}, {45.5, 58.1}
            }},
        }
    },
    
    [6065] = { -- Taming the Beast (Part 2)
        name = "Taming the Beast",
        zone = "Dun Morogh",
        start = { npc = "Grif Wildheart", x = 46.1, y = 53.5 },
        objectives = {
            { type = "kill", name = "Snow Leopard", spawns = {
                {48.2, 42.5}, {49.5, 43.8}, {47.5, 41.2}, {50.2, 44.5}
            }},
        }
    },
    
    [6066] = { -- Taming the Beast (Part 3)
        name = "Taming the Beast",
        zone = "Dun Morogh",
        start = { npc = "Grif Wildheart", x = 46.1, y = 53.5 },
        objectives = {
            { type = "kill", name = "Ice Claw Bear", spawns = {
                {42.8, 55.2}, {44.5, 56.8}, {41.2, 53.5}, {45.8, 58.1}
            }},
        }
    },
    
    [6068] = { -- Training the Beast
        name = "Training the Beast",
        zone = "Dun Morogh",
        start = { npc = "Grif Wildheart", x = 46.1, y = 53.5 },
        objectives = {
            { type = "talk", name = "Grif Wildheart", spawns = {{46.1, 53.5}} },
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - WARRIOR
    -- ========================================
    
    [1678] = { -- Muren Stormpike
        name = "Muren Stormpike",
        zone = "Dun Morogh",
        start = { npc = "Magis Sparkmantle", x = 47.6, y = 52.5 },
        objectives = {
            { type = "talk", name = "Muren Stormpike", spawns = {{69.8, 55.6}} },
        }
    },
    
    [1618] = { -- Vejrek
        name = "Vejrek",
        zone = "Dun Morogh",
        start = { npc = "Muren Stormpike", x = 69.8, y = 55.6 },
        objectives = {
            { type = "kill", name = "Vejrek", spawns = {{42.2, 52.5}} },
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - PALADIN
    -- ========================================
    
    [1642] = { -- Tome of Divinity
        name = "Tome of Divinity",
        zone = "Dun Morogh",
        start = { npc = "Tiza Battleforge", x = 47.8, y = 52.8 },
        objectives = {
            { type = "talk", name = "Brother Wilhelm", spawns = {{73.5, 55.2}} },
        }
    },
    
    [1644] = { -- The Binding
        name = "The Binding",
        zone = "Dun Morogh",
        start = { npc = "Brother Wilhelm", x = 73.5, y = 55.2 },
        objectives = {
            { type = "item", name = "Holy Relic", spawns = {{65.2, 48.5}} },
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - PRIEST
    -- ========================================
    
    [3365] = { -- Beginnings
        name = "Beginnings",
        zone = "Dun Morogh",
        start = { npc = "Maxan Anvol", x = 47.2, y = 52.1 },
        objectives = {
            { type = "talk", name = "High Priest Rohan", spawns = {{68.4, 8.2}} },
        }
    },
    
    [3364] = { -- In Favor of the Light
        name = "In Favor of the Light",
        zone = "Dun Morogh",
        start = { npc = "High Priest Rohan", x = 68.4, y = 8.2 },
        objectives = {
            { type = "item", name = "Symbol of Life", spawns = {{47.2, 52.1}} },
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - MAGE
    -- ========================================
    
    [1879] = { -- Mage-tastic Gizmonitor
        name = "Mage-tastic Gizmonitor",
        zone = "Dun Morogh",
        start = { npc = "Bink", x = 47.5, y = 52.1 },
        objectives = {
            { type = "kill", name = "Leper Gnome", spawns = {
                {77.5, 10.2}, {78.8, 11.5}, {76.2, 8.8}, {79.5, 12.1}
            }},
        }
    },
    
    [1880] = { -- Investigate the Troggs
        name = "Investigate the Troggs",
        zone = "Dun Morogh",
        start = { npc = "Bink", x = 47.5, y = 52.1 },
        objectives = {
            { type = "kill", name = "Rockjaw Trogg", spawns = {
                {65.5, 54.2}, {66.8, 55.5}, {64.2, 52.8}, {67.5, 56.2}
            }},
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - WARLOCK
    -- ========================================
    
    [1685] = { -- The Completion of Voida
        name = "The Completion of Voida",
        zone = "Dun Morogh",
        start = { npc = "Voida", x = 47.1, y = 48.5 },
        objectives = {
            { type = "kill", name = "Frostmane Novice", spawns = {
                {35.2, 47.5}, {36.5, 48.8}, {34.5, 46.2}, {37.2, 49.5}
            }},
        }
    },
    
    [1716] = { -- Piercing the Veil
        name = "Piercing the Veil",
        zone = "Dun Morogh",
        start = { npc = "Voida", x = 47.1, y = 48.5 },
        objectives = {
            { type = "kill", name = "Frostmane Shadowcaster", spawns = {
                {34.8, 39.2}, {35.5, 40.5}, {33.5, 38.5}, {36.2, 41.2}
            }},
        }
    },
    
    -- ========================================
    -- CLASS QUESTS - ROGUE
    -- ========================================
    
    [2205] = { -- Road to Salvation
        name = "Road to Salvation",
        zone = "Dun Morogh",
        start = { npc = "Hulfdan Blackbeard", x = 47.5, y = 52.8 },
        objectives = {
            { type = "item", name = "Kelm Redmane's Head", spawns = {{84.2, 50.5}} },
        }
    },
    
    [2206] = { -- Simple Subterfuge
        name = "Simple Subterfuge",
        zone = "Dun Morogh",
        start = { npc = "Hulfdan Blackbeard", x = 47.5, y = 52.8 },
        objectives = {
            { type = "talk", name = "SI:7 Agent", spawns = {{36.5, 45.8}} },
        }
    },
    
    -- ========================================
    -- MISC QUESTS
    -- ========================================
    
    [316] = { -- Tundra MacGrann's Stolen Stash
        name = "Tundra MacGrann's Stolen Stash",
        zone = "Dun Morogh",
        start = { npc = "Tundra MacGrann", x = 42.2, y = 52.5 },
        objectives = {
            { type = "item", name = "MacGrann's Dried Meats", spawns = {{42.8, 52.1}} },
        }
    },
    
    [5539] = { -- Bound for Iron Forge
        name = "Bound for Iron Forge",
        zone = "Dun Morogh",
        start = { npc = "Pilot Stonegear", x = 28.5, y = 66.2 },
        objectives = {
            { type = "talk", name = "Gryth Thurden", spawns = {{55.4, 47.5}} },
        }
    },
    
    [6391] = { -- A Pilot's Revenge (Followup)
        name = "A Pilot's Revenge",
        zone = "Dun Morogh",
        start = { npc = "Pilot Longbeard", x = 34.5, y = 49.2 },
        objectives = {
            { type = "talk", name = "Pilot Hammerfoot", spawns = {{49.4, 48.2}} },
        }
    },
    
    [411] = { -- Tools for Steelgrill
        name = "Tools for Steelgrill",
        zone = "Dun Morogh",
        start = { npc = "Beldin Steelgrill", x = 50.5, y = 49.2 },
        objectives = {
            { type = "item", name = "Steelgrill's Tools", spawns = {{45.2, 55.8}} },
        }
    },
    
    [433] = { -- Ammo for Rumbleshot
        name = "Ammo for Rumbleshot",
        zone = "Dun Morogh",
        start = { npc = "Loslor Rudge", x = 84.5, y = 51.5 },
        objectives = {
            { type = "talk", name = "Hegnar Rumbleshot", spawns = {{85.2, 52.1}} },
        }
    },
    
    [454] = { -- Finding the Historian
        name = "Finding the Historian",
        zone = "Dun Morogh",
        start = { npc = "Prospector Stormpike", x = 47.5, y = 52.5 },
        objectives = {
            { type = "talk", name = "Historian Karnik", spawns = {{69.5, 18.5}} },
        }
    },
    
    [432] = { -- Supplies for Golbolar Quarry
        name = "Supplies for Golbolar Quarry",
        zone = "Dun Morogh",
        start = { npc = "Quartermaster Hudson", x = 46.5, y = 52.2 },
        objectives = {
            { type = "talk", name = "Foreman Stonebrow", spawns = {{47.2, 52.8}} },
        }
    },
    
    [6387] = { -- The Deeprun Tram
        name = "The Deeprun Tram",
        zone = "Dun Morogh",
        start = { npc = "Senator Mehr Stonehallow", x = 47.2, y = 52.8 },
        objectives = {
            { type = "talk", name = "Monty", spawns = {{72.5, 64.2}} },
        }
    },
    
    [6392] = { -- Going to Ironforge
        name = "Going to Ironforge",
        zone = "Dun Morogh",
        start = { npc = "Captain Tharran", x = 46.4, y = 53.5 },
        objectives = {
            { type = "talk", name = "Golnir Bouldertoe", spawns = {{51.5, 26.5}} },
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
    
    [12] = { -- The People's Militia (Part 1)
        name = "The People's Militia",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Defias Trapper", spawns = {{45.2, 68.1}, {46.8, 70.3}} },
            { type = "kill", name = "Defias Smuggler", spawns = {{44.8, 71.2}, {46.2, 69.8}} },
        }
    },
    
    [13] = { -- The People's Militia (Part 2)
        name = "The People's Militia",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Defias Looter", spawns = {{44.2, 58.5}, {45.8, 56.2}} },
            { type = "kill", name = "Defias Pillager", spawns = {{42.5, 62.8}, {44.1, 60.5}} },
        }
    },
    
    [14] = { -- The People's Militia (Part 3)
        name = "The People's Militia",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Defias Highwayman", spawns = {{40.2, 52.5}, {41.8, 50.2}} },
            { type = "kill", name = "Defias Pathstalker", spawns = {{38.5, 56.8}, {40.1, 54.5}} },
        }
    },
    
    [65] = { -- The Defias Brotherhood (Start)
        name = "The Defias Brotherhood",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "talk", name = "Wiley the Black", spawns = {{41.2, 79.8}} },
        }
    },
    
    [103] = { -- The Coast Isn't Clear
        name = "The Coast Isn't Clear",
        zone = "Westfall",
        start = { npc = "Captain Grayson", x = 30.3, y = 85.6 },
        objectives = {
            { type = "kill", name = "Defias Coastrunner", spawns = {{33.2, 78.5}, {34.8, 76.2}} },
            { type = "kill", name = "Defias Watcher", spawns = {{35.5, 84.2}, {37.1, 82.5}} },
        }
    },
    
    [104] = { -- Old Murk-Eye
        name = "The Coast Isn't Clear",
        zone = "Westfall",
        start = { npc = "Captain Grayson", x = 30.3, y = 85.6 },
        objectives = {
            { type = "kill", name = "Old Murk-Eye", spawns = {{21.5, 75.2}} },
        }
    },
    
    [136] = { -- Captain Sanders' Hidden Treasure
        name = "Captain Sanders' Hidden Treasure",
        zone = "Westfall",
        start = { npc = "Captain Sanders' Treasure Map", x = 26.0, y = 47.0 },
        objectives = {
            { type = "item", name = "Captain Sanders' Treasure Chest", spawns = {{26.8, 47.2}} },
        }
    },
    
    [151] = { -- Poor Old Blanchy
        name = "Poor Old Blanchy",
        zone = "Westfall",
        start = { npc = "Verna Furlbrow", x = 59.9, y = 19.4 },
        objectives = {
            { type = "item", name = "Handful of Oats", spawns = {{56.2, 31.5}, {54.8, 32.1}} },
        }
    },
    
    [166] = { -- The Defias Kingpin
        name = "The Defias Kingpin",
        zone = "Westfall",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 },
        objectives = {
            { type = "kill", name = "Edwin VanCleef", spawns = {{42.5, 71.2}} },
            { type = "item", name = "Head of VanCleef", spawns = {{42.5, 71.2}} },
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

    [225] = { -- The Trogg Threat
        name = "The Trogg Threat",
        zone = "Loch Modan",
        start = { npc = "Captain Rugelfuss", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Stonesplinter Shaman", spawns = {
                {37.8, 43.5}, {39.1, 41.8}, {36.5, 44.8}, {40.2, 42.1}
            }},
            { type = "kill", name = "Stonesplinter Bonesnapper", spawns = {
                {38.2, 42.8}, {39.5, 44.1}, {37.1, 41.5}, {40.8, 43.2}
            }},
        }
    },

    [256] = { -- Report to Ironforge
        name = "Report to Ironforge",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "talk", name = "Senator Mehr Stonehallow", spawns = {{38.2, 55.1}} },
        }
    },

    [263] = { -- Ironband's Excavation
        name = "Ironband's Excavation",
        zone = "Loch Modan",
        start = { npc = "Magistrate Bluntnose", x = 35.0, y = 48.5 },
        objectives = {
            { type = "talk", name = "Prospector Ironband", spawns = {{65.1, 65.8}} },
        }
    },

    [268] = { -- Excavation Progress Report
        name = "Excavation Progress Report",
        zone = "Loch Modan",
        start = { npc = "Prospector Ironband", x = 65.1, y = 65.8 },
        objectives = {
            { type = "talk", name = "Jern Hornhelm", spawns = {{37.1, 47.4}} },
        }
    },

    [297] = { -- Report to Mountaineer Rockgar
        name = "Report to Mountaineer Rockgar",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "talk", name = "Mountaineer Rockgar", spawns = {{25.8, 10.2}} },
        }
    },

    [300] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Chief Engineer Hinderweir VII", x = 45.3, y = 13.2 },
        objectives = {
            { type = "item", name = "Explosive Seaforium", spawns = {{68.2, 43.5}} },
        }
    },

    [301] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Chief Engineer Hinderweir VII", x = 45.3, y = 13.2 },
        objectives = {
            { type = "kill", name = "Dark Iron Dwarf", spawns = {
                {69.5, 27.2}, {71.2, 25.8}, {68.1, 28.5}, {72.4, 26.1}
            }},
            { type = "item", name = "Dark Iron Fanny Pack", spawns = {
                {69.5, 27.2}, {71.2, 25.8}, {68.1, 28.5}, {72.4, 26.1}
            }},
        }
    },

    [302] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Chief Engineer Hinderweir VII", x = 45.3, y = 13.2 },
        objectives = {
            { type = "talk", name = "Ashlan Stonesmirk", spawns = {{68.8, 62.4}} },
        }
    },

    [303] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Ashlan Stonesmirk", x = 68.8, y = 62.4 },
        objectives = {
            { type = "talk", name = "Chief Engineer Hinderweir VII", spawns = {{45.3, 13.2}} },
        }
    },

    [304] = { -- A Dark Threat Looms
        name = "A Dark Threat Looms",
        zone = "Loch Modan",
        start = { npc = "Chief Engineer Hinderweir VII", x = 45.3, y = 13.2 },
        objectives = {
            { type = "item", name = "Detonation Device", spawns = {{47.2, 15.8}} },
        }
    },

    [305] = { -- Crocolisk Steak
        name = "Crocolisk Steak",
        zone = "Loch Modan",
        start = { npc = "Daryl the Youngling", x = 81.2, y = 64.5 },
        objectives = {
            { type = "kill", name = "Loch Crocolisk", spawns = {
                {48.5, 18.2}, {50.1, 16.8}, {47.2, 19.5}, {51.4, 17.1}
            }},
            { type = "item", name = "Crocolisk Skin", spawns = {
                {48.5, 18.2}, {50.1, 16.8}, {47.2, 19.5}, {51.4, 17.1}
            }},
        }
    },

    [414] = { -- Find Bingles
        name = "Find Bingles",
        zone = "Loch Modan",
        start = { npc = "Gnoarn", x = 47.2, y = 52.8 },
        objectives = {
            { type = "talk", name = "Bingles Blastenheimer", spawns = {{64.2, 55.1}} },
        }
    },

    [415] = { -- Bingles' Missing Supplies
        name = "Bingles' Missing Supplies",
        zone = "Loch Modan",
        start = { npc = "Bingles Blastenheimer", x = 64.2, y = 55.1 },
        objectives = {
            { type = "item", name = "Bingles's Blastencapper", spawns = {{63.5, 47.8}} },
            { type = "item", name = "Bingles's Hyperdriver", spawns = {{63.8, 48.2}} },
            { type = "item", name = "Bingles's Hammer", spawns = {{64.1, 46.5}} },
            { type = "item", name = "Bingles's Wrench", spawns = {{62.8, 49.1}} },
        }
    },

    [418] = { -- Mountaineer Stormpike's Task
        name = "Mountaineer Stormpike's Task",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Stormpike", x = 25.4, y = 70.8 },
        objectives = {
            { type = "kill", name = "Stonesplinter Trogg", spawns = {
                {32.8, 71.5}, {34.1, 69.8}, {31.5, 72.8}, {35.2, 70.1}
            }},
            { type = "item", name = "Arrow", spawns = {
                {32.8, 71.5}, {34.1, 69.8}, {31.5, 72.8}, {35.2, 70.1}
            }},
        }
    },

    [419] = { -- Filthy Paws
        name = "Filthy Paws",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Stormpike", x = 25.4, y = 70.8 },
        objectives = {
            { type = "item", name = "Miners' League Papers", spawns = {{33.5, 74.2}} },
        }
    },

    [433] = { -- Mo'grosh Ogre
        name = "Mo'grosh Ogre",
        zone = "Loch Modan",
        start = { npc = "Magistrate Bluntnose", x = 35.0, y = 48.5 },
        objectives = {
            { type = "kill", name = "Mo'grosh Brute", spawns = {
                {71.5, 22.8}, {73.1, 21.2}, {70.2, 24.5}, {74.4, 22.1}
            }},
            { type = "kill", name = "Mo'grosh Ogre", spawns = {
                {72.2, 23.5}, {73.8, 20.8}, {70.8, 25.1}, {75.1, 21.8}
            }},
        }
    },

    [434] = { -- Mo'grosh Stronghold
        name = "Mo'grosh Stronghold",
        zone = "Loch Modan",
        start = { npc = "Magistrate Bluntnose", x = 35.0, y = 48.5 },
        objectives = {
            { type = "kill", name = "Mo'grosh Shaman", spawns = {
                {72.8, 21.5}, {74.5, 19.8}, {71.2, 22.8}, {75.8, 20.1}
            }},
            { type = "kill", name = "Mo'grosh Mystic", spawns = {
                {73.2, 22.2}, {75.1, 20.5}, {71.8, 23.8}, {76.2, 21.2}
            }},
        }
    },

    [436] = { -- The Ogre King
        name = "The Ogre King",
        zone = "Loch Modan",
        start = { npc = "Magistrate Bluntnose", x = 35.0, y = 48.5 },
        objectives = {
            { type = "kill", name = "Chok'sul", spawns = {{74.8, 17.5}} },
            { type = "item", name = "Chok'sul's Spine", spawns = {{74.8, 17.5}} },
        }
    },

    [437] = { -- Gathering Idols
        name = "Gathering Idols",
        zone = "Loch Modan",
        start = { npc = "Holgor Stonecrusher", x = 35.5, y = 48.2 },
        objectives = {
            { type = "item", name = "Carved Stone Idol", spawns = {
                {37.2, 42.5}, {38.8, 40.8}, {36.1, 43.8}, {39.5, 41.2}
            }},
        }
    },

    [438] = { -- Protecting the Herd
        name = "Protecting the Herd",
        zone = "Loch Modan",
        start = { npc = "Yancy Whitestone", x = 35.8, y = 42.5 },
        objectives = {
            { type = "kill", name = "Mountain Buzzard", spawns = {
                {40.5, 31.2}, {42.1, 29.5}, {39.2, 32.8}, {43.5, 30.1}
            }},
        }
    },

    [217] = { -- Southshore Steamer
        name = "Southshore Steamer",
        zone = "Loch Modan",
        start = { npc = "Vidra Hearthstove", x = 34.8, y = 49.2 },
        objectives = {
            { type = "kill", name = "Loch Crocolisk", spawns = {
                {46.8, 19.5}, {48.2, 17.8}, {45.5, 20.8}, {49.1, 18.2}
            }},
            { type = "item", name = "Crocolisk Meat", spawns = {
                {46.8, 19.5}, {48.2, 17.8}, {45.5, 20.8}, {49.1, 18.2}
            }},
        }
    },

    [255] = { -- The Algaz Gauntlet
        name = "The Algaz Gauntlet",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Roghan", x = 25.1, y = 10.5 },
        objectives = {
            { type = "kill", name = "Dragonmaw Scout", spawns = {
                {21.8, 17.5}, {23.1, 15.8}, {20.5, 18.8}, {24.2, 16.2}
            }},
            { type = "kill", name = "Dragonmaw Grunt", spawns = {
                {22.5, 16.2}, {23.8, 14.5}, {21.2, 17.8}, {24.8, 15.1}
            }},
        }
    },

    [199] = { -- Keeping Pace
        name = "Keeping Pace",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Rockgar", x = 25.8, y = 10.2 },
        objectives = {
            { type = "talk", name = "Mountaineer Roghan", spawns = {{25.1, 10.5}} },
        }
    },

    [206] = { -- Longbraid the Grim
        name = "Longbraid the Grim",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Cobbleflint", x = 22.8, y = 73.5 },
        objectives = {
            { type = "talk", name = "Longbraid the Grim", spawns = {{65.8, 65.2}} },
        }
    },

    [249] = { -- Resupply Stormpike
        name = "Resupply Stormpike",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "talk", name = "Mountaineer Stormpike", spawns = {{25.4, 70.8}} },
        }
    },

    [266] = { -- Ormer's Revenge
        name = "Ormer's Revenge",
        zone = "Loch Modan",
        start = { npc = "Ormer Ironbraid", x = 72.2, y = 32.8 },
        objectives = {
            { type = "kill", name = "Mountain Buzzard", spawns = {
                {72.8, 35.2}, {74.5, 33.5}, {71.2, 36.8}, {75.8, 34.1}
            }},
            { type = "kill", name = "Elder Mountain Boar", spawns = {
                {73.5, 34.8}, {75.1, 32.1}, {72.2, 37.2}, {76.4, 33.5}
            }},
        }
    },

    [270] = { -- Ormer's Revenge
        name = "Ormer's Revenge",
        zone = "Loch Modan",
        start = { npc = "Ormer Ironbraid", x = 72.2, y = 32.8 },
        objectives = {
            { type = "kill", name = "Tunnel Rat Forager", spawns = {
                {66.2, 57.8}, {67.8, 55.5}, {65.1, 59.2}, {68.5, 56.1}
            }},
            { type = "kill", name = "Tunnel Rat Geomancer", spawns = {
                {66.8, 56.5}, {68.2, 58.2}, {65.5, 55.1}, {69.1, 57.5}
            }},
        }
    },

    [273] = { -- Ormer's Revenge
        name = "Ormer's Revenge",
        zone = "Loch Modan",
        start = { npc = "Ormer Ironbraid", x = 72.2, y = 32.8 },
        objectives = {
            { type = "kill", name = "Grawmug", spawns = {{65.5, 54.8}} },
            { type = "kill", name = "Gnawer", spawns = {{66.2, 55.2}} },
            { type = "kill", name = "Snigglegrunter", spawns = {{67.1, 54.5}} },
        }
    },

    [307] = { -- Explorers' League
        name = "Explorers' League",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "talk", name = "Explorer Stormpike", spawns = {{18.8, 57.2}} },
        }
    },

    [254] = { -- Stonegear's Search
        name = "Stonegear's Search",
        zone = "Loch Modan",
        start = { npc = "Pilot Stonegear", x = 83.1, y = 65.5 },
        objectives = {
            { type = "item", name = "Stonegear's Wooden Bowl", spawns = {{64.5, 67.2}} },
            { type = "item", name = "Stonegear's Metal Spoon", spawns = {{65.8, 66.5}} },
        }
    },

    [367] = { -- Pilot Bellowfiz
        name = "Pilot Bellowfiz",
        zone = "Loch Modan",
        start = { npc = "Pilot Stonegear", x = 83.1, y = 65.5 },
        objectives = {
            { type = "talk", name = "Pilot Bellowfiz", spawns = {{10.2, 71.8}} },
        }
    },

    [413] = { -- Stonegear's Return
        name = "Stonegear's Return",
        zone = "Loch Modan",
        start = { npc = "Pilot Stonegear", x = 83.1, y = 65.5 },
        objectives = {
            { type = "talk", name = "Gnoarn", spawns = {{47.2, 52.8}} },
        }
    },

    [437] = { -- The Lost Diplomat
        name = "The Lost Diplomat",
        zone = "Loch Modan",
        start = { npc = "Advisor Belgrum", x = 38.8, y = 55.2 },
        objectives = {
            { type = "talk", name = "Mountaineer Wallbang", spawns = {{22.8, 74.5}} },
        }
    },

    [238] = { -- Defense of the King's Lands
        name = "Defense of the King's Lands",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Stonesplinter Seer", spawns = {
                {38.5, 44.2}, {40.1, 42.5}, {37.2, 45.8}, {41.4, 43.1}
            }},
            { type = "kill", name = "Stonesplinter Digger", spawns = {
                {39.2, 43.8}, {40.8, 41.2}, {37.8, 46.2}, {42.1, 42.5}
            }},
        }
    },

    [239] = { -- Defense of the King's Lands
        name = "Defense of the King's Lands",
        zone = "Loch Modan",
        start = { npc = "Captain Rugelfuss", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Stonesplinter Skullthumper", spawns = {
                {39.8, 42.1}, {41.5, 40.5}, {38.2, 43.8}, {42.8, 41.2}
            }},
            { type = "kill", name = "Stonesplinter Seer", spawns = {
                {40.2, 43.5}, {41.8, 41.8}, {38.8, 44.8}, {43.1, 42.1}
            }},
        }
    },

    [287] = { -- Ursal the Mauler
        name = "Ursal the Mauler",
        zone = "Loch Modan",
        start = { npc = "Mountaineer Kadrell", x = 23.2, y = 73.8 },
        objectives = {
            { type = "kill", name = "Ursal the Mauler", spawns = {{28.5, 32.8}} },
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
    
    [871] = { -- The Forgotten Pools
        name = "The Forgotten Pools",
        zone = "The Barrens",
        start = { npc = "Tonga Runetotem", x = 52.2, y = 31.9 },
        objectives = {
            { type = "item", name = "Bubbling Fissure Water", spawns = {{45.2, 22.5}} },
        }
    },
    
    [846] = { -- Prowlers of the Barrens
        name = "Prowlers of the Barrens",
        zone = "The Barrens",
        start = { npc = "Sergra Darkthorn", x = 52.2, y = 31.0 },
        objectives = {
            { type = "kill", name = "Savannah Prowler", spawns = {
                {48.5, 38.2}, {49.8, 36.5}, {47.2, 39.8}, {50.5, 37.1}
            }},
        }
    },
    
    [881] = { -- Washte Pawne
        name = "Washte Pawne",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "kill", name = "Washte Pawne", spawns = {{48.5, 79.2}} },
        }
    },
    
    [882] = { -- Lakota'mani
        name = "Lakota'mani",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "kill", name = "Lakota'mani", spawns = {{41.2, 48.5}} },
        }
    },
    
    [883] = { -- Owatanka
        name = "Owatanka",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "kill", name = "Owatanka", spawns = {{51.8, 43.2}} },
        }
    },
    
    [884] = { -- Cry of the Thunderhawk
        name = "Cry of the Thunderhawk",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "item", name = "Thunderhawk Wings", spawns = {
                {46.5, 46.2}, {48.1, 44.8}, {45.2, 47.5}, {49.2, 43.5}
            }},
        }
    },
    
    [885] = { -- Enraged Spirits
        name = "Enraged Spirits",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "item", name = "Enraged Spirit Totem", spawns = {
                {47.8, 55.2}, {49.5, 53.8}, {46.2, 56.8}, {50.8, 52.5}
            }},
        }
    },
    
    [858] = { -- Displaced Scouts
        name = "Displaced Scouts",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Kolkar Centaur", spawns = {
                {43.8, 78.5}, {45.2, 76.2}, {42.5, 80.1}, {46.5, 77.5}
            }},
        }
    },
    
    [859] = { -- Verog the Dervish
        name = "Verog the Dervish",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Verog the Dervish", spawns = {{45.5, 77.8}} },
        }
    },
    
    [860] = { -- Hezrul Bloodmark
        name = "Hezrul Bloodmark",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Hezrul Bloodmark", spawns = {{44.8, 78.2}} },
        }
    },
    
    [855] = { -- Lost in Battle
        name = "Lost in Battle",
        zone = "The Barrens",
        start = { npc = "Mankrik", x = 45.1, y = 59.2 },
        objectives = {
            { type = "talk", name = "Mankrik's Wife", spawns = {{49.5, 50.2}} },
        }
    },
    
    [899] = { -- Wharfmaster Dizzywig
        name = "Wharfmaster Dizzywig",
        zone = "The Barrens",
        start = { npc = "Gazlowe", x = 62.7, y = 36.2 },
        objectives = {
            { type = "talk", name = "Wharfmaster Dizzywig", spawns = {{63.5, 38.8}} },
        }
    },
    
    [887] = { -- WANTED: Baron Longshore
        name = "WANTED: Baron Longshore",
        zone = "The Barrens",
        start = { npc = "Wanted Poster", x = 62.2, y = 37.5 },
        objectives = {
            { type = "kill", name = "Baron Longshore", spawns = {{68.5, 72.8}} },
        }
    },
    
    [891] = { -- The Guns of Northwatch
        name = "The Guns of Northwatch",
        zone = "The Barrens",
        start = { npc = "Captain Thalo'thas Brightsun", x = 62.7, y = 38.5 },
        objectives = {
            { type = "item", name = "Stolen Cannons", spawns = {
                {60.2, 54.5}, {61.5, 52.8}, {59.8, 56.2}, {62.1, 53.5}
            }},
        }
    },
    
    [890] = { -- Free From the Hold
        name = "Free From the Hold",
        zone = "The Barrens",
        start = { npc = "Wharfmaster Dizzywig", x = 63.5, y = 38.8 },
        objectives = {
            { type = "talk", name = "Wharfmaster Dizzywig", spawns = {{63.5, 38.8}} },
        }
    },
    
    [892] = { -- Southsea Freebooters
        name = "Southsea Freebooters",
        zone = "The Barrens",
        start = { npc = "Gazlowe", x = 62.7, y = 36.2 },
        objectives = {
            { type = "kill", name = "Southsea Brigand", spawns = {
                {64.5, 48.2}, {65.8, 46.5}, {63.2, 49.8}, {66.5, 47.1}
            }},
            { type = "kill", name = "Southsea Cannoneer", spawns = {
                {65.1, 47.5}, {64.2, 49.1}, {66.2, 46.2}, {63.5, 50.5}
            }},
        }
    },
    
    [893] = { -- The Missing Shipment
        name = "The Missing Shipment",
        zone = "The Barrens",
        start = { npc = "Wharfmaster Dizzywig", x = 63.5, y = 38.8 },
        objectives = {
            { type = "talk", name = "Gazlowe", spawns = {{62.7, 36.2}} },
        }
    },
    
    [894] = { -- The Missing Shipment (Part 2)
        name = "The Missing Shipment",
        zone = "The Barrens",
        start = { npc = "Gazlowe", x = 62.7, y = 36.2 },
        objectives = {
            { type = "talk", name = "Wharfmaster Dizzywig", spawns = {{63.5, 38.8}} },
        }
    },
    
    [900] = { -- Trouble at the Docks
        name = "Trouble at the Docks",
        zone = "The Barrens",
        start = { npc = "Crane Operator Bigglefuzz", x = 63.1, y = 38.2 },
        objectives = {
            { type = "kill", name = "Southsea Cutthroat", spawns = {
                {63.5, 48.5}, {64.8, 47.2}, {62.2, 49.8}, {65.5, 46.5}
            }},
            { type = "kill", name = "Southsea Privateer", spawns = {
                {64.1, 47.8}, {63.2, 49.5}, {65.2, 46.8}, {62.5, 50.2}
            }},
        }
    },
    
    [867] = { -- Supplies for the Crossroads
        name = "Supplies for the Crossroads",
        zone = "The Barrens",
        start = { npc = "Thork", x = 51.5, y = 30.5 },
        objectives = {
            { type = "item", name = "Supply Crate", spawns = {
                {54.2, 25.8}, {55.8, 24.2}, {53.5, 27.1}, {56.5, 23.5}
            }},
        }
    },
    
    [848] = { -- Kolkar Leaders
        name = "Kolkar Leaders",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Barak Kodobane", spawns = {{45.2, 73.5}} },
        }
    },
    
    [878] = { -- Serpentbloom
        name = "Serpentbloom",
        zone = "The Barrens",
        start = { npc = "Apothecary Zamah", x = 22.8, y = 21.2 },
        objectives = {
            { type = "item", name = "Serpentbloom", spawns = {
                {46.5, 36.8}, {47.8, 35.2}, {45.2, 38.1}, {48.5, 34.5}
            }},
        }
    },
    
    [914] = { -- Deviate Hides
        name = "Deviate Hides",
        zone = "The Barrens",
        start = { npc = "Nalpak", x = 47.5, y = 36.8 },
        objectives = {
            { type = "kill", name = "Deviate Lurker", spawns = {
                {46.2, 37.5}, {47.5, 36.2}, {45.5, 38.8}, {48.2, 35.5}
            }},
            { type = "kill", name = "Deviate Guardian", spawns = {
                {46.8, 37.2}, {48.1, 35.8}, {45.8, 38.5}, {49.1, 34.8}
            }},
        }
    },
    
    [915] = { -- Deviate Eradication
        name = "Deviate Eradication",
        zone = "The Barrens",
        start = { npc = "Ebru", x = 47.2, y = 36.5 },
        objectives = {
            { type = "kill", name = "Deviate Ravager", spawns = {
                {46.5, 37.8}, {47.8, 36.5}, {45.8, 39.1}, {48.5, 35.8}
            }},
            { type = "kill", name = "Deviate Viper", spawns = {
                {47.1, 37.5}, {48.5, 36.1}, {46.2, 38.8}, {49.2, 35.2}
            }},
        }
    },
    
    [916] = { -- Leaders of the Fang
        name = "Leaders of the Fang",
        zone = "The Barrens",
        start = { npc = "Nara Wildmane", x = 75.2, y = 31.2 },
        objectives = {
            { type = "kill", name = "Lord Cobrahn", spawns = {{47.5, 37.2}} },
            { type = "kill", name = "Lord Pythas", spawns = {{47.8, 37.5}} },
            { type = "kill", name = "Lord Anacondra", spawns = {{47.2, 36.8}} },
            { type = "kill", name = "Lady Anacondra", spawns = {{47.5, 37.8}} },
        }
    },
    
    [919] = { -- Smart Drinks
        name = "Smart Drinks",
        zone = "The Barrens",
        start = { npc = "Mebok Mizzyrix", x = 62.5, y = 37.5 },
        objectives = {
            { type = "item", name = "Wailing Essence", spawns = {
                {46.8, 37.2}, {48.1, 35.8}, {45.5, 38.5}, {49.2, 34.8}
            }},
        }
    },
    
    [1483] = { -- Altered Beings
        name = "Altered Beings",
        zone = "The Barrens",
        start = { npc = "Tonga Runetotem", x = 52.2, y = 31.9 },
        objectives = {
            { type = "item", name = "Altered Skin", spawns = {
                {46.5, 37.5}, {47.8, 36.2}, {45.2, 38.8}, {48.5, 35.5}
            }},
        }
    },
    
    [1484] = { -- Hamuul Runetotem
        name = "Hamuul Runetotem",
        zone = "The Barrens",
        start = { npc = "Tonga Runetotem", x = 52.2, y = 31.9 },
        objectives = {
            { type = "talk", name = "Hamuul Runetotem", spawns = {{75.2, 31.2}} },
        }
    },
    
    [886] = { -- Weapons of Choice
        name = "Weapons of Choice",
        zone = "The Barrens",
        start = { npc = "Tatternack Steelforge", x = 45.1, y = 57.8 },
        objectives = {
            { type = "item", name = "Razormane Backstabber", spawns = {
                {40.5, 48.2}, {41.8, 46.5}, {39.2, 49.8}, {42.5, 47.1}
            }},
            { type = "item", name = "Razormane War Shield", spawns = {
                {41.1, 47.5}, {40.2, 49.1}, {42.2, 46.2}, {39.5, 50.5}
            }},
            { type = "item", name = "Razormane Warblade", spawns = {
                {40.8, 48.8}, {42.1, 46.8}, {39.8, 50.2}, {43.1, 45.8}
            }},
        }
    },
    
    [873] = { -- Gann's Reclamation
        name = "Gann's Reclamation",
        zone = "The Barrens",
        start = { npc = "Gann Stonespire", x = 46.5, y = 76.2 },
        objectives = {
            { type = "kill", name = "Bael'dun Excavator", spawns = {
                {47.5, 85.2}, {48.8, 83.5}, {46.2, 86.8}, {49.5, 84.1}
            }},
            { type = "kill", name = "Bael'dun Foreman", spawns = {
                {48.1, 84.5}, {47.2, 86.1}, {49.2, 83.2}, {46.5, 87.5}
            }},
        }
    },
    
    [874] = { -- Revenge of Gann
        name = "Revenge of Gann",
        zone = "The Barrens",
        start = { npc = "Gann Stonespire", x = 46.5, y = 76.2 },
        objectives = {
            { type = "item", name = "Bael'dun Keep Key", spawns = {{48.5, 85.2}} },
            { type = "item", name = "Demolished Siege Engine", spawns = {{47.8, 84.5}} },
        }
    },
    
    [875] = { -- Counterattack!
        name = "Counterattack!",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Warlord Krom'zar", spawns = {{47.2, 61.5}} },
        }
    },
    
    [3261] = { -- The Harvester
        name = "The Harvester",
        zone = "The Barrens",
        start = { npc = "Darsok Swiftdagger", x = 51.5, y = 30.9 },
        objectives = {
            { type = "kill", name = "Harvester", spawns = {{50.2, 41.5}} },
        }
    },
    
    [861] = { -- Horde Presence
        name = "Horde Presence",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "talk", name = "Thork", spawns = {{51.5, 30.5}} },
        }
    },
    
    [876] = { -- Egg Hunt
        name = "Egg Hunt",
        zone = "The Barrens",
        start = { npc = "Korran", x = 51.8, y = 30.2 },
        objectives = {
            { type = "item", name = "Silithid Egg", spawns = {
                {41.2, 79.5}, {42.5, 77.8}, {40.5, 80.8}, {43.2, 78.2}
            }},
        }
    },
    
    [1492] = { -- Shimmering Flats
        name = "Shimmering Flats",
        zone = "The Barrens",
        start = { npc = "Thork", x = 51.5, y = 30.5 },
        objectives = {
            { type = "talk", name = "Pozzik", spawns = {{75.2, 97.5}} },
        }
    },
    
    [904] = { -- Testing an Enemy's Strength
        name = "Testing an Enemy's Strength",
        zone = "The Barrens",
        start = { npc = "Krog", x = 45.2, y = 58.8 },
        objectives = {
            { type = "kill", name = "Theramore Sentry", spawns = {
                {60.2, 54.8}, {61.5, 53.2}, {59.5, 56.1}, {62.2, 52.5}
            }},
        }
    },
    
    [905] = { -- Returning the Lost Satchel
        name = "Returning the Lost Satchel",
        zone = "The Barrens",
        start = { npc = "Krog", x = 45.2, y = 58.8 },
        objectives = {
            { type = "talk", name = "Thork", spawns = {{51.5, 30.5}} },
        }
    },
    
    [853] = { -- Chen's Empty Keg
        name = "Chen's Empty Keg",
        zone = "The Barrens",
        start = { npc = "Chen's Empty Keg", x = 47.8, y = 36.5 },
        objectives = {
            { type = "talk", name = "Brewmaster Drohn", spawns = {{62.5, 38.2}} },
        }
    },
    
    [821] = { -- Chen's Empty Keg (Quest Complete)
        name = "Chen's Empty Keg",
        zone = "The Barrens",
        start = { npc = "Brewmaster Drohn", x = 62.5, y = 38.2 },
        objectives = {
            { type = "item", name = "Savannah Lion Tusk", spawns = {
                {48.2, 48.5}, {49.5, 46.8}, {47.5, 50.1}, {50.2, 47.5}
            }},
            { type = "item", name = "Plainstrider Kidney", spawns = {
                {53.5, 26.2}, {54.8, 24.5}, {52.2, 27.8}, {55.5, 25.2}
            }},
            { type = "item", name = "Kodo Liver", spawns = {
                {45.2, 58.5}, {46.5, 56.8}, {44.5, 60.1}, {47.2, 57.5}
            }},
        }
    },
    
    [840] = { -- Message to Freewind Post
        name = "Message to Freewind Post",
        zone = "The Barrens",
        start = { npc = "Cliffwatcher Longhorn", x = 44.8, y = 59.2 },
        objectives = {
            { type = "talk", name = "Brave Moonhorn", spawns = {{45.2, 49.5}} },
        }
    },
    
    [863] = { -- Melor Sends Word
        name = "Melor Sends Word",
        zone = "The Barrens",
        start = { npc = "Melor Stonehoof", x = 61.5, y = 80.8 },
        objectives = {
            { type = "talk", name = "Jorn Skyseer", spawns = {{44.9, 59.1}} },
        }
    },
    
    [901] = { -- Apothecary Helbrim
        name = "Apothecary Helbrim",
        zone = "The Barrens",
        start = { npc = "Master Apothecary Faranell", x = 48.2, y = 69.5 },
        objectives = {
            { type = "talk", name = "Apothecary Helbrim", spawns = {{51.5, 30.2}} },
        }
    },
    
    [888] = { -- Samophlange Manual
        name = "Samophlange Manual",
        zone = "The Barrens",
        start = { npc = "Tinkerer Sniggles", x = 52.5, y = 11.5 },
        objectives = {
            { type = "item", name = "Samophlange Manual", spawns = {{53.2, 10.8}} },
        }
    },
    
    [889] = { -- Wenikee Boltbucket
        name = "Wenikee Boltbucket",
        zone = "The Barrens",
        start = { npc = "Sputtervalve", x = 62.3, y = 38.5 },
        objectives = {
            { type = "talk", name = "Wenikee Boltbucket", spawns = {{49.5, 11.2}} },
        }
    },
    
    [895] = { -- Mahren Skyseer
        name = "Mahren Skyseer",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "talk", name = "Mahren Skyseer", spawns = {{44.5, 59.5}} },
        }
    },
    
    [851] = { -- Revenge of Durotar
        name = "Revenge of Durotar",
        zone = "The Barrens",
        start = { npc = "Gar'Thok", x = 51.9, y = 43.5 },
        objectives = {
            { type = "kill", name = "Razormane Geomancer", spawns = {
                {41.5, 47.8}, {42.8, 46.1}, {40.2, 49.5}, {43.5, 45.2}
            }},
            { type = "kill", name = "Razormane Defender", spawns = {
                {42.1, 47.1}, {41.2, 48.8}, {43.2, 45.8}, {40.5, 50.2}
            }},
        }
    },
    
    [3281] = { -- Betrayal from Within (Part 1)
        name = "Betrayal from Within",
        zone = "The Barrens",
        start = { npc = "Mangletooth", x = 44.5, y = 59.2 },
        objectives = {
            { type = "kill", name = "Razormane Stalker", spawns = {
                {40.8, 49.5}, {42.1, 47.8}, {39.5, 51.2}, {43.2, 46.5}
            }},
        }
    },
    
    [3282] = { -- Betrayal from Within (Part 2)
        name = "Betrayal from Within",
        zone = "The Barrens",
        start = { npc = "Mangletooth", x = 44.5, y = 59.2 },
        objectives = {
            { type = "kill", name = "Charlga Razorflank", spawns = {{42.5, 50.2}} },
        }
    },
    
    [3380] = { -- Blood Shards of Agamaggan
        name = "Blood Shards of Agamaggan",
        zone = "The Barrens",
        start = { npc = "Mangletooth", x = 44.5, y = 59.2 },
        objectives = {
            { type = "item", name = "Blood Shard", spawns = {
                {41.2, 48.5}, {42.5, 46.8}, {40.5, 50.2}, {43.2, 47.2}
            }},
        }
    },
    
    [1060] = { -- The Kolkar of Spirit Rock
        name = "The Kolkar of Spirit Rock",
        zone = "The Barrens",
        start = { npc = "Thork", x = 51.5, y = 30.5 },
        objectives = {
            { type = "kill", name = "Kolkar Marauder", spawns = {
                {45.2, 63.5}, {46.5, 61.8}, {44.5, 65.2}, {47.2, 62.2}
            }},
            { type = "kill", name = "Kolkar Bloodcharger", spawns = {
                {45.8, 62.8}, {47.1, 61.2}, {44.8, 64.5}, {48.1, 60.5}
            }},
        }
    },
    
    [888] = { -- Samophlange
        name = "Samophlange",
        zone = "The Barrens",
        start = { npc = "Sputtervalve", x = 62.3, y = 38.5 },
        objectives = {
            { type = "talk", name = "Control Console", spawns = {{52.5, 11.2}} },
        }
    },
    
    [847] = { -- The Angry Scytheclaws
        name = "The Angry Scytheclaws",
        zone = "The Barrens",
        start = { npc = "Korran", x = 51.8, y = 30.2 },
        objectives = {
            { type = "kill", name = "Sunscale Scytheclaw", spawns = {
                {54.5, 34.2}, {55.8, 32.5}, {53.2, 35.8}, {56.5, 33.2}
            }},
        }
    },
    
    [862] = { -- Razormane Grounds
        name = "Razormane Grounds",
        zone = "The Barrens",
        start = { npc = "Thork", x = 51.5, y = 30.5 },
        objectives = {
            { type = "kill", name = "Razormane Quilboar", spawns = {
                {42.5, 49.2}, {43.8, 47.5}, {41.2, 50.8}, {44.5, 48.1}
            }},
            { type = "kill", name = "Razormane Dustrunner", spawns = {
                {43.1, 48.5}, {42.2, 50.1}, {44.2, 47.2}, {41.5, 51.5}
            }},
        }
    },
    
    [842] = { -- Crossroads Conscription
        name = "Crossroads Conscription",
        zone = "The Barrens",
        start = { npc = "Sergra Darkthorn", x = 52.2, y = 31.0 },
        objectives = {
            { type = "talk", name = "Thork", spawns = {{51.5, 30.5}} },
        }
    },
    
    [843] = { -- Disrupt the Attacks
        name = "Disrupt the Attacks",
        zone = "The Barrens",
        start = { npc = "Thork", x = 51.5, y = 30.5 },
        objectives = {
            { type = "kill", name = "Razormane Scout", spawns = {
                {48.5, 45.2}, {49.8, 43.5}, {47.2, 46.8}, {50.5, 44.1}
            }},
            { type = "kill", name = "Razormane Thornweaver", spawns = {
                {49.1, 44.5}, {48.2, 46.1}, {50.2, 43.2}, {47.5, 47.5}
            }},
        }
    },
    
    [849] = { -- Kolkar's Booty
        name = "Kolkar's Booty",
        zone = "The Barrens",
        start = { npc = "Verog the Dervish", x = 45.5, y = 77.8 },
        objectives = {
            { type = "item", name = "Kolkar Booty Key", spawns = {
                {44.5, 78.2}, {45.8, 76.5}, {43.2, 79.8}, {46.5, 77.1}
            }},
            { type = "item", name = "Kolkar Booty Chest", spawns = {{44.8, 77.5}} },
        }
    },
    
    [906] = { -- Northwatch Hold
        name = "Northwatch Hold",
        zone = "The Barrens",
        start = { npc = "Captain Fairmount", x = 63.2, y = 56.5 },
        objectives = {
            { type = "kill", name = "Northwatch Guard", spawns = {
                {61.5, 54.2}, {62.8, 52.5}, {60.2, 55.8}, {63.5, 53.1}
            }},
        }
    },
    
    [907] = { -- Cannonball Run
        name = "Cannonball Run",
        zone = "The Barrens",
        start = { npc = "Captain Thalo'thas Brightsun", x = 62.7, y = 38.5 },
        objectives = {
            { type = "item", name = "Northwatch Supply Crate", spawns = {
                {62.2, 55.5}, {63.5, 53.8}, {61.5, 57.2}, {64.2, 54.2}
            }},
        }
    },
    
    [854] = { -- Journey to the Crossroads
        name = "Journey to the Crossroads",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "talk", name = "Thork", spawns = {{51.5, 30.5}} },
        }
    },
    
    [879] = { -- Tribes at War
        name = "Tribes at War",
        zone = "The Barrens",
        start = { npc = "Mangletooth", x = 44.5, y = 59.2 },
        objectives = {
            { type = "item", name = "Bristleback Belt", spawns = {
                {40.5, 48.8}, {41.8, 47.2}, {39.2, 50.5}, {42.5, 46.5}
            }},
        }
    },
    
    [897] = { -- Verog the Dervish
        name = "Verog the Dervish",
        zone = "The Barrens",
        start = { npc = "Regthar Deathgate", x = 45.3, y = 28.4 },
        objectives = {
            { type = "kill", name = "Verog the Dervish", spawns = {{45.5, 77.8}} },
        }
    },
    
    [864] = { -- The Hunter's Way
        name = "The Hunter's Way",
        zone = "The Barrens",
        start = { npc = "Melor Stonehoof", x = 61.5, y = 80.8 },
        objectives = {
            { type = "kill", name = "Savannah Patriarch", spawns = {
                {49.5, 38.8}, {50.8, 37.2}, {48.2, 40.5}, {51.5, 36.5}
            }},
        }
    },
    
    [3262] = { -- Hunting Kodo
        name = "Hunting Kodo",
        zone = "The Barrens",
        start = { npc = "Jorn Skyseer", x = 44.9, y = 59.1 },
        objectives = {
            { type = "item", name = "Kodo Horn", spawns = {
                {46.5, 55.8}, {47.8, 54.2}, {45.2, 57.5}, {48.5, 53.5}
            }},
        }
    },
    
    [898] = { -- Ratchet
        name = "Ratchet",
        zone = "The Barrens",
        start = { npc = "Dev'ral", x = 51.5, y = 30.2 },
        objectives = {
            { type = "talk", name = "Gazlowe", spawns = {{62.7, 36.2}} },
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
    
    [19] = { -- Messenger to Westfall
        name = "Messenger to Westfall",
        zone = "Redridge Mountains",
        start = { npc = "Magistrate Solomon", x = 29.0, y = 44.4 },
        objectives = {
            { type = "talk", name = "Gryan Stoutmantle", spawns = {{56.3, 47.5}} },
        }
    },
    
    [65] = { -- Wanted: Gath'Ilzogg
        name = "Wanted: Gath'Ilzogg",
        zone = "Redridge Mountains",
        start = { npc = "Wanted Poster", x = 26.9, y = 45.5 },
        objectives = {
            { type = "kill", name = "Gath'Ilzogg", spawns = {{60.5, 37.8}} },
        }
    },
    
    [66] = { -- Wanted: Lieutenant Fangore
        name = "Wanted: Lieutenant Fangore",
        zone = "Redridge Mountains",
        start = { npc = "Wanted Poster", x = 26.9, y = 45.5 },
        objectives = {
            { type = "kill", name = "Lieutenant Fangore", spawns = {{80.5, 39.2}} },
        }
    },
    
    [88] = { -- Solomon's Law
        name = "Solomon's Law",
        zone = "Redridge Mountains",
        start = { npc = "Magistrate Solomon", x = 29.0, y = 44.4 },
        objectives = {
            { type = "kill", name = "Redridge Mongrel", spawns = {
                {42.5, 24.8}, {44.2, 26.1}, {43.1, 23.5}, {45.8, 25.4}
            }},
            { type = "kill", name = "Redridge Brute", spawns = {
                {44.8, 24.2}, {43.5, 27.5}, {46.1, 23.8}, {42.2, 26.8}
            }},
        }
    },
    
    [89] = { -- Underbelly Scales
        name = "Underbelly Scales",
        zone = "Redridge Mountains",
        start = { npc = "Verner Osgood", x = 31.0, y = 47.4 },
        objectives = {
            { type = "item", name = "Underbelly Whelp Scale", spawns = {
                {45.2, 54.8}, {47.5, 56.2}, {44.1, 57.5}, {48.8, 55.1}
            }},
        }
    },
    
    [92] = { -- Murloc Poachers
        name = "Murloc Poachers",
        zone = "Redridge Mountains",
        start = { npc = "Dockmaster Baren", x = 26.8, y = 47.2 },
        objectives = {
            { type = "kill", name = "Murloc Streamrunner", spawns = {
                {37.5, 54.2}, {39.2, 55.8}, {36.1, 56.5}, {40.5, 53.8}
            }},
            { type = "kill", name = "Murloc Nightcrawler", spawns = {
                {38.8, 54.5}, {37.2, 56.1}, {40.1, 55.2}, {35.5, 57.2}
            }},
        }
    },
    
    [34] = { -- Tharil'zun
        name = "Tharil'zun",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "kill", name = "Tharil'zun", spawns = {{35.8, 14.2}} },
        }
    },
    
    [116] = { -- Redridge Goulash
        name = "Redridge Goulash",
        zone = "Redridge Mountains",
        start = { npc = "Chef Breanna", x = 22.3, y = 43.4 },
        objectives = {
            { type = "item", name = "Crisp Spider Meat", spawns = {
                {22.5, 26.8}, {24.1, 28.5}, {21.2, 25.1}, {25.5, 27.2}
            }},
            { type = "item", name = "Great Goretusk Snout", spawns = {
                {18.5, 62.8}, {20.2, 60.5}, {17.1, 64.2}, {21.5, 61.8}
            }},
            { type = "item", name = "Tough Condor Meat", spawns = {
                {30.5, 26.8}, {32.2, 24.5}, {29.1, 28.2}, {33.5, 25.5}
            }},
        }
    },
    
    [90] = { -- The Price of Shoes
        name = "The Price of Shoes",
        zone = "Redridge Mountains",
        start = { npc = "Verner Osgood", x = 31.0, y = 47.4 },
        objectives = {
            { type = "talk", name = "Smith Argus", spawns = {{41.8, 65.5}} },
        }
    },
    
    [121] = { -- Blackrock Bounty
        name = "Blackrock Bounty",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "kill", name = "Blackrock Champion", spawns = {
                {62.5, 48.2}, {64.2, 46.5}, {61.1, 49.8}, {65.5, 47.1}
            }},
        }
    },
    
    [131] = { -- Looking Further
        name = "Looking Further",
        zone = "Redridge Mountains",
        start = { npc = "High Sorcerer Andromath", x = 37.1, y = 81.5 },
        objectives = {
            { type = "item", name = "Wizards' Reagent", spawns = {{45.8, 12.5}} },
        }
    },
    
    [132] = { -- What Comes Around...
        name = "What Comes Around...",
        zone = "Redridge Mountains",
        start = { npc = "Guard Berton", x = 30.4, y = 60.5 },
        objectives = {
            { type = "item", name = "Gnoll Paw", spawns = {
                {32.5, 61.2}, {34.2, 59.5}, {31.1, 62.8}, {35.5, 60.1}
            }},
        }
    },
    
    [120] = { -- Encroaching Gnolls
        name = "Encroaching Gnolls",
        zone = "Redridge Mountains",
        start = { npc = "Watcher Petras", x = 17.5, y = 69.5 },
        objectives = {
            { type = "kill", name = "Redridge Mystic", spawns = {
                {28.5, 72.8}, {30.2, 70.5}, {27.1, 74.2}, {31.5, 71.8}
            }},
            { type = "kill", name = "Redridge Alpha", spawns = {
                {29.8, 71.5}, {28.2, 73.1}, {31.2, 70.2}, {26.8, 75.5}
            }},
        }
    },
    
    [122] = { -- An Unwelcome Guest
        name = "An Unwelcome Guest",
        zone = "Redridge Mountains",
        start = { npc = "Verner Osgood", x = 31.0, y = 47.4 },
        objectives = {
            { type = "kill", name = "Bellygrub", spawns = {{24.5, 60.2}} },
        }
    },
    
    [130] = { -- Morganth
        name = "Morganth",
        zone = "Redridge Mountains",
        start = { npc = "High Sorcerer Andromath", x = 37.1, y = 81.5 },
        objectives = {
            { type = "kill", name = "Morganth", spawns = {{79.5, 38.2}} },
        }
    },
    
    [391] = { -- Blackrock Spyglass
        name = "Blackrock Spyglass",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "item", name = "Spyglass", spawns = {{77.2, 42.5}} },
        }
    },
    
    [93] = { -- A Free Lunch
        name = "A Free Lunch",
        zone = "Redridge Mountains",
        start = { npc = "Darcy", x = 26.4, y = 41.5 },
        objectives = {
            { type = "talk", name = "Guard Parker", spawns = {{20.5, 56.8}} },
        }
    },
    
    [115] = { -- Return to Verner
        name = "Return to Verner",
        zone = "Redridge Mountains",
        start = { npc = "Smith Argus", x = 41.8, y = 65.5 },
        objectives = {
            { type = "talk", name = "Verner Osgood", spawns = {{31.0, 47.4}} },
        }
    },
    
    [169] = { -- The Everstill Bridge
        name = "The Everstill Bridge",
        zone = "Redridge Mountains",
        start = { npc = "Foreman Oslow", x = 32.3, y = 48.6 },
        objectives = {
            { type = "item", name = "Iron Pike", spawns = {
                {38.5, 56.2}, {40.2, 54.5}, {37.1, 57.8}, {41.5, 55.1}
            }},
            { type = "item", name = "Iron Rivet", spawns = {
                {39.8, 55.5}, {38.2, 57.1}, {41.2, 54.2}, {36.8, 58.5}
            }},
        }
    },
    
    [1698] = { -- Hilary's Necklace
        name = "Hilary's Necklace",
        zone = "Redridge Mountains",
        start = { npc = "Shawn", x = 26.8, y = 43.8 },
        objectives = {
            { type = "item", name = "Hilary's Necklace", spawns = {{44.5, 57.2}} },
        }
    },
    
    [180] = { -- A Watchful Eye
        name = "A Watchful Eye",
        zone = "Redridge Mountains",
        start = { npc = "Guard Ashlock", x = 33.5, y = 47.5 },
        objectives = {
            { type = "item", name = "Smuggled Supplies", spawns = {
                {17.2, 26.5}, {18.5, 24.8}, {16.1, 27.8}, {19.5, 25.5}
            }},
        }
    },
    
    [94] = { -- Visit the Herbalist
        name = "Visit the Herbalist",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "talk", name = "Martie Jainrose", spawns = {{23.8, 53.2}} },
        }
    },
    
    [127] = { -- Howling in the Hills
        name = "Howling in the Hills",
        zone = "Redridge Mountains",
        start = { npc = "Martie Jainrose", x = 23.8, y = 53.2 },
        objectives = {
            { type = "kill", name = "Yowler", spawns = {{28.5, 18.8}} },
        }
    },
    
    [128] = { -- Deliver the Spyglass
        name = "Deliver the Spyglass",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "talk", name = "Magistrate Solomon", spawns = {{29.0, 44.4}} },
        }
    },
    
    [244] = { -- Assault on the Tower
        name = "Assault on the Tower",
        zone = "Redridge Mountains",
        start = { npc = "Marshal Marris", x = 33.5, y = 49.0 },
        objectives = {
            { type = "item", name = "Blackhand's Lieutenant Badge", spawns = {
                {60.5, 38.2}, {62.2, 36.5}, {59.1, 39.8}, {63.5, 37.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Duskwood Quests (Alliance 18-30)
    -----------------------------------------
    
    [163] = { -- The Hermit
        name = "The Hermit",
        zone = "Duskwood",
        start = { npc = "Elaine Carevin", x = 75.2, y = 45.5 },
        objectives = {
            { type = "talk", name = "Abercrombie", spawns = {{28.2, 32.5}} },
        }
    },
    
    [164] = { -- Supplies from Darkshire
        name = "Supplies from Darkshire",
        zone = "Duskwood",
        start = { npc = "Abercrombie", x = 28.2, y = 32.5 },
        objectives = {
            { type = "talk", name = "Madame Eva", spawns = {{75.8, 45.8}} },
        }
    },
    
    [165] = { -- Ghost Hair Thread
        name = "Ghost Hair Thread",
        zone = "Duskwood",
        start = { npc = "Abercrombie", x = 28.2, y = 32.5 },
        objectives = {
            { type = "talk", name = "Madame Eva", spawns = {{75.8, 45.8}} },
        }
    },
    
    [166] = { -- Return the Comb
        name = "Return the Comb",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "talk", name = "Abercrombie", spawns = {{28.2, 32.5}} },
        }
    },
    
    [167] = { -- Deliver the Thread
        name = "Deliver the Thread",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "talk", name = "Abercrombie", spawns = {{28.2, 32.5}} },
        }
    },
    
    [168] = { -- Zombie Juice
        name = "Zombie Juice",
        zone = "Duskwood",
        start = { npc = "Abercrombie", x = 28.2, y = 32.5 },
        objectives = {
            { type = "talk", name = "Tavernkeep Smitts", spawns = {{73.5, 44.5}} },
        }
    },
    
    [221] = { -- Seasoned Wolf Kabobs
        name = "Seasoned Wolf Kabobs",
        zone = "Duskwood",
        start = { npc = "Chef Grual", x = 73.8, y = 43.5 },
        objectives = {
            { type = "item", name = "Lean Wolf Flank", spawns = {
                {52.5, 66.2}, {54.2, 64.5}, {51.1, 67.8}, {55.5, 65.1}
            }},
        }
    },
    
    [222] = { -- Worgen in the Woods
        name = "Worgen in the Woods",
        zone = "Duskwood",
        start = { npc = "Calor", x = 75.2, y = 48.5 },
        objectives = {
            { type = "kill", name = "Nightbane Worgen", spawns = {
                {64.5, 32.8}, {66.2, 30.5}, {63.1, 34.2}, {67.5, 31.8}
            }},
        }
    },
    
    [223] = { -- Worgen in the Woods (Part 2)
        name = "Worgen in the Woods",
        zone = "Duskwood",
        start = { npc = "Calor", x = 75.2, y = 48.5 },
        objectives = {
            { type = "kill", name = "Nightbane Shadow Weaver", spawns = {
                {70.5, 26.8}, {72.2, 24.5}, {69.1, 28.2}, {73.5, 25.5}
            }},
            { type = "kill", name = "Nightbane Dark Runner", spawns = {
                {71.8, 25.5}, {70.2, 27.1}, {73.2, 24.2}, {68.8, 29.5}
            }},
        }
    },
    
    [224] = { -- Worgen in the Woods (Part 3)
        name = "Worgen in the Woods",
        zone = "Duskwood",
        start = { npc = "Calor", x = 75.2, y = 48.5 },
        objectives = {
            { type = "kill", name = "Nightbane Vile Fang", spawns = {
                {69.5, 78.2}, {71.2, 76.5}, {68.1, 79.8}, {72.5, 77.1}
            }},
        }
    },
    
    [225] = { -- Worgen in the Woods (Part 4)
        name = "Worgen in the Woods",
        zone = "Duskwood",
        start = { npc = "Jonathan Carevin", x = 75.5, y = 48.2 },
        objectives = {
            { type = "kill", name = "Gutspill", spawns = {{72.8, 73.5}} },
        }
    },
    
    [226] = { -- The Legend of Stalvan
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Clerk Daltry", x = 72.5, y = 46.5 },
        objectives = {
            { type = "talk", name = "Clerk Daltry", spawns = {{72.5, 46.5}} },
        }
    },
    
    [227] = { -- The Legend of Stalvan (Part 2)
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Clerk Daltry", x = 72.5, y = 46.5 },
        objectives = {
            { type = "talk", name = "Caretaker Folsom", spawns = {{31.5, 48.5}} },
        }
    },
    
    [228] = { -- The Legend of Stalvan (Part 3)
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "talk", name = "Tavernkeep Smitts", spawns = {{73.5, 44.5}} },
        }
    },
    
    [229] = { -- The Legend of Stalvan (Part 4)
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Tavernkeep Smitts", x = 73.5, y = 44.5 },
        objectives = {
            { type = "item", name = "Dusty Unsent Letter", spawns = {{77.2, 36.5}} },
        }
    },
    
    [230] = { -- The Legend of Stalvan (Part 5)
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Clerk Daltry", x = 72.5, y = 46.5 },
        objectives = {
            { type = "talk", name = "Commander Althea Ebonlocke", spawns = {{73.5, 46.8}} },
        }
    },
    
    [231] = { -- The Legend of Stalvan (Part 6)
        name = "The Legend of Stalvan",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Stalvan Mistmantle", spawns = {{77.5, 36.2}} },
        }
    },
    
    [232] = { -- Sven's Revenge
        name = "Sven's Revenge",
        zone = "Duskwood",
        start = { npc = "Sven Yorgen", x = 7.8, y = 34.2 },
        objectives = {
            { type = "talk", name = "Madame Eva", spawns = {{75.8, 45.8}} },
        }
    },
    
    [233] = { -- Prove Your Worth
        name = "Prove Your Worth",
        zone = "Duskwood",
        start = { npc = "Sven Yorgen", x = 7.8, y = 34.2 },
        objectives = {
            { type = "kill", name = "Skeletal Raider", spawns = {
                {15.5, 38.2}, {17.2, 36.5}, {14.1, 39.8}, {18.5, 37.1}
            }},
            { type = "kill", name = "Skeletal Fiend", spawns = {
                {16.8, 37.5}, {15.2, 39.1}, {18.2, 36.2}, {13.8, 40.5}
            }},
        }
    },
    
    [53] = { -- Wolves at the Window / Skeletal Fingers
        name = "Skeletal Fingers",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "item", name = "Skeletal Finger", spawns = {
                {18.5, 54.2}, {20.2, 52.5}, {17.1, 55.8}, {21.5, 53.1}
            }},
        }
    },
    
    [56] = { -- Mor'Ladim
        name = "Mor'Ladim",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Mor'Ladim", spawns = {{19.5, 32.8}} },
        }
    },
    
    [57] = { -- The Daughter Who Lived
        name = "The Daughter Who Lived",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "talk", name = "Watcher Sarah Ladimore", spawns = {{75.5, 45.2}} },
        }
    },
    
    [58] = { -- A Daughter's Love
        name = "A Daughter's Love",
        zone = "Duskwood",
        start = { npc = "Watcher Sarah Ladimore", x = 75.5, y = 45.2 },
        objectives = {
            { type = "talk", name = "Mor'Ladim", spawns = {{19.5, 32.8}} },
        }
    },
    
    [235] = { -- Sven's Camp
        name = "Sven's Camp",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "talk", name = "Sven Yorgen", spawns = {{7.8, 34.2}} },
        }
    },
    
    [262] = { -- Raven Hill
        name = "Raven Hill",
        zone = "Duskwood",
        start = { npc = "Lord Ello Ebonlocke", x = 75.8, y = 44.3 },
        objectives = {
            { type = "kill", name = "Plague Spreader", spawns = {
                {19.5, 41.2}, {21.2, 39.5}, {18.1, 42.8}, {22.5, 40.1}
            }},
            { type = "kill", name = "Bone Chewer", spawns = {
                {20.8, 40.5}, {19.2, 42.1}, {22.2, 39.2}, {17.8, 43.5}
            }},
        }
    },
    
    [265] = { -- The Night Watch
        name = "The Night Watch",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Skeletal Warrior", spawns = {
                {18.5, 36.2}, {20.2, 34.5}, {17.1, 37.8}, {21.5, 35.1}
            }},
            { type = "kill", name = "Skeletal Mage", spawns = {
                {19.8, 35.5}, {18.2, 37.1}, {21.2, 34.2}, {16.8, 38.5}
            }},
        }
    },
    
    [266] = { -- The Night Watch (Part 2)
        name = "The Night Watch",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Skeletal Healer", spawns = {
                {24.5, 28.2}, {26.2, 26.5}, {23.1, 29.8}, {27.5, 27.1}
            }},
        }
    },
    
    [267] = { -- The Night Watch (Part 3)
        name = "The Night Watch",
        zone = "Duskwood",
        start = { npc = "Commander Althea Ebonlocke", x = 73.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Skeletal Horror", spawns = {
                {17.5, 31.2}, {19.2, 29.5}, {16.1, 32.8}, {20.5, 30.1}
            }},
        }
    },
    
    [323] = { -- Deliveries to Sven
        name = "Deliveries to Sven",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "talk", name = "Sven Yorgen", spawns = {{7.8, 34.2}} },
        }
    },
    
    [324] = { -- Seeking Wisdom
        name = "Seeking Wisdom",
        zone = "Duskwood",
        start = { npc = "Sven Yorgen", x = 7.8, y = 34.2 },
        objectives = {
            { type = "talk", name = "Bishop Farthing", spawns = {{49.5, 30.2}} },
        }
    },
    
    [325] = { -- The Doomed Fleet
        name = "The Doomed Fleet",
        zone = "Duskwood",
        start = { npc = "Bishop Farthing", x = 49.5, y = 30.2 },
        objectives = {
            { type = "talk", name = "Glorin Steelbrow", spawns = {{10.5, 60.8}} },
        }
    },
    
    [326] = { -- Lightforge Iron
        name = "Lightforge Iron",
        zone = "Duskwood",
        start = { npc = "Glorin Steelbrow", x = 10.5, y = 60.8 },
        objectives = {
            { type = "item", name = "Lightforge Ingot", spawns = {
                {32.5, 71.2}, {34.2, 69.5}, {31.1, 72.8}, {35.5, 70.1}
            }},
        }
    },
    
    [327] = { -- The Rotting Orchard
        name = "The Rotting Orchard",
        zone = "Duskwood",
        start = { npc = "Sven Yorgen", x = 7.8, y = 34.2 },
        objectives = {
            { type = "item", name = "Ghoul Rib", spawns = {
                {57.5, 28.2}, {59.2, 26.5}, {56.1, 29.8}, {60.5, 27.1}
            }},
        }
    },
    
    [328] = { -- Armed and Ready
        name = "Armed and Ready",
        zone = "Duskwood",
        start = { npc = "Clarice Foster", x = 73.2, y = 44.2 },
        objectives = {
            { type = "talk", name = "Sven Yorgen", spawns = {{7.8, 34.2}} },
        }
    },
    
    [253] = { -- Stranglekelp
        name = "Stranglekelp",
        zone = "Duskwood",
        start = { npc = "Tavernkeep Smitts", x = 73.5, y = 44.5 },
        objectives = {
            { type = "item", name = "Stranglekelp", spawns = {
                {20.5, 79.2}, {22.2, 77.5}, {19.1, 80.8}, {23.5, 78.1}
            }},
        }
    },
    
    [254] = { -- The Jitters
        name = "The Jitters",
        zone = "Duskwood",
        start = { npc = "Tavernkeep Smitts", x = 73.5, y = 44.5 },
        objectives = {
            { type = "talk", name = "Jitters", spawns = {{18.5, 57.8}} },
        }
    },
    
    [257] = { -- Ogre Thieves
        name = "Ogre Thieves",
        zone = "Duskwood",
        start = { npc = "Jitters", x = 18.5, y = 57.8 },
        objectives = {
            { type = "item", name = "Giles' Traveling Case", spawns = {{32.5, 56.8}} },
        }
    },
    
    [255] = { -- Deliveries to Abercrombie
        name = "Deliveries to Abercrombie",
        zone = "Duskwood",
        start = { npc = "Tavernkeep Smitts", x = 73.5, y = 44.5 },
        objectives = {
            { type = "talk", name = "Abercrombie", spawns = {{28.2, 32.5}} },
        }
    },
    
    [252] = { -- Abomination
        name = "Abomination",
        zone = "Duskwood",
        start = { npc = "Abercrombie", x = 28.2, y = 32.5 },
        objectives = {
            { type = "kill", name = "Stitches", spawns = {{73.5, 46.2}} },
        }
    },
    
    [245] = { -- Look to the Stars (Part 1)
        name = "Look to the Stars",
        zone = "Duskwood",
        start = { npc = "Viktori Prism'Antras", x = 81.2, y = 59.5 },
        objectives = {
            { type = "talk", name = "Cog", spawns = {{77.5, 45.2}} },
        }
    },
    
    [246] = { -- Look to the Stars (Part 2)
        name = "Look to the Stars",
        zone = "Duskwood",
        start = { npc = "Cog", x = 77.5, y = 45.2 },
        objectives = {
            { type = "item", name = "Insane Ghoul's Heart", spawns = {
                {24.5, 36.2}, {26.2, 34.5}, {23.1, 37.8}, {27.5, 35.1}
            }},
        }
    },
    
    [247] = { -- Look to the Stars (Part 3)
        name = "Look to the Stars",
        zone = "Duskwood",
        start = { npc = "Viktori Prism'Antras", x = 81.2, y = 59.5 },
        objectives = {
            { type = "talk", name = "Madame Eva", spawns = {{75.8, 45.8}} },
        }
    },
    
    [248] = { -- Look to the Stars (Part 4)
        name = "Look to the Stars",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "kill", name = "Blind Mary", spawns = {{81.5, 59.2}} },
        }
    },
    
    [459] = { -- The Totem of Infliction
        name = "The Totem of Infliction",
        zone = "Duskwood",
        start = { npc = "Madame Eva", x = 75.8, y = 45.8 },
        objectives = {
            { type = "item", name = "Ghoul Fang", spawns = {
                {18.5, 43.2}, {20.2, 41.5}, {17.1, 44.8}, {21.5, 42.1}
            }},
            { type = "item", name = "Spider's Silk", spawns = {
                {25.5, 71.2}, {27.2, 69.5}, {24.1, 72.8}, {28.5, 70.1}
            }},
            { type = "item", name = "Skeleton Bone", spawns = {
                {19.5, 35.2}, {21.2, 33.5}, {18.1, 36.8}, {22.5, 34.1}
            }},
        }
    },
    
    [401] = { -- Worgen Dissectors
        name = "Worgen Dissectors",
        zone = "Duskwood",
        start = { npc = "Elaine Carevin", x = 75.2, y = 45.5 },
        objectives = {
            { type = "kill", name = "Nightbane Worgen", spawns = {
                {64.5, 32.8}, {66.2, 30.5}, {63.1, 34.2}, {67.5, 31.8}
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
    
    [493] = { -- Battle of Hillsbrad
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Farmer", spawns = {
                {33.5, 45.2}, {35.2, 43.5}, {32.1, 46.8}, {36.5, 44.1}
            }},
            { type = "kill", name = "Hillsbrad Farmhand", spawns = {
                {34.8, 44.5}, {33.2, 46.1}, {36.2, 43.2}, {31.8, 47.5}
            }},
        }
    },
    
    [494] = { -- Battle of Hillsbrad (Part 2)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Peasant", spawns = {
                {37.5, 48.2}, {39.2, 46.5}, {36.1, 49.8}, {40.5, 47.1}
            }},
        }
    },
    
    [495] = { -- Battle of Hillsbrad (Part 3)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Apprentice Blacksmith", spawns = {
                {32.5, 42.2}, {34.2, 40.5}, {31.1, 43.8}, {35.5, 41.1}
            }},
            { type = "kill", name = "Blacksmith Verringtan", spawns = {{32.5, 41.5}} },
        }
    },
    
    [496] = { -- Battle of Hillsbrad (Part 4)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Councilman", spawns = {
                {35.5, 44.2}, {37.2, 42.5}, {34.1, 45.8}, {38.5, 43.1}
            }},
            { type = "kill", name = "Magistrate Burnside", spawns = {{35.5, 43.8}} },
        }
    },
    
    [497] = { -- Battle of Hillsbrad (Part 5)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Hillsbrad Footman", spawns = {
                {34.5, 45.2}, {36.2, 43.5}, {33.1, 46.8}, {37.5, 44.1}
            }},
            { type = "kill", name = "Hillsbrad Sentry", spawns = {
                {35.8, 44.5}, {34.2, 46.1}, {37.2, 43.2}, {32.8, 47.5}
            }},
        }
    },
    
    [498] = { -- Battle of Hillsbrad (Part 6)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Clerk Horrace Whitesteed", spawns = {{36.2, 44.5}} },
            { type = "kill", name = "Minor Clerk", spawns = {
                {36.5, 45.2}, {37.8, 43.8}, {35.2, 46.5}, {38.5, 44.5}
            }},
        }
    },
    
    [499] = { -- Battle of Hillsbrad (Part 7)
        name = "Battle of Hillsbrad",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Magistrate Burnside", spawns = {{35.5, 43.8}} },
        }
    },
    
    [502] = { -- Elixir of Suffering (Part 2)
        name = "Elixir of Suffering",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "kill", name = "Mudsnout Shaman", spawns = {
                {44.5, 61.2}, {46.2, 59.5}, {43.1, 62.8}, {47.5, 60.1}
            }},
        }
    },
    
    [503] = { -- Elixir of Pain
        name = "Elixir of Pain",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "kill", name = "Gray Bear", spawns = {
                {54.5, 61.2}, {56.2, 59.5}, {53.1, 62.8}, {57.5, 60.1}
            }},
        }
    },
    
    [504] = { -- Elixir of Agony
        name = "Elixir of Agony",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "item", name = "Gray Bear Tongue", spawns = {
                {54.5, 61.2}, {56.2, 59.5}, {53.1, 62.8}, {57.5, 60.1}
            }},
            { type = "item", name = "Mountain Lion Blood", spawns = {
                {38.5, 36.2}, {40.2, 34.5}, {37.1, 37.8}, {41.5, 35.1}
            }},
        }
    },
    
    [505] = { -- Elixir of Agony (Part 2)
        name = "Elixir of Agony",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "kill", name = "Hillsbrad Farmer", spawns = {
                {33.5, 45.2}, {35.2, 43.5}, {32.1, 46.8}, {36.5, 44.1}
            }},
        }
    },
    
    [509] = { -- Elixir of Agony (Part 3)
        name = "Elixir of Agony",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "talk", name = "Umpi", spawns = {{62.8, 20.5}} },
        }
    },
    
    [510] = { -- Elixir of Agony (Part 4)
        name = "Elixir of Agony",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apothecary Lydon", x = 61.4, y = 19.1 },
        objectives = {
            { type = "item", name = "Mudsnout Composite", spawns = {
                {44.5, 61.2}, {46.2, 59.5}, {43.1, 62.8}, {47.5, 60.1}
            }},
        }
    },
    
    [529] = { -- Helcular's Revenge
        name = "Helcular's Revenge",
        zone = "Hillsbrad Foothills",
        start = { npc = "Novice Thaivand", x = 61.8, y = 19.2 },
        objectives = {
            { type = "item", name = "Helcular's Rod", spawns = {{56.5, 48.2}} },
        }
    },
    
    [530] = { -- Helcular's Revenge (Part 2)
        name = "Helcular's Revenge",
        zone = "Hillsbrad Foothills",
        start = { npc = "Novice Thaivand", x = 61.8, y = 19.2 },
        objectives = {
            { type = "item", name = "Flame of Yetimus", spawns = {{46.2, 29.5}} },
            { type = "item", name = "Flame of Uzel", spawns = {{42.8, 16.5}} },
        }
    },
    
    [531] = { -- Helcular's Revenge (Part 3)
        name = "Helcular's Revenge",
        zone = "Hillsbrad Foothills",
        start = { npc = "Novice Thaivand", x = 61.8, y = 19.2 },
        objectives = {
            { type = "item", name = "Torch of Retribution", spawns = {{46.5, 14.8}} },
        }
    },
    
    [535] = { -- Trollbane
        name = "Trollbane",
        zone = "Hillsbrad Foothills",
        start = { npc = "Krusk", x = 59.5, y = 23.0 },
        objectives = {
            { type = "item", name = "Troll Tribal Necklace", spawns = {
                {62.5, 74.2}, {64.2, 72.5}, {61.1, 75.8}, {65.5, 73.1}
            }},
        }
    },
    
    [546] = { -- WANTED: Syndicate Personnel
        name = "WANTED: Syndicate Personnel",
        zone = "Hillsbrad Foothills",
        start = { npc = "Wanted Poster", x = 61.5, y = 19.5 },
        objectives = {
            { type = "kill", name = "Syndicate Thief", spawns = {
                {54.5, 24.2}, {56.2, 22.5}, {53.1, 25.8}, {57.5, 23.1}
            }},
            { type = "kill", name = "Syndicate Spy", spawns = {
                {55.8, 23.5}, {54.2, 25.1}, {57.2, 22.2}, {52.8, 26.5}
            }},
        }
    },
    
    [547] = { -- WANTED: Baron Vardus
        name = "WANTED: Baron Vardus",
        zone = "Hillsbrad Foothills",
        start = { npc = "Wanted Poster", x = 61.5, y = 19.5 },
        objectives = {
            { type = "kill", name = "Baron Vardus", spawns = {{64.5, 59.8}} },
        }
    },
    
    [549] = { -- Humbert's Sword
        name = "Humbert's Sword",
        zone = "Hillsbrad Foothills",
        start = { npc = "Deathguard Humbert", x = 62.2, y = 20.5 },
        objectives = {
            { type = "item", name = "Humbert's Sword", spawns = {{76.5, 60.8}} },
        }
    },
    
    [550] = { -- Blackmoore's Legacy
        name = "Blackmoore's Legacy",
        zone = "Hillsbrad Foothills",
        start = { npc = "Durnholde Rifleman", x = 77.5, y = 58.2 },
        objectives = {
            { type = "item", name = "Blackmoore's Legacy", spawns = {{78.2, 55.5}} },
        }
    },
    
    [552] = { -- Gol'dir
        name = "Gol'dir",
        zone = "Hillsbrad Foothills",
        start = { npc = "Krusk", x = 59.5, y = 23.0 },
        objectives = {
            { type = "talk", name = "Gol'dir", spawns = {{79.2, 51.5}} },
        }
    },
    
    [556] = { -- Infiltration
        name = "Infiltration",
        zone = "Hillsbrad Foothills",
        start = { npc = "Krusk", x = 59.5, y = 23.0 },
        objectives = {
            { type = "item", name = "Syndicate Disguise", spawns = {
                {72.5, 44.2}, {74.2, 42.5}, {71.1, 45.8}, {75.5, 43.1}
            }},
        }
    },
    
    [559] = { -- Prison Lockdown
        name = "Prison Lockdown",
        zone = "Hillsbrad Foothills",
        start = { npc = "Gol'dir", x = 79.2, y = 51.5 },
        objectives = {
            { type = "item", name = "Burnished Gold Key", spawns = {{79.5, 48.8}} },
        }
    },
    
    [562] = { -- Dalaran Patrols
        name = "Dalaran Patrols",
        zone = "Hillsbrad Foothills",
        start = { npc = "Magus Wordeen Voidglare", x = 61.3, y = 21.5 },
        objectives = {
            { type = "kill", name = "Dalaran Summoner", spawns = {
                {17.5, 42.2}, {19.2, 40.5}, {16.1, 43.8}, {20.5, 41.1}
            }},
            { type = "kill", name = "Dalaran Conjuror", spawns = {
                {18.8, 41.5}, {17.2, 43.1}, {20.2, 40.2}, {15.8, 44.5}
            }},
        }
    },
    
    [564] = { -- Dalaran Horrors
        name = "Dalaran Horrors",
        zone = "Hillsbrad Foothills",
        start = { npc = "Magus Wordeen Voidglare", x = 61.3, y = 21.5 },
        objectives = {
            { type = "kill", name = "Dalaran Shield Guard", spawns = {
                {16.5, 43.2}, {18.2, 41.5}, {15.1, 44.8}, {19.5, 42.1}
            }},
            { type = "kill", name = "Dalaran Theurgist", spawns = {
                {17.8, 42.5}, {16.2, 44.1}, {19.2, 41.2}, {14.8, 45.5}
            }},
        }
    },
    
    [556] = { -- Durnholde Keep
        name = "Durnholde Keep",
        zone = "Hillsbrad Foothills",
        start = { npc = "High Executor Darthalia", x = 61.5, y = 19.0 },
        objectives = {
            { type = "kill", name = "Durnholde Rifleman", spawns = {
                {76.5, 58.2}, {78.2, 56.5}, {75.1, 59.8}, {79.5, 57.1}
            }},
            { type = "kill", name = "Durnholde Warden", spawns = {
                {77.8, 57.5}, {76.2, 59.1}, {79.2, 56.2}, {74.8, 60.5}
            }},
        }
    },
    
    [567] = { -- Stormpike's Order
        name = "Stormpike's Order",
        zone = "Hillsbrad Foothills",
        start = { npc = "Magistrate Maleb", x = 50.5, y = 57.0 },
        objectives = {
            { type = "talk", name = "Loremaster Dibbs", spawns = {{52.5, 56.2}} },
        }
    },
    
    [568] = { -- Crushridge Warmongers
        name = "Crushridge Warmongers",
        zone = "Hillsbrad Foothills",
        start = { npc = "Marshal Redpath", x = 51.5, y = 58.5 },
        objectives = {
            { type = "kill", name = "Crushridge Warmonger", spawns = {
                {48.5, 87.2}, {50.2, 85.5}, {47.1, 88.8}, {51.5, 86.1}
            }},
        }
    },
    
    [569] = { -- Costly Menace
        name = "Costly Menace",
        zone = "Hillsbrad Foothills",
        start = { npc = "Quartermaster Hicks", x = 49.8, y = 56.5 },
        objectives = {
            { type = "item", name = "Mountain Lion Carcass", spawns = {
                {38.5, 36.2}, {40.2, 34.5}, {37.1, 37.8}, {41.5, 35.1}
            }},
        }
    },
    
    [570] = { -- Southshore Stew
        name = "Southshore Stew",
        zone = "Hillsbrad Foothills",
        start = { npc = "Chef Jessen", x = 51.8, y = 57.8 },
        objectives = {
            { type = "item", name = "Bear Meat", spawns = {
                {54.5, 61.2}, {56.2, 59.5}, {53.1, 62.8}, {57.5, 60.1}
            }},
            { type = "item", name = "Spider Ichor", spawns = {
                {35.5, 71.2}, {37.2, 69.5}, {34.1, 72.8}, {38.5, 70.1}
            }},
            { type = "item", name = "Fresh Crab Meat", spawns = {
                {47.5, 60.2}, {49.2, 58.5}, {46.1, 61.8}, {50.5, 59.1}
            }},
        }
    },
    
    [573] = { -- WANTED: Hillsbrad Humans
        name = "WANTED: Hillsbrad Humans",
        zone = "Hillsbrad Foothills",
        start = { npc = "Wanted Poster", x = 61.5, y = 19.5 },
        objectives = {
            { type = "kill", name = "Hillsbrad Human", spawns = {
                {32.5, 44.2}, {34.2, 42.5}, {31.1, 45.8}, {35.5, 43.1}
            }},
        }
    },
    
    [574] = { -- Soothing Turtle Bisque
        name = "Soothing Turtle Bisque",
        zone = "Hillsbrad Foothills",
        start = { npc = "Chef Jessen", x = 51.8, y = 57.8 },
        objectives = {
            { type = "item", name = "Turtle Meat", spawns = {
                {28.5, 68.2}, {30.2, 66.5}, {27.1, 69.8}, {31.5, 67.1}
            }},
            { type = "item", name = "Snapjaw Crocolisk Skin", spawns = {
                {29.8, 67.5}, {28.2, 69.1}, {31.2, 66.2}, {26.8, 70.5}
            }},
        }
    },
    
    [577] = { -- Hints of a New Plague
        name = "Hints of a New Plague?",
        zone = "Hillsbrad Foothills",
        start = { npc = "Phin Odelic", x = 50.5, y = 56.8 },
        objectives = {
            { type = "talk", name = "Apprentice Kryten", spawns = {{37.2, 49.8}} },
        }
    },
    
    [578] = { -- Hints of a New Plague (Part 2)
        name = "Hints of a New Plague?",
        zone = "Hillsbrad Foothills",
        start = { npc = "Apprentice Kryten", x = 37.2, y = 49.8 },
        objectives = {
            { type = "item", name = "Mudsnout Fungus", spawns = {
                {44.5, 61.2}, {46.2, 59.5}, {43.1, 62.8}, {47.5, 60.1}
            }},
        }
    },
    
    [580] = { -- Yeti Hide
        name = "Yeti Hide",
        zone = "Hillsbrad Foothills",
        start = { npc = "Bartolo Ginsetti", x = 50.5, y = 58.5 },
        objectives = {
            { type = "item", name = "Thick Yeti Hide", spawns = {
                {43.5, 18.2}, {45.2, 16.5}, {42.1, 19.8}, {46.5, 17.1}
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
    
    [991] = { -- Satyr Horns
        name = "Satyr Horns",
        zone = "Ashenvale",
        start = { npc = "Illiyana", x = 37.2, y = 51.8 },
        objectives = {
            { type = "item", name = "Satyr Horn", spawns = {
                {78.5, 44.2}, {80.2, 42.5}, {77.1, 45.8}, {81.5, 43.1}
            }},
        }
    },
    
    [1010] = { -- Naga at the Zoram Strand
        name = "Naga at the Zoram Strand",
        zone = "Ashenvale",
        start = { npc = "Shindrell Swiftfire", x = 34.6, y = 49.1 },
        objectives = {
            { type = "kill", name = "Wrathtail Myrmidon", spawns = {
                {14.5, 24.2}, {16.2, 22.5}, {13.1, 25.8}, {17.5, 23.1}
            }},
            { type = "kill", name = "Wrathtail Sorceress", spawns = {
                {15.8, 23.5}, {14.2, 25.1}, {17.2, 22.2}, {12.8, 26.5}
            }},
        }
    },
    
    [1011] = { -- The Zoram Strand
        name = "The Zoram Strand",
        zone = "Ashenvale",
        start = { npc = "Shindrell Swiftfire", x = 34.6, y = 49.1 },
        objectives = {
            { type = "item", name = "Wrathtail Head", spawns = {
                {14.5, 24.2}, {16.2, 22.5}, {13.1, 25.8}, {17.5, 23.1}
            }},
        }
    },
    
    [1018] = { -- Raene's Cleansing
        name = "Raene's Cleansing",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "item", name = "Glowing Gem", spawns = {{55.2, 35.8}} },
        }
    },
    
    [1019] = { -- Raene's Cleansing (Part 2)
        name = "Raene's Cleansing",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "kill", name = "Rinsul", spawns = {{81.5, 48.2}} },
        }
    },
    
    [1020] = { -- Raene's Cleansing (Part 3)
        name = "Raene's Cleansing",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "kill", name = "Ursangous", spawns = {{40.5, 62.8}} },
        }
    },
    
    [1021] = { -- Raene's Cleansing (Part 4)
        name = "Raene's Cleansing",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "kill", name = "Shadumbra", spawns = {{60.5, 66.2}} },
        }
    },
    
    [1000] = { -- The Ruins of Stardust
        name = "The Ruins of Stardust",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "item", name = "Stardust", spawns = {
                {34.5, 68.2}, {36.2, 66.5}, {33.1, 69.8}, {37.5, 67.1}
            }},
        }
    },
    
    [1034] = { -- Culling the Threat
        name = "Culling the Threat",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "kill", name = "Dal Bloodclaw", spawns = {{78.8, 49.5}} },
        }
    },
    
    [6503] = { -- Dartol's Rod
        name = "Dartol's Rod",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "item", name = "Dartol's Rod", spawns = {{60.5, 65.8}} },
        }
    },
    
    [1023] = { -- Bathran's Hair
        name = "Bathran's Hair",
        zone = "Ashenvale",
        start = { npc = "Orendil Broadleaf", x = 26.3, y = 36.5 },
        objectives = {
            { type = "item", name = "Bathran's Hair", spawns = {
                {31.5, 22.2}, {33.2, 20.5}, {30.1, 23.8}, {34.5, 21.1}
            }},
        }
    },
    
    [1024] = { -- Orendil's Cure
        name = "Orendil's Cure",
        zone = "Ashenvale",
        start = { npc = "Orendil Broadleaf", x = 26.3, y = 36.5 },
        objectives = {
            { type = "talk", name = "Pelturas Whitemoon", spawns = {{37.2, 51.5}} },
        }
    },
    
    [1025] = { -- Elune's Tear
        name = "Elune's Tear",
        zone = "Ashenvale",
        start = { npc = "Pelturas Whitemoon", x = 37.2, y = 51.5 },
        objectives = {
            { type = "item", name = "Elune's Tear", spawns = {{52.5, 38.8}} },
        }
    },
    
    [1026] = { -- The Howling Vale
        name = "The Howling Vale",
        zone = "Ashenvale",
        start = { npc = "Sentinel Melyria Frostshadow", x = 26.2, y = 36.8 },
        objectives = {
            { type = "item", name = "Howling Pendant", spawns = {
                {52.5, 30.2}, {54.2, 28.5}, {51.1, 31.8}, {55.5, 29.1}
            }},
        }
    },
    
    [1027] = { -- Velinde Starsong
        name = "Velinde Starsong",
        zone = "Ashenvale",
        start = { npc = "Sentinel Melyria Frostshadow", x = 26.2, y = 36.8 },
        objectives = {
            { type = "talk", name = "Thyn'tel Bladeweaver", spawns = {{55.2, 92.1}} },
        }
    },
    
    [1028] = { -- Shadumbra's Head
        name = "Shadumbra's Head",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "kill", name = "Shadumbra", spawns = {{60.5, 66.2}} },
        }
    },
    
    [1030] = { -- Ursangous's Paw
        name = "Ursangous's Paw",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "kill", name = "Ursangous", spawns = {{40.5, 62.8}} },
        }
    },
    
    [1031] = { -- Sharptalon's Claw
        name = "Sharptalon's Claw",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "kill", name = "Sharptalon", spawns = {{75.2, 70.5}} },
        }
    },
    
    [1033] = { -- Dance of the Strifeless
        name = "Dance of the Strifeless",
        zone = "Ashenvale",
        start = { npc = "Kayneth Stillwind", x = 37.0, y = 49.8 },
        objectives = {
            { type = "item", name = "Well Stone", spawns = {{61.2, 52.5}} },
        }
    },
    
    [1035] = { -- Troll Charm
        name = "Troll Charm",
        zone = "Ashenvale",
        start = { npc = "Advisor Willadson", x = 36.6, y = 49.2 },
        objectives = {
            { type = "item", name = "Troll Charm", spawns = {
                {73.5, 61.2}, {75.2, 59.5}, {72.1, 62.8}, {76.5, 60.1}
            }},
        }
    },
    
    [1036] = { -- The Befouled Element
        name = "The Befouled Element",
        zone = "Ashenvale",
        start = { npc = "Advisor Willadson", x = 36.6, y = 49.2 },
        objectives = {
            { type = "kill", name = "Tideress", spawns = {{51.5, 64.8}} },
        }
    },
    
    [1037] = { -- Je'neu of the Earthen Ring
        name = "Je'neu of the Earthen Ring",
        zone = "Ashenvale",
        start = { npc = "Advisor Willadson", x = 36.6, y = 49.2 },
        objectives = {
            { type = "talk", name = "Je'neu Sancrea", spawns = {{11.8, 34.5}} },
        }
    },
    
    [1038] = { -- Between a Rock and a Thistlefur
        name = "Between a Rock and a Thistlefur",
        zone = "Ashenvale",
        start = { npc = "Kayneth Stillwind", x = 37.0, y = 49.8 },
        objectives = {
            { type = "kill", name = "Thistlefur Avenger", spawns = {
                {35.5, 31.2}, {37.2, 29.5}, {34.1, 32.8}, {38.5, 30.1}
            }},
            { type = "kill", name = "Thistlefur Shaman", spawns = {
                {36.8, 30.5}, {35.2, 32.1}, {38.2, 29.2}, {33.8, 33.5}
            }},
        }
    },
    
    [1039] = { -- Thistlefur Village
        name = "Thistlefur Village",
        zone = "Ashenvale",
        start = { npc = "Raene Wolfrunner", x = 36.6, y = 49.5 },
        objectives = {
            { type = "kill", name = "Thistlefur Ursa", spawns = {
                {37.5, 32.2}, {39.2, 30.5}, {36.1, 33.8}, {40.5, 31.1}
            }},
            { type = "kill", name = "Thistlefur Pathfinder", spawns = {
                {38.8, 31.5}, {37.2, 33.1}, {40.2, 30.2}, {35.8, 34.5}
            }},
        }
    },
    
    [1040] = { -- Kayneth Stillwind
        name = "Kayneth Stillwind",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "talk", name = "Kayneth Stillwind", spawns = {{37.0, 49.8}} },
        }
    },
    
    [1047] = { -- Forsaken Encampment
        name = "Forsaken Encampment",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "talk", name = "Forsaken Instructions", spawns = {{72.5, 68.5}} },
        }
    },
    
    [1048] = { -- Destroy the Legion
        name = "Destroy the Legion",
        zone = "Ashenvale",
        start = { npc = "Delgren the Purifier", x = 26.2, y = 38.7 },
        objectives = {
            { type = "kill", name = "Mannoroc Lasher", spawns = {
                {81.5, 68.2}, {83.2, 66.5}, {80.1, 69.8}, {84.5, 67.1}
            }},
            { type = "kill", name = "Searing Infernal", spawns = {
                {82.8, 67.5}, {81.2, 69.1}, {84.2, 66.2}, {79.8, 70.5}
            }},
        }
    },
    
    [1049] = { -- Never Again!
        name = "Never Again!",
        zone = "Ashenvale",
        start = { npc = "Delgren the Purifier", x = 26.2, y = 38.7 },
        objectives = {
            { type = "kill", name = "Diathorus the Seeker", spawns = {{85.5, 75.2}} },
        }
    },
    
    [1053] = { -- An Aggressive Defense
        name = "An Aggressive Defense",
        zone = "Ashenvale",
        start = { npc = "Kayneth Stillwind", x = 37.0, y = 49.8 },
        objectives = {
            { type = "item", name = "Befouled Water Globe", spawns = {
                {68.5, 54.2}, {70.2, 52.5}, {67.1, 55.8}, {71.5, 53.1}
            }},
        }
    },
    
    [6544] = { -- Horde Encroachment
        name = "Horde Encroachment",
        zone = "Ashenvale",
        start = { npc = "Sentinel Thenysil", x = 37.1, y = 51.1 },
        objectives = {
            { type = "kill", name = "Warsong Scout", spawns = {
                {72.5, 68.2}, {74.2, 66.5}, {71.1, 69.8}, {75.5, 67.1}
            }},
            { type = "kill", name = "Warsong Outrider", spawns = {
                {73.8, 67.5}, {72.2, 69.1}, {75.2, 66.2}, {70.8, 70.5}
            }},
        }
    },
    
    [6545] = { -- The Hunt
        name = "The Hunt",
        zone = "Ashenvale",
        start = { npc = "Senani Thunderheart", x = 73.1, y = 61.2 },
        objectives = {
            { type = "kill", name = "Ashenvale Bear", spawns = {
                {74.5, 70.2}, {76.2, 68.5}, {73.1, 71.8}, {77.5, 69.1}
            }},
            { type = "kill", name = "Ashenvale Outrunner", spawns = {
                {75.8, 69.5}, {74.2, 71.1}, {77.2, 68.2}, {72.8, 72.5}
            }},
        }
    },
    
    [6546] = { -- Warsong Sawblades
        name = "Warsong Sawblades",
        zone = "Ashenvale",
        start = { npc = "Warsong Lumbercamp NPC", x = 84.5, y = 59.2 },
        objectives = {
            { type = "item", name = "Warsong Sawblade", spawns = {
                {84.5, 60.2}, {86.2, 58.5}, {83.1, 61.8}, {87.5, 59.1}
            }},
        }
    },
    
    [1012] = { -- Blackfathom Villainy
        name = "Blackfathom Villainy",
        zone = "Ashenvale",
        start = { npc = "Argent Guard Thaelrid", x = 14.5, y = 14.2 },
        objectives = {
            { type = "kill", name = "Twilight Lord Kelris", spawns = {{16.2, 12.5}} },
        }
    },
    
    [1013] = { -- Allegiance to the Old Gods
        name = "Allegiance to the Old Gods",
        zone = "Ashenvale",
        start = { npc = "Je'neu Sancrea", x = 11.8, y = 34.5 },
        objectives = {
            { type = "kill", name = "Lorgus Jett", spawns = {{14.8, 9.5}} },
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
    
    [6282] = { -- Goblin Invaders
        name = "Goblin Invaders",
        zone = "Stonetalon Mountains",
        start = { npc = "Seereth Stonebreak", x = 47.2, y = 61.0 },
        objectives = {
            { type = "kill", name = "Venture Co. Deforester", spawns = {
                {64.5, 42.2}, {66.2, 40.5}, {63.1, 43.8}, {67.5, 41.1}
            }},
            { type = "kill", name = "Venture Co. Logger", spawns = {
                {65.8, 41.5}, {64.2, 43.1}, {67.2, 40.2}, {62.8, 44.5}
            }},
        }
    },
    
    [1084] = { -- Trouble in the Deeps
        name = "Trouble in the Deeps",
        zone = "Stonetalon Mountains",
        start = { npc = "Tsunaman", x = 45.6, y = 40.2 },
        objectives = {
            { type = "item", name = "Tsunaman's Deep Sea Conch", spawns = {{60.5, 73.2}} },
        }
    },
    
    [1085] = { -- Deep Sea Salvation
        name = "Deep Sea Salvation",
        zone = "Stonetalon Mountains",
        start = { npc = "Tsunaman", x = 45.6, y = 40.2 },
        objectives = {
            { type = "talk", name = "Tsunaman", spawns = {{45.6, 40.2}} },
        }
    },
    
    [1087] = { -- Cenarius' Legacy
        name = "Cenarius' Legacy",
        zone = "Stonetalon Mountains",
        start = { npc = "Braelyn Firehand", x = 46.5, y = 42.5 },
        objectives = {
            { type = "kill", name = "Daughter of Cenarius", spawns = {
                {39.5, 31.2}, {41.2, 29.5}, {38.1, 32.8}, {42.5, 30.1}
            }},
        }
    },
    
    [1088] = { -- Goblin Engineerin Strike
        name = "Goblin Engineering Strike",
        zone = "Stonetalon Mountains",
        start = { npc = "Windshear Mine Control Box", x = 58.5, y = 48.8 },
        objectives = {
            { type = "item", name = "Venture Co. Engineering Plans", spawns = {{62.5, 39.8}} },
        }
    },
    
    [1089] = { -- Elemental War
        name = "Elemental War",
        zone = "Stonetalon Mountains",
        start = { npc = "Zor Lonetree", x = 38.4, y = 40.6 },
        objectives = {
            { type = "kill", name = "Burning Ravager", spawns = {
                {32.5, 62.2}, {34.2, 60.5}, {31.1, 63.8}, {35.5, 61.1}
            }},
            { type = "kill", name = "Charred Ancient", spawns = {
                {33.8, 61.5}, {32.2, 63.1}, {35.2, 60.2}, {30.8, 64.5}
            }},
        }
    },
    
    [1091] = { -- Shredding Machines
        name = "Shredding Machines",
        zone = "Stonetalon Mountains",
        start = { npc = "Kaela Shadowspear", x = 35.4, y = 71.5 },
        objectives = {
            { type = "kill", name = "XT:9", spawns = {{64.5, 38.2}} },
            { type = "kill", name = "XT:4", spawns = {{62.8, 41.5}} },
        }
    },
    
    [1092] = { -- Deforestation
        name = "Deforestation",
        zone = "Stonetalon Mountains",
        start = { npc = "Kaela Shadowspear", x = 35.4, y = 71.5 },
        objectives = {
            { type = "kill", name = "Venture Co. Shredder", spawns = {
                {67.5, 44.2}, {69.2, 42.5}, {66.1, 45.8}, {70.5, 43.1}
            }},
        }
    },
    
    [1095] = { -- Ordanus
        name = "Ordanus",
        zone = "Stonetalon Mountains",
        start = { npc = "Braelyn Firehand", x = 46.5, y = 42.5 },
        objectives = {
            { type = "kill", name = "Ordanus", spawns = {{56.5, 47.8}} },
        }
    },
    
    [6421] = { -- Retrieval for Mauren
        name = "Retrieval for Mauren",
        zone = "Stonetalon Mountains",
        start = { npc = "Mauren", x = 45.5, y = 60.0 },
        objectives = {
            { type = "item", name = "Mauren's Scrolls", spawns = {
                {72.5, 54.2}, {74.2, 52.5}, {71.1, 55.8}, {75.5, 53.1}
            }},
        }
    },
    
    [6401] = { -- Force of the North
        name = "Force of the North",
        zone = "Stonetalon Mountains",
        start = { npc = "Blood Shard", x = 47.8, y = 61.5 },
        objectives = {
            { type = "kill", name = "Force of Air", spawns = {
                {45.5, 42.2}, {47.2, 40.5}, {44.1, 43.8}, {48.5, 41.1}
            }},
        }
    },
    
    [1096] = { -- The Windwatcher
        name = "The Windwatcher",
        zone = "Stonetalon Mountains",
        start = { npc = "Tsunaman", x = 45.6, y = 40.2 },
        objectives = {
            { type = "talk", name = "Hamuul Runetotem", spawns = {{78.5, 28.8}} },
        }
    },
    
    [6481] = { -- Cycle of Rebirth
        name = "Cycle of Rebirth",
        zone = "Stonetalon Mountains",
        start = { npc = "Tammra Windfall", x = 47.2, y = 60.0 },
        objectives = {
            { type = "item", name = "Gaea Seeds", spawns = {
                {32.5, 61.2}, {34.2, 59.5}, {31.1, 62.8}, {35.5, 60.1}
            }},
        }
    },
    
    [6482] = { -- New Life
        name = "New Life",
        zone = "Stonetalon Mountains",
        start = { npc = "Tammra Windfall", x = 47.2, y = 60.0 },
        objectives = {
            { type = "item", name = "Gaea Bark", spawns = {
                {38.5, 57.2}, {40.2, 55.5}, {37.1, 58.8}, {41.5, 56.1}
            }},
        }
    },
    
    [1097] = { -- Kodo Bones
        name = "Kodo Bones",
        zone = "Stonetalon Mountains",
        start = { npc = "Layo Starstrike", x = 45.8, y = 59.8 },
        objectives = {
            { type = "item", name = "Kodo Liver", spawns = {
                {50.5, 75.2}, {52.2, 73.5}, {49.1, 76.8}, {53.5, 74.1}
            }},
        }
    },
    
    [1098] = { -- Bloodfury Bloodline
        name = "Bloodfury Bloodline",
        zone = "Stonetalon Mountains",
        start = { npc = "Mor'rogal", x = 45.5, y = 57.8 },
        objectives = {
            { type = "kill", name = "Bloodfury Harpy", spawns = {
                {28.5, 61.2}, {30.2, 59.5}, {27.1, 62.8}, {31.5, 60.1}
            }},
        }
    },
    
    [6283] = { -- Avenge My Village
        name = "Avenge My Village",
        zone = "Stonetalon Mountains",
        start = { npc = "Makaba Flathoof", x = 45.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Grimtotem Ruffian", spawns = {
                {41.5, 47.2}, {43.2, 45.5}, {40.1, 48.8}, {44.5, 46.1}
            }},
            { type = "kill", name = "Grimtotem Mercenary", spawns = {
                {42.8, 46.5}, {41.2, 48.1}, {44.2, 45.2}, {39.8, 49.5}
            }},
        }
    },
    
    [6284] = { -- Kill Grundig Darkcloud
        name = "Kill Grundig Darkcloud",
        zone = "Stonetalon Mountains",
        start = { npc = "Makaba Flathoof", x = 45.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Grundig Darkcloud", spawns = {{43.5, 45.8}} },
        }
    },
    
    [6285] = { -- Grimtotem Spying
        name = "Grimtotem Spying",
        zone = "Stonetalon Mountains",
        start = { npc = "Makaba Flathoof", x = 45.5, y = 59.5 },
        objectives = {
            { type = "item", name = "Grimtotem Scroll", spawns = {
                {41.5, 47.2}, {43.2, 45.5}, {40.1, 48.8}, {44.5, 46.1}
            }},
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
    
    [4770] = { -- Hardened Shells
        name = "Hardened Shells",
        zone = "Thousand Needles",
        start = { npc = "Pozzik", x = 77.8, y = 77.2 },
        objectives = {
            { type = "kill", name = "Saltstone Crystalhide", spawns = {
                {70.5, 73.2}, {71.8, 71.5}, {69.2, 74.8}, {72.5, 72.1}
            }},
        }
    },
    
    [4771] = { -- Load Lightening
        name = "Load Lightening",
        zone = "Thousand Needles",
        start = { npc = "Pozzik", x = 77.8, y = 77.2 },
        objectives = {
            { type = "item", name = "Rocket Car Parts", spawns = {
                {78.5, 74.2}, {79.8, 76.5}, {77.2, 73.8}, {80.5, 75.1}
            }},
        }
    },
    
    [1186] = { -- Parts of the Swarm
        name = "Parts of the Swarm",
        zone = "Thousand Needles",
        start = { npc = "Moktar Kansen", x = 21.5, y = 32.2 },
        objectives = {
            { type = "kill", name = "Silithid Hive Warrior", spawns = {
                {55.5, 51.2}, {56.8, 49.5}, {54.2, 52.8}, {57.5, 50.1}
            }},
        }
    },
    
    [1187] = { -- Parts of the Swarm (Part 2)
        name = "Parts of the Swarm",
        zone = "Thousand Needles",
        start = { npc = "Korran", x = 67.5, y = 64.0 },
        objectives = {
            { type = "kill", name = "Silithid Harvester", spawns = {
                {56.5, 52.2}, {57.8, 50.5}, {55.2, 53.8}, {58.5, 51.1}
            }},
        }
    },
    
    [5151] = { -- Hemet Nesingwary Jr.
        name = "Hemet Nesingwary Jr.",
        zone = "Thousand Needles",
        start = { npc = "Kravel Koalbeard", x = 78.0, y = 77.0 },
        objectives = {
            { type = "talk", name = "Hemet Nesingwary Jr.", spawns = {{35.7, 10.5}} },
        }
    },
    
    [1150] = { -- Grimtotem Spying
        name = "Grimtotem Spying",
        zone = "Thousand Needles",
        start = { npc = "Cliffwatcher Longhorn", x = 21.4, y = 32.2 },
        objectives = {
            { type = "item", name = "Grimtotem Note", spawns = {
                {12.5, 9.2}, {13.8, 7.5}, {11.2, 10.8}, {14.5, 8.1}
            }},
        }
    },
    
    [4907] = { -- Wanted: Arnak Grimtotem
        name = "Wanted: Arnak Grimtotem",
        zone = "Thousand Needles",
        start = { npc = "Wanted Poster", x = 45.0, y = 50.5 },
        objectives = {
            { type = "kill", name = "Arnak Grimtotem", spawns = {{10.8, 18.5}} },
        }
    },
    
    [5064] = { -- The Swarm Grows
        name = "The Swarm Grows",
        zone = "Thousand Needles",
        start = { npc = "Korran", x = 67.5, y = 64.0 },
        objectives = {
            { type = "kill", name = "Silithid Searcher", spawns = {
                {54.5, 49.2}, {55.8, 47.5}, {53.2, 50.8}, {56.5, 48.1}
            }},
        }
    },
    
    [1133] = { -- A Different Approach
        name = "A Different Approach",
        zone = "Thousand Needles",
        start = { npc = "Brave Moonhorn", x = 45.1, y = 50.7 },
        objectives = {
            { type = "talk", name = "Pao'ka Swiftmountain", spawns = {{92.2, 80.8}} },
        }
    },
    
    [4881] = { -- Protect Kaya
        name = "Protect Kaya",
        zone = "Thousand Needles",
        start = { npc = "Kaya Flathoof", x = 10.2, y = 17.8 },
        objectives = {
            { type = "talk", name = "Brave Moonhorn", spawns = {{45.1, 50.7}} },
        }
    },
    
    [1172] = { -- Free at Last
        name = "Free at Last",
        zone = "Thousand Needles",
        start = { npc = "Lakota Windsong", x = 39.5, y = 27.8 },
        objectives = {
            { type = "talk", name = "Cliffwatcher Longhorn", spawns = {{21.4, 32.2}} },
        }
    },
    
    [1189] = { -- Homeward Bound
        name = "Homeward Bound",
        zone = "Thousand Needles",
        start = { npc = "Pao'ka Swiftmountain", x = 92.2, y = 80.8 },
        objectives = {
            { type = "talk", name = "Brave Moonhorn", spawns = {{45.1, 50.7}} },
        }
    },
    
    [1183] = { -- Test of Faith
        name = "Test of Faith",
        zone = "Thousand Needles",
        start = { npc = "Dorn Plainstalker", x = 21.5, y = 32.0 },
        objectives = {
            { type = "talk", name = "Cliffwatcher Longhorn", spawns = {{21.4, 32.2}} },
        }
    },
    
    [4904] = { -- Sacred Fire
        name = "Sacred Fire",
        zone = "Thousand Needles",
        start = { npc = "Rau Cliffrunner", x = 45.2, y = 49.2 },
        objectives = {
            { type = "item", name = "Incendia Agave", spawns = {
                {33.5, 40.2}, {35.8, 38.5}, {32.2, 41.8}, {36.5, 39.1}
            }},
        }
    },
    
    [4768] = { -- Martek the Exiled
        name = "Martek the Exiled",
        zone = "Thousand Needles",
        start = { npc = "Fizzle Brassbolts", x = 78.1, y = 77.1 },
        objectives = {
            { type = "talk", name = "Martek the Exiled", spawns = {{42.3, 52.7}} },
        }
    },
    
    [1131] = { -- Wind Rider
        name = "Wind Rider",
        zone = "Thousand Needles",
        start = { npc = "Win'ye", x = 45.1, y = 49.1 },
        objectives = {
            { type = "kill", name = "Wyvern Stormclaw", spawns = {
                {18.5, 22.2}, {19.8, 20.5}, {17.2, 23.8}, {20.5, 21.1}
            }},
        }
    },
    
    [1180] = { -- Test of Lore
        name = "Test of Lore",
        zone = "Thousand Needles",
        start = { npc = "Dorn Plainstalker", x = 21.5, y = 32.0 },
        objectives = {
            { type = "talk", name = "Braug Dimspirit", spawns = {{53.8, 63.8}} },
        }
    },
    
    [1151] = { -- Tribal War
        name = "Tribal War",
        zone = "Thousand Needles",
        start = { npc = "Cliffwatcher Longhorn", x = 21.4, y = 32.2 },
        objectives = {
            { type = "kill", name = "Galak Stormer", spawns = {
                {38.5, 25.2}, {39.8, 23.5}, {37.2, 26.8}, {40.5, 24.1}
            }},
            { type = "kill", name = "Galak Mauler", spawns = {
                {37.5, 24.2}, {38.8, 22.5}, {36.2, 25.8}, {39.5, 23.1}
            }},
        }
    },
    
    [5152] = { -- Race to Thunder Bluff
        name = "Race to Thunder Bluff",
        zone = "Thousand Needles",
        start = { npc = "Zamek", x = 77.0, y = 74.6 },
        objectives = {
            { type = "talk", name = "Rau Cliffrunner", spawns = {{45.2, 49.2}} },
        }
    },
    
    [4966] = { -- Wanted: Caliph Scorpidsting
        name = "Wanted: Caliph Scorpidsting",
        zone = "Thousand Needles",
        start = { npc = "Wanted Poster", x = 78.5, y = 77.4 },
        objectives = {
            { type = "kill", name = "Caliph Scorpidsting", spawns = {{74.2, 85.5}} },
        }
    },
    
    [1137] = { -- Arikara
        name = "Arikara",
        zone = "Thousand Needles",
        start = { npc = "Magatha Grimtotem", x = 55.0, y = 12.0 },
        objectives = {
            { type = "kill", name = "Arikara", spawns = {{42.5, 48.8}} },
        }
    },
    
    [4781] = { -- An Orphan Looking for a Home
        name = "An Orphan Looking for a Home",
        zone = "Thousand Needles",
        start = { npc = "Pozzik", x = 77.8, y = 77.2 },
        objectives = {
            { type = "talk", name = "Ziz Fizziks", spawns = {{79.2, 45.5}} },
        }
    },
    
    [1184] = { -- Test of Strength
        name = "Test of Strength",
        zone = "Thousand Needles",
        start = { npc = "Dorn Plainstalker", x = 21.5, y = 32.0 },
        objectives = {
            { type = "kill", name = "Bloodscalp Warrior", spawns = {
                {32.5, 14.2}, {33.8, 12.5}, {31.2, 15.8}, {34.5, 13.1}
            }},
        }
    },
    
    [1177] = { -- A Vengeful Fate
        name = "A Vengeful Fate",
        zone = "Thousand Needles",
        start = { npc = "Motega Firemane", x = 46.0, y = 51.0 },
        objectives = {
            { type = "kill", name = "Grenka Bloodscreech", spawns = {{29.5, 36.8}} },
        }
    },
    
    [4763] = { -- Wharfmaster Dizzywig
        name = "Wharfmaster Dizzywig",
        zone = "Thousand Needles",
        start = { npc = "Kravel Koalbeard", x = 78.0, y = 77.0 },
        objectives = {
            { type = "talk", name = "Wharfmaster Dizzywig", spawns = {{63.5, 38.6}} },
        }
    },
    
    [4726] = { -- Rocket Car Parts
        name = "Rocket Car Parts",
        zone = "Thousand Needles",
        start = { npc = "Kravel Koalbeard", x = 78.0, y = 77.0 },
        objectives = {
            { type = "item", name = "Rocket Car Parts", spawns = {
                {80.2, 79.5}, {81.5, 77.8}, {79.2, 80.8}, {82.5, 78.1}
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
    
    -- Panther Mastery Chain (Sir S. J. Erlgadin)
    [190] = { -- Panther Mastery (Part 2)
        name = "Panther Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Sir S. J. Erlgadin", x = 35.5, y = 10.5 },
        objectives = {
            { type = "kill", name = "Young Panther", spawns = {
                {44.5, 25.2}, {45.8, 23.5}, {43.2, 26.8}, {46.5, 24.1}
            }},
        }
    },
    
    [192] = { -- Panther Mastery (Part 3)
        name = "Panther Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Sir S. J. Erlgadin", x = 35.5, y = 10.5 },
        objectives = {
            { type = "kill", name = "Panther", spawns = {
                {49.5, 21.2}, {50.8, 19.5}, {48.2, 22.8}, {51.5, 20.1}
            }},
        }
    },
    
    [193] = { -- Panther Mastery (Part 4)
        name = "Panther Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Sir S. J. Erlgadin", x = 35.5, y = 10.5 },
        objectives = {
            { type = "kill", name = "Elder Shadowmaw Panther", spawns = {
                {53.5, 30.2}, {54.8, 28.5}, {52.2, 31.8}, {55.5, 29.1}
            }},
        }
    },
    
    [194] = { -- Panther Mastery (Part 5 - Bhag'thera)
        name = "Panther Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Sir S. J. Erlgadin", x = 35.5, y = 10.5 },
        objectives = {
            { type = "kill", name = "Bhag'thera", spawns = {{49.8, 24.2}} },
        }
    },
    
    -- Tiger Mastery Chain (Ajeck Rouack)
    [186] = { -- Tiger Mastery (Part 2)
        name = "Tiger Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Ajeck Rouack", x = 35.6, y = 10.6 },
        objectives = {
            { type = "kill", name = "Young Stranglethorn Tiger", spawns = {
                {28.2, 13.5}, {29.5, 11.8}, {27.1, 15.1}, {30.2, 12.5}
            }},
        }
    },
    
    [187] = { -- Tiger Mastery (Part 3)
        name = "Tiger Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Ajeck Rouack", x = 35.6, y = 10.6 },
        objectives = {
            { type = "kill", name = "Stranglethorn Tigress", spawns = {
                {30.2, 16.5}, {31.5, 14.8}, {29.1, 18.1}, {32.2, 15.5}
            }},
        }
    },
    
    [188] = { -- Tiger Mastery (Part 4)
        name = "Tiger Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Ajeck Rouack", x = 35.6, y = 10.6 },
        objectives = {
            { type = "kill", name = "Elder Stranglethorn Tiger", spawns = {
                {40.2, 10.5}, {41.5, 8.8}, {39.1, 12.1}, {42.2, 9.5}
            }},
        }
    },
    
    [195] = { -- Tiger Mastery (Part 5 - Sin'Dall)
        name = "Tiger Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Ajeck Rouack", x = 35.6, y = 10.6 },
        objectives = {
            { type = "kill", name = "Sin'Dall", spawns = {{32.5, 17.2}} },
        }
    },
    
    -- Raptor Mastery Chain (Hemet Nesingwary)
    [183] = { -- Raptor Mastery (Part 2)
        name = "Raptor Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "Jungle Stalker", spawns = {
                {35.5, 49.2}, {36.8, 47.5}, {34.2, 50.8}, {37.5, 48.1}
            }},
        }
    },
    
    [184] = { -- Raptor Mastery (Part 3)
        name = "Raptor Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "Lashtail Raptor", spawns = {
                {41.5, 58.2}, {42.8, 56.5}, {40.2, 59.8}, {43.5, 57.1}
            }},
        }
    },
    
    [196] = { -- Raptor Mastery (Part 4 - Tethis)
        name = "Raptor Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "Tethis", spawns = {{28.2, 43.5}} },
        }
    },
    
    -- Green Hills of Stranglethorn Pages
    [338] = { -- The Green Hills of Stranglethorn (Chapter 1)
        name = "The Green Hills of Stranglethorn",
        zone = "Stranglethorn Vale",
        start = { npc = "Barnil Stonepot", x = 35.0, y = 10.6 },
        objectives = {
            { type = "item", name = "Green Hills of Stranglethorn Page 1", spawns = {
                {38.5, 8.2}, {40.8, 15.5}, {32.2, 11.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 4", spawns = {
                {45.2, 22.5}, {33.8, 16.2}, {29.5, 19.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 6", spawns = {
                {48.5, 25.2}, {36.8, 18.5}, {31.2, 20.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 8", spawns = {
                {52.5, 28.2}, {38.8, 21.5}, {33.2, 23.8}
            }},
        }
    },
    
    [339] = { -- The Green Hills of Stranglethorn (Chapter 2)
        name = "The Green Hills of Stranglethorn",
        zone = "Stranglethorn Vale",
        start = { npc = "Barnil Stonepot", x = 35.0, y = 10.6 },
        objectives = {
            { type = "item", name = "Green Hills of Stranglethorn Page 10", spawns = {
                {39.5, 32.2}, {42.8, 35.5}, {37.2, 28.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 11", spawns = {
                {46.2, 38.5}, {44.8, 40.2}, {40.5, 36.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 14", spawns = {
                {50.5, 42.2}, {47.8, 44.5}, {43.2, 39.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 16", spawns = {
                {54.5, 46.2}, {50.8, 48.5}, {46.2, 43.8}
            }},
        }
    },
    
    [340] = { -- The Green Hills of Stranglethorn (Chapter 3)
        name = "The Green Hills of Stranglethorn",
        zone = "Stranglethorn Vale",
        start = { npc = "Barnil Stonepot", x = 35.0, y = 10.6 },
        objectives = {
            { type = "item", name = "Green Hills of Stranglethorn Page 18", spawns = {
                {28.5, 52.2}, {30.8, 55.5}, {26.2, 49.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 20", spawns = {
                {32.2, 58.5}, {34.8, 61.2}, {29.5, 55.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 21", spawns = {
                {36.5, 64.2}, {38.8, 67.5}, {33.2, 61.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 24", spawns = {
                {40.5, 70.2}, {42.8, 73.5}, {37.2, 67.8}
            }},
        }
    },
    
    [341] = { -- The Green Hills of Stranglethorn (Chapter 4)
        name = "The Green Hills of Stranglethorn",
        zone = "Stranglethorn Vale",
        start = { npc = "Barnil Stonepot", x = 35.0, y = 10.6 },
        objectives = {
            { type = "item", name = "Green Hills of Stranglethorn Page 25", spawns = {
                {25.5, 74.2}, {27.8, 77.5}, {23.2, 71.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 26", spawns = {
                {29.2, 80.5}, {31.8, 83.2}, {26.5, 77.8}
            }},
            { type = "item", name = "Green Hills of Stranglethorn Page 27", spawns = {
                {33.5, 86.2}, {35.8, 89.5}, {30.2, 83.8}
            }},
        }
    },
    
    -- Grom'gol Quests (Horde)
    [568] = { -- Mok'thardin's Enchantment (Part 1)
        name = "Mok'thardin's Enchantment",
        zone = "Stranglethorn Vale",
        start = { npc = "Far Seer Mok'thardin", x = 32.2, y = 27.8 },
        objectives = {
            { type = "kill", name = "Young Stranglethorn Tiger", spawns = {
                {31.5, 22.2}, {32.8, 20.5}, {30.2, 23.8}, {33.5, 21.1}
            }},
        }
    },
    
    [569] = { -- Mok'thardin's Enchantment (Part 2)
        name = "Mok'thardin's Enchantment",
        zone = "Stranglethorn Vale",
        start = { npc = "Far Seer Mok'thardin", x = 32.2, y = 27.8 },
        objectives = {
            { type = "kill", name = "Shadowmaw Panther", spawns = {
                {43.5, 35.2}, {44.8, 33.5}, {42.2, 36.8}, {45.5, 34.1}
            }},
        }
    },
    
    [570] = { -- Mok'thardin's Enchantment (Part 3)
        name = "Mok'thardin's Enchantment",
        zone = "Stranglethorn Vale",
        start = { npc = "Far Seer Mok'thardin", x = 32.2, y = 27.8 },
        objectives = {
            { type = "kill", name = "Bhag'thera", spawns = {{49.8, 24.2}} },
        }
    },
    
    [572] = { -- Mok'thardin's Enchantment (Part 4)
        name = "Mok'thardin's Enchantment",
        zone = "Stranglethorn Vale",
        start = { npc = "Far Seer Mok'thardin", x = 32.2, y = 27.8 },
        objectives = {
            { type = "item", name = "Pristine Tigress Fang", spawns = {
                {34.5, 30.2}, {35.8, 28.5}, {33.2, 31.8}, {36.5, 29.1}
            }},
        }
    },
    
    [567] = { -- The Defense of Grom'gol (Part 1)
        name = "The Defense of Grom'gol",
        zone = "Stranglethorn Vale",
        start = { npc = "Commander Aggro'gosh", x = 32.1, y = 28.5 },
        objectives = {
            { type = "kill", name = "Lashtail Raptor", spawns = {
                {37.5, 38.2}, {38.8, 36.5}, {36.2, 39.8}, {39.5, 37.1}
            }},
        }
    },
    
    [565] = { -- Hunt for Yenniku
        name = "Hunt for Yenniku",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "item", name = "Bloodscalp Tusk", spawns = {
                {33.5, 15.2}, {34.8, 13.5}, {32.2, 16.8}, {35.5, 14.1}
            }},
        }
    },
    
    -- Booty Bay Quests
    [580] = { -- Venture Company Mining
        name = "Venture Company Mining",
        zone = "Stranglethorn Vale",
        start = { npc = "Crank Fizzlebub", x = 27.8, y = 77.1 },
        objectives = {
            { type = "kill", name = "Venture Co. Geologist", spawns = {
                {42.5, 18.2}, {43.8, 16.5}, {41.2, 19.8}, {44.5, 17.1}
            }},
            { type = "kill", name = "Venture Co. Miner", spawns = {
                {43.5, 17.2}, {44.8, 15.5}, {42.2, 18.8}, {45.5, 16.1}
            }},
        }
    },
    
    [606] = { -- Scaring Shaky
        name = "Scaring Shaky",
        zone = "Stranglethorn Vale",
        start = { npc = "Sea Wolf MacKinley", x = 27.6, y = 77.1 },
        objectives = {
            { type = "kill", name = "Elder Mistvale Gorilla", spawns = {
                {31.5, 71.2}, {32.8, 69.5}, {30.2, 72.8}, {33.5, 70.1}
            }},
        }
    },
    
    [622] = { -- Return to MacKinley
        name = "Return to MacKinley",
        zone = "Stranglethorn Vale",
        start = { npc = "Shaky Phillipe", x = 27.6, y = 77.4 },
        objectives = {
            { type = "talk", name = "Sea Wolf MacKinley", spawns = {{27.6, 77.1}} },
        }
    },
    
    [215] = { -- Up to Snuff
        name = "Up to Snuff",
        zone = "Stranglethorn Vale",
        start = { npc = "Deeg", x = 27.0, y = 78.5 },
        objectives = {
            { type = "item", name = "Snuff", spawns = {
                {26.5, 81.2}, {28.8, 83.5}, {25.2, 79.8}, {29.5, 82.1}
            }},
        }
    },
    
    [587] = { -- Keep An Eye Out
        name = "Keep An Eye Out",
        zone = "Stranglethorn Vale",
        start = { npc = "Dizzy One-Eye", x = 26.8, y = 77.8 },
        objectives = {
            { type = "item", name = "Dizzy's Eye", spawns = {
                {36.5, 67.2}, {38.8, 69.5}, {35.2, 65.8}, {39.5, 68.1}
            }},
        }
    },
    
    -- Skullsplitter Chain
    [574] = { -- The Skullsplitter Expedition
        name = "The Skullsplitter Expedition",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "kill", name = "Skullsplitter Hunter", spawns = {
                {53.5, 42.2}, {54.8, 40.5}, {52.2, 43.8}, {55.5, 41.1}
            }},
            { type = "kill", name = "Skullsplitter Headhunter", spawns = {
                {54.5, 41.2}, {55.8, 39.5}, {53.2, 42.8}, {56.5, 40.1}
            }},
        }
    },
    
    [575] = { -- Bloodsail Buccaneers
        name = "Bloodsail Buccaneers",
        zone = "Stranglethorn Vale",
        start = { npc = "First Mate Crazz", x = 27.6, y = 77.3 },
        objectives = {
            { type = "kill", name = "Bloodsail Swashbuckler", spawns = {
                {34.5, 78.2}, {35.8, 76.5}, {33.2, 79.8}, {36.5, 77.1}
            }},
        }
    },
    
    [595] = { -- Bloodsail Buccaneers (Part 2)
        name = "Bloodsail Buccaneers",
        zone = "Stranglethorn Vale",
        start = { npc = "Fleet Master Firallon", x = 27.2, y = 77.0 },
        objectives = {
            { type = "kill", name = "Bloodsail Warlock", spawns = {
                {31.5, 81.2}, {32.8, 79.5}, {30.2, 82.8}, {33.5, 80.1}
            }},
            { type = "kill", name = "Bloodsail Sea Dog", spawns = {
                {32.5, 80.2}, {33.8, 78.5}, {31.2, 81.8}, {34.5, 79.1}
            }},
        }
    },
    
    [599] = { -- The Bloodsail Buccaneers (Part 3)
        name = "The Bloodsail Buccaneers",
        zone = "Stranglethorn Vale",
        start = { npc = "Fleet Master Firallon", x = 27.2, y = 77.0 },
        objectives = {
            { type = "item", name = "Bloodsail Charts", spawns = {{27.5, 82.5}} },
            { type = "item", name = "Bloodsail Orders", spawns = {{29.8, 84.2}} },
        }
    },
    
    [604] = { -- The Bloodsail Buccaneers (Part 4)
        name = "The Bloodsail Buccaneers",
        zone = "Stranglethorn Vale",
        start = { npc = "Fleet Master Firallon", x = 27.2, y = 77.0 },
        objectives = {
            { type = "kill", name = "Captain Stillwater", spawns = {{28.5, 87.2}} },
            { type = "kill", name = "Fleet Master Firallon", spawns = {{27.2, 77.0}} },
        }
    },
    
    -- Kurzen's Compound
    [202] = { -- Kurzen's Mystery
        name = "Kurzen's Mystery",
        zone = "Stranglethorn Vale",
        start = { npc = "Brother Nimetz", x = 47.2, y = 11.2 },
        objectives = {
            { type = "talk", name = "Private Thorsen", spawns = {{38.2, 3.5}} },
        }
    },
    
    [207] = { -- Bad Medicine
        name = "Bad Medicine",
        zone = "Stranglethorn Vale",
        start = { npc = "Sergeant Yohwa", x = 47.6, y = 10.3 },
        objectives = {
            { type = "kill", name = "Kurzen Medicine Man", spawns = {
                {62.5, 2.2}, {63.8, 0.5}, {61.2, 3.8}, {64.5, 1.1}
            }},
            { type = "item", name = "Kurzen Jungle Remedy", spawns = {
                {63.5, 1.2}, {64.8, -0.5}, {62.2, 2.8}, {65.5, 0.1}
            }},
        }
    },
    
    [203] = { -- Troll Witchery
        name = "Troll Witchery",
        zone = "Stranglethorn Vale",
        start = { npc = "Brother Nimetz", x = 47.2, y = 11.2 },
        objectives = {
            { type = "item", name = "Bloodscalp Fetish", spawns = {
                {34.5, 12.2}, {35.8, 10.5}, {33.2, 13.8}, {36.5, 11.1}
            }},
        }
    },
    
    [210] = { -- Special Forces
        name = "Special Forces",
        zone = "Stranglethorn Vale",
        start = { npc = "Lieutenant Doren", x = 47.1, y = 10.4 },
        objectives = {
            { type = "kill", name = "Kurzen Elite", spawns = {
                {58.5, 6.2}, {59.8, 4.5}, {57.2, 7.8}, {60.5, 5.1}
            }},
            { type = "kill", name = "Kurzen Commando", spawns = {
                {59.5, 5.2}, {60.8, 3.5}, {58.2, 6.8}, {61.5, 4.1}
            }},
            { type = "kill", name = "Kurzen Wrangler", spawns = {
                {60.5, 4.2}, {61.8, 2.5}, {59.2, 5.8}, {62.5, 3.1}
            }},
        }
    },
    
    [211] = { -- Colonel Kurzen
        name = "Colonel Kurzen",
        zone = "Stranglethorn Vale",
        start = { npc = "Lieutenant Doren", x = 47.1, y = 10.4 },
        objectives = {
            { type = "kill", name = "Colonel Kurzen", spawns = {{57.2, 3.8}} },
        }
    },
    
    -- Zul'Gurub Lead-up
    [720] = { -- Split Bone Necklace
        name = "Split Bone Necklace",
        zone = "Stranglethorn Vale",
        start = { npc = "Kin'weelay", x = 32.5, y = 28.0 },
        objectives = {
            { type = "item", name = "Split Bone Necklace", spawns = {
                {50.5, 25.2}, {51.8, 23.5}, {49.2, 26.8}, {52.5, 24.1}
            }},
        }
    },
    
    [592] = { -- The Vile Reef
        name = "The Vile Reef",
        zone = "Stranglethorn Vale",
        start = { npc = "Grindel'wald", x = 26.9, y = 76.5 },
        objectives = {
            { type = "item", name = "Vile Reef Coral", spawns = {
                {23.5, 22.2}, {24.8, 20.5}, {22.2, 23.8}, {25.5, 21.1}
            }},
        }
    },
    
    [593] = { -- Deep Sea Salvage
        name = "Deep Sea Salvage",
        zone = "Stranglethorn Vale",
        start = { npc = "Drizzlik", x = 28.3, y = 77.6 },
        objectives = {
            { type = "item", name = "Elven Gems", spawns = {{23.5, 61.2}} },
            { type = "item", name = "Mithril Mechanical Dragonling", spawns = {{24.8, 63.5}} },
            { type = "item", name = "Smotts' Chest", spawns = {{26.2, 65.8}} },
        }
    },
    
    [596] = { -- Excelsior
        name = "Excelsior",
        zone = "Stranglethorn Vale",
        start = { npc = "Drizzlik", x = 28.3, y = 77.6 },
        objectives = {
            { type = "kill", name = "Snapjaw Crocolisk", spawns = {
                {43.5, 65.2}, {44.8, 63.5}, {42.2, 66.8}, {45.5, 64.1}
            }},
        }
    },
    
    [608] = { -- Raptor Mastery
        name = "Raptor Mastery",
        zone = "Stranglethorn Vale",
        start = { npc = "Hemet Nesingwary", x = 35.7, y = 10.8 },
        objectives = {
            { type = "kill", name = "Jungle Stalker", spawns = {
                {36.5, 50.2}, {37.8, 48.5}, {35.2, 51.8}, {38.5, 49.1}
            }},
        }
    },
    
    [628] = { -- Akiris by the Bundle
        name = "Akiris by the Bundle",
        zone = "Stranglethorn Vale",
        start = { npc = "Privateer Bloads", x = 27.8, y = 77.5 },
        objectives = {
            { type = "item", name = "Akiris Reed", spawns = {
                {18.5, 72.2}, {19.8, 70.5}, {17.2, 73.8}, {20.5, 71.1}
            }},
        }
    },
    
    [589] = { -- Bloodscalp Clan Heads
        name = "Bloodscalp Clan Heads",
        zone = "Stranglethorn Vale",
        start = { npc = "Kin'weelay", x = 32.5, y = 28.0 },
        objectives = {
            { type = "kill", name = "Bloodscalp Shaman", spawns = {
                {33.5, 13.2}, {34.8, 11.5}, {32.2, 14.8}, {35.5, 12.1}
            }},
        }
    },
    
    [605] = { -- Hostile Takeover
        name = "Hostile Takeover",
        zone = "Stranglethorn Vale",
        start = { npc = "Kebok", x = 27.1, y = 77.2 },
        objectives = {
            { type = "kill", name = "Foreman Cozzle", spawns = {{42.2, 17.5}} },
            { type = "item", name = "Cozzle's Key", spawns = {{42.2, 17.5}} },
        }
    },
    
    [617] = { -- Water Elementals
        name = "Water Elementals",
        zone = "Stranglethorn Vale",
        start = { npc = "Baron Revilgaz", x = 27.0, y = 77.0 },
        objectives = {
            { type = "kill", name = "Lesser Water Elemental", spawns = {
                {20.5, 68.2}, {21.8, 66.5}, {19.2, 69.8}, {22.5, 67.1}
            }},
        }
    },
    
    [618] = { -- Magical Analysis
        name = "Magical Analysis",
        zone = "Stranglethorn Vale",
        start = { npc = "Baron Revilgaz", x = 27.0, y = 77.0 },
        objectives = {
            { type = "talk", name = "Archmage Ansirem Runeweaver", spawns = {{29.5, 50.2}} },
        }
    },
    
    [594] = { -- Investigate the Camp
        name = "Investigate the Camp",
        zone = "Stranglethorn Vale",
        start = { npc = "Krazek", x = 28.5, y = 77.2 },
        objectives = {
            { type = "talk", name = "Jungle Fighter", spawns = {{35.5, 10.8}} },
        }
    },
    
    [613] = { -- Saving Yenniku
        name = "Saving Yenniku",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "item", name = "Soul Gem", spawns = {{22.5, 9.8}} },
        }
    },
    
    [621] = { -- Skullsplitter Tusks
        name = "Skullsplitter Tusks",
        zone = "Stranglethorn Vale",
        start = { npc = "Nimboya", x = 32.2, y = 29.2 },
        objectives = {
            { type = "item", name = "Skullsplitter Tusk", spawns = {
                {55.5, 45.2}, {56.8, 43.5}, {54.2, 46.8}, {57.5, 44.1}
            }},
        }
    },
    
    [609] = { -- Some Assembly Required
        name = "Some Assembly Required",
        zone = "Stranglethorn Vale",
        start = { npc = "Drizzlik", x = 28.3, y = 77.6 },
        objectives = {
            { type = "kill", name = "Ironjaw Basilisk", spawns = {
                {37.5, 62.2}, {38.8, 60.5}, {36.2, 63.8}, {39.5, 61.1}
            }},
            { type = "kill", name = "Galak Basilisk", spawns = {
                {38.5, 61.2}, {39.8, 59.5}, {37.2, 62.8}, {40.5, 60.1}
            }},
        }
    },
    
    [626] = { -- Stranglethorn Fever
        name = "Stranglethorn Fever",
        zone = "Stranglethorn Vale",
        start = { npc = "Fin Fizracket", x = 27.4, y = 77.7 },
        objectives = {
            { type = "kill", name = "Mokk the Savage", spawns = {{38.5, 33.8}} },
            { type = "item", name = "Heart of Mokk", spawns = {{38.5, 33.8}} },
        }
    },
    
    -----------------------------------------
    -- Desolace Quests (30-40)
    -----------------------------------------
    
    [1453] = { -- Kodo Roundup
        name = "Kodo Roundup",
        zone = "Desolace",
        start = { npc = "Smeed Scrabblescrew", x = 60.7, y = 38.9 },
        objectives = {
            { type = "talk", name = "Aged Kodo", spawns = {
                {55.5, 50.2}, {56.8, 48.5}, {54.2, 51.8}, {57.5, 49.1}
            }},
        }
    },
    
    [1478] = { -- Ghost-o-plasm Round Up
        name = "Ghost-o-plasm Round Up",
        zone = "Desolace",
        start = { npc = "Hornizz Brimbuzzle", x = 60.5, y = 38.2 },
        objectives = {
            { type = "kill", name = "Haggard Specter", spawns = {
                {65.5, 90.2}, {66.8, 88.5}, {64.2, 91.8}, {67.5, 89.1}
            }},
        }
    },
    
    [1466] = { -- Gelkis Alliance
        name = "Gelkis Alliance",
        zone = "Desolace",
        start = { npc = "Uthek the Wise", x = 36.2, y = 79.2 },
        objectives = {
            { type = "kill", name = "Magram Stormer", spawns = {
                {70.5, 44.2}, {71.8, 42.5}, {69.2, 45.8}, {72.5, 43.1}
            }},
        }
    },
    
    [1367] = { -- Burning Destruction
        name = "Burning Destruction",
        zone = "Desolace",
        start = { npc = "Maurin Bonesplitter", x = 52.5, y = 53.5 },
        objectives = {
            { type = "kill", name = "Burning Blade Felsworn", spawns = {
                {54.5, 28.2}, {55.8, 26.5}, {53.2, 29.8}, {56.5, 27.1}
            }},
        }
    },
    
    [1368] = { -- The Burning of Spirits
        name = "The Burning of Spirits",
        zone = "Desolace",
        start = { npc = "Maurin Bonesplitter", x = 52.5, y = 53.5 },
        objectives = {
            { type = "kill", name = "Burning Blade Adept", spawns = {
                {55.5, 27.2}, {56.8, 25.5}, {54.2, 28.8}, {57.5, 26.1}
            }},
        }
    },
    
    [1432] = { -- Centaur Bounty
        name = "Centaur Bounty",
        zone = "Desolace",
        start = { npc = "Corporal Melkins", x = 66.5, y = 11.5 },
        objectives = {
            { type = "item", name = "Centaur Ear", spawns = {
                {68.5, 15.2}, {69.8, 13.5}, {67.2, 16.8}, {70.5, 14.1}
            }},
        }
    },
    
    [1434] = { -- Strange Alliance (Alliance)
        name = "Strange Alliance",
        zone = "Desolace",
        start = { npc = "Captain Pentigast", x = 66.8, y = 10.3 },
        objectives = {
            { type = "talk", name = "Uthek the Wise", spawns = {{36.2, 79.2}} },
        }
    },
    
    [1383] = { -- Reagents for Reclaimers Inc.
        name = "Reagents for Reclaimers Inc.",
        zone = "Desolace",
        start = { npc = "Kreldig Ungor", x = 66.2, y = 8.2 },
        objectives = {
            { type = "item", name = "Scorpashi Venom", spawns = {
                {58.5, 32.2}, {59.8, 30.5}, {57.2, 33.8}, {60.5, 31.1}
            }},
            { type = "item", name = "Kodo Horn", spawns = {
                {55.5, 45.2}, {56.8, 43.5}, {54.2, 46.8}, {57.5, 44.1}
            }},
        }
    },
    
    [1384] = { -- Reagents for Reclaimers Inc. (Part 2)
        name = "Reagents for Reclaimers Inc.",
        zone = "Desolace",
        start = { npc = "Kreldig Ungor", x = 66.2, y = 8.2 },
        objectives = {
            { type = "item", name = "Felhound Brain", spawns = {
                {75.5, 22.2}, {76.8, 20.5}, {74.2, 23.8}, {77.5, 21.1}
            }},
        }
    },
    
    [1459] = { -- Magram Alliance
        name = "Magram Alliance",
        zone = "Desolace",
        start = { npc = "Warug", x = 74.5, y = 68.0 },
        objectives = {
            { type = "kill", name = "Gelkis Stamper", spawns = {
                {37.5, 81.2}, {38.8, 79.5}, {36.2, 82.8}, {39.5, 80.1}
            }},
        }
    },
    
    [1456] = { -- Stealing Supplies
        name = "Stealing Supplies",
        zone = "Desolace",
        start = { npc = "Warug", x = 74.5, y = 68.0 },
        objectives = {
            { type = "item", name = "Magram Centaur Supply", spawns = {
                {71.5, 45.2}, {72.8, 43.5}, {70.2, 46.8}, {73.5, 44.1}
            }},
        }
    },
    
    [1480] = { -- Khan Shaka
        name = "Khan Shaka",
        zone = "Desolace",
        start = { npc = "Uthek the Wise", x = 36.2, y = 79.2 },
        objectives = {
            { type = "kill", name = "Khan Shaka", spawns = {{72.5, 46.2}} },
        }
    },
    
    [1437] = { -- Sceptre of Light
        name = "Sceptre of Light",
        zone = "Desolace",
        start = { npc = "Azore Aldamort", x = 38.8, y = 27.2 },
        objectives = {
            { type = "item", name = "Sceptre of Light", spawns = {{53.5, 30.2}} },
        }
    },
    
    [1438] = { -- Book of the Ancients
        name = "Book of the Ancients",
        zone = "Desolace",
        start = { npc = "Azore Aldamort", x = 38.8, y = 27.2 },
        objectives = {
            { type = "item", name = "Book of the Ancients", spawns = {{28.5, 8.5}} },
        }
    },
    
    [1442] = { -- Shadowprey Village (Horde)
        name = "Shadowprey Village",
        zone = "Desolace",
        start = { npc = "Takata Steelblade", x = 52.2, y = 53.8 },
        objectives = {
            { type = "talk", name = "Thalon", spawns = {{23.2, 72.8}} },
        }
    },
    
    [1454] = { -- Claim Rackmore's Treasure
        name = "Claim Rackmore's Treasure",
        zone = "Desolace",
        start = { npc = "Rackmore's Log", x = 36.2, y = 30.8 },
        objectives = {
            { type = "item", name = "Rackmore's Silver Key", spawns = {{28.5, 7.8}} },
            { type = "item", name = "Rackmore's Golden Key", spawns = {{22.8, 11.2}} },
        }
    },
    
    [1455] = { -- Bone Collector
        name = "Bone Collector",
        zone = "Desolace",
        start = { npc = "Bibbly F'utzbuckle", x = 60.5, y = 38.5 },
        objectives = {
            { type = "item", name = "Kodo Bone", spawns = {
                {55.5, 48.2}, {56.8, 46.5}, {54.2, 49.8}, {57.5, 47.1}
            }},
        }
    },
    
    [5501] = { -- Corrupted Sabers
        name = "Corrupted Sabers",
        zone = "Desolace",
        start = { npc = "Keeper Albanar", x = 58.5, y = 47.5 },
        objectives = {
            { type = "item", name = "Corrupted Felheart", spawns = {
                {78.5, 22.2}, {79.8, 20.5}, {77.2, 23.8}, {80.5, 21.1}
            }},
        }
    },
    
    [1365] = { -- The Kolkar of Desolace
        name = "The Kolkar of Desolace",
        zone = "Desolace",
        start = { npc = "Regthar Deathgate", x = 45.2, y = 28.5 },
        objectives = {
            { type = "talk", name = "Grundig Darkcloud", spawns = {{68.5, 62.8}} },
        }
    },
    
    [1369] = { -- Demon Ice
        name = "Demon Ice",
        zone = "Desolace",
        start = { npc = "Maurin Bonesplitter", x = 52.5, y = 53.5 },
        objectives = {
            { type = "kill", name = "Felhound", spawns = {
                {75.5, 20.2}, {76.8, 18.5}, {74.2, 21.8}, {77.5, 19.1}
            }},
        }
    },
    
    [1476] = { -- Khan Hratha
        name = "Khan Hratha",
        zone = "Desolace",
        start = { npc = "Uthek the Wise", x = 36.2, y = 79.2 },
        objectives = {
            { type = "kill", name = "Khan Hratha", spawns = {{70.5, 70.8}} },
        }
    },
    
    [6134] = { -- Slitherblade Threat
        name = "Slitherblade Threat",
        zone = "Desolace",
        start = { npc = "Cenarion Envoy", x = 56.5, y = 48.2 },
        objectives = {
            { type = "kill", name = "Slitherblade Naga", spawns = {
                {28.5, 5.2}, {29.8, 3.5}, {27.2, 6.8}, {30.5, 4.1}
            }},
        }
    },
    
    [1374] = { -- Hunting in Desolace
        name = "Hunting in Desolace",
        zone = "Desolace",
        start = { npc = "Nijel's Point Wanted Poster", x = 66.0, y = 9.5 },
        objectives = {
            { type = "kill", name = "Hatefury Felsworn", spawns = {
                {69.5, 22.2}, {70.8, 20.5}, {68.2, 23.8}, {71.5, 21.1}
            }},
        }
    },
    
    [5741] = { -- Portals of the Legion
        name = "Portals of the Legion",
        zone = "Desolace",
        start = { npc = "Azore Aldamort", x = 38.8, y = 27.2 },
        objectives = {
            { type = "item", name = "Portal Fragment", spawns = {
                {77.5, 28.2}, {78.8, 26.5}, {76.2, 29.8}, {79.5, 27.1}
            }},
        }
    },
    
    [5421] = { -- Catch of the Day
        name = "Catch of the Day",
        zone = "Desolace",
        start = { npc = "Brogus Thunderbrew", x = 24.5, y = 72.8 },
        objectives = {
            { type = "item", name = "Coho Salmon", spawns = {
                {22.5, 68.2}, {23.8, 66.5}, {21.2, 69.8}, {24.5, 67.1}
            }},
        }
    },
    
    [1467] = { -- Assault on the Kolkar
        name = "Assault on the Kolkar",
        zone = "Desolace",
        start = { npc = "Felgur Twocuts", x = 66.5, y = 10.8 },
        objectives = {
            { type = "kill", name = "Kolkar Marauder", spawns = {
                {68.5, 62.2}, {69.8, 60.5}, {67.2, 63.8}, {70.5, 61.1}
            }},
            { type = "kill", name = "Kolkar Scout", spawns = {
                {69.5, 61.2}, {70.8, 59.5}, {68.2, 62.8}, {71.5, 60.1}
            }},
        }
    },
    
    [6027] = { -- Zaetar's Spirit (Maraudon)
        name = "Zaetar's Spirit",
        zone = "Desolace",
        start = { npc = "Zaetar's Spirit", x = 29.7, y = 62.5 },
        objectives = {
            { type = "talk", name = "Keeper Remulos", spawns = {{36.2, 41.8}} },
        }
    },
    
    [1373] = { -- Sargeron
        name = "Sargeron",
        zone = "Desolace",
        start = { npc = "Captain Pentigast", x = 66.8, y = 10.3 },
        objectives = {
            { type = "kill", name = "Hatefury Betrayer", spawns = {
                {72.5, 26.2}, {73.8, 24.5}, {71.2, 27.8}, {74.5, 25.1}
            }},
            { type = "kill", name = "Hatefury Hellcaller", spawns = {
                {73.5, 25.2}, {74.8, 23.5}, {72.2, 26.8}, {75.5, 24.1}
            }},
        }
    },
    
    [6142] = { -- The Pariah's Instructions
        name = "The Pariah's Instructions",
        zone = "Desolace",
        start = { npc = "Centaur Pariah", x = 44.5, y = 84.5 },
        objectives = {
            { type = "talk", name = "Gaelkis Scout", spawns = {{36.2, 79.2}} },
        }
    },
    
    [1457] = { -- Broken Tears
        name = "Broken Tears",
        zone = "Desolace",
        start = { npc = "Grace Jessup", x = 66.5, y = 8.8 },
        objectives = {
            { type = "item", name = "Broken Tears", spawns = {
                {56.5, 18.2}, {57.8, 16.5}, {55.2, 19.8}, {58.5, 17.1}
            }},
        }
    },
    
    [1460] = { -- Magram Betrayal
        name = "Magram Betrayal",
        zone = "Desolace",
        start = { npc = "Warug", x = 74.5, y = 68.0 },
        objectives = {
            { type = "kill", name = "Magram Outrunner", spawns = {
                {72.5, 48.2}, {73.8, 46.5}, {71.2, 49.8}, {74.5, 47.1}
            }},
        }
    },
    
    [1481] = { -- Gelkis Scouts
        name = "Gelkis Scouts",
        zone = "Desolace",
        start = { npc = "Uthek the Wise", x = 36.2, y = 79.2 },
        objectives = {
            { type = "kill", name = "Gelkis Scout", spawns = {
                {35.5, 78.2}, {36.8, 76.5}, {34.2, 79.8}, {37.5, 77.1}
            }},
        }
    },
    
    [1451] = { -- Oracle of the Sea
        name = "Oracle of the Sea",
        zone = "Desolace",
        start = { npc = "Mazoga", x = 24.8, y = 68.5 },
        objectives = {
            { type = "kill", name = "Slitherblade Oracle", spawns = {
                {26.5, 8.2}, {27.8, 6.5}, {25.2, 9.8}, {28.5, 7.1}
            }},
        }
    },
    
    [1475] = { -- Sorrowbane
        name = "Sorrowbane",
        zone = "Desolace",
        start = { npc = "Korran", x = 67.5, y = 64.0 },
        objectives = {
            { type = "kill", name = "Spirit of Sorrow", spawns = {
                {62.5, 92.2}, {63.8, 90.5}, {61.2, 93.8}, {64.5, 91.1}
            }},
        }
    },
    
    [1482] = { -- Raid on the Kolkar
        name = "Raid on the Kolkar",
        zone = "Desolace",
        start = { npc = "Felgur Twocuts", x = 66.5, y = 10.8 },
        objectives = {
            { type = "kill", name = "Kolkar Packhorse", spawns = {
                {66.5, 60.2}, {67.8, 58.5}, {65.2, 61.8}, {68.5, 59.1}
            }},
            { type = "kill", name = "Kolkar Ambusher", spawns = {
                {67.5, 59.2}, {68.8, 57.5}, {66.2, 60.8}, {69.5, 58.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Arathi Highlands Quests (30-40)
    -----------------------------------------
    
    [665] = { -- Stromgarde Badges
        name = "Stromgarde Badges",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "item", name = "Stromgarde Badge", spawns = {
                {26.5, 62.2}, {27.8, 60.5}, {25.2, 63.8}, {28.5, 61.1}
            }},
        }
    },
    
    [667] = { -- The Broken Sigil
        name = "The Broken Sigil",
        zone = "Arathi Highlands",
        start = { npc = "Apprentice Kryten", x = 46.2, y = 47.5 },
        objectives = {
            { type = "item", name = "Sigil Fragment", spawns = {
                {28.5, 59.2}, {29.8, 57.5}, {27.2, 60.8}, {30.5, 58.1}
            }},
        }
    },
    
    [668] = { -- Sigil of Strom
        name = "Sigil of Strom",
        zone = "Arathi Highlands",
        start = { npc = "Apprentice Kryten", x = 46.2, y = 47.5 },
        objectives = {
            { type = "item", name = "Sigil of Strom", spawns = {{26.5, 58.2}} },
        }
    },
    
    [669] = { -- The Forsaken Trollbane
        name = "The Forsaken Trollbane",
        zone = "Arathi Highlands",
        start = { npc = "Zengu", x = 74.0, y = 36.5 },
        objectives = {
            { type = "item", name = "Sigil of Trollbane", spawns = {{16.5, 68.2}} },
        }
    },
    
    [674] = { -- Hammerfall (Horde)
        name = "Hammerfall",
        zone = "Arathi Highlands",
        start = { npc = "Drum Fel", x = 74.2, y = 36.8 },
        objectives = {
            { type = "talk", name = "Tor'gan", spawns = {{74.0, 36.5}} },
        }
    },
    
    [675] = { -- Call to Arms
        name = "Call to Arms",
        zone = "Arathi Highlands",
        start = { npc = "Drum Fel", x = 74.2, y = 36.8 },
        objectives = {
            { type = "kill", name = "Witherbark Axe Thrower", spawns = {
                {63.5, 62.2}, {64.8, 60.5}, {62.2, 63.8}, {65.5, 61.1}
            }},
            { type = "kill", name = "Witherbark Witch Doctor", spawns = {
                {64.5, 61.2}, {65.8, 59.5}, {63.2, 62.8}, {66.5, 60.1}
            }},
        }
    },
    
    [676] = { -- Call to Arms (Part 2)
        name = "Call to Arms",
        zone = "Arathi Highlands",
        start = { npc = "Drum Fel", x = 74.2, y = 36.8 },
        objectives = {
            { type = "kill", name = "Witherbark Shadowcaster", spawns = {
                {60.5, 66.2}, {61.8, 64.5}, {59.2, 67.8}, {62.5, 65.1}
            }},
            { type = "kill", name = "Witherbark Headhunter", spawns = {
                {61.5, 65.2}, {62.8, 63.5}, {60.2, 66.8}, {63.5, 64.1}
            }},
        }
    },
    
    [677] = { -- Call to Arms (Part 3 - Mort'alor)
        name = "Call to Arms",
        zone = "Arathi Highlands",
        start = { npc = "Drum Fel", x = 74.2, y = 36.8 },
        objectives = {
            { type = "kill", name = "Mort'alor", spawns = {{62.5, 73.8}} },
        }
    },
    
    [678] = { -- The Hammer May Fall
        name = "The Hammer May Fall",
        zone = "Arathi Highlands",
        start = { npc = "Tor'gan", x = 74.0, y = 36.5 },
        objectives = {
            { type = "kill", name = "Boulderfist Ogre", spawns = {
                {40.5, 48.2}, {41.8, 46.5}, {39.2, 49.8}, {42.5, 47.1}
            }},
        }
    },
    
    [679] = { -- Guile of the Raptor
        name = "Guile of the Raptor",
        zone = "Arathi Highlands",
        start = { npc = "Tor'gan", x = 74.0, y = 36.5 },
        objectives = {
            { type = "kill", name = "Highland Strider", spawns = {
                {58.5, 35.2}, {59.8, 33.5}, {57.2, 36.8}, {60.5, 34.1}
            }},
        }
    },
    
    [680] = { -- Foul Magics
        name = "Foul Magics",
        zone = "Arathi Highlands",
        start = { npc = "Zengu", x = 74.0, y = 36.5 },
        objectives = {
            { type = "item", name = "Witherbark Fetish", spawns = {
                {65.5, 62.2}, {66.8, 60.5}, {64.2, 63.8}, {67.5, 61.1}
            }},
        }
    },
    
    [681] = { -- Troll Necklace Bounty
        name = "Troll Necklace Bounty",
        zone = "Arathi Highlands",
        start = { npc = "Zengu", x = 74.0, y = 36.5 },
        objectives = {
            { type = "item", name = "Troll Tribal Necklace", spawns = {
                {66.5, 63.2}, {67.8, 61.5}, {65.2, 64.8}, {68.5, 62.1}
            }},
        }
    },
    
    [682] = { -- Trollbane
        name = "Trollbane",
        zone = "Arathi Highlands",
        start = { npc = "Zengu", x = 74.0, y = 36.5 },
        objectives = {
            { type = "item", name = "Trol'kalar", spawns = {{18.5, 68.2}} },
        }
    },
    
    [684] = { -- Wanted: Otto and Falconcrest
        name = "Wanted: Otto and Falconcrest",
        zone = "Arathi Highlands",
        start = { npc = "Wanted Poster", x = 45.2, y = 48.2 },
        objectives = {
            { type = "kill", name = "Otto", spawns = {{26.2, 27.5}} },
            { type = "kill", name = "Lord Falconcrest", spawns = {{21.8, 30.2}} },
        }
    },
    
    [685] = { -- Northfold Manor
        name = "Northfold Manor",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "kill", name = "Syndicate Highwayman", spawns = {
                {30.5, 32.2}, {31.8, 30.5}, {29.2, 33.8}, {32.5, 31.1}
            }},
        }
    },
    
    [686] = { -- Syndicate Assassins
        name = "Syndicate Assassins",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "kill", name = "Syndicate Assassin", spawns = {
                {52.5, 59.2}, {53.8, 57.5}, {51.2, 60.8}, {54.5, 58.1}
            }},
        }
    },
    
    [671] = { -- Death From Below
        name = "Death From Below",
        zone = "Arathi Highlands",
        start = { npc = "Shakes O'Breen", x = 32.5, y = 81.2 },
        objectives = {
            { type = "kill", name = "Daggerspine Raider", spawns = {
                {22.5, 85.2}, {23.8, 83.5}, {21.2, 86.8}, {24.5, 84.1}
            }},
        }
    },
    
    [699] = { -- Go'shek Farm
        name = "Go'shek Farm",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "kill", name = "Syndicate Thief", spawns = {
                {58.5, 55.2}, {59.8, 53.5}, {57.2, 56.8}, {60.5, 54.1}
            }},
            { type = "kill", name = "Syndicate Spy", spawns = {
                {59.5, 54.2}, {60.8, 52.5}, {58.2, 55.8}, {61.5, 53.1}
            }},
        }
    },
    
    [687] = { -- Circle of Inner Binding
        name = "Circle of Inner Binding",
        zone = "Arathi Highlands",
        start = { npc = "Skuerto", x = 46.5, y = 46.8 },
        objectives = {
            { type = "kill", name = "Fozruk", spawns = {{52.5, 39.8}} },
            { type = "item", name = "Binding Shard", spawns = {{52.5, 39.8}} },
        }
    },
    
    [688] = { -- Circle of Outer Binding
        name = "Circle of Outer Binding",
        zone = "Arathi Highlands",
        start = { npc = "Skuerto", x = 46.5, y = 46.8 },
        objectives = {
            { type = "item", name = "Cresting Key", spawns = {{62.8, 33.8}} },
            { type = "item", name = "Thundering Key", spawns = {{38.5, 64.2}} },
            { type = "item", name = "Burning Key", spawns = {{52.5, 55.8}} },
        }
    },
    
    [691] = { -- Myzrael
        name = "Myzrael",
        zone = "Arathi Highlands",
        start = { npc = "Iridescent Shards", x = 62.5, y = 33.5 },
        objectives = {
            { type = "kill", name = "Myzrael", spawns = {{62.5, 34.2}} },
        }
    },
    
    [692] = { -- Crystal in the Mountains
        name = "Crystal in the Mountains",
        zone = "Arathi Highlands",
        start = { npc = "Skuerto", x = 46.5, y = 46.8 },
        objectives = {
            { type = "item", name = "Azure Agate", spawns = {
                {85.5, 32.2}, {86.8, 30.5}, {84.2, 33.8}, {87.5, 31.1}
            }},
        }
    },
    
    [670] = { -- Land Ho!
        name = "Land Ho!",
        zone = "Arathi Highlands",
        start = { npc = "Lolo the Lookout", x = 32.8, y = 80.5 },
        objectives = {
            { type = "talk", name = "Professor Phizzlethorpe", spawns = {{31.5, 82.2}} },
        }
    },
    
    [664] = { -- Drowned Sorrows
        name = "Drowned Sorrows",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "kill", name = "Daggerspine Siren", spawns = {
                {18.5, 88.2}, {19.8, 86.5}, {17.2, 89.8}, {20.5, 87.1}
            }},
        }
    },
    
    [694] = { -- Malin's Request
        name = "Malin's Request",
        zone = "Arathi Highlands",
        start = { npc = "Archmage Malin", x = 23.5, y = 50.2 },
        objectives = {
            { type = "talk", name = "Trelane", spawns = {{46.2, 47.5}} },
        }
    },
    
    [695] = { -- Worth Its Weight in Gold
        name = "Worth Its Weight in Gold",
        zone = "Arathi Highlands",
        start = { npc = "Trelane", x = 46.2, y = 47.5 },
        objectives = {
            { type = "item", name = "Trelane's Phylactery", spawns = {{27.5, 62.2}} },
        }
    },
    
    [696] = { -- The Real Threat
        name = "The Real Threat",
        zone = "Arathi Highlands",
        start = { npc = "Captain Nials", x = 45.5, y = 47.8 },
        objectives = {
            { type = "kill", name = "Boulderfist Lord", spawns = {
                {37.5, 55.2}, {38.8, 53.5}, {36.2, 56.8}, {39.5, 54.1}
            }},
            { type = "kill", name = "Boulderfist Shaman", spawns = {
                {38.5, 54.2}, {39.8, 52.5}, {37.2, 55.8}, {40.5, 53.1}
            }},
        }
    },
    
    [697] = { -- Shadowy Figures
        name = "Shadowy Figures",
        zone = "Arathi Highlands",
        start = { npc = "Zapetta", x = 73.5, y = 35.5 },
        objectives = {
            { type = "talk", name = "Deathstalker Rathor", spawns = {{60.5, 69.2}} },
        }
    },
    
    [698] = { -- Triage
        name = "Triage",
        zone = "Arathi Highlands",
        start = { npc = "Doctor Gregory Victor", x = 73.2, y = 36.8 },
        objectives = {
            { type = "talk", name = "Injured Soldier", spawns = {{73.5, 37.2}} },
        }
    },
    
    [702] = { -- Sunken Treasure
        name = "Sunken Treasure",
        zone = "Arathi Highlands",
        start = { npc = "Professor Phizzlethorpe", x = 31.5, y = 82.2 },
        objectives = {
            { type = "item", name = "Maiden's Folly Charts", spawns = {{23.5, 85.2}} },
            { type = "item", name = "Maiden's Folly Log", spawns = {{24.8, 86.5}} },
        }
    },
    
    -----------------------------------------
    -- Alterac Mountains Quests (30-40)
    -----------------------------------------
    
    [504] = { -- Foreboding Plans
        name = "Foreboding Plans",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "kill", name = "Syndicate Spy", spawns = {
                {38.5, 48.2}, {39.8, 46.5}, {37.2, 49.8}, {40.5, 47.1}
            }},
            { type = "item", name = "Foreboding Plans", spawns = {
                {39.5, 47.2}, {40.8, 45.5}, {38.2, 48.8}, {41.5, 46.1}
            }},
        }
    },
    
    [505] = { -- Encrypted Letter
        name = "Encrypted Letter",
        zone = "Alterac Mountains",
        start = { npc = "Encrypted Letter", x = 38.5, y = 47.2 },
        objectives = {
            { type = "talk", name = "Magistrate Henry Maleb", spawns = {{48.5, 31.8}} },
        }
    },
    
    [506] = { -- Noble Deaths
        name = "Noble Deaths",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "item", name = "Head of Balnazzar", spawns = {
                {42.5, 52.2}, {43.8, 50.5}, {41.2, 53.8}, {44.5, 51.1}
            }},
        }
    },
    
    [507] = { -- Crushridge Bounty
        name = "Crushridge Bounty",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "kill", name = "Crushridge Ogre", spawns = {
                {45.5, 50.2}, {46.8, 48.5}, {44.2, 51.8}, {47.5, 49.1}
            }},
            { type = "kill", name = "Crushridge Brute", spawns = {
                {46.5, 49.2}, {47.8, 47.5}, {45.2, 50.8}, {48.5, 48.1}
            }},
        }
    },
    
    [508] = { -- Crushridge Warmongers
        name = "Crushridge Warmongers",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "kill", name = "Crushridge Warmonger", spawns = {
                {50.5, 54.2}, {51.8, 52.5}, {49.2, 55.8}, {52.5, 53.1}
            }},
        }
    },
    
    [510] = { -- Muckrake's Report
        name = "Muckrake's Report",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "talk", name = "Muckrake", spawns = {{52.2, 44.8}} },
        }
    },
    
    [511] = { -- Infiltration
        name = "Infiltration",
        zone = "Alterac Mountains",
        start = { npc = "Muckrake", x = 52.2, y = 44.8 },
        objectives = {
            { type = "kill", name = "Syndicate Thief", spawns = {
                {56.5, 38.2}, {57.8, 36.5}, {55.2, 39.8}, {58.5, 37.1}
            }},
        }
    },
    
    [512] = { -- Baron's Decree
        name = "Baron's Decree",
        zone = "Alterac Mountains",
        start = { npc = "Muckrake", x = 52.2, y = 44.8 },
        objectives = {
            { type = "item", name = "Baron's Decree", spawns = {{56.5, 38.2}} },
        }
    },
    
    [513] = { -- Dalaran Patrols
        name = "Dalaran Patrols",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "kill", name = "Dalaran Summoner", spawns = {
                {20.5, 72.2}, {21.8, 70.5}, {19.2, 73.8}, {22.5, 71.1}
            }},
            { type = "kill", name = "Dalaran Theurgist", spawns = {
                {21.5, 71.2}, {22.8, 69.5}, {20.2, 72.8}, {23.5, 70.1}
            }},
        }
    },
    
    [514] = { -- Proof of Demise
        name = "Proof of Demise",
        zone = "Alterac Mountains",
        start = { npc = "Magistrate Henry Maleb", x = 48.5, y = 31.8 },
        objectives = {
            { type = "kill", name = "Syndicate Leader", spawns = {{57.5, 40.2}} },
            { type = "item", name = "Syndicate Signet Ring", spawns = {{57.5, 40.2}} },
        }
    },
    
    [515] = { -- Dark Council
        name = "Dark Council",
        zone = "Alterac Mountains",
        start = { npc = "Muckrake", x = 52.2, y = 44.8 },
        objectives = {
            { type = "kill", name = "Lord Aliden Perenolde", spawns = {{55.5, 74.5}} },
        }
    },
    
    [519] = { -- Stones of Binding
        name = "Stones of Binding",
        zone = "Alterac Mountains",
        start = { npc = "Krom Stoutarm", x = 54.0, y = 39.5 },
        objectives = {
            { type = "item", name = "Altar Stone", spawns = {
                {45.5, 42.2}, {46.8, 40.5}, {44.2, 43.8}, {47.5, 41.1}
            }},
        }
    },
    
    [554] = { -- The Crown of Will
        name = "The Crown of Will",
        zone = "Alterac Mountains",
        start = { npc = "High Executor Darthalia", x = 62.0, y = 20.0 },
        objectives = {
            { type = "kill", name = "Crushridge Enforcer", spawns = {
                {48.5, 58.2}, {49.8, 56.5}, {47.2, 59.8}, {50.5, 57.1}
            }},
        }
    },
    
    [556] = { -- The Crown of Will (Part 2)
        name = "The Crown of Will",
        zone = "Alterac Mountains",
        start = { npc = "High Executor Darthalia", x = 62.0, y = 20.0 },
        objectives = {
            { type = "kill", name = "Mug'thol", spawns = {{46.5, 68.2}} },
            { type = "item", name = "Crown of Will", spawns = {{46.5, 68.2}} },
        }
    },
    
    [557] = { -- Gol'dir
        name = "Gol'dir",
        zone = "Alterac Mountains",
        start = { npc = "Krusk", x = 58.5, y = 63.8 },
        objectives = {
            { type = "talk", name = "Gol'dir", spawns = {{57.5, 32.5}} },
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
    
    [1691] = { -- Gadgetzan Water Survey
        name = "Gadgetzan Water Survey",
        zone = "Tanaris",
        start = { npc = "Senior Surveyor Fizzledowser", x = 50.2, y = 27.5 },
        objectives = {
            { type = "item", name = "Untapped Dowsing Widget", spawns = {{38.5, 29.2}} },
        }
    },
    
    [992] = { -- Noggenfogger Elixir
        name = "Noggenfogger Elixir",
        zone = "Tanaris",
        start = { npc = "Marin Noggenfogger", x = 51.5, y = 28.8 },
        objectives = {
            { type = "item", name = "Dew Gland", spawns = {
                {28.2, 65.5}, {29.5, 67.2}, {27.8, 68.1}, {30.2, 66.4}
            }},
        }
    },
    
    [648] = { -- Gadgetzan Water Survey (Follow-up)
        name = "Noxious Lair Investigation",
        zone = "Tanaris",
        start = { npc = "Senior Surveyor Fizzledowser", x = 50.2, y = 27.5 },
        objectives = {
            { type = "item", name = "Centipaar Insect Part", spawns = {
                {32.5, 44.8}, {34.2, 46.5}, {31.8, 45.2}, {33.5, 47.1}
            }},
        }
    },
    
    [1560] = { -- Wastewander Justice
        name = "Wastewander Justice",
        zone = "Tanaris",
        start = { npc = "Chief Engineer Bilgewhizzle", x = 52.5, y = 28.5 },
        objectives = {
            { type = "kill", name = "Wastewander Shadow Mage", spawns = {
                {62.5, 34.2}, {63.8, 32.5}, {61.2, 35.8}, {64.5, 33.1}
            }},
            { type = "kill", name = "Wastewander Rogue", spawns = {
                {60.8, 31.5}, {62.1, 33.2}, {59.5, 32.8}, {61.8, 34.5}
            }},
        }
    },
    
    [1689] = { -- More Wastewander Justice
        name = "More Wastewander Justice",
        zone = "Tanaris",
        start = { npc = "Chief Engineer Bilgewhizzle", x = 52.5, y = 28.5 },
        objectives = {
            { type = "kill", name = "Wastewander Assassin", spawns = {
                {64.2, 28.5}, {65.5, 30.2}, {63.8, 29.1}, {66.2, 27.8}
            }},
            { type = "kill", name = "Wastewander Thief", spawns = {
                {63.5, 29.8}, {64.8, 31.5}, {62.2, 30.2}, {65.5, 28.8}
            }},
        }
    },
    
    [82] = { -- WANTED: Caliph Scorpidsting
        name = "WANTED: Caliph Scorpidsting",
        zone = "Tanaris",
        start = { npc = "Wanted Poster", x = 51.5, y = 26.8 },
        objectives = {
            { type = "kill", name = "Caliph Scorpidsting", spawns = {{64.5, 29.2}} },
        }
    },
    
    [8366] = { -- Pirate Hats Ahoy!
        name = "Pirate Hats Ahoy!",
        zone = "Tanaris",
        start = { npc = "Haughty Modiste", x = 51.6, y = 26.8 },
        objectives = {
            { type = "item", name = "Southsea Pirate Hat", spawns = {
                {71.2, 46.5}, {72.5, 48.2}, {70.8, 47.1}, {73.2, 45.8}
            }},
        }
    },
    
    [2875] = { -- Screecher Spirits
        name = "Screecher Spirits",
        zone = "Tanaris",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "kill", name = "Roc", spawns = {
                {42.5, 72.2}, {43.8, 70.5}, {41.2, 73.8}, {44.5, 71.1}
            }},
        }
    },
    
    [3520] = { -- The Prophecy of Mosh'aru
        name = "The Prophecy of Mosh'aru",
        zone = "Tanaris",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "item", name = "First Mosh'aru Tablet", spawns = {{36.5, 38.2}} },
            { type = "item", name = "Second Mosh'aru Tablet", spawns = {{48.2, 22.5}} },
        }
    },
    
    [2864] = { -- The Thirsty Goblin
        name = "The Thirsty Goblin",
        zone = "Tanaris",
        start = { npc = "Marin Noggenfogger", x = 51.5, y = 28.8 },
        objectives = {
            { type = "item", name = "Laden Dew Gland", spawns = {{29.5, 66.8}} },
        }
    },
    
    [5863] = { -- The Dunemaul Compound
        name = "The Dunemaul Compound",
        zone = "Tanaris",
        start = { npc = "Andi Lynn", x = 52.5, y = 27.6 },
        objectives = {
            { type = "kill", name = "Dunemaul Brute", spawns = {
                {40.5, 57.2}, {41.8, 55.5}, {39.2, 58.8}, {42.5, 56.1}
            }},
            { type = "kill", name = "Dunemaul Enforcer", spawns = {
                {41.2, 56.8}, {42.5, 58.5}, {40.8, 55.2}, {43.5, 57.5}
            }},
        }
    },
    
    [5862] = { -- Sandsorrow Watch
        name = "Sandsorrow Watch",
        zone = "Tanaris",
        start = { npc = "Andi Lynn", x = 52.5, y = 27.6 },
        objectives = {
            { type = "kill", name = "Sandfury Shadowcaster", spawns = {
                {38.5, 27.2}, {39.8, 25.5}, {37.2, 28.8}, {40.5, 26.1}
            }},
            { type = "kill", name = "Sandfury Shadowhunter", spawns = {
                {39.2, 26.8}, {40.5, 28.5}, {38.8, 25.2}, {41.5, 27.5}
            }},
        }
    },
    
    [2865] = { -- In Good Taste
        name = "In Good Taste",
        zone = "Tanaris",
        start = { npc = "Marin Noggenfogger", x = 51.5, y = 28.8 },
        objectives = {
            { type = "talk", name = "Sprinkle", spawns = {{51.2, 26.8}} },
        }
    },
    
    [2606] = { -- Southsea Freebooters
        name = "Southsea Freebooters",
        zone = "Tanaris",
        start = { npc = "Security Chief Bilgewhizzle", x = 51.6, y = 28.6 },
        objectives = {
            { type = "kill", name = "Southsea Freebooter", spawns = {
                {72.5, 46.2}, {73.8, 44.5}, {71.2, 47.8}, {74.5, 45.1}
            }},
            { type = "kill", name = "Southsea Dock Worker", spawns = {
                {73.2, 45.8}, {74.5, 47.5}, {72.8, 44.2}, {75.5, 46.5}
            }},
        }
    },
    
    [2607] = { -- The Relics of Wakening
        name = "The Relics of Wakening",
        zone = "Tanaris",
        start = { npc = "Security Chief Bilgewhizzle", x = 51.6, y = 28.6 },
        objectives = {
            { type = "item", name = "Gahz'ridian", spawns = {
                {48.5, 64.2}, {49.8, 62.5}, {47.2, 65.8}, {50.5, 63.1}
            }},
        }
    },
    
    [2770] = { -- Gahz'ridian
        name = "Gahz'ridian",
        zone = "Tanaris",
        start = { npc = "Marvon Rivetseeker", x = 52.8, y = 45.5 },
        objectives = {
            { type = "item", name = "Gahz'ridian", spawns = {
                {46.5, 38.2}, {47.8, 36.5}, {45.2, 39.8}, {48.5, 37.1},
                {52.2, 62.8}, {53.5, 64.5}, {51.8, 61.2}, {54.5, 63.5}
            }},
        }
    },
    
    [2768] = { -- Super Sticky
        name = "Super Sticky",
        zone = "Tanaris",
        start = { npc = "Tran'rek", x = 51.6, y = 26.8 },
        objectives = {
            { type = "item", name = "Thistleshrub Dew", spawns = {
                {27.5, 66.2}, {28.8, 68.5}, {26.2, 67.8}, {29.5, 65.1}
            }},
        }
    },
    
    [3161] = { -- Scarab Shells
        name = "Scarab Shells",
        zone = "Tanaris",
        start = { npc = "Tran'rek", x = 51.6, y = 26.8 },
        objectives = {
            { type = "item", name = "Intact Insect Carapace", spawns = {
                {33.5, 46.2}, {34.8, 44.5}, {32.2, 47.8}, {35.5, 45.1}
            }},
        }
    },
    
    [2872] = { -- Sprinkle's Secret Ingredient
        name = "Sprinkle's Secret Ingredient",
        zone = "Tanaris",
        start = { npc = "Sprinkle", x = 51.2, y = 26.8 },
        objectives = {
            { type = "item", name = "Violet Tragan", spawns = {{55.5, 65.8}} },
        }
    },
    
    [2773] = { -- Divino-matic Rod
        name = "Divino-matic Rod",
        zone = "Tanaris",
        start = { npc = "Chief Engineer Bilgewhizzle", x = 52.5, y = 28.5 },
        objectives = {
            { type = "item", name = "Divino-matic Rod", spawns = {{58.5, 37.2}} },
        }
    },
    
    [1558] = { -- Stoley's Debt
        name = "Stoley's Debt",
        zone = "Tanaris",
        start = { npc = "Stoley", x = 67.1, y = 23.9 },
        objectives = {
            { type = "item", name = "Stoley's Shipment", spawns = {{72.8, 47.5}} },
        }
    },
    
    [1559] = { -- Stoley's Shipment
        name = "Stoley's Shipment",
        zone = "Tanaris",
        start = { npc = "Stoley", x = 67.1, y = 23.9 },
        objectives = {
            { type = "talk", name = "Crank Fizzlebub", spawns = {{28.2, 75.5}} },
        }
    },
    
    [2877] = { -- The Ancient Egg
        name = "The Ancient Egg",
        zone = "Tanaris",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "item", name = "Ancient Egg", spawns = {{38.5, 21.2}} },
        }
    },
    
    [2936] = { -- The God Hakkar
        name = "The God Hakkar",
        zone = "Tanaris",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "item", name = "Filled Egg of Hakkar", spawns = {{36.8, 20.5}} },
        }
    },
    
    [2641] = { -- Ship Schedules
        name = "Ship Schedules",
        zone = "Tanaris",
        start = { npc = "Item Drop", x = 71.5, y = 45.8 },
        objectives = {
            { type = "talk", name = "Security Chief Bilgewhizzle", spawns = {{51.6, 28.6}} },
        }
    },
    
    [10] = { -- Thistleshrub Valley
        name = "The Root of All Evil",
        zone = "Tanaris",
        start = { npc = "Tran'rek", x = 51.6, y = 26.8 },
        objectives = {
            { type = "kill", name = "Gnarled Thistleshrub", spawns = {
                {29.5, 69.2}, {30.8, 67.5}, {28.2, 70.8}, {31.5, 68.1}
            }},
        }
    },
    
    [4507] = { -- OOX-17/TN Distress Beacon
        name = "OOX-17/TN Distress Beacon",
        zone = "Tanaris",
        start = { npc = "Homing Robot OOX-17/TN", x = 60.5, y = 64.8 },
        objectives = {
            { type = "talk", name = "Oglethorpe Obnoticus", spawns = {{28.2, 76.8}} },
        }
    },
    
    [2846] = { -- WANTED: Artisan Toolmakers
        name = "WANTED: Andre Firebeard",
        zone = "Tanaris",
        start = { npc = "Wanted Poster", x = 66.9, y = 22.2 },
        objectives = {
            { type = "kill", name = "Andre Firebeard", spawns = {{72.5, 47.2}} },
        }
    },
    
    [3362] = { -- The Sunken Temple
        name = "The Sunken Temple",
        zone = "Tanaris",
        start = { npc = "Marvon Rivetseeker", x = 52.8, y = 45.5 },
        objectives = {
            { type = "talk", name = "Lord Itharius", spawns = {{19.5, 57.2}} },
        }
    },
    
    [1452] = { -- Insect Corruption
        name = "Insect Corruption",
        zone = "Tanaris",
        start = { npc = "Alchemist Pestlezugg", x = 51.2, y = 28.8 },
        objectives = {
            { type = "item", name = "Centipaar Insect Part", spawns = {
                {34.5, 46.2}, {35.8, 44.5}, {33.2, 47.8}, {36.5, 45.1}
            }},
        }
    },
    
    [2605] = { -- Southsea Shakedown
        name = "Southsea Shakedown",
        zone = "Tanaris",
        start = { npc = "Security Chief Bilgewhizzle", x = 51.6, y = 28.6 },
        objectives = {
            { type = "kill", name = "Southsea Pirate", spawns = {
                {70.5, 48.2}, {71.8, 46.5}, {69.2, 49.8}, {72.5, 47.1}
            }},
            { type = "kill", name = "Southsea Swashbuckler", spawns = {
                {71.2, 47.8}, {72.5, 49.5}, {70.8, 46.2}, {73.5, 48.5}
            }},
        }
    },
    
    [5646] = { -- Tanaris Field Sampling
        name = "Tanaris Field Sampling",
        zone = "Tanaris",
        start = { npc = "Wrinkle Goodsteel", x = 52.2, y = 27.5 },
        objectives = {
            { type = "item", name = "Silithid Sampling", spawns = {
                {35.5, 45.2}, {36.8, 43.5}, {34.2, 46.8}, {37.5, 44.1}
            }},
        }
    },
    
    [351] = { -- Andre Firebeard Bounty
        name = "WANTED: Andre Firebeard",
        zone = "Tanaris",
        start = { npc = "Wanted Poster", x = 66.9, y = 22.2 },
        objectives = {
            { type = "kill", name = "Andre Firebeard", spawns = {{72.5, 47.2}} },
        }
    },
    
    [8365] = { -- Southsea Pirate Diversion
        name = "Southsea Freebooters",
        zone = "Tanaris",
        start = { npc = "Haughty Modiste", x = 51.6, y = 26.8 },
        objectives = {
            { type = "kill", name = "Southsea Pirate", spawns = {
                {71.5, 46.2}, {72.8, 44.5}, {70.2, 47.8}, {73.5, 45.1}
            }},
        }
    },
    
    [1707] = { -- ANCONA CHICKEN
        name = "WANTED: Andre Firebeard",
        zone = "Tanaris",
        start = { npc = "Magus Tirth", x = 66.5, y = 22.4 },
        objectives = {
            { type = "talk", name = "Andre Firebeard", spawns = {{67.2, 22.5}} },
        }
    },
    
    [3842] = { -- Troll Temper
        name = "Troll Temper",
        zone = "Tanaris",
        start = { npc = "Trenton Lighthammer", x = 51.5, y = 28.6 },
        objectives = {
            { type = "item", name = "Sandfury Temper", spawns = {
                {36.5, 22.2}, {37.8, 20.5}, {35.2, 23.8}, {38.5, 21.1}
            }},
        }
    },
    
    [3843] = { -- Mithril Casing
        name = "Mithril Casing",
        zone = "Tanaris",
        start = { npc = "Trenton Lighthammer", x = 51.5, y = 28.6 },
        objectives = {
            { type = "talk", name = "Trenton Lighthammer", spawns = {{51.5, 28.6}} },
        }
    },
    
    [1731] = { -- Zul'Farrak
        name = "Zul'Farrak",
        zone = "Tanaris",
        start = { npc = "Tran'rek", x = 51.6, y = 26.8 },
        objectives = {
            { type = "kill", name = "Sandfury Troll", spawns = {
                {36.5, 18.2}, {37.8, 16.5}, {35.2, 19.8}, {38.5, 17.1}
            }},
        }
    },
    
    [3845] = { -- Hammer of the Titans
        name = "Hammer of the Titans",
        zone = "Tanaris",
        start = { npc = "Trenton Lighthammer", x = 51.5, y = 28.6 },
        objectives = {
            { type = "talk", name = "Trenton Lighthammer", spawns = {{51.5, 28.6}} },
        }
    },
    
    [1144] = { -- Cuergo's Gold
        name = "Cuergo's Gold",
        zone = "Tanaris",
        start = { npc = "Item Drop", x = 72.5, y = 45.8 },
        objectives = {
            { type = "item", name = "Cuergo's Hidden Treasure", spawns = {{56.5, 87.2}} },
        }
    },
    
    -----------------------------------------
    -- Feralas Quests (40-50)
    -----------------------------------------
    
    -- ===== Camp Mojache (Horde) Quests =====
    
    [2979] = { -- The Mark of Quality
        name = "The Mark of Quality",
        zone = "Feralas",
        start = { npc = "Jangdor Swiftstrider", x = 74.4, y = 42.9 },
        objectives = {
            { type = "kill", name = "Rage Scar Yeti", spawns = {
                {54.5, 56.2}, {55.8, 54.5}, {53.2, 57.8}, {56.5, 55.1}
            }},
        }
    },
    
    [2973] = { -- Gordunni Cobalt
        name = "Gordunni Cobalt",
        zone = "Feralas",
        start = { npc = "Orwin Gizzmick", x = 74.8, y = 43.8 },
        objectives = {
            { type = "item", name = "Gordunni Cobalt", spawns = {
                {59.5, 42.2}, {60.8, 40.5}, {58.2, 43.8}, {61.5, 41.1}
            }},
        }
    },
    
    [2974] = { -- Gordunni Scroll
        name = "The Gordunni Scroll",
        zone = "Feralas",
        start = { npc = "Rok Orhan", x = 75.2, y = 44.2 },
        objectives = {
            { type = "item", name = "Gordunni Scroll", spawns = {{60.5, 41.8}} },
        }
    },
    
    [3002] = { -- Dark Ceremony
        name = "Dark Ceremony",
        zone = "Feralas",
        start = { npc = "Rok Orhan", x = 75.2, y = 44.2 },
        objectives = {
            { type = "kill", name = "Gordunni Mage-Lord", spawns = {{59.8, 39.5}} },
        }
    },
    
    [2978] = { -- Improved Quality
        name = "Improved Quality",
        zone = "Feralas",
        start = { npc = "Jangdor Swiftstrider", x = 74.4, y = 42.9 },
        objectives = {
            { type = "kill", name = "Feral Scar Yeti", spawns = {
                {56.5, 58.2}, {57.8, 56.5}, {55.2, 59.8}, {58.5, 57.1}
            }},
        }
    },
    
    [2976] = { -- The Ogres of Feralas (Horde)
        name = "The Ogres of Feralas",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "kill", name = "Gordunni Ogre", spawns = {
                {58.5, 40.2}, {59.8, 38.5}, {57.2, 41.8}, {60.5, 39.1}
            }},
            { type = "kill", name = "Gordunni Brute", spawns = {
                {59.2, 39.8}, {60.5, 41.5}, {58.8, 38.2}, {61.5, 40.5}
            }},
        }
    },
    
    [2975] = { -- The Gordunni Orb
        name = "The Gordunni Orb",
        zone = "Feralas",
        start = { npc = "Rok Orhan", x = 75.2, y = 44.2 },
        objectives = {
            { type = "item", name = "Gordunni Orb", spawns = {{61.5, 38.2}} },
        }
    },
    
    [2980] = { -- Woodpaw Gnolls
        name = "Woodpaw Gnolls",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "kill", name = "Woodpaw Trapper", spawns = {
                {71.5, 55.2}, {72.8, 53.5}, {70.2, 56.8}, {73.5, 54.1}
            }},
            { type = "kill", name = "Woodpaw Brute", spawns = {
                {72.2, 54.8}, {73.5, 56.5}, {71.8, 53.2}, {74.5, 55.5}
            }},
        }
    },
    
    [2981] = { -- The Woodpaw Gnolls
        name = "Woodpaw Investigation",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "item", name = "Large Leather Backpack", spawns = {{72.5, 56.8}} },
        }
    },
    
    [3128] = { -- Testing the Vessel
        name = "Testing the Vessel",
        zone = "Feralas",
        start = { npc = "Dreka'Sur", x = 74.5, y = 43.2 },
        objectives = {
            { type = "kill", name = "Wandering Forest Walker", spawns = {
                {42.5, 18.2}, {43.8, 16.5}, {41.2, 19.8}, {44.5, 17.1}
            }},
        }
    },
    
    [3062] = { -- Screecher Spirits (Feralas)
        name = "Screecher Spirits",
        zone = "Feralas",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "kill", name = "Vale Screecher", spawns = {
                {58.5, 69.2}, {59.8, 67.5}, {57.2, 70.8}, {60.5, 68.1}
            }},
        }
    },
    
    [3841] = { -- The Giants of Feralas
        name = "The Giants of Feralas",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "kill", name = "Cliff Giant", spawns = {
                {48.5, 36.2}, {49.8, 34.5}, {47.2, 37.8}, {50.5, 35.1}
            }},
            { type = "kill", name = "Mountain Giant", spawns = {
                {49.2, 35.8}, {50.5, 37.5}, {48.8, 34.2}, {51.5, 36.5}
            }},
        }
    },
    
    [2982] = { -- Alpha Strike
        name = "Alpha Strike",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "kill", name = "Woodpaw Alpha", spawns = {
                {73.5, 57.2}, {74.8, 55.5}, {72.2, 58.8}, {75.5, 56.1}
            }},
        }
    },
    
    [2983] = { -- Woodpaw Investigation
        name = "Woodpaw Investigation",
        zone = "Feralas",
        start = { npc = "Hadoken Swiftstrider", x = 74.8, y = 42.5 },
        objectives = {
            { type = "item", name = "Woodpaw Battle Report", spawns = {{72.8, 55.2}} },
        }
    },
    
    [3132] = { -- Hippogryph Egg Theft
        name = "Hippogryph Muisek",
        zone = "Feralas",
        start = { npc = "Krueg Skullsplitter", x = 74.5, y = 43.5 },
        objectives = {
            { type = "kill", name = "Hippogryph", spawns = {
                {53.5, 48.2}, {54.8, 46.5}, {52.2, 49.8}, {55.5, 47.1}
            }},
        }
    },
    
    [7721] = { -- Wandering Treant
        name = "Treant Muisek",
        zone = "Feralas",
        start = { npc = "Witch Doctor Uzer'i", x = 74.4, y = 43.2 },
        objectives = {
            { type = "kill", name = "Wandering Forest Walker", spawns = {
                {43.5, 17.2}, {44.8, 15.5}, {42.2, 18.8}, {45.5, 16.1}
            }},
        }
    },
    
    -- ===== Feathermoon Stronghold (Alliance) Quests =====
    
    [2869] = { -- The Ruins of Solarsal
        name = "The Ruins of Solarsal",
        zone = "Feralas",
        start = { npc = "Shandris Feathermoon", x = 30.4, y = 46.2 },
        objectives = {
            { type = "kill", name = "Hateful Siren", spawns = {
                {26.5, 52.2}, {27.8, 50.5}, {25.2, 53.8}, {28.5, 51.1}
            }},
        }
    },
    
    [2870] = { -- Return to Feathermoon Stronghold
        name = "Return to Feathermoon Stronghold",
        zone = "Feralas",
        start = { npc = "Solarsal Gazebo", x = 26.5, y = 52.5 },
        objectives = {
            { type = "talk", name = "Shandris Feathermoon", spawns = {{30.4, 46.2}} },
        }
    },
    
    [2871] = { -- Against the Hatecrest
        name = "Against the Hatecrest",
        zone = "Feralas",
        start = { npc = "Latronicus Moonspear", x = 30.6, y = 46.1 },
        objectives = {
            { type = "kill", name = "Hateful Siren", spawns = {
                {25.5, 53.2}, {26.8, 51.5}, {24.2, 54.8}, {27.5, 52.1}
            }},
            { type = "kill", name = "Hatecrest Sorceress", spawns = {
                {26.2, 52.8}, {27.5, 54.5}, {25.8, 51.2}, {28.5, 53.5}
            }},
        }
    },
    
    [2972] = { -- Against Lord Shalzaru
        name = "Against Lord Shalzaru",
        zone = "Feralas",
        start = { npc = "Latronicus Moonspear", x = 30.6, y = 46.1 },
        objectives = {
            { type = "kill", name = "Lord Shalzaru", spawns = {{28.5, 71.2}} },
        }
    },
    
    [2866] = { -- The Missing Courier
        name = "The Missing Courier",
        zone = "Feralas",
        start = { npc = "Latronicus Moonspear", x = 30.6, y = 46.1 },
        objectives = {
            { type = "item", name = "Boat Wreckage", spawns = {{44.5, 42.8}} },
        }
    },
    
    [2867] = { -- The Missing Courier (Part 2)
        name = "The Missing Courier",
        zone = "Feralas",
        start = { npc = "Ginro Hearthkindle", x = 31.8, y = 45.2 },
        objectives = {
            { type = "talk", name = "Courier Hammerfall", spawns = {{89.2, 45.5}} },
        }
    },
    
    [2944] = { -- The High Wilderness
        name = "The High Wilderness",
        zone = "Feralas",
        start = { npc = "Angelas Moonbreeze", x = 31.8, y = 45.5 },
        objectives = {
            { type = "kill", name = "Cliff Giant", spawns = {
                {47.5, 35.2}, {48.8, 33.5}, {46.2, 36.8}, {49.5, 34.1}
            }},
            { type = "kill", name = "Murk Thunderscar", spawns = {{51.8, 33.5}} },
        }
    },
    
    [2904] = { -- A New Cloak's Sheen
        name = "A New Cloak's Sheen",
        zone = "Feralas",
        start = { npc = "Pratt McGrubben", x = 30.6, y = 42.8 },
        objectives = {
            { type = "kill", name = "Sprite Darter", spawns = {
                {71.5, 48.2}, {72.8, 46.5}, {70.2, 49.8}, {73.5, 47.1}
            }},
        }
    },
    
    [3130] = { -- In Search of Knowledge
        name = "The Mark of Quality",
        zone = "Feralas",
        start = { npc = "Pratt McGrubben", x = 30.6, y = 42.8 },
        objectives = {
            { type = "kill", name = "Rage Scar Yeti", spawns = {
                {53.5, 55.2}, {54.8, 53.5}, {52.2, 56.8}, {55.5, 54.1}
            }},
        }
    },
    
    [3131] = { -- Return to Pratt
        name = "Improved Quality",
        zone = "Feralas",
        start = { npc = "Pratt McGrubben", x = 30.6, y = 42.8 },
        objectives = {
            { type = "kill", name = "Feral Scar Yeti", spawns = {
                {55.5, 57.2}, {56.8, 55.5}, {54.2, 58.8}, {57.5, 56.1}
            }},
        }
    },
    
    [2938] = { -- Find OOX-22/FE!
        name = "Find OOX-22/FE!",
        zone = "Feralas",
        start = { npc = "OOX-22/FE", x = 52.5, y = 55.8 },
        objectives = {
            { type = "talk", name = "Oglethorpe Obnoticus", spawns = {{28.2, 76.8}} },
        }
    },
    
    [2939] = { -- Rescue OOX-22/FE!
        name = "Rescue OOX-22/FE!",
        zone = "Feralas",
        start = { npc = "OOX-22/FE", x = 52.5, y = 55.8 },
        objectives = {
            { type = "talk", name = "Oglethorpe Obnoticus", spawns = {{28.2, 76.8}} },
        }
    },
    
    [2968] = { -- The Ogres of Feralas (Alliance)
        name = "The Ogres of Feralas",
        zone = "Feralas",
        start = { npc = "Pratt McGrubben", x = 30.6, y = 42.8 },
        objectives = {
            { type = "kill", name = "Gordunni Brute", spawns = {
                {57.5, 39.2}, {58.8, 37.5}, {56.2, 40.8}, {59.5, 38.1}
            }},
            { type = "kill", name = "Gordunni Warlock", spawns = {
                {58.2, 38.8}, {59.5, 40.5}, {57.8, 37.2}, {60.5, 39.5}
            }},
        }
    },
    
    [2970] = { -- Naga at the Zoram Strand
        name = "The Ruins of Solarsal",
        zone = "Feralas",
        start = { npc = "Latronicus Moonspear", x = 30.6, y = 46.1 },
        objectives = {
            { type = "kill", name = "Hatecrest Myrmidon", spawns = {
                {27.5, 53.2}, {28.8, 51.5}, {26.2, 54.8}, {29.5, 52.1}
            }},
        }
    },
    
    [2863] = { -- Gordunni Cobalt
        name = "Gordunni Cobalt",
        zone = "Feralas",
        start = { npc = "Latronicus Moonspear", x = 30.6, y = 46.1 },
        objectives = {
            { type = "item", name = "Gordunni Cobalt", spawns = {
                {58.5, 41.2}, {59.8, 39.5}, {57.2, 42.8}, {60.5, 40.1}
            }},
        }
    },
    
    [4267] = { -- The Spray of Argent Dawn
        name = "Sprite Darter Rescue",
        zone = "Feralas",
        start = { npc = "Kindal Moonweaver", x = 65.5, y = 45.8 },
        objectives = {
            { type = "kill", name = "Grimtotem Naturalist", spawns = {
                {66.5, 46.2}, {67.8, 44.5}, {65.2, 47.8}, {68.5, 45.1}
            }},
        }
    },
    
    [4561] = { -- The Dead Island
        name = "Sprite Darter Eggs",
        zone = "Feralas",
        start = { npc = "Jer'kai Moonweaver", x = 31.5, y = 45.8 },
        objectives = {
            { type = "item", name = "Sprite Darter Egg", spawns = {
                {72.5, 48.2}, {73.8, 46.5}, {71.2, 49.8}, {74.5, 47.1}
            }},
        }
    },
    
    [7001] = { -- Seeking Spiritual Aid
        name = "The Yazgi Gaurdians",
        zone = "Feralas",
        start = { npc = "Witch Doctor Uzer'i", x = 74.4, y = 43.2 },
        objectives = {
            { type = "kill", name = "Mountain Giant", spawns = {
                {50.5, 37.2}, {51.8, 35.5}, {49.2, 38.8}, {52.5, 36.1}
            }},
        }
    },
    
    -- ===== Dire Maul Prep Quests =====
    
    [7481] = { -- Libram of Focus
        name = "Libram of Focus",
        zone = "Feralas",
        start = { npc = "Dire Maul Dusty Tome", x = 62.8, y = 24.5 },
        objectives = {
            { type = "item", name = "Pristine Black Diamond", spawns = {{62.5, 25.8}} },
        }
    },
    
    [7482] = { -- Libram of Protection
        name = "Libram of Protection",
        zone = "Feralas",
        start = { npc = "Dire Maul Dusty Tome", x = 62.8, y = 24.5 },
        objectives = {
            { type = "item", name = "Pristine Black Diamond", spawns = {{62.5, 25.8}} },
        }
    },
    
    [7484] = { -- Libram of Rapidity
        name = "Libram of Rapidity",
        zone = "Feralas",
        start = { npc = "Dire Maul Dusty Tome", x = 62.8, y = 24.5 },
        objectives = {
            { type = "item", name = "Pristine Black Diamond", spawns = {{62.5, 25.8}} },
        }
    },
    
    [5526] = { -- Free Knot!
        name = "Free Knot!",
        zone = "Feralas",
        start = { npc = "Knot Thimblejack", x = 62.5, y = 24.8 },
        objectives = {
            { type = "item", name = "Gordok Shackle Key", spawns = {{63.8, 25.2}} },
        }
    },
    
    -----------------------------------------
    -- The Hinterlands Quests (40-50)
    -----------------------------------------
    
    -- ===== Aerie Peak (Alliance) Quests =====
    
    [2994] = { -- Skulk Rock Clean-up
        name = "Skulk Rock Clean-up",
        zone = "The Hinterlands",
        start = { npc = "Fraggar Thundermantle", x = 14.5, y = 44.2 },
        objectives = {
            { type = "kill", name = "Jade Sludge", spawns = {
                {57.5, 42.2}, {58.8, 40.5}, {56.2, 43.8}, {59.5, 41.1}
            }},
            { type = "kill", name = "Emerald Sludge", spawns = {
                {58.2, 41.8}, {59.5, 43.5}, {57.8, 40.2}, {60.5, 42.5}
            }},
        }
    },
    
    [2988] = { -- Troll Necklace Bounty
        name = "Troll Necklace Bounty",
        zone = "The Hinterlands",
        start = { npc = "Fraggar Thundermantle", x = 14.5, y = 44.2 },
        objectives = {
            { type = "item", name = "Troll Tribal Necklace", spawns = {
                {34.5, 68.2}, {35.8, 66.5}, {33.2, 69.8}, {36.5, 67.1}
            }},
        }
    },
    
    [2989] = { -- Vilebranch Hooligans
        name = "Vilebranch Hooligans",
        zone = "The Hinterlands",
        start = { npc = "Gryphon Master Talonaxe", x = 9.8, y = 44.5 },
        objectives = {
            { type = "kill", name = "Vilebranch Scalper", spawns = {
                {56.5, 48.2}, {57.8, 46.5}, {55.2, 49.8}, {58.5, 47.1}
            }},
            { type = "kill", name = "Vilebranch Ambusher", spawns = {
                {57.2, 47.8}, {58.5, 49.5}, {56.8, 46.2}, {59.5, 48.5}
            }},
        }
    },
    
    [2993] = { -- Featherbeard's Endorsement
        name = "Featherbeard's Endorsement",
        zone = "The Hinterlands",
        start = { npc = "Gryphon Master Talonaxe", x = 9.8, y = 44.5 },
        objectives = {
            { type = "talk", name = "Featherbeard", spawns = {{14.5, 44.2}} },
        }
    },
    
    [2991] = { -- Witherbark Cages
        name = "Witherbark Cages",
        zone = "The Hinterlands",
        start = { npc = "Gryphon Master Talonaxe", x = 9.8, y = 44.5 },
        objectives = {
            { type = "item", name = "Sharpbeak's Feather", spawns = {{23.5, 58.2}} },
        }
    },
    
    [2990] = { -- Cannibalistic Cousins
        name = "Cannibalistic Cousins",
        zone = "The Hinterlands",
        start = { npc = "Gryphon Master Talonaxe", x = 9.8, y = 44.5 },
        objectives = {
            { type = "kill", name = "Silvermane Howler", spawns = {
                {48.5, 39.2}, {49.8, 37.5}, {47.2, 40.8}, {50.5, 38.1}
            }},
        }
    },
    
    [2998] = { -- Rin'ji's Secret
        name = "Rin'ji's Secret",
        zone = "The Hinterlands",
        start = { npc = "Rin'ji", x = 29.5, y = 48.5 },
        objectives = {
            { type = "item", name = "Rin'ji's Secret", spawns = {{30.5, 47.8}} },
        }
    },
    
    [2992] = { -- The Altar of Zul
        name = "The Altar of Zul",
        zone = "The Hinterlands",
        start = { npc = "Saga Greymane", x = 13.1, y = 44.0 },
        objectives = {
            { type = "kill", name = "Altar of Zul Guardian", spawns = {
                {48.5, 68.2}, {49.8, 66.5}, {47.2, 69.8}, {50.5, 67.1}
            }},
        }
    },
    
    [3001] = { -- Jintha'Alor
        name = "Jintha'Alor",
        zone = "The Hinterlands",
        start = { npc = "Falstad Wildhammer", x = 9.8, y = 44.2 },
        objectives = {
            { type = "kill", name = "Vilebranch Berserker", spawns = {
                {62.5, 72.2}, {63.8, 70.5}, {61.2, 73.8}, {64.5, 71.1}
            }},
            { type = "kill", name = "Vilebranch Witch Doctor", spawns = {
                {63.2, 71.8}, {64.5, 73.5}, {62.8, 70.2}, {65.5, 72.5}
            }},
        }
    },
    
    [2995] = { -- Message to the Wildhammer
        name = "Message to the Wildhammer",
        zone = "The Hinterlands",
        start = { npc = "Courier Hammerfall", x = 78.5, y = 81.5 },
        objectives = {
            { type = "talk", name = "Gryphon Master Talonaxe", spawns = {{9.8, 44.5}} },
        }
    },
    
    [2996] = { -- Find OOX-09/HL!
        name = "Find OOX-09/HL!",
        zone = "The Hinterlands",
        start = { npc = "OOX-09/HL", x = 49.5, y = 37.8 },
        objectives = {
            { type = "talk", name = "Oglethorpe Obnoticus", spawns = {{28.2, 76.8}} },
        }
    },
    
    [2997] = { -- Rescue OOX-09/HL!
        name = "Rescue OOX-09/HL!",
        zone = "The Hinterlands",
        start = { npc = "OOX-09/HL", x = 49.5, y = 37.8 },
        objectives = {
            { type = "talk", name = "Oglethorpe Obnoticus", spawns = {{28.2, 76.8}} },
        }
    },
    
    [7846] = { -- Into The Temple of Atal'Hakkar
        name = "Into The Temple of Atal'Hakkar",
        zone = "The Hinterlands",
        start = { npc = "Yeh'kinya", x = 67.0, y = 22.3 },
        objectives = {
            { type = "item", name = "Hakkar's Eggs", spawns = {{65.5, 72.8}} },
        }
    },
    
    [7827] = { -- The Altar of Zul
        name = "The Altar of Zul",
        zone = "The Hinterlands",
        start = { npc = "Ambassador Infernus", x = 47.5, y = 69.2 },
        objectives = {
            { type = "kill", name = "Qiaga the Keeper", spawns = {{49.5, 68.5}} },
        }
    },
    
    -- ===== Revantusk Village (Horde) Quests =====
    
    [7861] = { -- Hunt the Savages
        name = "Hunt the Savages",
        zone = "The Hinterlands",
        start = { npc = "Primal Torntusk", x = 79.2, y = 79.5 },
        objectives = {
            { type = "kill", name = "Savage Owlbeast", spawns = {
                {61.5, 45.2}, {62.8, 43.5}, {60.2, 46.8}, {63.5, 44.1}
            }},
        }
    },
    
    [7828] = { -- Wanted: Vile Priestess Hexx
        name = "Wanted: Vile Priestess Hexx",
        zone = "The Hinterlands",
        start = { npc = "Wanted Poster", x = 77.8, y = 81.5 },
        objectives = {
            { type = "kill", name = "Vile Priestess Hexx", spawns = {{59.5, 78.5}} },
        }
    },
    
    [7829] = { -- Wanted: Stalking the Stalkers
        name = "Stalking the Stalkers",
        zone = "The Hinterlands",
        start = { npc = "Huntsman Markhor", x = 79.0, y = 78.8 },
        objectives = {
            { type = "kill", name = "Silvermane Stalker", spawns = {
                {43.5, 35.2}, {44.8, 33.5}, {42.2, 36.8}, {45.5, 34.1}
            }},
        }
    },
    
    [7830] = { -- Miner's Blood
        name = "Avenging the Fallen",
        zone = "The Hinterlands",
        start = { npc = "Otho Moji'ko", x = 78.5, y = 81.2 },
        objectives = {
            { type = "kill", name = "Vilebranch Kidnapper", spawns = {
                {65.5, 70.2}, {66.8, 68.5}, {64.2, 71.8}, {67.5, 69.1}
            }},
        }
    },
    
    [7831] = { -- Vilebranch Hooligans
        name = "Vilebranch Hooligans",
        zone = "The Hinterlands",
        start = { npc = "Lard", x = 78.5, y = 82.2 },
        objectives = {
            { type = "kill", name = "Vilebranch Shadowcaster", spawns = {
                {55.5, 47.2}, {56.8, 45.5}, {54.2, 48.8}, {57.5, 46.1}
            }},
            { type = "kill", name = "Vilebranch Soothsayer", spawns = {
                {56.2, 46.8}, {57.5, 48.5}, {55.8, 45.2}, {58.5, 47.5}
            }},
        }
    },
    
    [7832] = { -- Cannibalistic Cousins
        name = "Cannibalistic Cousins",
        zone = "The Hinterlands",
        start = { npc = "Mystic Yayo'jin", x = 79.0, y = 79.5 },
        objectives = {
            { type = "kill", name = "Silvermane Howler", spawns = {
                {47.5, 38.2}, {48.8, 36.5}, {46.2, 39.8}, {49.5, 37.1}
            }},
        }
    },
    
    [7833] = { -- Troll Necklace Bounty
        name = "Troll Necklace Bounty",
        zone = "The Hinterlands",
        start = { npc = "Smith Slagtree", x = 77.8, y = 80.2 },
        objectives = {
            { type = "item", name = "Troll Tribal Necklace", spawns = {
                {35.5, 67.2}, {36.8, 65.5}, {34.2, 68.8}, {37.5, 66.1}
            }},
        }
    },
    
    [7834] = { -- The Atal'ai Exile
        name = "The Atal'ai Exile",
        zone = "The Hinterlands",
        start = { npc = "Mystic Yayo'jin", x = 79.0, y = 79.5 },
        objectives = {
            { type = "talk", name = "Atal'ai Exile", spawns = {{33.5, 75.8}} },
        }
    },
    
    [7835] = { -- Recover the Ancient Relics
        name = "Recover the Ancient Relics",
        zone = "The Hinterlands",
        start = { npc = "Primal Torntusk", x = 79.2, y = 79.5 },
        objectives = {
            { type = "item", name = "Ancient Relics", spawns = {
                {48.5, 69.2}, {49.8, 67.5}, {47.2, 70.8}, {50.5, 68.1}
            }},
        }
    },
    
    [7836] = { -- Snapjaws, Mon!
        name = "Snapjaws, Mon!",
        zone = "The Hinterlands",
        start = { npc = "Katoom the Angler", x = 80.5, y = 81.5 },
        objectives = {
            { type = "item", name = "Snapjaw Cracker", spawns = {
                {81.5, 58.2}, {82.8, 56.5}, {80.2, 59.8}, {83.5, 57.1}
            }},
        }
    },
    
    [7837] = { -- Gammerita, Mon!
        name = "Gammerita, Mon!",
        zone = "The Hinterlands",
        start = { npc = "Katoom the Angler", x = 80.5, y = 81.5 },
        objectives = {
            { type = "kill", name = "Gammerita", spawns = {{79.5, 62.5}} },
        }
    },
    
    [7839] = { -- Whiskey Slim's Lost Grog
        name = "Whiskey Slim's Lost Grog",
        zone = "The Hinterlands",
        start = { npc = "Whiskey Slim", x = 78.5, y = 80.8 },
        objectives = {
            { type = "item", name = "Pupellyverbos Port", spawns = {
                {83.5, 60.2}, {84.8, 58.5}, {82.2, 61.8}, {85.5, 59.1}
            }},
        }
    },
    
    [7862] = { -- Separation Anxiety
        name = "Separation Anxiety",
        zone = "The Hinterlands",
        start = { npc = "Primal Torntusk", x = 79.2, y = 79.5 },
        objectives = {
            { type = "item", name = "Troll Claws", spawns = {
                {63.5, 73.2}, {64.8, 71.5}, {62.2, 74.8}, {65.5, 72.1}
            }},
        }
    },
    
    [7863] = { -- Message to the Revantusk
        name = "Message to the Revantusk",
        zone = "The Hinterlands",
        start = { npc = "High Elder Cloudsong", x = 79.5, y = 79.2 },
        objectives = {
            { type = "talk", name = "Primal Torntusk", spawns = {{79.2, 79.5}} },
        }
    },
    
    -----------------------------------------
    -- Searing Gorge Quests (45-50)
    -----------------------------------------
    
    [3441] = { -- Fiery Menace!
        name = "Fiery Menace!",
        zone = "Searing Gorge",
        start = { npc = "Hansel Heavyhands", x = 38.6, y = 28.0 },
        objectives = {
            { type = "kill", name = "Heavy War Golem", spawns = {
                {57.5, 50.2}, {58.8, 48.5}, {56.2, 51.8}, {59.5, 49.1}
            }},
        }
    },
    
    [3443] = { -- Caught!
        name = "Caught!",
        zone = "Searing Gorge",
        start = { npc = "Hansel Heavyhands", x = 38.6, y = 28.0 },
        objectives = {
            { type = "kill", name = "Dark Iron Geologist", spawns = {
                {38.5, 52.2}, {39.8, 50.5}, {37.2, 53.8}, {40.5, 51.1}
            }},
            { type = "kill", name = "Dark Iron Slaver", spawns = {
                {39.2, 51.8}, {40.5, 53.5}, {38.8, 50.2}, {41.5, 52.5}
            }},
        }
    },
    
    [3453] = { -- Incendosaurs? Whateverosaurs
        name = "Incendosaurs? Whateverosaurs",
        zone = "Searing Gorge",
        start = { npc = "Hansel Heavyhands", x = 38.6, y = 28.0 },
        objectives = {
            { type = "kill", name = "Incendosaur", spawns = {
                {49.5, 44.2}, {50.8, 42.5}, {48.2, 45.8}, {51.5, 43.1}
            }},
        }
    },
    
    [3444] = { -- STOLEN: Smithing Tuyere and Lookout's Spyglass
        name = "STOLEN: Smithing Tuyere and Lookout's Spyglass",
        zone = "Searing Gorge",
        start = { npc = "Stolen Equipment", x = 37.5, y = 26.5 },
        objectives = {
            { type = "item", name = "Smithing Tuyere", spawns = {{35.5, 62.2}} },
            { type = "item", name = "Lookout's Spyglass", spawns = {{55.2, 34.8}} },
        }
    },
    
    [3452] = { -- JOB OPPORTUNITY: Culling the Competition
        name = "JOB OPPORTUNITY: Culling the Competition",
        zone = "Searing Gorge",
        start = { npc = "Wanted Poster", x = 37.5, y = 26.5 },
        objectives = {
            { type = "kill", name = "Dark Iron Taskmaster", spawns = {
                {37.5, 57.2}, {38.8, 55.5}, {36.2, 58.8}, {39.5, 56.1}
            }},
        }
    },
    
    [3446] = { -- Curse These Fat Fingers
        name = "Curse These Fat Fingers",
        zone = "Searing Gorge",
        start = { npc = "Thorium Point", x = 38.2, y = 26.8 },
        objectives = {
            { type = "kill", name = "Heavy War Golem", spawns = {
                {56.5, 49.2}, {57.8, 47.5}, {55.2, 50.8}, {58.5, 48.1}
            }},
        }
    },
    
    [3448] = { -- The Key to Freedom
        name = "The Key to Freedom",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "item", name = "Slaver's Key", spawns = {{37.5, 45.2}} },
        }
    },
    
    [3451] = { -- Divine Retribution
        name = "Divine Retribution",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "talk", name = "Prisoner of War", spawns = {{37.8, 53.5}} },
        }
    },
    
    [3455] = { -- The Horn of the Beast
        name = "The Horn of the Beast",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "item", name = "Horn of the Beast", spawns = {{35.5, 32.8}} },
        }
    },
    
    [3454] = { -- Grimsite Outhouse
        name = "Grimsite Outhouse",
        zone = "Searing Gorge",
        start = { npc = "Dorius Stonetender", x = 65.0, y = 62.2 },
        objectives = {
            { type = "item", name = "Goodsteel's Balanced Flameberge", spawns = {{41.5, 55.2}} },
        }
    },
    
    [3466] = { -- Suntara Stones
        name = "Suntara Stones",
        zone = "Searing Gorge",
        start = { npc = "Dorius Stonetender", x = 65.0, y = 62.2 },
        objectives = {
            { type = "talk", name = "Lunk Stoneflayer", spawns = {{60.5, 57.8}} },
        }
    },
    
    [7722] = { -- The Flame's Casing
        name = "The Flame's Casing",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "item", name = "Flame's Casing", spawns = {{50.5, 35.8}} },
        }
    },
    
    [7723] = { -- The Spire's Coil
        name = "The Spire's Coil",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "kill", name = "Bloodaxe Warmonger", spawns = {
                {52.5, 38.2}, {53.8, 36.5}, {51.2, 39.8}, {54.5, 37.1}
            }},
        }
    },
    
    [7724] = { -- The Altar of Flames
        name = "The Altar of Flames",
        zone = "Searing Gorge",
        start = { npc = "Kalaran Windblade", x = 39.0, y = 39.0 },
        objectives = {
            { type = "item", name = "Altar of Flames Item", spawns = {{30.5, 31.8}} },
        }
    },
    
    [3883] = { -- Dark Iron Legacy
        name = "Dark Iron Legacy",
        zone = "Searing Gorge",
        start = { npc = "Franclorn Forgewright", x = 37.5, y = 26.2 },
        objectives = {
            { type = "kill", name = "Emperor Dagran Thaurissan", spawns = {{25.5, 44.8}} },
        }
    },
    
    [3481] = { -- What the Flux?
        name = "What the Flux?",
        zone = "Searing Gorge",
        start = { npc = "Thorium Point", x = 38.2, y = 26.8 },
        objectives = {
            { type = "item", name = "Dark Iron Residue", spawns = {
                {41.5, 48.2}, {42.8, 46.5}, {40.2, 49.8}, {43.5, 47.1}
            }},
        }
    },
    
    [7728] = { -- Dreadmaul Rock
        name = "Dreadmaul Rock",
        zone = "Searing Gorge",
        start = { npc = "Theldurin the Lost", x = 51.2, y = 28.5 },
        objectives = {
            { type = "kill", name = "Dreadmaul War Ogre", spawns = {
                {42.5, 31.2}, {43.8, 29.5}, {41.2, 32.8}, {44.5, 30.1}
            }},
        }
    },
    
    [7729] = { -- Thunderfury
        name = "Thunderfury",
        zone = "Searing Gorge",
        start = { npc = "Highlord Demitrian", x = 29.5, y = 10.5 },
        objectives = {
            { type = "item", name = "Essence of the Firelord", spawns = {{38.5, 45.2}} },
        }
    },
    
    -----------------------------------------
    -- Blasted Lands Quests (45-55)
    -----------------------------------------
    
    [2583] = { -- The Fallen Hero
        name = "The Fallen Hero",
        zone = "Blasted Lands",
        start = { npc = "Fallen Hero of the Horde", x = 50.5, y = 14.2 },
        objectives = {
            { type = "talk", name = "Watch Commander Relthorn", spawns = {{62.5, 21.8}} },
        }
    },
    
    [2585] = { -- The Fallen Hero (Part 2)
        name = "The Fallen Hero",
        zone = "Blasted Lands",
        start = { npc = "Fallen Hero of the Horde", x = 50.5, y = 14.2 },
        objectives = {
            { type = "kill", name = "Razelikh the Defiler", spawns = {{56.5, 36.8}} },
        }
    },
    
    [2801] = { -- A Boar's Vitality
        name = "A Boar's Vitality",
        zone = "Blasted Lands",
        start = { npc = "Quartermaster Lungertz", x = 62.5, y = 21.5 },
        objectives = {
            { type = "kill", name = "Ashmane Boar", spawns = {
                {41.5, 41.2}, {42.8, 39.5}, {40.2, 42.8}, {43.5, 40.1}
            }},
        }
    },
    
    [2802] = { -- Snickerfang Jowls
        name = "Snickerfang Jowls",
        zone = "Blasted Lands",
        start = { npc = "Quartermaster Lungertz", x = 62.5, y = 21.5 },
        objectives = {
            { type = "kill", name = "Snickerfang Hyena", spawns = {
                {43.5, 38.2}, {44.8, 36.5}, {42.2, 39.8}, {45.5, 37.1}
            }},
        }
    },
    
    [2803] = { -- Vulture Gizzards
        name = "Vulture Gizzards",
        zone = "Blasted Lands",
        start = { npc = "Quartermaster Lungertz", x = 62.5, y = 21.5 },
        objectives = {
            { type = "kill", name = "Black Slayer", spawns = {
                {55.5, 48.2}, {56.8, 46.5}, {54.2, 49.8}, {57.5, 47.1}
            }},
        }
    },
    
    [2821] = { -- Basilisk Brain
        name = "Basilisk Brain",
        zone = "Blasted Lands",
        start = { npc = "Quartermaster Lungertz", x = 62.5, y = 21.5 },
        objectives = {
            { type = "kill", name = "Redstone Basilisk", spawns = {
                {48.5, 44.2}, {49.8, 42.5}, {47.2, 45.8}, {50.5, 43.1}
            }},
        }
    },
    
    [2822] = { -- Scorpok Claws
        name = "Scorpok Claws",
        zone = "Blasted Lands",
        start = { npc = "Quartermaster Lungertz", x = 62.5, y = 21.5 },
        objectives = {
            { type = "kill", name = "Scorpok Stinger", spawns = {
                {52.5, 37.2}, {53.8, 35.5}, {51.2, 38.8}, {54.5, 36.1}
            }},
        }
    },
    
    [2601] = { -- Nethergarde Keep's Report
        name = "Nethergarde Keep's Report",
        zone = "Blasted Lands",
        start = { npc = "Corporal Podric", x = 62.2, y = 22.8 },
        objectives = {
            { type = "talk", name = "Quartermaster Lungertz", spawns = {{62.5, 21.5}} },
        }
    },
    
    [2584] = { -- The Dark Portal
        name = "The Dark Portal",
        zone = "Blasted Lands",
        start = { npc = "Watch Commander Relthorn", x = 62.5, y = 21.8 },
        objectives = {
            { type = "kill", name = "Dreadlord", spawns = {
                {38.5, 72.2}, {39.8, 70.5}, {37.2, 73.8}, {40.5, 71.1}
            }},
        }
    },
    
    [7583] = { -- Petty Squabbles
        name = "Petty Squabbles",
        zone = "Blasted Lands",
        start = { npc = "Ambassador Ardalan", x = 62.5, y = 20.5 },
        objectives = {
            { type = "talk", name = "Ambassador Infernus", spawns = {{55.5, 36.2}} },
        }
    },
    
    [7564] = { -- You Are Rakh'likh, Demon
        name = "You Are Rakh'likh, Demon",
        zone = "Blasted Lands",
        start = { npc = "Fallen Hero of the Horde", x = 50.5, y = 14.2 },
        objectives = {
            { type = "kill", name = "Rakh'likh", spawns = {{61.5, 41.2}} },
        }
    },
    
    [7563] = { -- Loramus Thalipedes
        name = "Loramus Thalipedes",
        zone = "Blasted Lands",
        start = { npc = "Fallen Hero of the Horde", x = 50.5, y = 14.2 },
        objectives = {
            { type = "talk", name = "Loramus Thalipedes", spawns = {{48.2, 12.5}} },
        }
    },
    
    [7621] = { -- The Altar of Storms
        name = "The Altar of Storms",
        zone = "Blasted Lands",
        start = { npc = "Watch Commander Relthorn", x = 62.5, y = 21.8 },
        objectives = {
            { type = "item", name = "Stone of Binding", spawns = {{48.5, 35.8}} },
        }
    },
    
    [7622] = { -- Servant of Sevine
        name = "Servant of Sevine",
        zone = "Blasted Lands",
        start = { npc = "Trey Lightforge", x = 62.2, y = 22.5 },
        objectives = {
            { type = "kill", name = "Servant of Sevine", spawns = {{63.5, 38.2}} },
        }
    },
    
    [7623] = { -- Servant of Razelikh
        name = "Servant of Razelikh",
        zone = "Blasted Lands",
        start = { npc = "Trey Lightforge", x = 62.2, y = 22.5 },
        objectives = {
            { type = "kill", name = "Servant of Razelikh", spawns = {{57.5, 40.2}} },
        }
    },
    
    -----------------------------------------
    -- Azshara Quests (45-55)
    -----------------------------------------
    
    [3602] = { -- Kim'jael Indeed!
        name = "Kim'jael Indeed!",
        zone = "Azshara",
        start = { npc = "Kim'jael", x = 53.2, y = 21.5 },
        objectives = {
            { type = "item", name = "Kim'jael's Equipment", spawns = {
                {52.5, 27.2}, {53.8, 25.5}, {51.2, 28.8}, {54.5, 26.1}
            }},
        }
    },
    
    [3601] = { -- Kim'jael's "Missing" Equipment
        name = "Kim'jael's Missing Equipment",
        zone = "Azshara",
        start = { npc = "Kim'jael", x = 53.2, y = 21.5 },
        objectives = {
            { type = "item", name = "Kim'jael's Compass", spawns = {{55.8, 25.5}} },
            { type = "item", name = "Kim'jael's Scope", spawns = {{54.2, 28.2}} },
        }
    },
    
    [3621] = { -- Delivery to Archmage Xylem
        name = "Delivery to Archmage Xylem",
        zone = "Azshara",
        start = { npc = "Sanath Lim-yo", x = 50.2, y = 21.8 },
        objectives = {
            { type = "talk", name = "Archmage Xylem", spawns = {{29.5, 40.2}} },
        }
    },
    
    [3634] = { -- Courser Antlers
        name = "Courser Antlers",
        zone = "Azshara",
        start = { npc = "Archmage Xylem", x = 29.5, y = 40.2 },
        objectives = {
            { type = "kill", name = "Legashi Moon Courser", spawns = {
                {49.5, 26.2}, {50.8, 24.5}, {48.2, 27.8}, {51.5, 25.1}
            }},
        }
    },
    
    [3636] = { -- Magma Spirits
        name = "Magma Spirits",
        zone = "Azshara",
        start = { npc = "Duke Hydraxis", x = 79.1, y = 73.5 },
        objectives = {
            { type = "kill", name = "Magma Elemental", spawns = {
                {26.5, 62.2}, {27.8, 60.5}, {25.2, 63.8}, {28.5, 61.1}
            }},
        }
    },
    
    [3628] = { -- Eye of Theradras
        name = "Eye of Theradras",
        zone = "Azshara",
        start = { npc = "Duke Hydraxis", x = 79.1, y = 73.5 },
        objectives = {
            { type = "kill", name = "Princess Theradras", spawns = {{28.5, 57.8}} },
        }
    },
    
    [3625] = { -- Poisoned Water
        name = "Poisoned Water",
        zone = "Azshara",
        start = { npc = "Duke Hydraxis", x = 79.1, y = 73.5 },
        objectives = {
            { type = "item", name = "Corrupt Water", spawns = {
                {21.5, 65.2}, {22.8, 63.5}, {20.2, 66.8}, {23.5, 64.1}
            }},
        }
    },
    
    [3561] = { -- Stealing Knowledge
        name = "Stealing Knowledge",
        zone = "Azshara",
        start = { npc = "Jediga", x = 45.2, y = 90.2 },
        objectives = {
            { type = "item", name = "Tablet Shard", spawns = {
                {52.5, 86.2}, {53.8, 84.5}, {51.2, 87.8}, {54.5, 85.1}
            }},
        }
    },
    
    [3562] = { -- Spiritual Unrest
        name = "Spiritual Unrest",
        zone = "Azshara",
        start = { npc = "Loh'atu", x = 11.5, y = 78.0 },
        objectives = {
            { type = "kill", name = "Highborne Apparition", spawns = {
                {22.5, 74.2}, {23.8, 72.5}, {21.2, 75.8}, {24.5, 73.1}
            }},
            { type = "kill", name = "Highborne Lichling", spawns = {
                {23.2, 73.8}, {24.5, 75.5}, {22.8, 72.2}, {25.5, 74.5}
            }},
        }
    },
    
    [3563] = { -- Lay of the Land
        name = "Lay of the Land",
        zone = "Azshara",
        start = { npc = "Loh'atu", x = 11.5, y = 78.0 },
        objectives = {
            { type = "item", name = "Cliff Walker Hides", spawns = {
                {68.5, 35.2}, {69.8, 33.5}, {67.2, 36.8}, {70.5, 34.1}
            }},
        }
    },
    
    [3504] = { -- Stormers and Rumblers
        name = "Stormers and Rumblers",
        zone = "Azshara",
        start = { npc = "Duke Hydraxis", x = 79.1, y = 73.5 },
        objectives = {
            { type = "kill", name = "Rumbler", spawns = {
                {57.5, 71.2}, {58.8, 69.5}, {56.2, 72.8}, {59.5, 70.1}
            }},
            { type = "kill", name = "Stormer", spawns = {
                {58.2, 70.8}, {59.5, 72.5}, {57.8, 69.2}, {60.5, 71.5}
            }},
        }
    },
    
    [3565] = { -- The Ancient Statuette
        name = "The Ancient Statuette",
        zone = "Azshara",
        start = { npc = "Loh'atu", x = 11.5, y = 78.0 },
        objectives = {
            { type = "item", name = "Ancient Statuette", spawns = {{28.5, 76.2}} },
        }
    },
    
    [3566] = { -- Delivery to Magatha
        name = "Delivery to Magatha",
        zone = "Azshara",
        start = { npc = "Loh'atu", x = 11.5, y = 78.0 },
        objectives = {
            { type = "talk", name = "Magatha Grimtotem", spawns = {{70.2, 31.5}} },
        }
    },
    
    [5535] = { -- Felnok Steelspring
        name = "Felnok Steelspring",
        zone = "Azshara",
        start = { npc = "Felnok Steelspring", x = 45.5, y = 50.2 },
        objectives = {
            { type = "item", name = "Felnok's Package", spawns = {{45.2, 50.5}} },
        }
    },
    
    [5536] = { -- Chillwind Horns
        name = "Chillwind Horns",
        zone = "Azshara",
        start = { npc = "Felnok Steelspring", x = 45.5, y = 50.2 },
        objectives = {
            { type = "kill", name = "Chillwind Ravager", spawns = {
                {42.5, 52.2}, {43.8, 50.5}, {41.2, 53.8}, {44.5, 51.1}
            }},
        }
    },
    
    [3385] = { -- A Meeting With The Master
        name = "A Meeting With The Master",
        zone = "Azshara",
        start = { npc = "Kaldorei Ambassador", x = 51.5, y = 81.2 },
        objectives = {
            { type = "talk", name = "Archmage Xylem", spawns = {{29.5, 40.2}} },
        }
    },
    
    [5537] = { -- Return to Tinkee
        name = "Return to Tinkee",
        zone = "Azshara",
        start = { npc = "Felnok Steelspring", x = 45.5, y = 50.2 },
        objectives = {
            { type = "talk", name = "Tinkee Steamboil", spawns = {{65.2, 23.9}} },
        }
    },
    
    [5538] = { -- Chimaera Horns
        name = "Chimaera Horns",
        zone = "Azshara",
        start = { npc = "Felnok Steelspring", x = 45.5, y = 50.2 },
        objectives = {
            { type = "kill", name = "Rogue Chimaera", spawns = {
                {38.5, 55.2}, {39.8, 53.5}, {37.2, 56.8}, {40.5, 54.1}
            }},
        }
    },
    
    [5539] = { -- The Lost Statuette
        name = "The Lost Statuette",
        zone = "Azshara",
        start = { npc = "Andello Porter", x = 59.5, y = 85.2 },
        objectives = {
            { type = "item", name = "Lost Statuette", spawns = {{52.8, 92.5}} },
        }
    },

    -----------------------------------------
    -- Un'Goro Crater Quests (48-55)
    -----------------------------------------
    
    -- ===== Marshal's Refuge Quests =====
    
    [4289] = { -- Lost!
        name = "Lost!",
        zone = "Un'Goro Crater",
        start = { npc = "Spraggle Frock", x = 42.5, y = 9.8 },
        objectives = {
            { type = "talk", name = "Spraggle Frock", spawns = {{42.5, 9.8}} },
        }
    },
    
    [4241] = { -- Expedition Salvation
        name = "Expedition Salvation",
        zone = "Un'Goro Crater",
        start = { npc = "Williden Marshal", x = 43.5, y = 8.5 },
        objectives = {
            { type = "item", name = "Crate of Foodstuffs", spawns = {
                {68.2, 36.5}, {71.5, 41.2}, {74.8, 38.1}, {69.5, 44.2}
            }},
        }
    },
    
    [4242] = { -- Alien Ecology
        name = "Alien Ecology",
        zone = "Un'Goro Crater",
        start = { npc = "Hol'anyee Marshal", x = 42.8, y = 9.2 },
        objectives = {
            { type = "item", name = "Holographical Viewfinder", spawns = {{55.2, 56.8}} },
        }
    },
    
    [4243] = { -- Shizzle's Flyer
        name = "Shizzle's Flyer",
        zone = "Un'Goro Crater",
        start = { npc = "Shizzle", x = 43.2, y = 8.8 },
        objectives = {
            { type = "kill", name = "Pterrordax", spawns = {
                {49.5, 72.2}, {53.8, 70.5}, {47.2, 74.8}, {55.5, 71.1}
            }},
        }
    },
    
    [3882] = { -- The Mighty U'cha
        name = "The Mighty U'cha",
        zone = "Un'Goro Crater",
        start = { npc = "Torwa Pathfinder", x = 71.5, y = 75.5 },
        objectives = {
            { type = "kill", name = "U'cha", spawns = {{67.5, 16.2}} },
        }
    },
    
    [3883] = { -- The Apes of Un'Goro
        name = "The Apes of Un'Goro",
        zone = "Un'Goro Crater",
        start = { npc = "Torwa Pathfinder", x = 71.5, y = 75.5 },
        objectives = {
            { type = "kill", name = "Un'Goro Gorilla", spawns = {
                {64.5, 17.2}, {66.8, 15.5}, {63.2, 18.8}, {67.5, 14.1}
            }},
        }
    },
    
    [3884] = { -- The Bait for Lar'korwi
        name = "The Bait for Lar'korwi",
        zone = "Un'Goro Crater",
        start = { npc = "Torwa Pathfinder", x = 71.5, y = 75.5 },
        objectives = {
            { type = "item", name = "Ravasaur Pheromone Gland", spawns = {
                {62.5, 65.2}, {63.8, 63.5}, {61.2, 66.8}, {64.5, 64.1}
            }},
        }
    },
    
    [3885] = { -- The Mighty Lar'korwi
        name = "The Mighty Lar'korwi",
        zone = "Un'Goro Crater",
        start = { npc = "Torwa Pathfinder", x = 71.5, y = 75.5 },
        objectives = {
            { type = "kill", name = "Lar'korwi", spawns = {{80.2, 49.5}} },
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
    
    -- ===== Linken Chain Quests =====
    
    [3908] = { -- It's a Secret to Everybody (Part 1)
        name = "It's a Secret to Everybody",
        zone = "Un'Goro Crater",
        start = { npc = "A Wrecked Raft", x = 63.2, y = 68.5 },
        objectives = {
            { type = "item", name = "A Carefully Wrapped Present", spawns = {{63.5, 68.8}} },
        }
    },
    
    [3909] = { -- It's a Secret to Everybody (Part 2)
        name = "It's a Secret to Everybody",
        zone = "Un'Goro Crater",
        start = { npc = "A Carefully Wrapped Present", x = 63.5, y = 68.8 },
        objectives = {
            { type = "talk", name = "Linken", spawns = {{43.8, 8.2}} },
        }
    },
    
    [3914] = { -- Linken's Memory
        name = "Linken's Memory",
        zone = "Un'Goro Crater",
        start = { npc = "Linken", x = 43.8, y = 8.2 },
        objectives = {
            { type = "talk", name = "Eridan Bluewind", spawns = {{51.5, 24.8}} },
        }
    },
    
    [3942] = { -- A Grave Situation
        name = "A Grave Situation",
        zone = "Un'Goro Crater",
        start = { npc = "Linken", x = 43.8, y = 8.2 },
        objectives = {
            { type = "item", name = "Silver Totem of Aquementas", spawns = {{36.1, 41.5}} },
        }
    },
    
    [3961] = { -- Linken's Sword
        name = "Linken's Sword",
        zone = "Un'Goro Crater",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "talk", name = "Aquementas", spawns = {{54.2, 49.5}} },
        }
    },
    
    [3962] = { -- Linken's Adventure
        name = "Linken's Adventure",
        zone = "Un'Goro Crater",
        start = { npc = "Linken", x = 43.8, y = 8.2 },
        objectives = {
            { type = "kill", name = "Blazerunner", spawns = {{52.5, 42.8}} },
        }
    },
    
    -- ===== Tar Pool Quests =====
    
    [4501] = { -- Murky Depths
        name = "Muddy Depths",
        zone = "Un'Goro Crater",
        start = { npc = "Krakle", x = 43.0, y = 9.5 },
        objectives = {
            { type = "item", name = "Silver Charge", spawns = {
                {51.2, 50.5}, {50.8, 52.2}, {52.5, 49.8}
            }},
        }
    },
    
    [24731] = { -- The Oozing Plague
        name = "The Oozing Plague",
        zone = "Un'Goro Crater",
        start = { npc = "Williden Marshal", x = 43.5, y = 8.5 },
        objectives = {
            { type = "kill", name = "Tar Creeper", spawns = {
                {52.5, 48.2}, {53.8, 46.5}, {51.2, 49.8}, {54.5, 47.1}
            }},
        }
    },
    
    [4492] = { -- Sticky Situation
        name = "Sticky Situation",
        zone = "Un'Goro Crater",
        start = { npc = "Spark Nilminer", x = 43.2, y = 7.5 },
        objectives = {
            { type = "kill", name = "Tar Lurker", spawns = {
                {48.5, 51.2}, {49.8, 49.5}, {47.2, 52.8}, {50.5, 50.1}
            }},
        }
    },
    
    -- ===== Crystal Pylon Quests =====
    
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
    
    [4285] = { -- Crystals of Power
        name = "Crystals of Power",
        zone = "Un'Goro Crater",
        start = { npc = "J.D. Collie", x = 42.1, y = 9.2 },
        objectives = {
            { type = "item", name = "Red Power Crystal", spawns = {
                {46.5, 13.2}, {47.8, 11.5}, {45.2, 14.8}, {48.5, 12.1}
            }},
            { type = "item", name = "Blue Power Crystal", spawns = {
                {51.5, 78.2}, {52.8, 76.5}, {50.2, 79.8}, {53.5, 77.1}
            }},
            { type = "item", name = "Green Power Crystal", spawns = {
                {79.5, 50.2}, {80.8, 48.5}, {78.2, 51.8}, {81.5, 49.1}
            }},
            { type = "item", name = "Yellow Power Crystal", spawns = {
                {32.5, 36.2}, {33.8, 34.5}, {31.2, 37.8}, {34.5, 35.1}
            }},
        }
    },
    
    [4287] = { -- The Northern Pylon
        name = "The Northern Pylon",
        zone = "Un'Goro Crater",
        start = { npc = "J.D. Collie", x = 42.1, y = 9.2 },
        objectives = {
            { type = "talk", name = "Northern Crystal Pylon", spawns = {{56.2, 12.5}} },
        }
    },
    
    [4288] = { -- The Eastern Pylon
        name = "The Eastern Pylon",
        zone = "Un'Goro Crater",
        start = { npc = "J.D. Collie", x = 42.1, y = 9.2 },
        objectives = {
            { type = "talk", name = "Eastern Crystal Pylon", spawns = {{77.5, 49.8}} },
        }
    },
    
    [4321] = { -- The Western Pylon
        name = "The Western Pylon",
        zone = "Un'Goro Crater",
        start = { npc = "J.D. Collie", x = 42.1, y = 9.2 },
        objectives = {
            { type = "talk", name = "Western Crystal Pylon", spawns = {{23.5, 59.2}} },
        }
    },
    
    [4322] = { -- Making Sense of It
        name = "Making Sense of It",
        zone = "Un'Goro Crater",
        start = { npc = "J.D. Collie", x = 42.1, y = 9.2 },
        objectives = {
            { type = "talk", name = "J.D. Collie", spawns = {{42.1, 9.2}} },
        }
    },
    
    -- ===== Dinosaur Hunting Quests =====
    
    [4244] = { -- Bones of the Diemetradons
        name = "Bones of the Diemetradons",
        zone = "Un'Goro Crater",
        start = { npc = "Karna Remtravel", x = 43.5, y = 8.8 },
        objectives = {
            { type = "item", name = "Diemetradon Bone", spawns = {
                {75.5, 45.2}, {76.8, 43.5}, {74.2, 46.8}, {77.5, 44.1}
            }},
        }
    },
    
    [4001] = { -- Super Sticky
        name = "Super Sticky",
        zone = "Un'Goro Crater",
        start = { npc = "Tinkerer Gizlock", x = 42.8, y = 9.5 },
        objectives = {
            { type = "item", name = "Super Sticky Tar", spawns = {
                {50.5, 50.2}, {51.8, 48.5}, {49.2, 51.8}, {52.5, 49.1}
            }},
        }
    },
    
    [3964] = { -- Roll the Bones
        name = "Roll the Bones",
        zone = "Un'Goro Crater",
        start = { npc = "Gryfe", x = 43.2, y = 8.2 },
        objectives = {
            { type = "item", name = "Dimetrodon Bone", spawns = {
                {72.5, 48.2}, {73.8, 46.5}, {71.2, 49.8}, {74.5, 47.1}
            }},
        }
    },
    
    -- ===== Silithid Quests =====
    
    [4291] = { -- Larion and Muigin
        name = "Larion and Muigin",
        zone = "Un'Goro Crater",
        start = { npc = "Larion", x = 45.5, y = 8.2 },
        objectives = {
            { type = "talk", name = "Muigin", spawns = {{42.2, 9.5}} },
        }
    },
    
    [4293] = { -- A Visit to Gregan
        name = "A Visit to Gregan",
        zone = "Un'Goro Crater",
        start = { npc = "Muigin", x = 42.2, y = 9.5 },
        objectives = {
            { type = "talk", name = "Gregan Brewspewer", spawns = {{45.2, 25.5}} },
        }
    },
    
    [3981] = { -- Hive in the Tower
        name = "Hive in the Tower",
        zone = "Un'Goro Crater",
        start = { npc = "Hive Tower Guard", x = 36.5, y = 62.0 },
        objectives = {
            { type = "kill", name = "Silithid Creeper", spawns = {
                {37.5, 63.2}, {38.8, 61.5}, {36.2, 64.8}, {39.5, 62.1}
            }},
        }
    },
    
    [974] = { -- Bungle in the Jungle
        name = "Bungle in the Jungle",
        zone = "Un'Goro Crater",
        start = { npc = "Krakle", x = 43.0, y = 9.5 },
        objectives = {
            { type = "item", name = "A Silithid Egg", spawns = {
                {35.5, 65.2}, {36.8, 63.5}, {34.2, 66.8}, {37.5, 64.1}
            }},
        }
    },
    
    -- ===== A-Me 01 Chain =====
    
    [4243] = { -- Chasing A-Me 01
        name = "Chasing A-Me 01",
        zone = "Un'Goro Crater",
        start = { npc = "Karna Remtravel", x = 43.5, y = 8.8 },
        objectives = {
            { type = "talk", name = "A-Me 01", spawns = {{66.5, 17.2}} },
        }
    },
    
    [4246] = { -- Chasing A-Me 01 (Part 2)
        name = "Chasing A-Me 01",
        zone = "Un'Goro Crater",
        start = { npc = "A-Me 01", x = 66.5, y = 17.2 },
        objectives = {
            { type = "escort", name = "A-Me 01", spawns = {{43.5, 8.8}} },
        }
    },
    
    [4503] = { -- Finding the Source
        name = "Finding the Source",
        zone = "Un'Goro Crater",
        start = { npc = "Karna Remtravel", x = 43.5, y = 8.8 },
        objectives = {
            { type = "item", name = "Damaged Crate", spawns = {{68.2, 12.5}} },
        }
    },
    
    [5052] = { -- Un'Goro Soil
        name = "Un'Goro Soil",
        zone = "Un'Goro Crater",
        start = { npc = "Muigin", x = 42.2, y = 9.5 },
        objectives = {
            { type = "item", name = "Un'Goro Soil", spawns = {
                {50.5, 50.2}, {51.8, 48.5}, {49.2, 51.8}, {52.5, 49.1},
                {55.5, 55.2}, {56.8, 53.5}, {54.2, 56.8}, {57.5, 54.1}
            }},
        }
    },
    
    -----------------------------------------
    -- Felwood Quests (48-55)
    -----------------------------------------
    
    -- ===== Timbermaw Hold / Timbermaw Reputation Quests =====
    
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
    
    [8460] = { -- Feathers for Nafien
        name = "Feathers for Nafien",
        zone = "Felwood",
        start = { npc = "Nafien", x = 64.2, y = 8.1 },
        objectives = {
            { type = "item", name = "Deadwood Headdress Feather", spawns = {
                {60.5, 10.2}, {61.8, 8.5}, {59.2, 11.8}, {62.5, 9.1}
            }},
        }
    },
    
    [8462] = { -- Feathers for Grazle
        name = "Feathers for Grazle",
        zone = "Felwood",
        start = { npc = "Grazle", x = 50.8, y = 85.1 },
        objectives = {
            { type = "item", name = "Deadwood Headdress Feather", spawns = {
                {48.5, 87.2}, {49.8, 85.5}, {47.2, 88.8}, {50.5, 86.1}
            }},
        }
    },
    
    [8461] = { -- Deadwood of the North
        name = "Deadwood of the North",
        zone = "Felwood",
        start = { npc = "Nafien", x = 64.2, y = 8.1 },
        objectives = {
            { type = "kill", name = "Deadwood Shaman", spawns = {
                {62.5, 12.2}, {63.8, 10.5}, {61.2, 13.8}, {64.5, 11.1}
            }},
        }
    },
    
    [8459] = { -- Deadwood Ritual Totem
        name = "Deadwood Ritual Totem",
        zone = "Felwood",
        start = { npc = "Deadwood Shaman (item drop)", x = 62.0, y = 10.0 },
        objectives = {
            { type = "talk", name = "Kernda", spawns = {{64.5, 5.2}} },
        }
    },
    
    -- ===== Deadwood Village Quests =====
    
    [5157] = { -- Speak to Nafien
        name = "Speak to Nafien",
        zone = "Felwood",
        start = { npc = "Grazle", x = 50.8, y = 85.1 },
        objectives = {
            { type = "talk", name = "Nafien", spawns = {{64.2, 8.1}} },
        }
    },
    
    [5158] = { -- The Corruption of the Jadefire
        name = "The Corruption of the Jadefire",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Jadefire Satyr", spawns = {
                {39.5, 72.2}, {40.8, 70.5}, {38.2, 73.8}, {41.5, 71.1}
            }},
            { type = "kill", name = "Jadefire Shadowstalker", spawns = {
                {38.5, 71.2}, {39.8, 69.5}, {37.2, 72.8}, {40.5, 70.1}
            }},
        }
    },
    
    -- ===== Felpaw Village Quests =====
    
    [5159] = { -- Felpaw Village
        name = "Felpaw Village",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Felpaw Ravager", spawns = {
                {60.5, 11.2}, {61.8, 9.5}, {59.2, 12.8}, {62.5, 10.1}
            }},
        }
    },
    
    [5160] = { -- Felpaw Scavengers
        name = "Felpaw Scavengers",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Felpaw Wolf", spawns = {
                {61.5, 12.2}, {62.8, 10.5}, {60.2, 13.8}, {63.5, 11.1}
            }},
        }
    },
    
    -- ===== Cleansing Felwood Chain =====
    
    [4101] = { -- Cleansing Felwood
        name = "Cleansing Felwood",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "item", name = "Corrupted Soul Shard", spawns = {
                {51.5, 82.2}, {52.8, 80.5}, {50.2, 83.8}, {53.5, 81.1}
            }},
        }
    },
    
    [4102] = { -- Salve via Hunting
        name = "Salve via Hunting",
        zone = "Felwood",
        start = { npc = "Arathandris Silversky", x = 54.2, y = 87.2 },
        objectives = {
            { type = "item", name = "Patch of Tainted Skin", spawns = {
                {50.5, 76.2}, {51.8, 74.5}, {49.2, 77.8}, {52.5, 75.1}
            }},
        }
    },
    
    [4103] = { -- Salve via Mining
        name = "Salve via Mining",
        zone = "Felwood",
        start = { npc = "Arathandris Silversky", x = 54.2, y = 87.2 },
        objectives = {
            { type = "item", name = "Corrupted Mineral Sample", spawns = {
                {48.5, 72.2}, {49.8, 70.5}, {47.2, 73.8}, {50.5, 71.1}
            }},
        }
    },
    
    [4104] = { -- Salve via Skinning
        name = "Salve via Skinning",
        zone = "Felwood",
        start = { npc = "Arathandris Silversky", x = 54.2, y = 87.2 },
        objectives = {
            { type = "item", name = "Corrupted Felwood Leather", spawns = {
                {45.5, 68.2}, {46.8, 66.5}, {44.2, 69.8}, {47.5, 67.1}
            }},
        }
    },
    
    [4105] = { -- Forces of Jaedenar
        name = "Forces of Jaedenar",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Jaedenar Guardian", spawns = {
                {36.5, 58.2}, {37.8, 56.5}, {35.2, 59.8}, {38.5, 57.1}
            }},
            { type = "kill", name = "Jaedenar Hound", spawns = {
                {37.5, 59.2}, {38.8, 57.5}, {36.2, 60.8}, {39.5, 58.1}
            }},
        }
    },
    
    -- ===== Jaedenar / Shadow Hold Quests =====
    
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
    
    [5165] = { -- Shadow Hold
        name = "Shadow Hold",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Shadow Lord Fel'dan", spawns = {{35.8, 58.5}} },
        }
    },
    
    [5202] = { -- A Final Blow
        name = "A Final Blow",
        zone = "Felwood",
        start = { npc = "Jessir Moonbow", x = 51.8, y = 81.5 },
        objectives = {
            { type = "kill", name = "Overlord Ror", spawns = {{35.2, 59.2}} },
        }
    },
    
    [5203] = { -- The Remains of Trey Lightforge
        name = "The Remains of Trey Lightforge",
        zone = "Felwood",
        start = { npc = "Remains of Trey Lightforge", x = 35.5, y = 58.0 },
        objectives = {
            { type = "talk", name = "Jessir Moonbow", spawns = {{51.8, 81.5}} },
        }
    },
    
    [5204] = { -- Flute of Xandivious
        name = "Flute of Xandivious",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "item", name = "Flute of Xandivious", spawns = {{35.5, 58.5}} },
        }
    },
    
    [5217] = { -- Rescue From Jaedenar
        name = "Rescue From Jaedenar",
        zone = "Felwood",
        start = { npc = "Captured Arkonarin", x = 35.2, y = 59.5 },
        objectives = {
            { type = "escort", name = "Arkonarin", spawns = {{51.2, 82.0}} },
        }
    },
    
    -- ===== Burning Blade / Cultist Quests =====
    
    [5155] = { -- Culling the Corruption
        name = "Culling the Corruption",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "kill", name = "Warpwood Moss Flayer", spawns = {
                {55.5, 16.2}, {56.8, 14.5}, {54.2, 17.8}, {57.5, 15.1}
            }},
        }
    },
    
    [5166] = { -- The Burning Blade
        name = "The Burning Blade",
        zone = "Felwood",
        start = { npc = "Greta Mosshide", x = 51.2, y = 82.0 },
        objectives = {
            { type = "kill", name = "Burning Blade Seer", spawns = {
                {37.5, 56.2}, {38.8, 54.5}, {36.2, 57.8}, {39.5, 55.1}
            }},
        }
    },
    
    [5167] = { -- Verifying the Corruption
        name = "Verifying the Corruption",
        zone = "Felwood",
        start = { npc = "Taronn Redfeather", x = 51.5, y = 81.2 },
        objectives = {
            { type = "item", name = "Corrupt Moonwell Water", spawns = {{38.5, 55.8}} },
        }
    },
    
    -- ===== Corrupted/Cleansed Songflower Quests =====
    
    [4441] = { -- Cleansed Songflower Quest 1
        name = "Cleansed Songflower",
        zone = "Felwood",
        start = { npc = "Songflower", x = 55.5, y = 87.0 },
        objectives = {
            { type = "talk", name = "Cleansed Songflower", spawns = {{55.5, 87.0}} },
        }
    },
    
    [5882] = { -- Root Samples
        name = "Root Samples",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "item", name = "Cleansed Night Dragon", spawns = {
                {52.5, 82.2}, {53.8, 80.5}, {51.2, 83.8}, {54.5, 81.1}
            }},
        }
    },
    
    [5883] = { -- Plagued Lands
        name = "Plagued Lands",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "item", name = "Plague Sample", spawns = {
                {49.5, 78.2}, {50.8, 76.5}, {48.2, 79.8}, {51.5, 77.1}
            }},
        }
    },
    
    -- ===== Additional Felwood Quests =====
    
    [4421] = { -- Captured Sprite Darter
        name = "Captured Sprite Darter",
        zone = "Felwood",
        start = { npc = "Captured Sprite Darter", x = 52.5, y = 82.5 },
        objectives = {
            { type = "talk", name = "Kindal Moonweaver", spawns = {{46.2, 25.8}} },
        }
    },
    
    [4906] = { -- The Strength of Corruption
        name = "The Strength of Corruption",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "kill", name = "Angerclaw Grizzly", spawns = {
                {58.5, 18.2}, {59.8, 16.5}, {57.2, 19.8}, {60.5, 17.1}
            }},
        }
    },
    
    [4907] = { -- Felbound Ancients
        name = "Felbound Ancients",
        zone = "Felwood",
        start = { npc = "Taronn Redfeather", x = 51.5, y = 81.2 },
        objectives = {
            { type = "kill", name = "Warpwood Tangler", spawns = {
                {55.5, 18.2}, {56.8, 16.5}, {54.2, 19.8}, {57.5, 17.1}
            }},
        }
    },
    
    [5156] = { -- Wild Guardians
        name = "Wild Guardians",
        zone = "Felwood",
        start = { npc = "Maybess Riverbreeze", x = 42.2, y = 69.5 },
        objectives = {
            { type = "kill", name = "Wandering Forest Walker", spawns = {
                {45.5, 62.2}, {46.8, 60.5}, {44.2, 63.8}, {47.5, 61.1}
            }},
        }
    },
    
    [5168] = { -- Twisted Evils
        name = "Twisted Evils",
        zone = "Felwood",
        start = { npc = "Taronn Redfeather", x = 51.5, y = 81.2 },
        objectives = {
            { type = "kill", name = "Jadefire Betrayer", spawns = {
                {42.5, 68.2}, {43.8, 66.5}, {41.2, 69.8}, {44.5, 67.1}
            }},
        }
    },
    
    [5886] = { -- Purified
        name = "Purified!",
        zone = "Felwood",
        start = { npc = "Eridan Bluewind", x = 51.2, y = 24.8 },
        objectives = {
            { type = "talk", name = "Maybess Riverbreeze", spawns = {{42.2, 69.5}} },
        }
    },
    
    -----------------------------------------
    -- Winterspring Quests (55-60)
    -----------------------------------------
    
    -- ===== Everlook (Goblin) Quests =====
    
    [5121] = { -- The Everlook Report
        name = "The Everlook Report",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "talk", name = "Jessara Cordell", spawns = {{62.5, 37.2}} },
        }
    },
    
    [5163] = { -- Are We There, Yeti?
        name = "Are We There, Yeti?",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "kill", name = "Iceclaw Yeti", spawns = {
                {57.5, 48.2}, {58.8, 46.5}, {56.2, 49.8}, {59.5, 47.1}
            }},
        }
    },
    
    [5164] = { -- Are We There, Yeti? (Part 2)
        name = "Are We There, Yeti?",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "item", name = "Pristine Yeti Horn", spawns = {
                {57.5, 50.2}, {58.8, 48.5}, {56.2, 51.8}, {59.5, 49.1}
            }},
        }
    },
    
    [5165] = { -- Are We There, Yeti? (Part 3)
        name = "Are We There, Yeti?",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "item", name = "Preserved Yeti Hide", spawns = {{57.5, 49.5}} },
        }
    },
    
    [5250] = { -- Luck Be With You
        name = "Luck Be With You",
        zone = "Winterspring",
        start = { npc = "Witch Doctor Mau'ari", x = 29.8, y = 49.2 },
        objectives = {
            { type = "item", name = "Winterspring Cub Paw", spawns = {
                {55.5, 42.2}, {56.8, 40.5}, {54.2, 43.8}, {57.5, 41.1}
            }},
        }
    },
    
    [5253] = { -- Chillwind Horns
        name = "Chillwind Horns",
        zone = "Winterspring",
        start = { npc = "Witch Doctor Mau'ari", x = 29.8, y = 49.2 },
        objectives = {
            { type = "item", name = "Chillwind Horn", spawns = {
                {59.5, 36.2}, {60.8, 34.5}, {58.2, 37.8}, {61.5, 35.1}
            }},
        }
    },
    
    [5254] = { -- Shardtooth Meat
        name = "Shardtooth Meat",
        zone = "Winterspring",
        start = { npc = "Witch Doctor Mau'ari", x = 29.8, y = 49.2 },
        objectives = {
            { type = "item", name = "Shardtooth Meat", spawns = {
                {56.5, 52.2}, {57.8, 50.5}, {55.2, 53.8}, {58.5, 51.1}
            }},
        }
    },
    
    [5305] = { -- Yeti Cookie Feast
        name = "Yeti Cookie Feast",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "talk", name = "Jaron Stoneshaper", spawns = {{30.5, 45.8}} },
        }
    },
    
    -- ===== Frostsaber Reputation Quests =====
    
    [5082] = { -- Ursius of the Shardtooth
        name = "Ursius of the Shardtooth",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.5, y = 9.5 },
        objectives = {
            { type = "kill", name = "Ursius", spawns = {{57.5, 52.8}} },
        }
    },
    
    [5083] = { -- Shy-Rotam
        name = "Shy-Rotam",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.5, y = 9.5 },
        objectives = {
            { type = "kill", name = "Shy-Rotam", spawns = {{53.2, 21.5}} },
        }
    },
    
    [5085] = { -- Brumeran of the Chillwind
        name = "Brumeran of the Chillwind",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.5, y = 9.5 },
        objectives = {
            { type = "kill", name = "Brumeran", spawns = {{59.2, 34.5}} },
        }
    },
    
    [4970] = { -- Frostsaber Provisions
        name = "Frostsaber Provisions",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.5, y = 9.5 },
        objectives = {
            { type = "item", name = "Frostsaber Rations", spawns = {
                {50.5, 18.2}, {51.8, 16.5}, {49.2, 19.8}, {52.5, 17.1}
            }},
        }
    },
    
    [4974] = { -- Winterspring Huntsman
        name = "Winterspring Huntsman",
        zone = "Winterspring",
        start = { npc = "Rivern Frostwind", x = 49.5, y = 9.5 },
        objectives = {
            { type = "kill", name = "Winterspring Owl", spawns = {
                {52.5, 16.2}, {53.8, 14.5}, {51.2, 17.8}, {54.5, 15.1}
            }},
        }
    },
    
    -- ===== Winterfall Furbolg Quests =====
    
    [5156] = { -- Winterfall Activity
        name = "Winterfall Activity",
        zone = "Winterspring",
        start = { npc = "Salfa", x = 61.5, y = 38.5 },
        objectives = {
            { type = "kill", name = "Winterfall Shaman", spawns = {
                {67.5, 35.2}, {68.8, 33.5}, {66.2, 36.8}, {69.5, 34.1}
            }},
        }
    },
    
    [5157] = { -- Falling to Corruption
        name = "Falling to Corruption",
        zone = "Winterspring",
        start = { npc = "Salfa", x = 61.5, y = 38.5 },
        objectives = {
            { type = "item", name = "Winterfall Ritual Totem", spawns = {
                {67.5, 38.2}, {68.8, 36.5}, {66.2, 39.8}, {69.5, 37.1}
            }},
        }
    },
    
    [5158] = { -- Mystery Goo
        name = "Mystery Goo",
        zone = "Winterspring",
        start = { npc = "Salfa", x = 61.5, y = 38.5 },
        objectives = {
            { type = "item", name = "Empty Firewater Flask", spawns = {
                {68.5, 36.2}, {69.8, 34.5}, {67.2, 37.8}, {70.5, 35.1}
            }},
        }
    },
    
    [5245] = { -- Cache of Mau'ari
        name = "Cache of Mau'ari",
        zone = "Winterspring",
        start = { npc = "Witch Doctor Mau'ari", x = 29.8, y = 49.2 },
        objectives = {
            { type = "talk", name = "Witch Doctor Mau'ari", spawns = {{29.8, 49.2}} },
        }
    },
    
    -- ===== Yeti Cave Chain =====
    
    [5163] = { -- The Yeti Cave
        name = "The Yeti Cave",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "explore", name = "Yeti Cave", spawns = {{57.5, 50.2}} },
        }
    },
    
    [5261] = { -- Return Yeti Fur
        name = "Return Yeti Fur",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "item", name = "Cured Yeti Hide", spawns = {
                {57.5, 51.2}, {58.8, 49.5}, {56.2, 52.8}, {59.5, 50.1}
            }},
        }
    },
    
    -- ===== High Chief Winterfall / Spirit Quests =====
    
    [5248] = { -- High Chief Winterfall
        name = "High Chief Winterfall",
        zone = "Winterspring",
        start = { npc = "Salfa", x = 61.5, y = 38.5 },
        objectives = {
            { type = "kill", name = "High Chief Winterfall", spawns = {{68.2, 37.5}} },
        }
    },
    
    [5249] = { -- The Final Piece
        name = "The Final Piece",
        zone = "Winterspring",
        start = { npc = "Witch Doctor Mau'ari", x = 29.8, y = 49.2 },
        objectives = {
            { type = "item", name = "Winterfall Elder's Censer", spawns = {{68.5, 37.2}} },
        }
    },
    
    [5244] = { -- Threat of the Winterfall
        name = "Threat of the Winterfall",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "kill", name = "Winterfall Ursa", spawns = {
                {67.5, 40.2}, {68.8, 38.5}, {66.2, 41.8}, {69.5, 39.1}
            }},
        }
    },
    
    -- ===== Spirit of Azuregos Chain =====
    
    [8575] = { -- Azuregos's Magical Ledger
        name = "Azuregos's Magical Ledger",
        zone = "Winterspring",
        start = { npc = "Narain Soothfancy", x = 65.2, y = 18.5 },
        objectives = {
            { type = "talk", name = "Spirit of Azuregos", spawns = {{55.2, 90.5}} },
        }
    },
    
    [8576] = { -- Translating the Ledger
        name = "Translating the Ledger",
        zone = "Winterspring",
        start = { npc = "Narain Soothfancy", x = 65.2, y = 18.5 },
        objectives = {
            { type = "item", name = "Draconic for Dummies", spawns = {{60.5, 38.2}} },
        }
    },
    
    -- ===== Additional Winterspring Quests =====
    
    [5087] = { -- Strange Sources
        name = "Strange Sources",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "item", name = "Empty Cursed Ooze Jar", spawns = {
                {57.5, 75.2}, {58.8, 73.5}, {56.2, 76.8}, {59.5, 74.1}
            }},
        }
    },
    
    [976] = { -- Trouble in Winterspring!
        name = "Trouble in Winterspring!",
        zone = "Winterspring",
        start = { npc = "Jessica Redpath", x = 62.5, y = 37.5 },
        objectives = {
            { type = "kill", name = "Cobalt Scalebane", spawns = {
                {52.5, 82.2}, {53.8, 80.5}, {51.2, 83.8}, {54.5, 81.1}
            }},
        }
    },
    
    [5063] = { -- Sister Pamela
        name = "Sister Pamela",
        zone = "Winterspring",
        start = { npc = "Jessica Redpath", x = 62.5, y = 37.5 },
        objectives = {
            { type = "talk", name = "Pamela", spawns = {{30.5, 37.5}} },
        }
    },
    
    [5305] = { -- Duke Nicholas Zverenhoff
        name = "Duke Nicholas Zverenhoff",
        zone = "Winterspring",
        start = { npc = "Commander Eligor Dawnbringer", x = 81.5, y = 59.5 },
        objectives = {
            { type = "talk", name = "Duke Nicholas Zverenhoff", spawns = {{82.2, 58.0}} },
        }
    },
    
    -- ===== Additional Everlook Quests =====
    
    [5126] = { -- A Yeti of Your Own
        name = "A Yeti of Your Own",
        zone = "Winterspring",
        start = { npc = "Umi Rumplesnicker", x = 61.2, y = 38.5 },
        objectives = {
            { type = "item", name = "Pristine Yeti Hide", spawns = {
                {57.5, 52.2}, {58.8, 50.5}, {56.2, 53.8}, {59.5, 51.1}
            }},
        }
    },
    
    [5128] = { -- Stealing Supplies
        name = "Stealing Supplies",
        zone = "Winterspring",
        start = { npc = "Legacki", x = 60.8, y = 37.5 },
        objectives = {
            { type = "item", name = "Winterfall Supplies", spawns = {
                {68.5, 35.2}, {69.8, 33.5}, {67.2, 36.8}, {70.5, 34.1}
            }},
        }
    },
    
    [5130] = { -- Duke of Cynders
        name = "Duke of Cynders",
        zone = "Winterspring",
        start = { npc = "Kelek Skykeeper", x = 64.5, y = 26.2 },
        objectives = {
            { type = "kill", name = "Duke of Cynders", spawns = {{62.5, 24.8}} },
        }
    },
    
    [5148] = { -- Moontouched Wildkin
        name = "Moontouched Wildkin",
        zone = "Winterspring",
        start = { npc = "Jaron Stoneshaper", x = 30.5, y = 45.8 },
        objectives = {
            { type = "item", name = "Moontouched Feather", spawns = {
                {49.5, 20.2}, {50.8, 18.5}, {48.2, 21.8}, {51.5, 19.1}
            }},
        }
    },
    
    [5150] = { -- Rage of the Owlbeasts
        name = "Rage of the Owlbeasts",
        zone = "Winterspring",
        start = { npc = "Jaron Stoneshaper", x = 30.5, y = 45.8 },
        objectives = {
            { type = "item", name = "Owlbeast Artifact", spawns = {
                {63.5, 22.2}, {64.8, 20.5}, {62.2, 23.8}, {65.5, 21.1}
            }},
        }
    },
    
    [5152] = { -- The Ruins of Kel'Theril
        name = "The Ruins of Kel'Theril",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "item", name = "Highborne Relic Fragment", spawns = {
                {55.5, 44.2}, {56.8, 42.5}, {54.2, 45.8}, {57.5, 43.1}
            }},
        }
    },
    
    [5154] = { -- Corrupted Songflower
        name = "Corrupted Songflower",
        zone = "Winterspring",
        start = { npc = "Donova Snowden", x = 31.2, y = 45.2 },
        objectives = {
            { type = "talk", name = "Corrupted Songflower", spawns = {{32.5, 46.8}} },
        }
    },
    
    [5155] = { -- It's a Secret to Everybody
        name = "It's a Secret to Everybody",
        zone = "Winterspring",
        start = { npc = "Linken", x = 35.5, y = 52.5 },
        objectives = {
            { type = "item", name = "Linken's Tempered Sword", spawns = {{32.5, 45.8}} },
        }
    },
    
    -- ===== Cobalt Dragonflight Quests =====
    
    [5166] = { -- Mazthoril
        name = "Mazthoril",
        zone = "Winterspring",
        start = { npc = "Sprite Darter", x = 52.5, y = 29.8 },
        objectives = {
            { type = "explore", name = "Mazthoril", spawns = {{57.5, 82.5}} },
        }
    },
    
    [5167] = { -- Cobalt Magehunters
        name = "Cobalt Magehunters",
        zone = "Winterspring",
        start = { npc = "Haleh", x = 54.5, y = 51.2 },
        objectives = {
            { type = "kill", name = "Cobalt Magehunter", spawns = {
                {56.5, 78.2}, {57.8, 76.5}, {55.2, 79.8}, {58.5, 77.1}
            }},
        }
    },
    
    [5169] = { -- The Cobalt Skull
        name = "The Cobalt Skull",
        zone = "Winterspring",
        start = { npc = "Haleh", x = 54.5, y = 51.2 },
        objectives = {
            { type = "item", name = "Cobalt Dragon Skull", spawns = {{58.5, 80.8}} },
        }
    },
    
    -- ===== Demon Hunting Quests =====
    
    [5170] = { -- Demon Ice
        name = "Demon Ice",
        zone = "Winterspring",
        start = { npc = "Felwood Traveler", x = 48.5, y = 42.5 },
        objectives = {
            { type = "item", name = "Demon Ice", spawns = {
                {58.5, 64.2}, {59.8, 62.5}, {57.2, 65.8}, {60.5, 63.1}
            }},
        }
    },
    
    [5171] = { -- Darkwhisper Gorge
        name = "Darkwhisper Gorge",
        zone = "Winterspring",
        start = { npc = "Kelek Skykeeper", x = 64.5, y = 26.2 },
        objectives = {
            { type = "kill", name = "Hederine Initiate", spawns = {
                {60.5, 68.2}, {61.8, 66.5}, {59.2, 69.8}, {62.5, 67.1}
            }},
        }
    },
    
    [5172] = { -- Icescale Venom
        name = "Icescale Venom",
        zone = "Winterspring",
        start = { npc = "Krakle", x = 59.5, y = 39.2 },
        objectives = {
            { type = "item", name = "Icescale Venom Sac", spawns = {
                {48.5, 28.2}, {49.8, 26.5}, {47.2, 29.8}, {50.5, 27.1}
            }},
        }
    },

    -----------------------------------------
    -- Western Plaguelands Quests (50-58)
    -----------------------------------------
    
    -- ===== Chillwind Camp (Alliance) Quests =====
    
    [5092] = { -- Unfinished Business
        name = "Unfinished Business",
        zone = "Western Plaguelands",
        start = { npc = "Kirsta Deepshadow", x = 42.6, y = 84.0 },
        objectives = {
            { type = "kill", name = "Cauldron Lord Bilemaw", spawns = {{67.2, 49.5}} },
        }
    },
    
    [5093] = { -- Unfinished Business (Part 2)
        name = "Unfinished Business",
        zone = "Western Plaguelands",
        start = { npc = "Kirsta Deepshadow", x = 42.6, y = 84.0 },
        objectives = {
            { type = "kill", name = "Huntsman Radley", spawns = {{53.5, 67.2}} },
            { type = "kill", name = "Cavalier Durgen", spawns = {{50.2, 68.5}} },
        }
    },
    
    [5094] = { -- Unfinished Business (Part 3)
        name = "Unfinished Business",
        zone = "Western Plaguelands",
        start = { npc = "Kirsta Deepshadow", x = 42.6, y = 84.0 },
        objectives = {
            { type = "kill", name = "Baron Harkoth", spawns = {{67.5, 49.8}} },
        }
    },
    
    [5097] = { -- All Along the Watchtowers
        name = "All Along the Watchtowers",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "Tower One", spawns = {{43.8, 17.2}} },
            { type = "talk", name = "Tower Two", spawns = {{47.5, 40.8}} },
            { type = "talk", name = "Tower Three", spawns = {{48.2, 71.5}} },
            { type = "talk", name = "Tower Four", spawns = {{42.5, 67.8}} },
        }
    },
    
    [5142] = { -- Clear the Way
        name = "Clear the Way",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "kill", name = "Skeletal Warlord", spawns = {
                {50.5, 66.2}, {51.8, 64.5}, {49.2, 67.8}, {52.5, 65.1}
            }},
        }
    },
    
    [5212] = { -- Alas, Andorhal
        name = "Alas, Andorhal",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "Andorhal Monument", spawns = {{41.2, 70.5}} },
        }
    },
    
    [5215] = { -- Skeletal Fragments
        name = "Skeletal Fragments",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "item", name = "Skeletal Fragment", spawns = {
                {45.5, 66.2}, {46.8, 64.5}, {44.2, 67.8}, {47.5, 65.1}
            }},
        }
    },
    
    -- ===== The Bulwark (Horde) Quests =====
    
    [5214] = { -- Better Late Than Never
        name = "Better Late Than Never",
        zone = "Western Plaguelands",
        start = { npc = "High Executor Derrington", x = 83.0, y = 72.0 },
        objectives = {
            { type = "talk", name = "Andorhal Chest", spawns = {{40.8, 70.2}} },
        }
    },
    
    [5217] = { -- The Scourge Cauldrons
        name = "The Scourge Cauldrons",
        zone = "Western Plaguelands",
        start = { npc = "High Executor Derrington", x = 83.0, y = 72.0 },
        objectives = {
            { type = "talk", name = "Shadow Priestess Vandis", spawns = {{83.5, 70.5}} },
        }
    },
    
    [5218] = { -- Felstone Field Cauldron
        name = "Felstone Field Cauldron",
        zone = "Western Plaguelands",
        start = { npc = "Shadow Priestess Vandis", x = 83.5, y = 70.5 },
        objectives = {
            { type = "kill", name = "Cauldron Lord Razarch", spawns = {{37.2, 54.8}} },
        }
    },
    
    -- ===== Caer Darrow / Andorhal Quests =====
    
    [5219] = { -- Target: Dalson's Tears
        name = "Target: Dalson's Tears",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "talk", name = "Scourge Cauldron", spawns = {{45.5, 52.8}} },
        }
    },
    
    [5220] = { -- Target: Writhing Haunt
        name = "Target: Writhing Haunt",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "talk", name = "Writhing Haunt Cauldron", spawns = {{52.5, 65.2}} },
        }
    },
    
    [5221] = { -- Target: Gahrron's Withering
        name = "Target: Gahrron's Withering",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "talk", name = "Gahrron Cauldron", spawns = {{62.8, 58.5}} },
        }
    },
    
    [5058] = { -- The Annals of Darrowshire
        name = "The Annals of Darrowshire",
        zone = "Western Plaguelands",
        start = { npc = "Carlin Redpath", x = 81.5, y = 59.5 },
        objectives = {
            { type = "item", name = "Annals of Darrowshire", spawns = {{70.2, 73.5}} },
        }
    },
    
    [5059] = { -- Brother Carlin
        name = "Brother Carlin",
        zone = "Western Plaguelands",
        start = { npc = "Chromie", x = 39.5, y = 66.8 },
        objectives = {
            { type = "talk", name = "Carlin Redpath", spawns = {{81.5, 59.5}} },
        }
    },
    
    [5060] = { -- Villains of Darrowshire
        name = "Villains of Darrowshire",
        zone = "Western Plaguelands",
        start = { npc = "Carlin Redpath", x = 81.5, y = 59.5 },
        objectives = {
            { type = "item", name = "Skull of Horgus", spawns = {{50.2, 66.8}} },
            { type = "item", name = "Skull of Marduk", spawns = {{51.5, 69.2}} },
        }
    },
    
    -- ===== Scholomance Attunement =====
    
    [5533] = { -- Scholomance
        name = "Scholomance",
        zone = "Western Plaguelands",
        start = { npc = "Eva Sarkhoff", x = 70.2, y = 73.0 },
        objectives = {
            { type = "kill", name = "Rattlegore", spawns = {{35.5, 58.2}} },
        }
    },
    
    [5537] = { -- Skeletal Fragments
        name = "Skeletal Fragments",
        zone = "Western Plaguelands",
        start = { npc = "Apothecary Dithers", x = 83.2, y = 69.5 },
        objectives = {
            { type = "item", name = "Skeletal Fragment", spawns = {
                {45.5, 66.2}, {46.8, 64.5}, {44.2, 67.8}, {47.5, 65.1}
            }},
        }
    },
    
    [5538] = { -- The Key to Scholomance
        name = "The Key to Scholomance",
        zone = "Western Plaguelands",
        start = { npc = "Alchemist Arbington", x = 42.5, y = 83.5 },
        objectives = {
            { type = "item", name = "Spectral Essence", spawns = {{70.5, 73.8}} },
        }
    },
    
    -- ===== The Cauldron Chain Quests =====
    
    [5227] = { -- Return to Chillwind Camp
        name = "Return to Chillwind Camp",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "High Priestess MacDonnell", spawns = {{42.8, 83.8}} },
        }
    },
    
    [5228] = { -- Mission Accomplished!
        name = "Mission Accomplished!",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "talk", name = "Commander Ashlam Valorfist", spawns = {{43.0, 84.5}} },
        }
    },
    
    -- ===== Araj the Summoner / Chromatic Carapace =====
    
    [5261] = { -- Araj's Scarab
        name = "Araj's Scarab",
        zone = "Western Plaguelands",
        start = { npc = "High Executor Derrington", x = 83.0, y = 72.0 },
        objectives = {
            { type = "kill", name = "Araj the Summoner", spawns = {{45.2, 69.5}} },
        }
    },
    
    [5262] = { -- Araj's Scarab (Alliance)
        name = "Araj's Scarab",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "kill", name = "Araj the Summoner", spawns = {{45.2, 69.5}} },
        }
    },
    
    [5515] = { -- The Chromatic Carapace
        name = "The Chromatic Carapace",
        zone = "Western Plaguelands",
        start = { npc = "Curator Thorius", x = 43.0, y = 12.0 },
        objectives = {
            { type = "item", name = "Chromatic Carapace", spawns = {{42.5, 15.5}} },
        }
    },
    
    -- ===== Additional Western Plaguelands Quests =====
    
    [5025] = { -- The Everlook Report
        name = "The Everlook Report",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "Elling Trias", spawns = {{77.2, 35.5}} },
        }
    },
    
    [5044] = { -- A Plague Upon Thee
        name = "A Plague Upon Thee",
        zone = "Western Plaguelands",
        start = { npc = "Mickey Levine", x = 47.5, y = 32.2 },
        objectives = {
            { type = "item", name = "Termite Barrel", spawns = {{47.8, 32.5}} },
        }
    },
    
    [5046] = { -- A Plague Upon Thee (Part 2)
        name = "A Plague Upon Thee",
        zone = "Western Plaguelands",
        start = { npc = "Mickey Levine", x = 47.5, y = 32.2 },
        objectives = {
            { type = "talk", name = "Termite Mound", spawns = {{50.2, 28.5}} },
        }
    },
    
    -- ===== Hearthglen / Scarlet Crusade Quests =====
    
    [5050] = { -- The Mark of the Lightbringer
        name = "The Mark of the Lightbringer",
        zone = "Western Plaguelands",
        start = { npc = "Anchorite Truuen", x = 43.0, y = 84.0 },
        objectives = {
            { type = "item", name = "Mark of the Lightbringer", spawns = {{45.5, 18.2}} },
        }
    },
    
    [5051] = { -- The Scourge Cauldrons
        name = "The Scourge Cauldrons",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "High Priestess MacDonnell", spawns = {{42.8, 83.8}} },
        }
    },
    
    [5096] = { -- Return to Chillwind Camp
        name = "Return to Chillwind Camp",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "talk", name = "High Priestess MacDonnell", spawns = {{42.8, 83.8}} },
        }
    },
    
    [5095] = { -- Scarlet Diversions
        name = "Scarlet Diversions",
        zone = "Western Plaguelands",
        start = { npc = "High Executor Derrington", x = 83.0, y = 72.0 },
        objectives = {
            { type = "item", name = "Scarlet Crusade Orders", spawns = {{45.5, 18.8}} },
            { type = "explore", name = "Command Tent", spawns = {{45.8, 18.2}} },
        }
    },
    
    [5098] = { -- All Along the Watchtowers (Horde)
        name = "All Along the Watchtowers",
        zone = "Western Plaguelands",
        start = { npc = "High Executor Derrington", x = 83.0, y = 72.0 },
        objectives = {
            { type = "talk", name = "Northridge Lumber Mill Tower", spawns = {{48.5, 32.2}} },
            { type = "talk", name = "Hearthglen Tower", spawns = {{45.2, 18.5}} },
            { type = "talk", name = "Plaguewood Tower", spawns = {{44.8, 17.8}} },
        }
    },
    
    -- ===== Redpath / Chromie Chain =====
    
    [5153] = { -- Aunt Martina
        name = "Aunt Martina",
        zone = "Western Plaguelands",
        start = { npc = "Chromie", x = 39.5, y = 66.8 },
        objectives = {
            { type = "talk", name = "Martina Redpath", spawns = {{82.5, 58.8}} },
        }
    },
    
    [5201] = { -- A Strange Historian
        name = "A Strange Historian",
        zone = "Western Plaguelands",
        start = { npc = "Joseph Redpath", x = 35.5, y = 83.5 },
        objectives = {
            { type = "talk", name = "Chromie", spawns = {{39.5, 66.8}} },
        }
    },
    
    [5202] = { -- The Annals of Darrowshire
        name = "The Annals of Darrowshire",
        zone = "Western Plaguelands",
        start = { npc = "Chromie", x = 39.5, y = 66.8 },
        objectives = {
            { type = "item", name = "Annals of Darrowshire", spawns = {{70.2, 73.5}} },
        }
    },
    
    [5206] = { -- Sharing the Land
        name = "Sharing the Land",
        zone = "Western Plaguelands",
        start = { npc = "Mulgris Deepriver", x = 53.5, y = 65.5 },
        objectives = {
            { type = "kill", name = "Skeletal Flayer", spawns = {
                {49.5, 62.2}, {50.8, 60.5}, {48.2, 63.8}, {51.5, 61.1}
            }},
        }
    },
    
    -- ===== Undead Farming Quests =====
    
    [5210] = { -- Writhing Haunt Cauldron
        name = "Writhing Haunt Cauldron",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "kill", name = "Cauldron Lord Malvinious", spawns = {{53.2, 66.8}} },
        }
    },
    
    [5211] = { -- Gahrron's Withering Cauldron
        name = "Gahrron's Withering Cauldron",
        zone = "Western Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "kill", name = "Cauldron Lord Soulwrath", spawns = {{62.5, 58.2}} },
        }
    },
    
    [5216] = { -- The Plague Spreaders
        name = "The Plague Spreaders",
        zone = "Western Plaguelands",
        start = { npc = "Commander Ashlam Valorfist", x = 43.0, y = 84.5 },
        objectives = {
            { type = "kill", name = "Diseased Flayer", spawns = {
                {42.5, 68.2}, {43.8, 66.5}, {41.2, 69.8}, {44.5, 67.1}
            }},
        }
    },

    -----------------------------------------
    -- Eastern Plaguelands Quests (53-60)
    -----------------------------------------
    
    -- ===== Light's Hope Chapel Quests =====
    
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
    
    [5543] = { -- Hameya's Plea
        name = "Hameya's Plea",
        zone = "Eastern Plaguelands",
        start = { npc = "Hameya's Plea (Note)", x = 27.2, y = 85.5 },
        objectives = {
            { type = "item", name = "Hameya's Key", spawns = {{23.5, 78.8}} },
        }
    },
    
    [5903] = { -- Defenders of Darrowshire
        name = "Defenders of Darrowshire",
        zone = "Eastern Plaguelands",
        start = { npc = "Carlin Redpath", x = 81.5, y = 59.5 },
        objectives = {
            { type = "item", name = "Remains of the Defenders", spawns = {
                {35.5, 84.2}, {36.8, 82.5}, {34.2, 85.8}, {37.5, 83.1}
            }},
        }
    },
    
    [5944] = { -- The Battle of Darrowshire
        name = "The Battle of Darrowshire",
        zone = "Eastern Plaguelands",
        start = { npc = "Joseph Redpath", x = 35.5, y = 83.5 },
        objectives = {
            { type = "kill", name = "Redpath the Corrupted", spawns = {{35.5, 83.8}} },
        }
    },
    
    [5862] = { -- Augustus' Receipt Book
        name = "Augustus' Receipt Book",
        zone = "Eastern Plaguelands",
        start = { npc = "Augustus the Touched", x = 80.5, y = 58.2 },
        objectives = {
            { type = "item", name = "Augustus' Receipt Book", spawns = {{33.5, 68.2}} },
        }
    },
    
    -- ===== Tirion Fordring Chain =====
    
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
    
    [5283] = { -- Carrion Grubbage
        name = "Carrion Grubbage",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "item", name = "Carrion Grub", spawns = {
                {20.5, 50.2}, {21.8, 48.5}, {19.2, 51.8}, {22.5, 49.1}
            }},
        }
    },
    
    [5241] = { -- Of Forgotten Memories
        name = "Of Forgotten Memories",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "item", name = "Tirion's Gift", spawns = {{28.5, 86.8}} },
        }
    },
    
    [5242] = { -- Of Lost Honor
        name = "Of Lost Honor",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "item", name = "Taelan's Hammer", spawns = {{42.5, 15.8}} },
        }
    },
    
    [5243] = { -- Of Love and Family
        name = "Of Love and Family",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "item", name = "Painting of Tirion and Taelan", spawns = {{27.5, 84.5}} },
        }
    },
    
    [5944] = { -- Redemption
        name = "Redemption",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "escort", name = "Tirion Fordring", spawns = {{42.5, 15.5}} },
        }
    },
    
    -- ===== Redpath Chain =====
    
    [5061] = { -- Marauders of Darrowshire
        name = "Marauders of Darrowshire",
        zone = "Eastern Plaguelands",
        start = { npc = "Carlin Redpath", x = 81.5, y = 59.5 },
        objectives = {
            { type = "item", name = "Relics of the Marauders", spawns = {
                {15.5, 42.2}, {16.8, 40.5}, {14.2, 43.8}, {17.5, 41.1}
            }},
        }
    },
    
    [5062] = { -- Return to Chromie
        name = "Return to Chromie",
        zone = "Eastern Plaguelands",
        start = { npc = "Carlin Redpath", x = 81.5, y = 59.5 },
        objectives = {
            { type = "talk", name = "Chromie", spawns = {{39.5, 66.8}} },
        }
    },
    
    [5168] = { -- Pamela's Doll
        name = "Pamela's Doll",
        zone = "Eastern Plaguelands",
        start = { npc = "Pamela Redpath", x = 35.5, y = 83.5 },
        objectives = {
            { type = "item", name = "Pamela's Doll's Head", spawns = {{35.8, 82.5}} },
            { type = "item", name = "Pamela's Doll's Left Side", spawns = {{34.2, 84.5}} },
            { type = "item", name = "Pamela's Doll's Right Side", spawns = {{36.5, 85.2}} },
        }
    },
    
    [5149] = { -- Sister Pamela
        name = "Sister Pamela",
        zone = "Eastern Plaguelands",
        start = { npc = "Jessica Redpath", x = 76.5, y = 52.5 },
        objectives = {
            { type = "talk", name = "Pamela Redpath", spawns = {{35.5, 83.5}} },
        }
    },
    
    [5152] = { -- Uncle Carlin
        name = "Uncle Carlin",
        zone = "Eastern Plaguelands",
        start = { npc = "Pamela Redpath", x = 35.5, y = 83.5 },
        objectives = {
            { type = "talk", name = "Carlin Redpath", spawns = {{81.5, 59.5}} },
        }
    },
    
    -- ===== Stratholme Prep Quests =====
    
    [5263] = { -- Dead Man's Plea
        name = "Dead Man's Plea",
        zone = "Eastern Plaguelands",
        start = { npc = "Anthion Harmon", x = 26.5, y = 74.8 },
        objectives = {
            { type = "talk", name = "Deliana", spawns = {{43.5, 52.5}} },
        }
    },
    
    [5305] = { -- The Archivist
        name = "The Archivist",
        zone = "Eastern Plaguelands",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Archivist Galford", spawns = {{27.5, 11.5}} },
        }
    },
    
    [5306] = { -- The Truth Comes Crashing Down
        name = "The Truth Comes Crashing Down",
        zone = "Eastern Plaguelands",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "talk", name = "Balnazzar", spawns = {{28.5, 12.2}} },
        }
    },
    
    [5307] = { -- Above and Beyond
        name = "Above and Beyond",
        zone = "Eastern Plaguelands",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "talk", name = "Highlord Bolvar Fordragon", spawns = {{78.5, 18.2}} },
        }
    },
    
    -- ===== Plaguewood / Tyr's Hand Quests =====
    
    [5251] = { -- When Smokey Sings, I Get Violent
        name = "When Smokey Sings, I Get Violent",
        zone = "Eastern Plaguelands",
        start = { npc = "Smokey LaRue", x = 80.5, y = 58.8 },
        objectives = {
            { type = "item", name = "Box of Termites", spawns = {{28.5, 11.5}} },
        }
    },
    
    [5514] = { -- The Blightcaller Cometh
        name = "The Blightcaller Cometh",
        zone = "Eastern Plaguelands",
        start = { npc = "High Priestess MacDonnell", x = 42.8, y = 83.8 },
        objectives = {
            { type = "kill", name = "Nathanos Blightcaller", spawns = {{26.5, 74.5}} },
        }
    },
    
    [5515] = { -- Order Must Be Restored
        name = "Order Must Be Restored",
        zone = "Eastern Plaguelands",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Grand Crusader Dathrohan", spawns = {{28.5, 12.5}} },
        }
    },
    
    [5581] = { -- Zaeldarr the Outcast
        name = "Zaeldarr the Outcast",
        zone = "Eastern Plaguelands",
        start = { npc = "Caretaker Alen", x = 24.7, y = 74.3 },
        objectives = {
            { type = "kill", name = "Zaeldarr the Outcast", spawns = {{27.5, 85.2}} },
        }
    },
    
    -- ===== Argent Dawn Reputation Quests =====
    
    [5513] = { -- Minion's Scourgestones
        name = "Minion's Scourgestones",
        zone = "Eastern Plaguelands",
        start = { npc = "Argent Officer Pureheart", x = 81.2, y = 58.5 },
        objectives = {
            { type = "item", name = "Minion's Scourgestone", spawns = {
                {25.5, 74.2}, {26.8, 72.5}, {24.2, 75.8}, {27.5, 73.1}
            }},
        }
    },
    
    [5160] = { -- They Call Me "The Rooster"
        name = "They Call Me \"The Rooster\"",
        zone = "Eastern Plaguelands",
        start = { npc = "Flint Shadowmore", x = 81.5, y = 60.2 },
        objectives = {
            { type = "talk", name = "Nathanos Blightcaller", spawns = {{26.5, 74.5}} },
        }
    },
    
    [5213] = { -- Invader's Scourgestones
        name = "Invader's Scourgestones",
        zone = "Eastern Plaguelands",
        start = { npc = "Argent Officer Pureheart", x = 81.2, y = 58.5 },
        objectives = {
            { type = "item", name = "Invader's Scourgestone", spawns = {
                {18.5, 28.2}, {19.8, 26.5}, {17.2, 29.8}, {20.5, 27.1}
            }},
        }
    },
    
    [5509] = { -- Corruptor's Scourgestones
        name = "Corruptor's Scourgestones",
        zone = "Eastern Plaguelands",
        start = { npc = "Argent Officer Pureheart", x = 81.2, y = 58.5 },
        objectives = {
            { type = "item", name = "Corruptor's Scourgestone", spawns = {
                {15.5, 30.2}, {16.8, 28.5}, {14.2, 31.8}, {17.5, 29.1}
            }},
        }
    },
    
    [6145] = { -- The Argent Hold
        name = "The Argent Hold",
        zone = "Eastern Plaguelands",
        start = { npc = "Lord Maxwell Tyrosus", x = 81.5, y = 59.5 },
        objectives = {
            { type = "talk", name = "Duke Nicholas Zverenhoff", spawns = {{81.5, 59.8}} },
        }
    },
    
    -- ===== Additional Tirion Fordring Quests =====
    
    [5218] = { -- Redemption
        name = "Redemption",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "kill", name = "Isillien", spawns = {{42.5, 18.8}} },
        }
    },
    
    [5219] = { -- The Scarlet Oracle, Demetria
        name = "The Scarlet Oracle, Demetria",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "kill", name = "Demetria", spawns = {{35.5, 15.8}} },
        }
    },
    
    [5220] = { -- In Dreams
        name = "In Dreams",
        zone = "Eastern Plaguelands",
        start = { npc = "Tirion Fordring", x = 7.5, y = 43.6 },
        objectives = {
            { type = "escort", name = "Taelan Fordring", spawns = {{42.5, 18.5}} },
        }
    },
    
    -- ===== Tyr's Hand / Scarlet Quests =====
    
    [5262] = { -- The Crimson Courier
        name = "The Crimson Courier",
        zone = "Eastern Plaguelands",
        start = { npc = "Nathanos Blightcaller", x = 26.5, y = 74.5 },
        objectives = {
            { type = "kill", name = "Crimson Courier", spawns = {{75.5, 55.2}} },
        }
    },
    
    [5263] = { -- Scarlet Subterfuge
        name = "Scarlet Subterfuge",
        zone = "Eastern Plaguelands",
        start = { npc = "Nathanos Blightcaller", x = 26.5, y = 74.5 },
        objectives = {
            { type = "item", name = "Scarlet Crusade Disguise", spawns = {{76.5, 52.8}} },
        }
    },
    
    [5264] = { -- In Pursuit of the Scarlet Oracle
        name = "In Pursuit of the Scarlet Oracle",
        zone = "Eastern Plaguelands",
        start = { npc = "Nathanos Blightcaller", x = 26.5, y = 74.5 },
        objectives = {
            { type = "talk", name = "Demetria", spawns = {{35.5, 15.8}} },
        }
    },
    
    [5265] = { -- The Archivist (EPL)
        name = "The Archivist",
        zone = "Eastern Plaguelands",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Archivist Galford", spawns = {{27.2, 11.8}} },
        }
    },
    
    -- ===== Northdale / Crown Guard Tower Quests =====
    
    [5542] = { -- Zaeldarr Returns
        name = "Zaeldarr Returns",
        zone = "Eastern Plaguelands",
        start = { npc = "Caretaker Alen", x = 24.7, y = 74.3 },
        objectives = {
            { type = "kill", name = "Zaeldarr the Outcast", spawns = {{27.5, 85.2}} },
        }
    },
    
    [5721] = { -- The Lich, Ras Frostwhisper
        name = "The Lich, Ras Frostwhisper",
        zone = "Eastern Plaguelands",
        start = { npc = "Magistrate Marduke", x = 70.2, y = 73.5 },
        objectives = {
            { type = "kill", name = "Ras Frostwhisper", spawns = {{35.5, 58.2}} },
        }
    },
    
    [5722] = { -- The Plaguebringer's Request
        name = "The Plaguebringer's Request",
        zone = "Eastern Plaguelands",
        start = { npc = "Commander Eligor Dawnbringer", x = 81.5, y = 58.8 },
        objectives = {
            { type = "item", name = "Scourge Data", spawns = {
                {22.5, 68.2}, {23.8, 66.5}, {21.2, 69.8}, {24.5, 67.1}
            }},
        }
    },
    
    [5723] = { -- Plagued Hatchlings
        name = "Plagued Hatchlings",
        zone = "Eastern Plaguelands",
        start = { npc = "Betina Bigglezink", x = 81.2, y = 59.8 },
        objectives = {
            { type = "kill", name = "Plagued Hatchling", spawns = {
                {47.5, 22.2}, {48.8, 20.5}, {46.2, 23.8}, {49.5, 21.1}
            }},
        }
    },
    
    [5724] = { -- Healthy Dragon Scale
        name = "Healthy Dragon Scale",
        zone = "Eastern Plaguelands",
        start = { npc = "Betina Bigglezink", x = 81.2, y = 59.8 },
        objectives = {
            { type = "item", name = "Healthy Dragon Scale", spawns = {
                {50.5, 18.2}, {51.8, 16.5}, {49.2, 19.8}, {52.5, 17.1}
            }},
        }
    },

    -----------------------------------------
    -- Burning Steppes Quests (50-58)
    -----------------------------------------
    
    -- ===== Morgan's Vigil (Alliance) Quests =====
    
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
    
    [4182] = { -- Extinguish the Firegut
        name = "Extinguish the Firegut",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "kill", name = "Firegut Ogre", spawns = {
                {81.5, 46.2}, {82.8, 44.5}, {80.2, 47.8}, {83.5, 45.1}
            }},
            { type = "kill", name = "Firegut Ogre Mage", spawns = {
                {79.5, 48.2}, {80.8, 46.5}, {78.2, 49.8}, {81.5, 47.1}
            }},
        }
    },
    
    [4183] = { -- FIFTY! YEP!
        name = "FIFTY! YEP!",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "kill", name = "Black Dragonspawn", spawns = {
                {26.5, 42.2}, {27.8, 40.5}, {25.2, 43.8}, {28.5, 41.1}
            }},
        }
    },
    
    [4184] = { -- Dragonkin Menace
        name = "Dragonkin Menace",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "kill", name = "Black Broodling", spawns = {
                {26.5, 38.2}, {27.8, 36.5}, {25.2, 39.8}, {28.5, 37.1}
            }},
            { type = "kill", name = "Black Dragonspawn", spawns = {
                {30.5, 42.2}, {31.8, 40.5}, {29.2, 43.8}, {32.5, 41.1}
            }},
            { type = "kill", name = "Black Wyrmkin", spawns = {
                {35.5, 38.2}, {36.8, 36.5}, {34.2, 39.8}, {37.5, 37.1}
            }},
            { type = "kill", name = "Flamescale Broodling", spawns = {
                {28.5, 44.2}, {29.8, 42.5}, {27.2, 45.8}, {30.5, 43.1}
            }},
        }
    },
    
    [4185] = { -- The True Masters
        name = "The True Masters",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "talk", name = "Highlord Bolvar Fordragon", spawns = {{78.5, 18.2}} },
        }
    },
    
    [4224] = { -- A Crumpled Up Note
        name = "A Crumpled Up Note",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "talk", name = "Ragged John", spawns = {{65.5, 23.8}} },
        }
    },
    
    -- ===== Flame Crest (Horde) Quests =====
    
    [4481] = { -- Doomrigger's Clasp
        name = "Doomrigger's Clasp",
        zone = "Burning Steppes",
        start = { npc = "Vahlarriel Demonslayer", x = 54.5, y = 24.2 },
        objectives = {
            { type = "item", name = "Doomrigger's Clasp", spawns = {{40.5, 48.8}} },
        }
    },
    
    [4721] = { -- Eitrigg's Wisdom
        name = "Eitrigg's Wisdom",
        zone = "Burning Steppes",
        start = { npc = "Warlord Goretooth", x = 65.5, y = 22.5 },
        objectives = {
            { type = "talk", name = "Eitrigg", spawns = {{49.5, 76.8}} },
        }
    },
    
    [4722] = { -- For The Horde!
        name = "For The Horde!",
        zone = "Burning Steppes",
        start = { npc = "Warlord Goretooth", x = 65.5, y = 22.5 },
        objectives = {
            { type = "talk", name = "Thrall", spawns = {{32.2, 37.8}} },
        }
    },
    
    [4723] = { -- What the Wind Carries
        name = "What the Wind Carries",
        zone = "Burning Steppes",
        start = { npc = "Thrall", x = 32.2, y = 37.8 },
        objectives = {
            { type = "talk", name = "Thrall", spawns = {{32.2, 37.8}} },
        }
    },
    
    [4724] = { -- The Champion of the Horde
        name = "The Champion of the Horde",
        zone = "Burning Steppes",
        start = { npc = "Thrall", x = 32.2, y = 37.8 },
        objectives = {
            { type = "talk", name = "Rexxar", spawns = {{48.5, 8.2}} },
        }
    },
    
    -- ===== Kibler's Exotic Pets Quests =====
    
    [4729] = { -- Kibler's Exotic Pets
        name = "Kibler's Exotic Pets",
        zone = "Burning Steppes",
        start = { npc = "Kibler", x = 66.5, y = 22.5 },
        objectives = {
            { type = "item", name = "Worg Pup", spawns = {{40.5, 52.8}} },
        }
    },
    
    [4866] = { -- En-Ay-Es-Tee-Why
        name = "En-Ay-Es-Tee-Why",
        zone = "Burning Steppes",
        start = { npc = "Kibler", x = 66.5, y = 22.5 },
        objectives = {
            { type = "item", name = "Smolderweb Egg", spawns = {{45.5, 55.8}} },
        }
    },
    
    -- ===== UBRS/LBRS Attunement Chain =====
    
    [4741] = { -- Seal of Ascension
        name = "Seal of Ascension",
        zone = "Burning Steppes",
        start = { npc = "Vaelan", x = 36.5, y = 56.2 },
        objectives = {
            { type = "item", name = "Gemstone of Smolderthorn", spawns = {{42.5, 55.8}} },
            { type = "item", name = "Gemstone of Spirestone", spawns = {{45.5, 52.2}} },
            { type = "item", name = "Gemstone of Bloodaxe", spawns = {{48.5, 58.5}} },
        }
    },
    
    [4742] = { -- The Unadorned Seal of Ascension
        name = "The Unadorned Seal of Ascension",
        zone = "Burning Steppes",
        start = { npc = "Vaelan", x = 36.5, y = 56.2 },
        objectives = {
            { type = "kill", name = "Emberstrife", spawns = {{36.2, 58.5}} },
        }
    },
    
    [4865] = { -- General Drakkisath's Command
        name = "General Drakkisath's Command",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "kill", name = "General Drakkisath", spawns = {{36.5, 56.5}} },
        }
    },
    
    -- ===== Dragonkin / Black Dragonflight Quests =====
    
    [4764] = { -- Draconic for Dummies
        name = "Draconic for Dummies",
        zone = "Burning Steppes",
        start = { npc = "Lexlort", x = 65.8, y = 23.5 },
        objectives = {
            { type = "item", name = "Draconic for Dummies", spawns = {
                {24.5, 35.2}, {25.8, 33.5}, {23.2, 36.8}
            }},
        }
    },
    
    [4768] = { -- Blackhand's Command
        name = "Blackhand's Command",
        zone = "Burning Steppes",
        start = { npc = "Scarshield Quartermaster", x = 36.5, y = 56.2 },
        objectives = {
            { type = "item", name = "Blackhand's Command", spawns = {{36.2, 55.8}} },
        }
    },
    
    [4903] = { -- Maxwell's Mission
        name = "Maxwell's Mission",
        zone = "Burning Steppes",
        start = { npc = "Marshal Maxwell", x = 85.0, y = 68.5 },
        objectives = {
            { type = "escort", name = "Marshal Windsor", spawns = {{36.5, 56.8}} },
        }
    },
    
    [4941] = { -- The Dragon's Eye
        name = "The Dragon's Eye",
        zone = "Burning Steppes",
        start = { npc = "Warlord Goretooth", x = 65.5, y = 22.5 },
        objectives = {
            { type = "item", name = "Unforged Seal of Ascension", spawns = {{36.5, 56.2}} },
        }
    },
    
    -- ===== Firegut Ogre / Blackrock Quests =====
    
    [4981] = { -- Operative Bijou
        name = "Operative Bijou",
        zone = "Burning Steppes",
        start = { npc = "Lexlort", x = 65.8, y = 23.5 },
        objectives = {
            { type = "talk", name = "Bijou", spawns = {{36.2, 55.5}} },
        }
    },
    
    [4982] = { -- Bijou's Belongings
        name = "Bijou's Belongings",
        zone = "Burning Steppes",
        start = { npc = "Bijou", x = 36.2, y = 55.5 },
        objectives = {
            { type = "item", name = "Bijou's Belongings", spawns = {{40.5, 56.8}} },
        }
    },
    
    [4983] = { -- Bijou's Reconnaissance Report
        name = "Bijou's Reconnaissance Report",
        zone = "Burning Steppes",
        start = { npc = "Bijou", x = 36.2, y = 55.5 },
        objectives = {
            { type = "talk", name = "Warlord Goretooth", spawns = {{65.5, 22.5}} },
        }
    },
    
    -----------------------------------------
    -- Silithus Quests (55-60)
    -----------------------------------------
    
    -- ===== Cenarion Hold Quests =====
    
    [8280] = { -- Wanted - Deathclasp, Terror of the Sands
        name = "Wanted - Deathclasp, Terror of the Sands",
        zone = "Silithus",
        start = { npc = "Wanted Poster", x = 50.5, y = 36.2 },
        objectives = {
            { type = "kill", name = "Deathclasp", spawns = {{50.8, 77.5}} },
        }
    },
    
    [8275] = { -- The Twilight Mystery
        name = "The Twilight Mystery",
        zone = "Silithus",
        start = { npc = "Geologist Larksbane", x = 53.5, y = 35.5 },
        objectives = {
            { type = "item", name = "Twilight Tablet Fragment", spawns = {
                {32.5, 17.2}, {33.8, 15.5}, {31.2, 18.8}, {34.5, 16.1}
            }},
        }
    },
    
    [8276] = { -- The Deserter
        name = "The Deserter",
        zone = "Silithus",
        start = { npc = "Geologist Larksbane", x = 53.5, y = 35.5 },
        objectives = {
            { type = "talk", name = "Hermit Ortell", spawns = {{68.5, 62.8}} },
        }
    },
    
    [8279] = { -- Twilight Geolords
        name = "Twilight Geolords",
        zone = "Silithus",
        start = { npc = "Geologist Larksbane", x = 53.5, y = 35.5 },
        objectives = {
            { type = "kill", name = "Twilight Geolord", spawns = {
                {25.5, 22.2}, {26.8, 20.5}, {24.2, 23.8}, {27.5, 21.1}
            }},
        }
    },
    
    [8281] = { -- The Twilight Lexicon
        name = "The Twilight Lexicon",
        zone = "Silithus",
        start = { npc = "Hermit Ortell", x = 68.5, y = 62.8 },
        objectives = {
            { type = "item", name = "Twilight Lexicon - Chapter 1", spawns = {{29.5, 86.2}} },
            { type = "item", name = "Twilight Lexicon - Chapter 2", spawns = {{22.5, 14.8}} },
            { type = "item", name = "Twilight Lexicon - Chapter 3", spawns = {{36.5, 30.2}} },
        }
    },
    
    -- ===== Windcaller Proudhorn Quests =====
    
    [8348] = { -- Secret Communication
        name = "Secret Communication",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "item", name = "Encrypted Twilight Text", spawns = {
                {28.5, 18.2}, {29.8, 16.5}, {27.2, 19.8}, {30.5, 17.1}
            }},
        }
    },
    
    [8352] = { -- The Calling
        name = "The Calling",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "kill", name = "Twilight Prophet", spawns = {
                {33.5, 28.2}, {34.8, 26.5}, {32.2, 29.8}, {35.5, 27.1}
            }},
        }
    },
    
    [8353] = { -- Signet of the Dukes
        name = "Signet of the Dukes",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "kill", name = "Twilight Overlord", spawns = {
                {35.5, 25.2}, {36.8, 23.5}, {34.2, 26.8}, {37.5, 24.1}
            }},
        }
    },
    
    -- ===== Commander Mar'alith Quests =====
    
    [8349] = { -- Deadly Desert Venom
        name = "Deadly Desert Venom",
        zone = "Silithus",
        start = { npc = "Commander Mar'alith", x = 49.5, y = 34.0 },
        objectives = {
            { type = "kill", name = "Sand Skitterer", spawns = {
                {54.5, 82.2}, {55.8, 80.5}, {53.2, 83.8}, {56.5, 81.1}
            }},
        }
    },
    
    [8350] = { -- Noggle's Last Hope
        name = "Noggle's Last Hope",
        zone = "Silithus",
        start = { npc = "Noggle Ficklespragg", x = 55.8, y = 36.5 },
        objectives = {
            { type = "item", name = "Stonelash Pincer", spawns = {
                {45.5, 85.2}, {46.8, 83.5}, {44.2, 86.8}, {47.5, 84.1}
            }},
        }
    },
    
    [8351] = { -- March of the Silithid
        name = "March of the Silithid",
        zone = "Silithus",
        start = { npc = "Commander Mar'alith", x = 49.5, y = 34.0 },
        objectives = {
            { type = "talk", name = "Hive'Zora", spawns = {{28.5, 56.8}} },
            { type = "talk", name = "Hive'Ashi", spawns = {{56.5, 24.8}} },
            { type = "talk", name = "Hive'Regal", spawns = {{67.5, 72.5}} },
        }
    },
    
    -- ===== Silithid Hive Quests =====
    
    [1126] = { -- Brood of Nozdormu
        name = "Brood of Nozdormu",
        zone = "Silithus",
        start = { npc = "Baristolth of the Shifting Sands", x = 51.5, y = 38.2 },
        objectives = {
            { type = "talk", name = "Anachronos", spawns = {{65.5, 50.8}} },
        }
    },
    
    [8285] = { -- Securing the Supply Lines
        name = "Securing the Supply Lines",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "kill", name = "Hive'Ashi Worker", spawns = {
                {58.5, 22.2}, {59.8, 20.5}, {57.2, 23.8}, {60.5, 21.1}
            }},
            { type = "kill", name = "Hive'Ashi Defender", spawns = {
                {60.5, 18.2}, {61.8, 16.5}, {59.2, 19.8}, {62.5, 17.1}
            }},
        }
    },
    
    [8287] = { -- Report to General Kirika
        name = "Report to General Kirika",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "talk", name = "General Kirika", spawns = {{53.5, 33.2}} },
        }
    },
    
    [8288] = { -- Hive in the Tower
        name = "Hive in the Tower",
        zone = "Silithus",
        start = { npc = "General Kirika", x = 53.5, y = 33.2 },
        objectives = {
            { type = "item", name = "Hive'Regal Rubbing", spawns = {{65.5, 70.8}} },
        }
    },
    
    [8289] = { -- Umber, Archivist
        name = "Umber, Archivist",
        zone = "Silithus",
        start = { npc = "Rutgar Glyphshaper", x = 52.8, y = 36.8 },
        objectives = {
            { type = "talk", name = "Umber", spawns = {{61.5, 51.2}} },
        }
    },
    
    -- ===== Twilight's Hammer Quests =====
    
    [8314] = { -- Twilight Trappings
        name = "Twilight Trappings",
        zone = "Silithus",
        start = { npc = "Geologist Larksbane", x = 53.5, y = 35.5 },
        objectives = {
            { type = "item", name = "Twilight Trappings", spawns = {
                {30.5, 20.2}, {31.8, 18.5}, {29.2, 21.8}, {32.5, 19.1}
            }},
        }
    },
    
    [8315] = { -- Twilight Research
        name = "Twilight Research",
        zone = "Silithus",
        start = { npc = "Geologist Larksbane", x = 53.5, y = 35.5 },
        objectives = {
            { type = "item", name = "Twilight Research Log", spawns = {{28.5, 22.8}} },
        }
    },
    
    [8316] = { -- The Twilight Cultists
        name = "The Twilight Cultists",
        zone = "Silithus",
        start = { npc = "Aurel Goldleaf", x = 51.5, y = 39.2 },
        objectives = {
            { type = "kill", name = "Twilight Avenger", spawns = {
                {26.5, 20.2}, {27.8, 18.5}, {25.2, 21.8}, {28.5, 19.1}
            }},
        }
    },
    
    [8323] = { -- Abyssal Signets
        name = "Abyssal Signets",
        zone = "Silithus",
        start = { npc = "Huum Wildmane", x = 50.5, y = 36.8 },
        objectives = {
            { type = "item", name = "Abyssal Signet", spawns = {
                {24.5, 18.2}, {25.8, 16.5}, {23.2, 19.8}, {26.5, 17.1}
            }},
        }
    },
    
    [8331] = { -- Scepter of the Council
        name = "Scepter of the Council",
        zone = "Silithus",
        start = { npc = "Baristolth of the Shifting Sands", x = 51.5, y = 38.2 },
        objectives = {
            { type = "item", name = "Proxy of Nozdormu", spawns = {{65.5, 50.5}} },
        }
    },
    
    -- ===== AQ Prep / War Effort Quests =====
    
    [8743] = { -- Imperial Qiraji Regalia
        name = "Imperial Qiraji Regalia",
        zone = "Silithus",
        start = { npc = "Windcaller Proudhorn", x = 49.5, y = 36.0 },
        objectives = {
            { type = "item", name = "Imperial Qiraji Regalia", spawns = {{42.5, 50.8}} },
        }
    },
    
    [8788] = { -- Carapace of the Old God
        name = "Carapace of the Old God",
        zone = "Silithus",
        start = { npc = "Anachronos", x = 65.5, y = 50.8 },
        objectives = {
            { type = "kill", name = "C'Thun", spawns = {{42.5, 50.5}} },
        }
    },
    
    [8801] = { -- The Path of the Conqueror
        name = "The Path of the Conqueror",
        zone = "Silithus",
        start = { npc = "Kandrostrasz", x = 50.2, y = 36.5 },
        objectives = {
            { type = "item", name = "Imperial Qiraji Armaments", spawns = {{42.5, 50.8}} },
        }
    },
    
    [8802] = { -- The Path of the Invoker
        name = "The Path of the Invoker",
        zone = "Silithus",
        start = { npc = "Kandrostrasz", x = 50.2, y = 36.5 },
        objectives = {
            { type = "item", name = "Imperial Qiraji Regalia", spawns = {{42.5, 50.8}} },
        }
    },
    
    -----------------------------------------
    -- DUNGEON QUESTS
    -----------------------------------------
    
    -- ===== THE DEADMINES =====
    
    [166] = { -- Collecting Memories
        name = "Collecting Memories",
        zone = "The Deadmines",
        start = { npc = "Wilder Thistlenettle", x = 42.5, y = 72.2 }, -- Stormwind
        objectives = {
            { type = "item", name = "Miners' Union Card", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [167] = { -- Oh Brother...
        name = "Oh Brother...",
        zone = "The Deadmines",
        start = { npc = "Wilder Thistlenettle", x = 42.5, y = 72.2 }, -- Stormwind
        objectives = {
            { type = "item", name = "Thistlenettle's Badge", spawns = {{0, 0}} },
        }
    },
    
    [214] = { -- Red Silk Bandanas
        name = "Red Silk Bandanas",
        zone = "The Deadmines",
        start = { npc = "Scout Riell", x = 56.3, y = 47.5 }, -- Sentinel Hill
        objectives = {
            { type = "item", name = "Red Silk Bandana", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [168] = { -- The Unsent Letter
        name = "The Unsent Letter",
        zone = "The Deadmines",
        start = { npc = "Edwin VanCleef", x = 0, y = 0 }, -- Drops from VanCleef
        objectives = {
            { type = "talk", name = "Mathias Shaw", spawns = {{76.0, 59.8}} }, -- Stormwind
        }
    },
    
    [2040] = { -- The Defias Brotherhood (Part 6 - Final)
        name = "The Defias Brotherhood",
        zone = "The Deadmines",
        start = { npc = "Gryan Stoutmantle", x = 56.3, y = 47.5 }, -- Sentinel Hill
        objectives = {
            { type = "kill", name = "Edwin VanCleef", spawns = {{0, 0}} },
            { type = "item", name = "Head of VanCleef", spawns = {{0, 0}} },
        }
    },
    
    [2041] = { -- Underground Assault
        name = "Underground Assault",
        zone = "The Deadmines",
        start = { npc = "Shoni the Shilent", x = 55.5, y = 12.5 }, -- Ironforge
        objectives = {
            { type = "item", name = "Gnoam Sprecklesprocket", spawns = {{0, 0}} },
        }
    },
    
    [373] = { -- The Defias Hideout
        name = "The Defias Hideout",
        zone = "The Deadmines",
        start = { npc = "Quartermaster Lewis", x = 57.5, y = 45.5 },
        objectives = {
            { type = "kill", name = "Rhahk'Zor", spawns = {{0, 0}} },
            { type = "kill", name = "Sneed", spawns = {{0, 0}} },
            { type = "kill", name = "Gilnid", spawns = {{0, 0}} },
        }
    },
    
    [1654] = { -- The Test of Righteousness (Paladin)
        name = "The Test of Righteousness",
        zone = "The Deadmines",
        start = { npc = "Jordan Stilwell", x = 52.5, y = 36.8 }, -- Ironforge
        objectives = {
            { type = "item", name = "Whitestone Oak Lumber", spawns = {{0, 0}} },
        }
    },
    
    [2359] = { -- Mathias and the Defias
        name = "Mathias and the Defias",
        zone = "The Deadmines",
        start = { npc = "Mathias Shaw", x = 76.0, y = 59.8 },
        objectives = {
            { type = "kill", name = "Edwin VanCleef", spawns = {{0, 0}} },
        }
    },
    
    -- ===== WAILING CAVERNS =====
    
    [1486] = { -- Deviate Hides
        name = "Deviate Hides",
        zone = "Wailing Caverns",
        start = { npc = "Nalpak", x = 47.2, y = 36.8 }, -- Entrance
        objectives = {
            { type = "item", name = "Deviate Hide", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [962] = { -- Serpentbloom
        name = "Serpentbloom",
        zone = "Wailing Caverns",
        start = { npc = "Apothecary Zamah", x = 22.5, y = 21.5 }, -- Thunder Bluff
        objectives = {
            { type = "item", name = "Serpentbloom", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [914] = { -- Leaders of the Fang
        name = "Leaders of the Fang",
        zone = "Wailing Caverns",
        start = { npc = "Nara Wildmane", x = 75.5, y = 31.2 }, -- Thunder Bluff
        objectives = {
            { type = "kill", name = "Lord Cobrahn", spawns = {{0, 0}} },
            { type = "kill", name = "Lord Pythas", spawns = {{0, 0}} },
            { type = "kill", name = "Lord Anacondra", spawns = {{0, 0}} },
            { type = "kill", name = "Lord Serpentis", spawns = {{0, 0}} },
        }
    },
    
    [1487] = { -- Deviate Eradication
        name = "Deviate Eradication",
        zone = "Wailing Caverns",
        start = { npc = "Ebru", x = 47.1, y = 36.6 }, -- Entrance
        objectives = {
            { type = "kill", name = "Deviate Ravager", spawns = {{0, 0}} },
            { type = "kill", name = "Deviate Viper", spawns = {{0, 0}} },
            { type = "kill", name = "Deviate Shambler", spawns = {{0, 0}} },
        }
    },
    
    [959] = { -- Trouble at the Docks
        name = "Trouble at the Docks",
        zone = "Wailing Caverns",
        start = { npc = "Crane Operator Bigglefuzz", x = 62.8, y = 36.5 }, -- Ratchet
        objectives = {
            { type = "kill", name = "Mad Magglish", spawns = {{0, 0}} },
            { type = "item", name = "99-Year-Old Port", spawns = {{0, 0}} },
        }
    },
    
    [1491] = { -- Smart Drinks
        name = "Smart Drinks",
        zone = "Wailing Caverns",
        start = { npc = "Mebok Mizzyrix", x = 62.5, y = 37.2 }, -- Ratchet
        objectives = {
            { type = "item", name = "Wailing Essence", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [3370] = { -- The Glowing Shard
        name = "The Glowing Shard",
        zone = "Wailing Caverns",
        start = { npc = "Mutanus the Devourer", x = 0, y = 0 },
        objectives = {
            { type = "talk", name = "Falla Sagewind", x = 47.0, y = 36.8 },
        }
    },
    
    -- ===== SHADOWFANG KEEP =====
    
    [1014] = { -- Arugal Must Die
        name = "Arugal Must Die",
        zone = "Shadowfang Keep",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 }, -- Sepulcher
        objectives = {
            { type = "kill", name = "Archmage Arugal", spawns = {{0, 0}} },
            { type = "item", name = "Head of Arugal", spawns = {{0, 0}} },
        }
    },
    
    [1740] = { -- Deathstalkers in Shadowfang
        name = "Deathstalkers in Shadowfang",
        zone = "Shadowfang Keep",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 }, -- Sepulcher
        objectives = {
            { type = "talk", name = "Deathstalker Adamant", spawns = {{0, 0}} },
            { type = "talk", name = "Deathstalker Vincent", spawns = {{0, 0}} },
        }
    },
    
    [1013] = { -- The Book of Ur
        name = "The Book of Ur",
        zone = "Shadowfang Keep",
        start = { npc = "Keeper Bel'dugur", x = 63.8, y = 47.2 }, -- Undercity
        objectives = {
            { type = "item", name = "The Book of Ur", spawns = {{0, 0}} },
        }
    },
    
    [1098] = { -- The Orb of Soran'ruk (Warlock)
        name = "The Orb of Soran'ruk",
        zone = "Shadowfang Keep",
        start = { npc = "Doan Karhan", x = 49.2, y = 57.5 }, -- The Barrens
        objectives = {
            { type = "item", name = "Soran'ruk Fragment", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [1886] = { -- Pyrewood Ambush
        name = "Pyrewood Ambush",
        zone = "Shadowfang Keep",
        start = { npc = "Deathstalker Faerleia", x = 43.5, y = 41.0 },
        objectives = {
            { type = "kill", name = "Pyrewood Elder", spawns = {{44.8, 68.5}} },
        }
    },
    
    [1920] = { -- Supplying the Sepulcher
        name = "Supplying the Sepulcher",
        zone = "Shadowfang Keep",
        start = { npc = "High Executor Hadrec", x = 43.5, y = 40.5 },
        objectives = {
            { type = "item", name = "Crate of Lightforge Ingots", spawns = {{0, 0}} },
        }
    },
    
    -- ===== SCARLET MONASTERY =====
    
    [1048] = { -- In the Name of the Light
        name = "In the Name of the Light",
        zone = "Scarlet Monastery",
        start = { npc = "Raleigh the Devout", x = 51.5, y = 58.5 }, -- Southshore
        objectives = {
            { type = "kill", name = "High Inquisitor Whitemane", spawns = {{0, 0}} },
            { type = "kill", name = "Scarlet Commander Mograine", spawns = {{0, 0}} },
            { type = "kill", name = "Herod", spawns = {{0, 0}} },
            { type = "kill", name = "Houndmaster Loksey", spawns = {{0, 0}} },
        }
    },
    
    [1051] = { -- Hearts of Zeal
        name = "Hearts of Zeal",
        zone = "Scarlet Monastery",
        start = { npc = "Master Apothecary Faranell", x = 48.5, y = 69.2 }, -- Undercity
        objectives = {
            { type = "item", name = "Heart of Zeal", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [1049] = { -- Into the Scarlet Monastery
        name = "Into the Scarlet Monastery",
        zone = "Scarlet Monastery",
        start = { npc = "Varimathras", x = 56.3, y = 92.0 }, -- Undercity
        objectives = {
            { type = "item", name = "Whitemane's Chapeau", spawns = {{0, 0}} },
            { type = "item", name = "Mograine's Might", spawns = {{0, 0}} },
            { type = "item", name = "Sword of Interrogation", spawns = {{0, 0}} },
            { type = "item", name = "Herod's Shoulder", spawns = {{0, 0}} },
        }
    },
    
    [1113] = { -- Test of Lore (Part 5)
        name = "Test of Lore",
        zone = "Scarlet Monastery",
        start = { npc = "Parqual Fintallas", x = 57.0, y = 65.5 }, -- Undercity
        objectives = {
            { type = "item", name = "Beginnings of the Undead Threat", spawns = {{0, 0}} },
        }
    },
    
    [1160] = { -- Compendium of the Fallen
        name = "Compendium of the Fallen",
        zone = "Scarlet Monastery",
        start = { npc = "Sage Truthseeker", x = 35.0, y = 28.5 }, -- Thunder Bluff
        objectives = {
            { type = "item", name = "Compendium of the Fallen", spawns = {{0, 0}} },
        }
    },
    
    [1050] = { -- Mythology of the Titans
        name = "Mythology of the Titans",
        zone = "Scarlet Monastery",
        start = { npc = "Librarian Mae Paledust", x = 74.8, y = 12.5 }, -- Ironforge
        objectives = {
            { type = "item", name = "Mythology of the Titans", spawns = {{0, 0}} },
        }
    },
    
    [1053] = { -- Down the Scarlet Path
        name = "Down the Scarlet Path",
        zone = "Scarlet Monastery",
        start = { npc = "Brother Anton", x = 51.0, y = 58.2 }, -- Southshore
        objectives = {
            { type = "kill", name = "Scarlet Champion", spawns = {{0, 0}} },
            { type = "kill", name = "Scarlet Centurion", spawns = {{0, 0}} },
        }
    },
    
    [1052] = { -- Horde/Alliance Ritual (Corrupted Ashbringer event)
        name = "Rituals of Power",
        zone = "Scarlet Monastery",
        start = { npc = "Tabitha", x = 79.0, y = 76.0 }, -- Dustwallow
        objectives = {
            { type = "item", name = "Book of Rituals", spawns = {{0, 0}} },
        }
    },
    
    -- ===== ZUL'FARRAK =====
    
    [2768] = { -- Troll Temper
        name = "Troll Temper",
        zone = "Zul'Farrak",
        start = { npc = "Trenton Lighthammer", x = 51.5, y = 28.6 }, -- Gadgetzan
        objectives = {
            { type = "item", name = "Troll Temper", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [2770] = { -- Divino-matic Rod
        name = "Divino-matic Rod",
        zone = "Zul'Farrak",
        start = { npc = "Chief Engineer Bilgewhizzle", x = 52.5, y = 28.0 }, -- Gadgetzan
        objectives = {
            { type = "item", name = "Divino-matic Rod", spawns = {{0, 0}} },
            { type = "kill", name = "Sergeant Bly", spawns = {{0, 0}} },
        }
    },
    
    [2936] = { -- Nekrum's Medallion
        name = "Nekrum's Medallion",
        zone = "Zul'Farrak",
        start = { npc = "Thadius Grimshade", x = 66.0, y = 21.5 }, -- Blasted Lands
        objectives = {
            { type = "kill", name = "Nekrum Gutchewer", spawns = {{0, 0}} },
            { type = "item", name = "Nekrum's Medallion", spawns = {{0, 0}} },
        }
    },
    
    [3527] = { -- The Prophecy of Mosh'aru
        name = "The Prophecy of Mosh'aru",
        zone = "Zul'Farrak",
        start = { npc = "Yeh'kinya", x = 66.8, y = 22.5 }, -- Tanaris
        objectives = {
            { type = "item", name = "First Mosh'aru Tablet", spawns = {{0, 0}} },
            { type = "item", name = "Second Mosh'aru Tablet", spawns = {{0, 0}} },
        }
    },
    
    [2865] = { -- Gahz'rilla
        name = "Gahz'rilla",
        zone = "Zul'Farrak",
        start = { npc = "Wizzle Brassbolts", x = 77.0, y = 77.0 }, -- Shimmering Flats
        objectives = {
            { type = "kill", name = "Gahz'rilla", spawns = {{0, 0}} },
            { type = "item", name = "Gahz'rilla Scale", spawns = {{0, 0}} },
        }
    },
    
    [2846] = { -- Scarab Shells
        name = "Scarab Shells",
        zone = "Zul'Farrak",
        start = { npc = "Tran'rek", x = 51.5, y = 26.8 }, -- Gadgetzan
        objectives = {
            { type = "item", name = "Uncracked Scarab Shell", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    -- ===== MARAUDON =====
    
    [7070] = { -- Legends of Maraudon
        name = "Legends of Maraudon",
        zone = "Maraudon",
        start = { npc = "Cavindra", x = 29.5, y = 62.5 }, -- Outside Maraudon
        objectives = {
            { type = "item", name = "Celebrian Rod", spawns = {{0, 0}} },
            { type = "item", name = "Celebrian Diamond", spawns = {{0, 0}} },
        }
    },
    
    [7041] = { -- The Pariah's Instructions
        name = "The Pariah's Instructions",
        zone = "Maraudon",
        start = { npc = "Centaur Pariah", x = 45.5, y = 86.8 }, -- Desolace
        objectives = {
            { type = "item", name = "Amulet of Union", spawns = {{0, 0}} },
        }
    },
    
    [7044] = { -- Corruption of Earth and Seed
        name = "Corruption of Earth and Seed",
        zone = "Maraudon",
        start = { npc = "Keeper Marandis", x = 63.5, y = 10.5 }, -- Desolace
        objectives = {
            { type = "kill", name = "Princess Theradras", spawns = {{0, 0}} },
        }
    },
    
    [7028] = { -- Shadowshard Fragments
        name = "Shadowshard Fragments",
        zone = "Maraudon",
        start = { npc = "Archmage Xylem", x = 29.5, y = 40.5 }, -- Azshara
        objectives = {
            { type = "item", name = "Shadowshard Fragment", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [7029] = { -- Vyletongue Corruption
        name = "Vyletongue Corruption",
        zone = "Maraudon",
        start = { npc = "Talendria", x = 65.0, y = 8.5 }, -- Nijel's Point
        objectives = {
            { type = "item", name = "Vylestem Vines", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    -- ===== STRATHOLME =====
    
    [5212] = { -- Houses of the Holy
        name = "Houses of the Holy",
        zone = "Stratholme",
        start = { npc = "Leonid Barthalomew the Revered", x = 80.5, y = 58.0 }, -- Light's Hope Chapel
        objectives = {
            { type = "item", name = "Holy Water", spawns = {{0, 0}, {0, 0}, {0, 0}} },
        }
    },
    
    [5243] = { -- The Archivist
        name = "The Archivist",
        zone = "Stratholme",
        start = { npc = "Duke Nicholas Zverenhoff", x = 81.5, y = 59.5 },
        objectives = {
            { type = "kill", name = "Archivist Galford", spawns = {{0, 0}} },
        }
    },
    
    [5214] = { -- Of Love and Family
        name = "Of Love and Family",
        zone = "Stratholme",
        start = { npc = "Artist Renfray", x = 65.5, y = 75.5 }, -- Caer Darrow
        objectives = {
            { type = "item", name = "Ysida's Locket", spawns = {{0, 0}} },
        }
    },
    
    [5848] = { -- The Active Agent
        name = "The Active Agent",
        zone = "Stratholme",
        start = { npc = "Betina Bigglezink", x = 81.0, y = 59.5 }, -- Light's Hope
        objectives = {
            { type = "item", name = "Scourge Data", spawns = {{0, 0}} },
        }
    },
    
    [5282] = { -- The Great Fras Siabi
        name = "The Great Fras Siabi",
        zone = "Stratholme",
        start = { npc = "Smokey LaRue", x = 80.5, y = 58.8 },
        objectives = {
            { type = "item", name = "Siabi's Premium Tobacco", spawns = {{0, 0}} },
        }
    },
    
    [5463] = { -- Menethil's Gift
        name = "Menethil's Gift",
        zone = "Stratholme",
        start = { npc = "Anthion Harmon", x = 26.5, y = 74.8 },
        objectives = {
            { type = "kill", name = "Baron Rivendare", spawns = {{0, 0}} },
            { type = "item", name = "Aurius's Reckoning", spawns = {{0, 0}} },
        }
    },
    
    [5848] = { -- Dead Man's Plea (45-min Baron run)
        name = "Dead Man's Plea",
        zone = "Stratholme",
        start = { npc = "Anthion Harmon", x = 26.5, y = 74.8 },
        objectives = {
            { type = "talk", name = "Ysida Harmon", spawns = {{0, 0}} },
        }
    },
    
    -- ===== SCHOLOMANCE =====
    
    [5382] = { -- Barov Family Fortune (Alliance)
        name = "Barov Family Fortune",
        zone = "Scholomance",
        start = { npc = "Weldon Barov", x = 43.5, y = 83.5 }, -- WPL Chillwind
        objectives = {
            { type = "item", name = "The Deed to Caer Darrow", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Brill", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Tarren Mill", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Southshore", spawns = {{0, 0}} },
        }
    },
    
    [5343] = { -- Barov Family Fortune (Horde)
        name = "Barov Family Fortune",
        zone = "Scholomance",
        start = { npc = "Alexi Barov", x = 83.5, y = 72.0 }, -- Bulwark
        objectives = {
            { type = "item", name = "The Deed to Caer Darrow", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Brill", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Tarren Mill", spawns = {{0, 0}} },
            { type = "item", name = "The Deed to Southshore", spawns = {{0, 0}} },
        }
    },
    
    [5384] = { -- Doctor Theolen Krastinov, the Butcher
        name = "Doctor Theolen Krastinov, the Butcher",
        zone = "Scholomance",
        start = { npc = "Eva Sarkhoff", x = 70.2, y = 73.0 },
        objectives = {
            { type = "kill", name = "Doctor Theolen Krastinov", spawns = {{0, 0}} },
        }
    },
    
    [5466] = { -- Krastinov's Bag of Horrors
        name = "Krastinov's Bag of Horrors",
        zone = "Scholomance",
        start = { npc = "Eva Sarkhoff", x = 70.2, y = 73.0 },
        objectives = {
            { type = "item", name = "Krastinov's Bag of Horrors", spawns = {{0, 0}} },
        }
    },
    
    [5381] = { -- Kirtonos the Herald
        name = "Kirtonos the Herald",
        zone = "Scholomance",
        start = { npc = "Eva Sarkhoff", x = 70.2, y = 73.0 },
        objectives = {
            { type = "kill", name = "Kirtonos the Herald", spawns = {{0, 0}} },
        }
    },
    
    [5529] = { -- The Lich, Ras Frostwhisper
        name = "The Lich, Ras Frostwhisper",
        zone = "Scholomance",
        start = { npc = "Magistrate Marduke", x = 70.5, y = 72.8 },
        objectives = {
            { type = "kill", name = "Ras Frostwhisper", spawns = {{0, 0}} },
            { type = "item", name = "Ras's Head", spawns = {{0, 0}} },
        }
    },
    
    [5341] = { -- Plagued Hatchlings
        name = "Plagued Hatchlings",
        zone = "Scholomance",
        start = { npc = "Betina Bigglezink", x = 81.0, y = 59.5 },
        objectives = {
            { type = "kill", name = "Plagued Hatchling", spawns = {{0, 0}} },
        }
    },
    
    -- ===== BLACKROCK DEPTHS =====
    
    [4123] = { -- The Heart of the Mountain
        name = "The Heart of the Mountain",
        zone = "Blackrock Depths",
        start = { npc = "Maxwort Uberglint", x = 21.5, y = 47.5 }, -- Burning Steppes
        objectives = {
            { type = "item", name = "Heart of the Mountain", spawns = {{0, 0}} },
        }
    },
    
    [4136] = { -- Dark Iron Legacy
        name = "Dark Iron Legacy",
        zone = "Blackrock Depths",
        start = { npc = "Franclorn Forgewright", x = 37.4, y = 29.5 }, -- Blackrock Mountain (ghost)
        objectives = {
            { type = "item", name = "Shadowforge Key", spawns = {{0, 0}} },
        }
    },
    
    [4001] = { -- Marshal Windsor
        name = "Marshal Windsor",
        zone = "Blackrock Depths",
        start = { npc = "Marshal Maxwell", x = 84.5, y = 68.5 }, -- Morgan's Vigil
        objectives = {
            { type = "talk", name = "Marshal Windsor", spawns = {{0, 0}} },
        }
    },
    
    [4322] = { -- Abandoned Hope
        name = "Abandoned Hope",
        zone = "Blackrock Depths",
        start = { npc = "Marshal Windsor", x = 0, y = 0 }, -- In dungeon
        objectives = {
            { type = "talk", name = "Marshal Maxwell", spawns = {{84.5, 68.5}} },
        }
    },
    
    [4264] = { -- A Crumpled Up Note
        name = "A Crumpled Up Note",
        zone = "Blackrock Depths",
        start = { npc = "A Crumpled Up Note", x = 0, y = 0 },
        objectives = {
            { type = "talk", name = "Marshal Windsor", spawns = {{0, 0}} },
        }
    },
    
    [4282] = { -- Jail Break!
        name = "Jail Break!",
        zone = "Blackrock Depths",
        start = { npc = "Marshal Windsor", x = 0, y = 0 },
        objectives = {
            { type = "talk", name = "Marshal Maxwell", spawns = {{84.5, 68.5}} },
        }
    },
    
    [4024] = { -- Overmaster Pyron
        name = "Overmaster Pyron",
        zone = "Blackrock Depths",
        start = { npc = "Jalinda Sprig", x = 85.0, y = 69.5 },
        objectives = {
            { type = "kill", name = "Overmaster Pyron", spawns = {{0, 0}} },
        }
    },
    
    [4083] = { -- Ribbly Screwspigot
        name = "Ribbly Screwspigot",
        zone = "Blackrock Depths",
        start = { npc = "Yuka Screwspigot", x = 66.0, y = 21.5 }, -- Everlook (?)
        objectives = {
            { type = "kill", name = "Ribbly Screwspigot", spawns = {{0, 0}} },
        }
    },
    
    [4241] = { -- The Spectral Chalice
        name = "The Spectral Chalice",
        zone = "Blackrock Depths",
        start = { npc = "Gloom'rel", x = 0, y = 0 },
        objectives = {
            { type = "talk", name = "Gloom'rel", spawns = {{0, 0}} },
        }
    },
    
    [4126] = { -- Hurley Blackbreath
        name = "Hurley Blackbreath",
        zone = "Blackrock Depths",
        start = { npc = "Ragnar Thunderbrew", x = 18.8, y = 51.2 }, -- Kharanos
        objectives = {
            { type = "kill", name = "Hurley Blackbreath", spawns = {{0, 0}} },
            { type = "item", name = "Lost Thunderbrew Recipe", spawns = {{0, 0}} },
        }
    },
    
    [4201] = { -- The Last Element
        name = "The Last Element",
        zone = "Blackrock Depths",
        start = { npc = "Vivian Lagrave", x = 3.5, y = 47.5 },
        objectives = {
            { type = "item", name = "Essence of the Elements", spawns = {{0, 0}} },
        }
    },
    
    [4262] = { -- Commander Gor'shak
        name = "Commander Gor'shak",
        zone = "Blackrock Depths",
        start = { npc = "Galamav the Marksman", x = 3.3, y = 47.0 }, -- Kargath
        objectives = {
            { type = "talk", name = "Commander Gor'shak", spawns = {{0, 0}} },
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
