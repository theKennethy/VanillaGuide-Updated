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
-- Format: [questId] = { name, zone, objectives[] }
VGuideQuestObjectives.Data = {

    -----------------------------------------
    -- Durotar Quests
    -----------------------------------------
    
    [4641] = { -- Your Place In The World
        name = "Your Place In The World",
        zone = "Durotar",
        objectives = {
            { type = "talk", name = "Gornek", spawns = {{42.1, 68.4}} },
        }
    },
    
    [5441] = { -- Cutting Teeth / Lazy Peons
        name = "Cutting Teeth",
        zone = "Durotar",
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
        objectives = {
            { type = "kill", name = "Sarkoth", spawns = {{40.6, 62.1}} },
        }
    },
    
    [789] = { -- Sting of the Scorpid
        name = "Sting of the Scorpid",
        zone = "Durotar",
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
        objectives = {
            { type = "kill", name = "Yarrog Baneshadow", spawns = {{44.9, 53.6}} },
        }
    },
    
    [805] = { -- Report to Sen'jin Village
        name = "Report to Sen'jin Village",
        zone = "Durotar",
        objectives = {
            { type = "talk", name = "Master Gadrin", spawns = {{55.9, 74.6}} },
        }
    },
    
    [786] = { -- Thwarting Kolkar Aggression
        name = "Thwarting Kolkar Aggression",
        zone = "Durotar",
        objectives = {
            { type = "kill", name = "Kolkar Drudge", spawns = {
                {48.5, 79.3}, {50.1, 78.2}, {49.2, 80.6}, {51.3, 79.8}
            }},
        }
    },
    
    [818] = { -- A Solvent Spirit
        name = "A Solvent Spirit",
        zone = "Durotar",
        objectives = {
            { type = "kill", name = "Minor Manifestation of Water", spawns = {
                {62.4, 79.2}, {63.1, 81.5}, {64.2, 78.8}, {61.8, 80.4}
            }},
        }
    },
    
    [826] = { -- Zalazane
        name = "Zalazane",
        zone = "Durotar",
        objectives = {
            { type = "kill", name = "Zalazane", spawns = {{67.1, 86.9}} },
        }
    },
    
    [834] = { -- Winds in the Desert
        name = "Winds in the Desert",
        zone = "Durotar",
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
        objectives = {
            { type = "kill", name = "Battleboar", spawns = {
                {50.2, 83.1}, {51.8, 81.4}, {49.5, 84.7}, {52.3, 82.8}
            }},
        }
    },
    
    [761] = { -- Swoop Hunting
        name = "Swoop Hunting",
        zone = "Mulgore",
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
        objectives = {
            { type = "kill", name = "Mazzranache", spawns = {{49.6, 55.8}} },
        }
    },
    
    [745] = { -- Sharing the Land
        name = "Sharing the Land",
        zone = "Mulgore",
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
        objectives = {
            { type = "talk", name = "Shadow Priest Sarvis", spawns = {{38.2, 56.8}} },
        }
    },
    
    [364] = { -- The Mindless Ones
        name = "The Mindless Ones",
        zone = "Tirisfal Glades",
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
        objectives = {
            { type = "talk", name = "Marshal McBride", spawns = {{48.9, 41.6}} },
        }
    },
    
    [7] = { -- Kobold Camp Cleanup
        name = "Kobold Camp Cleanup",
        zone = "Elwynn Forest",
        objectives = {
            { type = "kill", name = "Kobold Vermin", spawns = {
                {47.5, 35.8}, {48.2, 37.1}, {46.8, 34.5}, {49.1, 36.2}
            }},
        }
    },
    
    [15] = { -- Investigate Echo Ridge
        name = "Investigate Echo Ridge",
        zone = "Elwynn Forest",
        objectives = {
            { type = "kill", name = "Kobold Worker", spawns = {
                {48.8, 31.2}, {50.1, 29.8}, {47.5, 32.5}, {51.2, 30.4}
            }},
        }
    },
    
    [21] = { -- Skirmish at Echo Ridge  
        name = "Skirmish at Echo Ridge",
        zone = "Elwynn Forest",
        objectives = {
            { type = "kill", name = "Kobold Laborer", spawns = {
                {48.2, 28.5}, {49.8, 26.2}, {47.1, 30.1}, {50.5, 27.8}
            }},
        }
    },
    
    [18] = { -- Brotherhood of Thieves
        name = "Brotherhood of Thieves",
        zone = "Elwynn Forest",
        objectives = {
            { type = "kill", name = "Defias Thug", spawns = {
                {53.2, 49.1}, {54.8, 47.5}, {52.5, 50.8}, {55.1, 48.2}
            }},
        }
    },
    
    [54] = { -- Report to Goldshire
        name = "Report to Goldshire", 
        zone = "Elwynn Forest",
        objectives = {
            { type = "talk", name = "Marshal Dughan", spawns = {{42.1, 65.9}} },
        }
    },
    
    [47] = { -- Gold Dust Exchange
        name = "Gold Dust Exchange",
        zone = "Elwynn Forest",
        objectives = {
            { type = "item", name = "Gold Dust", spawns = {
                {39.8, 82.1}, {41.2, 80.5}, {38.5, 84.2}, {42.1, 81.8}
            }},
        }
    },
    
    [40] = { -- A Fishy Peril
        name = "A Fishy Peril",
        zone = "Elwynn Forest",
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
        objectives = {
            { type = "talk", name = "Tarindrella", spawns = {{57.8, 44.6}} },
        }
    },
    
    [459] = { -- The Woodland Protector (2)
        name = "The Woodland Protector",
        zone = "Teldrassil",
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
        objectives = {
            { type = "kill", name = "Ragged Young Wolf", spawns = {
                {28.2, 71.5}, {29.8, 73.2}, {27.5, 70.1}, {30.1, 72.8}
            }},
        }
    },
    
    [182] = { -- Coldridge Valley Mail Delivery
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        objectives = {
            { type = "talk", name = "Talin Keeneye", spawns = {{25.1, 75.2}} },
        }
    },
    
    [183] = { -- Coldridge Valley Mail Delivery (2)
        name = "Coldridge Valley Mail Delivery",
        zone = "Dun Morogh",
        objectives = {
            { type = "talk", name = "Grelin Whitebeard", spawns = {{24.8, 76.8}} },
        }
    },
    
    [233] = { -- Frostmane Hold
        name = "Frostmane Hold",
        zone = "Dun Morogh",
        objectives = {
            { type = "kill", name = "Frostmane Troll Whelp", spawns = {
                {19.2, 78.5}, {20.5, 76.8}, {18.1, 79.2}, {21.2, 77.5}
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
                    table.insert(results, {
                        questId = questId,
                        questName = data.name,
                        objective = obj
                    })
                end
            end
        end
    end
    return results
end

Di("      - Quest Objective DB loaded with spawn data")
