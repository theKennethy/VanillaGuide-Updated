--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestDatabase.lua
Authors: VanillaGuide Contributors
Version: 1.05.0
------------------------------------------------------
Description: 
    Quest ID lookup table for pfQuest integration.
    Maps quest names to their database IDs for direct
    quest tracking and objective display.
    
    Quest IDs are from the vanilla 1.12 database.
------------------------------------------------------
Usage:
    local questId = VGuideQuestDB:GetQuestId("Quest Name")
    local npcId = VGuideQuestDB:GetNpcId("NPC Name")
------------------------------------------------------
]]--

Dv(" VGuide QuestDatabase.lua Start")

VGuideQuestDB = {}

-- Quest name to Quest ID mapping
-- Format: ["Quest Name"] = questId
VGuideQuestDB.Quests = {
    -----------------------------------------
    -- Durotar (Orc/Troll Starting Zone)
    -----------------------------------------
    ["Your Place In The World"] = 4641,
    ["Cutting Teeth"] = 5441,
    ["Sarkoth"] = 780,
    ["Etched Tablet"] = 3082,  -- Warrior version, other classes have different IDs
    ["Sting of the Scorpid"] = 789,
    ["Vile Familiars"] = 792,
    ["Galgar's Cactus Apple Surprise"] = 4402,
    ["Lazy Peons"] = 5441,
    ["Burning Blade Medallion"] = 794,
    ["Thazz'ril's Pick"] = 790,
    ["Report to Sen'jin Village"] = 805,
    ["A Peon's Burden"] = 2161,
    ["Thwarting Kolkar Aggression"] = 786,
    ["A Solvent Spirit"] = 818,
    ["Practical Prey"] = 817,
    ["Minshina's Skull"] = 808,
    ["Report to Orgnil"] = 823,
    ["Zalazane"] = 826,
    ["Dark Storms"] = 806,
    ["Vanquish the Betrayers"] = 784,
    ["Encroachment"] = 837,
    ["Break a Few Eggs"] = 815,
    ["Carry Your Weight"] = 791,
    ["The Admiral's Orders"] = 830,
    ["From The Wreckage...."] = 825,
    ["Lost But Not Forgotten"] = 816,
    ["Winds in the Desert"] = 834,
    
    -----------------------------------------
    -- Mulgore (Tauren Starting Zone)
    -----------------------------------------
    ["The Hunt Begins"] = 747,
    ["A Humble Task"] = 752,
    ["A Humble Task (Part 2)"] = 753,
    ["Rite of Strength"] = 757,
    ["Rites of the Earthmother"] = 758,
    ["Rite of Vision"] = 763,
    ["Rite of Vision (Part 2)"] = 767,
    ["Rite of Wisdom"] = 768,
    ["Journey into Thunder Bluff"] = 775,
    ["Mazzranache"] = 766,
    ["Swoop Hunting"] = 761,
    ["The Battleboars"] = 780,
    ["Break Sharptusk!"] = 781,
    ["Poison Water"] = 748,
    ["Sharing the Land"] = 745,
    ["Attack on Camp Narache"] = 746,
    
    -----------------------------------------
    -- Tirisfal Glades (Undead Starting Zone)
    -----------------------------------------
    ["Rude Awakening"] = 363,
    ["The Mindless Ones"] = 364,
    ["Rattling the Rattlecages"] = 373,
    ["Marla's Last Wish"] = 374,
    ["A Rogue's Deal"] = 366,
    ["The Damned"] = 376,
    ["Night Web's Hollow"] = 380,
    ["The Scarlet Crusade"] = 381,
    ["Proof of Demise"] = 382,
    ["The Prodigal Lich"] = 383,
    ["The Prodigal Lich Returns"] = 384,
    ["Fields of Grief"] = 365,
    ["Scavenging Deathknell"] = 376,
    ["A New Plague"] = 367,
    ["A New Plague (Part 2)"] = 368,
    ["A New Plague (Part 3)"] = 369,
    ["A New Plague (Part 4)"] = 370,
    
    -----------------------------------------
    -- Elwynn Forest (Human Starting Zone)
    -----------------------------------------
    ["A Threat Within"] = 783,
    ["Kobold Camp Cleanup"] = 7,
    ["Investigate Echo Ridge"] = 15,
    ["Skirmish at Echo Ridge"] = 21,
    ["Report to Goldshire"] = 54,
    ["The Fargodeep Mine"] = 62,
    ["The Jasperlode Mine"] = 76,
    ["Gold Dust Exchange"] = 47,
    ["A Fishy Peril"] = 40,
    ["Further Concerns"] = 35,
    ["Find the Lost Guards"] = 37,
    ["Discover Rolf's Fate"] = 45,
    ["Report to Thomas"] = 71,
    ["Deliver Thomas' Report"] = 39,
    ["Cloth and Leather Armor"] = 59,
    ["Elmore's Task"] = 1097,
    ["Westbrook Garrison Needs Help!"] = 239,
    ["Riverpaw Gnoll Bounty"] = 11,
    ["Wanted: \"Hogger\""] = 176,
    ["Princess Must Die!"] = 88,
    ["Lost Necklace"] = 85,
    ["Pie for Billy"] = 86,
    ["Back to Billy"] = 84,
    ["Goldtooth"] = 87,
    
    -----------------------------------------
    -- Dun Morogh (Dwarf/Gnome Starting Zone)
    -----------------------------------------
    ["Dwarven Outfitters"] = 179,
    ["Coldridge Valley Mail Delivery"] = 233,
    ["Coldridge Valley Mail Delivery (Part 2)"] = 183,
    ["The Boar Hunter"] = 183,
    ["A New Threat"] = 170,
    ["Rockjaw Invaders"] = 182,
    ["Supplies to Tannok"] = 315,
    ["Beer Basted Boar Ribs"] = 384,
    ["The Troll Cave"] = 218,
    ["The Stolen Journal"] = 282,
    ["Senir's Observations"] = 420,
    ["Senir's Observations (Part 2)"] = 287,
    ["The Public Servant"] = 432,
    ["Those Blasted Troggs!"] = 432,
    ["The Grizzled Den"] = 313,
    ["A Refugee's Quandary"] = 3361,
    ["Protecting the Herd"] = 314,
    ["The Perfect Stout"] = 310,
    ["Shimmer Stout"] = 311,
    ["Stout to Kadrell"] = 317,
    
    -----------------------------------------
    -- Teldrassil (Night Elf Starting Zone)
    -----------------------------------------
    ["The Balance of Nature"] = 456,
    ["The Balance of Nature (Part 2)"] = 457,
    ["The Woodland Protector"] = 458,
    ["The Woodland Protector (Part 2)"] = 459,
    ["The Emerald Dreamcatcher"] = 2438,
    ["Ferocitas the Dream Eater"] = 2459,
    ["Twisted Hatred"] = 932,
    ["The Road to Darnassus"] = 487,
    ["Dolanaar Delivery"] = 2159,
    ["Zenn's Bidding"] = 488,
    ["Seek Redemption!"] = 489,
    ["Denalan's Earth"] = 997,
    ["Timberling Seeds"] = 918,
    ["Timberling Sprouts"] = 919,
    ["Rellian Greenspyre"] = 922,
    ["Tumors"] = 923,
    ["Return to Denalan"] = 2499,
    ["Oakenscowl"] = 2498,
    ["The Relics of Wakening"] = 483,
    ["Ursal the Mauler"] = 486,
    ["Crown of the Earth"] = 928,
    ["Crown of the Earth (Part 2)"] = 929,
    ["Crown of the Earth (Part 3)"] = 933,
    ["Crown of the Earth (Part 4)"] = 934,
    ["Crown of the Earth (Part 5)"] = 935,
    
    -----------------------------------------
    -- The Barrens
    -----------------------------------------
    ["Crossroads Conscription"] = 842,
    ["Plainstrider Menace"] = 844,
    ["The Forgotten Pools"] = 870,
    ["Raptor Thieves"] = 869,
    ["Wharfmaster Dizzywig"] = 1492,
    ["Supplies for the Crossroads"] = 5041,
    ["Disrupt the Attacks"] = 871,
    ["The Disruption Ends"] = 872,
    ["Altered Beings"] = 880,
    ["Hamuul Runetotem"] = 1489,
    ["Fungal Spores"] = 848,
    ["Apothecary Zamah"] = 853,
    ["Serpentbloom"] = 962,
    ["Echeyakee"] = 881,
    ["The Angry Scytheclaws"] = 905,
    ["Lost in Battle"] = 4921,
    ["Consumed by Hatred"] = 899,
    ["Centaur Bracers"] = 855,
    ["Kolkar Leaders"] = 850,
    ["Harpy Raiders"] = 867,
    ["Harpy Lieutenants"] = 875,
    ["Serena Bloodfeather"] = 876,
    ["Lakota'mani"] = 883,
    ["Stolen Silver"] = 3281,
    ["Samophlange"] = 894,
    ["Samophlange (Part 2)"] = 900,
    ["Samophlange (Part 3)"] = 901,
    ["Samophlange (Part 4)"] = 902,
    ["Wenikee Boltbucket"] = 903,
    ["Nugget Slugs"] = 1483,
    
    -----------------------------------------
    -- Silverpine Forest
    -----------------------------------------
    ["The Dead Fields"] = 437,
    ["At War With The Scarlet Crusade"] = 427,
    ["A Recipe For Death"] = 447,
    ["Journey to Hillsbrad Foothills"] = 493,
    ["Prove Your Worth"] = 421,
    ["Arugal's Folly"] = 422,
    ["Arugal's Folly (Part 2)"] = 423,
    ["Arugal's Folly (Part 3)"] = 424,
    ["Arugal's Folly (Part 4)"] = 425,
    ["Ivar the Foul"] = 430,
    ["The Rot Hides"] = 429,
    ["The Engraved Ring"] = 440,
    ["Seeking Wisdom"] = 441,
    ["The Weaver"] = 453,
    ["Border Crossings"] = 477,
    ["Maps and Runes"] = 478,
    ["Pyrewood Ambush"] = 452,
    
    -----------------------------------------
    -- Westfall
    -----------------------------------------
    ["Westfall Stew"] = 36,
    ["Westfall Stew (Part 2)"] = 38,
    ["Poor Old Blanchy"] = 151,
    ["The Killing Fields"] = 9,
    ["The People's Militia"] = 12,
    ["The People's Militia (Part 2)"] = 13,
    ["The People's Militia (Part 3)"] = 14,
    ["Red Leather Bandanas"] = 153,
    ["Patrolling Westfall"] = 64,
    ["The Defias Brotherhood"] = 65,
    ["The Defias Brotherhood (Part 2)"] = 132,
    ["The Defias Brotherhood (Part 3)"] = 135,
    ["The Defias Brotherhood (Part 4)"] = 141,
    ["The Defias Brotherhood (Part 5)"] = 142,
    ["Thunderbrew Lager"] = 116,
    ["The Collector"] = 123,
    ["Furlbrow's Deed"] = 184,
    
    -----------------------------------------
    -- Loch Modan
    -----------------------------------------
    ["Thelsamar Blood Sausages"] = 418,
    ["Rat Catching"] = 416,
    ["The Trogg Threat"] = 267,
    ["In Defense of the King's Lands"] = 217,
    ["In Defense of the King's Lands (Part 2)"] = 224,
    ["In Defense of the King's Lands (Part 3)"] = 237,
    ["A Hunter's Boast"] = 258,
    ["Powder to Ironband"] = 302,
    ["Resupplying the Excavation"] = 273,
    ["Resupplying the Excavation (Part 2)"] = 275,
    ["Protecting the Shipment"] = 309,
    ["After the Ambush"] = 454,
    ["Report to Ironforge"] = 353,
    ["Filthy Paws"] = 307,
    ["Gathering Idols"] = 436,
    ["Excavation Progress Report"] = 298,
    
    -----------------------------------------
    -- Darkshore
    -----------------------------------------
    ["Flight to Auberdine"] = 962,
    ["For Love Eternal"] = 963,
    ["Buzzbox 827"] = 983,
    ["Buzzbox 411"] = 1001,
    ["Plagued Lands"] = 2118,
    ["Cleansing of the Infected"] = 2138,
    ["The Tower of Althalaxx"] = 965,
    ["The Cliffspring River"] = 4762,
    ["Cave Mushrooms"] = 947,
    ["The Red Crystal"] = 4811,
    ["As Water Cascades"] = 4812,
    ["Bashal'Aran"] = 954,
    ["Bashal'Aran (Part 2)"] = 955,
    ["Bashal'Aran (Part 3)"] = 957,
    ["Bashal'Aran (Part 4)"] = 958,
    ["Tools of the Highborne"] = 949,
    ["The Ancient Statuette"] = 4507,
    ["Deep Ocean, Vast Sea"] = 982,
}

-- NPC name to NPC ID mapping
-- Format: ["NPC Name"] = npcId
VGuideQuestDB.NPCs = {
    -----------------------------------------
    -- Durotar NPCs
    -----------------------------------------
    ["Kaltunk"] = 3143,
    ["Gornek"] = 3145,
    ["Sarkoth"] = 3281,
    ["Zureetha Fargaze"] = 3145,
    ["Galgar"] = 3190,
    ["Foreman Thazz'ril"] = 3188,
    ["Ken'jai"] = 3665,
    ["Master Gadrin"] = 3188,
    ["Sen'jin Guardian"] = 3191,
    ["Orgnil Soulscar"] = 3142,
    ["Gar'Thok"] = 3139,
    ["Cook Torka"] = 3189,
    ["Innkeeper Grosk"] = 6928,
    
    -----------------------------------------
    -- Mulgore NPCs
    -----------------------------------------
    ["Chief Hawkwind"] = 2981,
    ["Grull Hawkwind"] = 2980,
    ["Seer Graytongue"] = 2982,
    ["Antur Fallow"] = 2984,
    ["Skorn Whitecloud"] = 3052,
    ["Mull Thunderhorn"] = 3051,
    ["Harken Windtotem"] = 3055,
    
    -----------------------------------------
    -- Tirisfal Glades NPCs
    -----------------------------------------
    ["Undertaker Mordo"] = 1568,
    ["Shadow Priest Sarvis"] = 1569,
    ["Novice Elreth"] = 1570,
    ["Deathguard Saltain"] = 1519,
    ["Executor Zygand"] = 1515,
    ["Deathguard Simmer"] = 1520,
    ["Apothecary Johaan"] = 1518,
    ["Magistrate Sevren"] = 1500,
    
    -----------------------------------------
    -- Common NPCs
    -----------------------------------------
    ["Innkeeper"] = 0,  -- Generic, varies by location
    ["Flight Master"] = 0,  -- Generic, varies by location
}

-- Zone default mappings for coordinate inference
VGuideQuestDB.ZoneDefaults = {
    ["Durotar"] = "Durotar",
    ["Valley of Trials"] = "Durotar",
    ["Razor Hill"] = "Durotar",
    ["Sen'jin Village"] = "Durotar",
    ["Mulgore"] = "Mulgore",
    ["Camp Narache"] = "Mulgore",
    ["Bloodhoof Village"] = "Mulgore",
    ["Tirisfal Glades"] = "Tirisfal Glades",
    ["Deathknell"] = "Tirisfal Glades",
    ["Brill"] = "Tirisfal Glades",
    ["Elwynn Forest"] = "Elwynn Forest",
    ["Northshire Valley"] = "Elwynn Forest",
    ["Goldshire"] = "Elwynn Forest",
    ["Dun Morogh"] = "Dun Morogh",
    ["Coldridge Valley"] = "Dun Morogh",
    ["Kharanos"] = "Dun Morogh",
    ["Teldrassil"] = "Teldrassil",
    ["Shadowglen"] = "Teldrassil",
    ["Dolanaar"] = "Teldrassil",
    ["The Barrens"] = "The Barrens",
    ["Crossroads"] = "The Barrens",
    ["Ratchet"] = "The Barrens",
    ["Westfall"] = "Westfall",
    ["Sentinel Hill"] = "Westfall",
    ["Loch Modan"] = "Loch Modan",
    ["Thelsamar"] = "Loch Modan",
    ["Darkshore"] = "Darkshore",
    ["Auberdine"] = "Darkshore",
    ["Silverpine Forest"] = "Silverpine Forest",
    ["Sepulcher"] = "Silverpine Forest",
}

-- Get quest ID by name
function VGuideQuestDB:GetQuestId(questName)
    if not questName then return nil end
    return self.Quests[questName]
end

-- Get NPC ID by name
function VGuideQuestDB:GetNpcId(npcName)
    if not npcName then return nil end
    return self.NPCs[npcName]
end

-- Get zone name from subzone
function VGuideQuestDB:GetZoneFromSubzone(subzone)
    if not subzone then return nil end
    return self.ZoneDefaults[subzone]
end

-- Add a quest to the database (for runtime additions)
function VGuideQuestDB:AddQuest(questName, questId)
    if questName and questId then
        self.Quests[questName] = questId
    end
end

-- Add an NPC to the database (for runtime additions)
function VGuideQuestDB:AddNpc(npcName, npcId)
    if npcName and npcId then
        self.NPCs[npcName] = npcId
    end
end

Dv(" VGuide QuestDatabase.lua End")
