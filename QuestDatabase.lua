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
    
    -----------------------------------------
    -- Redridge Mountains
    -----------------------------------------
    ["Encroaching Gnolls"] = 20,
    ["Assessing the Threat"] = 21,
    ["A Free Lunch"] = 129,
    ["Visit the Herbalist"] = 130,
    ["Delivering Daffodils"] = 131,
    ["Blackrock Menace"] = 19,
    ["Wanted: Lieutenant Fangore"] = 180,
    ["Underbelly Scales"] = 122,
    ["Murloc Poachers"] = 150,
    ["The Price of Shoes"] = 118,
    ["Return to Verner"] = 119,
    ["Howling in the Hills"] = 126,
    ["Solomon's Law"] = 120,
    ["Selling Fish"] = 127,
    ["Messenger to Stormwind"] = 121,
    ["Messenger to Stormwind (Part 2)"] = 144,
    ["A Watchful Eye"] = 94,
    
    -----------------------------------------
    -- Stonetalon Mountains
    -----------------------------------------
    ["Warsong Supplies"] = 6543,
    ["Goblin Invaders"] = 1062,
    ["Shredding Machines"] = 1068,
    ["The Spirits of Stonetalon"] = 1064,
    ["Arachnophobia"] = 6284,
    ["Cycle of Rebirth"] = 6301,
    ["New Life"] = 6381,
    ["Gerenzo Wrenchwhistle"] = 1096,
    ["Cenarius' Legacy"] = 1087,
    
    -----------------------------------------
    -- Ashenvale
    -----------------------------------------
    ["The Zoram Strand"] = 1008,
    ["Pridewings of Stonetalon"] = 6383,
    ["Between a Rock and a Thistlefur"] = 216,
    ["Troll Charm"] = 6462,
    ["Raene's Cleansing"] = 991,
    ["The Howling Vale"] = 1022,
    ["Velinde Starsong"] = 1037,
    ["Supplies to Auberdine"] = 967,
    ["An Act of War"] = 1024,
    ["The Ashenvale Hunt"] = 6383,
    ["Satyr Horns"] = 1054,
    ["The Tower of Althalaxx"] = 965,
    ["Fallen Sky Lake"] = 1034,
    ["The Lost Chalice"] = 1038,
    
    -----------------------------------------
    -- Hillsbrad Foothills
    -----------------------------------------
    ["Time To Strike"] = 516,
    ["Battle of Hillsbrad"] = 527,
    ["Battle of Hillsbrad (Part 2)"] = 528,
    ["Battle of Hillsbrad (Part 3)"] = 529,
    ["Elixir of Suffering"] = 496,
    ["Elixir of Suffering (Part 2)"] = 499,
    ["Elixir of Pain"] = 501,
    ["Elixir of Agony"] = 509,
    ["Elixir of Agony (Part 2)"] = 513,
    ["Elixir of Agony (Part 3)"] = 515,
    ["Elixir of Agony (Part 4)"] = 517,
    ["Deadly Blunderbuss"] = 536,
    ["Humbert's Sword"] = 547,
    ["Helcular's Revenge"] = 552,
    ["Helcular's Revenge (Part 2)"] = 553,
    ["WANTED: Syndicate Personnel"] = 549,
    ["Assassin's Contract"] = 523,
    
    -----------------------------------------
    -- Thousand Needles
    -----------------------------------------
    ["Pacify the Centaur"] = 4841,
    ["Test of Endurance"] = 1150,
    ["Test of Faith"] = 1149,
    ["A Test of Mettle"] = 1151,
    ["Grimtotem Spying"] = 1148,
    ["Wind Rider"] = 4966,
    ["Alien Egg"] = 4821,
    ["Sacred Fire"] = 1193,
    ["Arikara"] = 1195,
    ["The Swarm Grows"] = 1147,
    ["Parts of the Swarm"] = 1184,
    ["Wanted - Arnak Grimtotem"] = 5147,
    ["Homeward Bound"] = 4770,
    ["Hypercapacitor Gizmo"] = 1186,
    
    -----------------------------------------
    -- Stranglethorn Vale
    -----------------------------------------
    ["The Green Hills of Stranglethorn"] = 338,
    ["Tiger Mastery"] = 185,
    ["Tiger Mastery (Part 2)"] = 186,
    ["Tiger Mastery (Part 3)"] = 187,
    ["Tiger Mastery (Part 4)"] = 188,
    ["Panther Mastery"] = 190,
    ["Panther Mastery (Part 2)"] = 191,
    ["Panther Mastery (Part 3)"] = 192,
    ["Panther Mastery (Part 4)"] = 193,
    ["Raptor Mastery"] = 194,
    ["Raptor Mastery (Part 2)"] = 195,
    ["Raptor Mastery (Part 3)"] = 196,
    ["Raptor Mastery (Part 4)"] = 197,
    ["Big Game Hunter"] = 208,
    ["Welcome to the Jungle"] = 583,
    ["Bloodscalp Ears"] = 189,
    ["Bloodscalp Insight"] = 586,
    ["Hunt for Yenniku"] = 581,
    ["Headhunting"] = 582,
    ["Mok'thardin's Enchantment"] = 570,
    ["The Defense of Grom'gol"] = 568,
    ["Special Forces"] = 574,
    ["Singing Blue Shards"] = 605,
    ["Venture Company Mining"] = 600,
    ["Skullsplitter Tusks"] = 209,
    ["Split Bone Necklace"] = 598,
    ["Troll Witchery"] = 596,
    ["Bloody Bone Necklaces"] = 596,
    ["Zanzil's Secret"] = 621,
    ["Voodoo Dues"] = 609,
    ["Water Elementals"] = 601,
    ["Excelsior"] = 628,
    
    -----------------------------------------
    -- Desolace
    -----------------------------------------
    ["Vahlarriel's Search"] = 1437,
    ["Vahlarriel's Search (Part 2)"] = 1465,
    ["Vahlarriel's Search (Part 3)"] = 1438,
    ["Gelkis Alliance"] = 1368,
    ["Stealing Supplies"] = 1369,
    ["Ongeku"] = 1382,
    ["Khan Dez'hepah"] = 1365,
    ["Centaur Bounty"] = 1366,
    ["Kodo Roundup"] = 5561,
    ["Ghost-o-plasm Round Up"] = 6134,
    ["Gizelton Caravan"] = 5943,
    ["Bone Collector"] = 5501,
    ["Shadowprey Village"] = 1459,
    ["The Karnitol Shipwreck"] = 1454,
    ["Reagents for Reclaimers Inc."] = 1458,
    
    -----------------------------------------
    -- Arathi Highlands
    -----------------------------------------
    ["Stromgarde Badges"] = 639,
    ["The Princess Trapped"] = 642,
    ["Call to Arms"] = 672,
    ["Northfold Manor"] = 640,
    ["Foul Magics"] = 675,
    ["Worth Its Weight in Gold"] = 691,
    ["Wanted! Marez Cowl"] = 654,
    ["Wanted! Otto and Falconcrest"] = 652,
    ["The Broken Sigil"] = 643,
    ["Sigil of Strom"] = 644,
    ["The Forsaken Trollbane"] = 645,
    ["Triage"] = 6622,
    ["Hints of a New Plague?"] = 658,
    
    -----------------------------------------
    -- Dustwallow Marsh
    -----------------------------------------
    ["The Theramore Docks"] = 1281,
    ["Soothing Turtle Bisque"] = 1218,
    ["Mudrock Soup and Bugs"] = 1177,
    ["Hungry!"] = 1177,
    ["Theramore Spies"] = 1205,
    ["Lieutenant Paval Reethe"] = 1252,
    ["Traitors Among Us"] = 1249,
    ["Propaganda War"] = 1220,
    ["Identifying the Brood"] = 1169,
    ["The Black Shield"] = 1253,
    ["The Black Shield (Part 2)"] = 1319,
    ["Inspecting the Ruins"] = 1284,
    ["The Deserters"] = 1285,
    ["The Deserters (Part 2)"] = 1286,
    ["Prisoners of the Grimtotems"] = 1171,
    ["Tabetha's Assistance"] = 1219,
    ["The Missing Diplomat"] = 1220,
    ["James Hyal"] = 1221,
    ["Jarl Needs Eyes"] = 1206,
    
    -----------------------------------------
    -- Badlands
    -----------------------------------------
    ["A Dwarf and His Tools"] = 716,
    ["Badlands Reagent Run"] = 705,
    ["Study of the Elements: Rock"] = 710,
    ["Mirages"] = 718,
    ["Martek the Exiled"] = 713,
    ["Barbecued Buzzard Wings"] = 703,
    ["Power Stones"] = 711,
    ["Broken Alliances"] = 793,
    ["Broken Alliances (Part 2)"] = 794,
    ["Coolant Heads Prevail"] = 713,
    ["Gyro... What?"] = 714,
    ["This Is Going to Be Hard"] = 733,
    ["Scrounging"] = 734,
    ["Murdaloc"] = 735,
    
    -----------------------------------------
    -- Tanaris
    -----------------------------------------
    ["WANTED: Caliph Scorpidsting"] = 2781,
    ["WANTED: Andre Firebeard"] = 2875,
    ["Water Pouch Bounty"] = 1707,
    ["Wastewander Justice"] = 1690,
    ["More Wastewander Justice"] = 1691,
    ["Thistleshrub Valley"] = 3362,
    ["The Thirsty Goblin"] = 2605,
    ["In Good Taste"] = 2606,
    ["Sprinkle's Secret Ingredient"] = 2641,
    ["Pirate Hats Ahoy!"] = 8365,
    ["Ship Schedules"] = 2873,
    ["Southsea Shakedown"] = 8366,
    ["Screecher Spirits"] = 3520,
    ["The Dunemaul Compound"] = 5863,
    ["Gadgetzan Water Survey"] = 992,
    ["Noxious Lair Investigation"] = 82,
    ["The Scrimshank Redemption"] = 10,
    ["Insect Part Analysis"] = 110,
    ["Scarab Shells"] = 2865,
    ["Tooga's Quest"] = 1560,
    ["OOX-17/TN Distress Beacon"] = 351,
    
    -----------------------------------------
    -- Feralas
    -----------------------------------------
    ["The Ogres of Feralas"] = 2975,
    ["The Mark of Quality"] = 2821,
    ["Gordunni Cobalt"] = 2979,
    ["War on the Woodpaw"] = 2862,
    ["Against the Hatecrest"] = 2869,
    ["Against the Hatecrest (Part 2)"] = 2870,
    ["The High Wilderness"] = 2982,
    ["Improved Quality"] = 2822,
    ["A Strange Request"] = 3121,
    ["Return to Witch Doctor Uzer'i"] = 3122,
    ["Testing the Vessel"] = 3123,
    ["Natural Materials"] = 2976,
    ["The Sunken Temple"] = 3380,
    ["Into the Depths"] = 3446,
    ["Secret of the Circle"] = 3447,
    ["The Gordunni Scroll"] = 2978,
    ["Dark Ceremony"] = 2977,
    ["OOX-22/FE Distress Beacon"] = 25471,
    
    -----------------------------------------
    -- The Hinterlands
    -----------------------------------------
    ["Troll Necklace Bounty"] = 7861,
    ["Stalking the Stalkers"] = 7828,
    ["Hunt the Savages"] = 7829,
    ["Vilebranch Hooligans"] = 7849,
    ["Gammerita, Mon!"] = 7815,
    ["Cannibalistic Cousins"] = 7844,
    ["Snapjaws, Mon!"] = 7816,
    ["Message to the Wildhammer"] = 7826,
    ["Aerie Peak Ammo"] = 7867,
    ["Lines of Communication"] = 7824,
    ["Rin'ji is Trapped!"] = 7780,
    ["Rin'ji's Secret"] = 7781,
    ["The Altar of Zul"] = 7787,
    ["Thadius Grimshade"] = 7791,
    ["Nekrum's Medallion"] = 7792,
    ["The Ancient Egg"] = 4787,
    ["The God Hakkar"] = 4788,
    ["Featherbeard's Endorsement"] = 7866,
    ["Rhapsody's Kalimdor Kocktail"] = 7733,
    ["OOX-09/HL Distress Beacon"] = 485,
    
    -----------------------------------------
    -- Searing Gorge
    -----------------------------------------
    ["STOLEN: Smithing Tuyere and Lookout's Spyglass"] = 7724,
    ["Caught!"] = 7723,
    ["The Horn of the Beast"] = 7727,
    ["Fiery Menace!"] = 7728,
    ["Incendosaurs? Whateverosaur is More Like It"] = 7729,
    ["JOB OPPORTUNITY: Culling the Competition"] = 7701,
    ["Curse These Fat Fingers"] = 7722,
    ["What the Flux?"] = 7726,
    ["The Key to Freedom"] = 7717,
    ["Divine Retribution"] = 3441,
    ["The Flawless Flame"] = 3452,
    
    -----------------------------------------
    -- Blasted Lands
    -----------------------------------------
    ["A Boar's Vitality"] = 2581,
    ["Snickerfang Jowls"] = 2583,
    ["Basilisk Brains"] = 2585,
    ["Vulture Gizzards"] = 2603,
    ["Scorpok Claws"] = 2601,
    ["The Basilisk's Bite"] = 2580,
    ["Salt of the Scorpok"] = 2582,
    ["Lung Juice Cocktail"] = 2584,
    ["Infallible Mind"] = 2586,
    ["Gizzard and Snout Pie"] = 2602,
    ["Razelikh's Minions"] = 2540,
    ["Loramus Thalipedes"] = 2541,
    ["You Are Rakh'likh, Demon"] = 2503,
    
    -----------------------------------------
    -- Burning Steppes
    -----------------------------------------
    ["WANTED: Ranger Lord Hawkspear"] = 4481,
    ["Broodling Essence"] = 4726,
    ["Felnok Steelspring"] = 4808,
    ["The Pack Mistress"] = 4729,
    ["Gor'tesh the Brute Lord"] = 4728,
    ["Dreadmaul Rock"] = 4765,
    ["Ogre Head On A Stick = Party"] = 4866,
    ["General Drakkisath's Command"] = 5089,
    ["For The Horde!"] = 4974,
    ["Warlord's Command"] = 4903,
    
    -----------------------------------------
    -- Un'Goro Crater
    -----------------------------------------
    ["The Fare of Lar'korwi"] = 4290,
    ["The Scent of Lar'korwi"] = 4291,
    ["Shizzle's Flyer"] = 4243,
    ["Roll the Bones"] = 4301,
    ["Super Sticky"] = 4289,
    ["Finding the Source"] = 974,
    ["The Apes of Un'Goro"] = 4289,
    ["Lost!"] = 4492,
    ["A Little Help From My Friends"] = 4491,
    ["Chasing A-Me 01"] = 4243,
    ["Bone-Bladed Weapons"] = 4242,
    ["Beware of Pterrordax"] = 4501,
    ["Larion and Muigin"] = 4141,
    ["The Bait for Lar'korwi"] = 4292,
    ["It's a Secret to Everybody"] = 3845,
    ["It's a Secret to Everybody (Part 2)"] = 3908,
    ["Volcanic Activity"] = 4501,
    ["Making Sense of It"] = 24735,
    ["Bungle in the Jungle"] = 4501,
    
    -----------------------------------------
    -- Felwood
    -----------------------------------------
    ["Forces of Jaedenar"] = 5155,
    ["Collection of the Corrupt Water"] = 5157,
    ["Verifying the Corruption"] = 5158,
    ["Cleansing Felwood"] = 4101,
    ["Salve via Hunting"] = 4103,
    ["Salve via Mining"] = 4104,
    ["Salve via Gathering"] = 4102,
    ["Corrupted Sabers"] = 4441,
    ["Frostsaber Stalker Hide"] = 4442,
    ["The Corruption of the Jadefire"] = 5165,
    ["Deadwood Ritual Totem"] = 8462,
    ["Feathers for Grazle"] = 8466,
    ["Feathers for Nafien"] = 8467,
    ["The Timbermaw Tribe"] = 8460,
    ["Timbermaw Ally"] = 8461,
    ["Runecloth"] = 8469,
    
    -----------------------------------------
    -- Winterspring
    -----------------------------------------
    ["The Everlook Report"] = 5084,
    ["Are We There, Yeti?"] = 977,
    ["Are We There, Yeti? (Part 2)"] = 5163,
    ["Are We There, Yeti? (Part 3)"] = 5164,
    ["Winterfall Firewater"] = 5083,
    ["Winterfall Activity"] = 5082,
    ["Strange Sources"] = 5088,
    ["One Draenei's Junk..."] = 5085,
    ["Luck Be With You"] = 5060,
    ["Chillwind Horns"] = 5054,
    ["High Chief Winterfall"] = 969,
    ["The Final Piece"] = 5123,
    ["Rampaging Giants"] = 5104,
    ["Delivery for Orahil"] = 5080,
    ["Ursius of the Shardtooth"] = 5056,
    ["Brumeran of the Chillwind"] = 5057,
    ["Wild Guardians"] = 5055,
    
    -----------------------------------------
    -- Western Plaguelands
    -----------------------------------------
    ["The Scourge Cauldrons"] = 5214,
    ["Target: Felstone Field"] = 5215,
    ["Target: Dalson's Tears"] = 5216,
    ["Target: Writhing Haunt"] = 5217,
    ["Target: Gahrron's Withering"] = 5219,
    ["Return to Chillwind Camp"] = 5220,
    ["Alas, Andorhal"] = 211,
    ["All Along the Watchtowers"] = 5097,
    ["Scholomance"] = 5533,
    ["The Annals of Darrowshire"] = 5210,
    ["Pamela's Doll"] = 5149,
    ["Auntie Marlene"] = 5152,
    ["A Strange Historian"] = 5153,
    ["The Battle of Darrowshire"] = 5211,
    ["Defenders of Darrowshire"] = 5181,
    ["Heroes of Darrowshire"] = 5168,
    ["Brother Carlin"] = 5212,
    
    -----------------------------------------
    -- Eastern Plaguelands
    -----------------------------------------
    ["The Restless Souls"] = 5282,
    ["Augustus' Receipt Book"] = 6164,
    ["Zaeldarr the Outcast"] = 6021,
    ["To Kill With Purpose"] = 5661,
    ["Demon Dogs"] = 5537,
    ["Carrion Grubbage"] = 5544,
    ["Blood Tinged Skies"] = 5543,
    ["Redemption"] = 5742,
    ["Of Forgotten Memories"] = 5781,
    ["Of Lost Honor"] = 5845,
    ["Of Love and Family"] = 5846,
    ["Of Love and Family (Part 2)"] = 5848,
    ["Tirion Fordring"] = 5944,
    ["Plagued Hatchlings"] = 6389,
    ["Healthy Dragon Scale"] = 6390,
    ["Bodies of Evil"] = 6041,
    ["Argent Dawn Commission"] = 5534,
    ["Light's Hope Chapel"] = 5663,
    
    -----------------------------------------
    -- Silithus
    -----------------------------------------
    ["The Twilight Mystery"] = 8284,
    ["The Deserter"] = 8286,
    ["Dearest Natalia"] = 8315,
    ["Twilight Geolords"] = 8323,
    ["The Twilight Lexicon"] = 8279,
    ["Deadly Desert Venom"] = 8277,
    ["Hive in the Tower"] = 8272,
    ["Report to General Kirika"] = 8285,
    ["Cenarion Battlegear"] = 8546,
    ["Field Duty"] = 8507,
    ["Logistics Assignment"] = 8731,
    ["Combat Assignment"] = 8498,
    ["Tactical Assignment"] = 8510,
    
    -----------------------------------------
    -- Dungeon Quests
    -----------------------------------------
    -- Deadmines
    ["Red Silk Bandanas"] = 214,
    ["Collecting Memories"] = 168,
    ["Oh Brother. . ."] = 167,
    ["Underground Assault"] = 2040,
    ["The Defias Brotherhood (Final)"] = 166,
    
    -- Wailing Caverns
    ["Deviate Hides"] = 1486,
    ["Deviate Eradication"] = 1487,
    ["Serpentbloom"] = 962,
    ["Smart Drinks"] = 1491,
    ["Leaders of the Fang"] = 914,
    
    -- Shadowfang Keep
    ["Arugal Must Die"] = 1014,
    ["The Book of Ur"] = 1013,
    ["Deathstalkers in Shadowfang"] = 1098,
    
    -- Blackfathom Deeps
    ["Researching the Corruption"] = 1275,
    ["In Search of Thaelrid"] = 1200,
    ["Blackfathom Villainy"] = 1199,
    ["Twilight Falls"] = 971,
    
    -- Gnomeregan
    ["Gnogaine"] = 2927,
    ["The Grand Betrayal"] = 2929,
    ["Gyrodrillmatic Excavationators"] = 2928,
    ["Save Techbot's Brain!"] = 2922,
    ["Data Rescue"] = 2930,
    ["Essential Artificials"] = 2924,
    
    -- Scarlet Monastery
    ["Into The Scarlet Monastery"] = 1048,
    ["In the Name of the Light"] = 1053,
    ["Hearts of Zeal"] = 1113,
    ["Mythology of the Titans"] = 1051,
    ["Test of Lore"] = 1159,
    ["Compendium of the Fallen"] = 1049,
    
    -- Uldaman
    ["Power Stones"] = 2418,
    ["Reclaimed Treasures"] = 1360,
    ["Agmond's Fate"] = 704,
    ["Solution to Doom"] = 709,
    ["Find the Gems"] = 2240,
    ["The Platinum Discs"] = 2278,
    
    -- Zul'Farrak
    ["Troll Temper"] = 3042,
    ["Scarab Shells"] = 2865,
    ["The Prophecy of Mosh'aru"] = 3527,
    ["Divino-matic Rod"] = 2768,
    ["Gahz'rilla"] = 2770,
    
    -- Maraudon
    ["Shadowshard Fragments"] = 7070,
    ["Corruption of Earth and Seed"] = 7065,
    ["Twisted Evils"] = 7029,
    ["Legends of Maraudon"] = 7044,
    ["The Pariah's Instructions"] = 7067,
    
    -- Sunken Temple
    ["The Temple of Atal'Hakkar"] = 1475,
    ["Into The Temple of Atal'Hakkar"] = 1446,
    ["The Essence of Eranikus"] = 3373,
    ["Jammal'an the Prophet"] = 1446,
    ["Secret of the Circle"] = 3447,
    
    -- Blackrock Depths
    ["Dark Iron Legacy"] = 3802,
    ["Ribbly Screwspigot"] = 4136,
    ["The Heart of the Mountain"] = 4024,
    ["A Taste of Flame"] = 4022,
    ["Disharmony of Fire"] = 4363,
    ["Marshal Windsor"] = 4264,
    ["Abandoned Hope"] = 4242,
    ["A Crumpled Up Note"] = 4264,
    ["The Royal Rescue"] = 4003,
    ["The Good Stuff"] = 4295,
    ["The Challenge"] = 9015,
    ["The Spectral Chalice"] = 4083,
    
    -- LBRS
    ["Warlord's Command"] = 4903,
    ["Seal of Ascension"] = 4743,
    ["The Final Tablets"] = 4788,
    ["Bijou's Belongings"] = 5001,
    ["Mother's Milk"] = 4866,
    ["Kibler's Exotic Pets"] = 4729,
    
    -- UBRS
    ["General Drakkisath's Command"] = 5089,
    ["For The Horde!"] = 4974,
    ["Blackhand's Command"] = 7761,
    ["Doomrigger's Clasp"] = 5047,
    ["Finkle Einhorn, At Your Service!"] = 5047,
    ["Seal of Ascension (Final)"] = 4743,
    
    -- Scholomance
    ["Doctor Theolen Krastinov, the Butcher"] = 5382,
    ["Krastinov's Bag of Horrors"] = 5515,
    ["Kirtonos the Herald"] = 5384,
    ["The Lich, Ras Frostwhisper"] = 5466,
    ["Dawn's Gambit"] = 4771,
    ["Plagued Hatchlings"] = 5529,
    ["Barov Family Fortune"] = 5343,
    
    -- Stratholme
    ["The Archivist"] = 5251,
    ["Aurius' Reckoning"] = 5125,
    ["The Great Fras Siabi"] = 5214,
    ["Houses of the Holy"] = 5243,
    ["The Medallion of Faith"] = 5122,
    ["Of Love and Family"] = 5848,
    ["Ramstein"] = 5262,
    ["The Flesh Does Not Lie"] = 5212,
    
    -- Dire Maul
    ["Elven Legends"] = 7481,
    ["Libram of Focus"] = 7484,
    ["Libram of Protection"] = 7485,
    ["Libram of Rapidity"] = 7483,
    ["The Madness Within"] = 7461,
    ["The Treasure of the Shen'dralar"] = 7877,
    ["Shards of the Felvine"] = 5526,
    ["A Broken Trap"] = 1193,
    ["Lethtendris's Web"] = 7488,
    ["Pusillin and the Elder Azj'Tordin"] = 7441,
    ["Free Knot!"] = 5525,
    ["The Gordok Ogre Suit"] = 5518,
    ["King of the Gordok"] = 1318,
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
