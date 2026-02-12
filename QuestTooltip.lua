--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestTooltip.lua
Authors: VanillaGuide Contributors
Version: 1.10.0
------------------------------------------------------
Description: 
    Adds quest information to tooltips when hovering
    over NPCs and mobs in the game world.
    Shows if an NPC gives/turns-in quests, or if a mob
    drops quest items.
    
    Comprehensive database covering all leveling zones.
------------------------------------------------------
]]--

Dv(" VGuide QuestTooltip.lua Start")

VGuideQuestTooltip = {}
VGuideQuestTooltip.enabled = true
VGuideQuestTooltip.initialized = false
VGuideQuestTooltip.NPCQuests = {}
VGuideQuestTooltip.MobDrops = {}
VGuideQuestTooltip.AllQuests = {}  -- All quest names from guides
VGuideQuestTooltip.GuideQuests = {} -- Quests parsed from guide tables
VGuideQuestTooltip.databaseBuilt = false

-- Comprehensive NPC -> Quest mapping for all zones
VGuideQuestTooltip.KnownNPCs = {
    -----------------------------------------
    -- Alliance Starting Zone NPCs (1-12)
    -----------------------------------------
    -- Elwynn Forest / Northshire
    ["Marshal McBride"] = {"A Threat Within", "Kobold Camp Cleanup", "Investigate Echo Ridge", "Skirmish at Echo Ridge", "Report to Goldshire"},
    ["Deputy Willem"] = {"Simple Letter", "Eagan Peltskinner", "Garments of the Light", "Brotherhood of Thieves"},
    ["Eagan Peltskinner"] = {"Wolves Across the Border"},
    ["Milly Osworth"] = {"Milly's Harvest", "Milly Osworth"},
    ["Brother Neals"] = {"Rest and Relaxation"},
    ["Marshal Dughan"] = {"Report to Goldshire", "The Fargodeep Mine", "The Jasperlode Mine", "Westbrook Garrison Needs Help!", "Riverpaw Gnoll Bounty"},
    ["Remy Two-Times"] = {"Gold Dust Exchange"},
    ["Smith Argus"] = {"Elmore's Task"},
    ["Sara Timberlain"] = {"A Fishy Peril", "Further Concerns"},
    ["Guard Thomas"] = {"Find the Lost Guards", "Discover Rolf's Fate", "Report to Thomas", "Deliver Thomas' Report", "Cloth and Leather Armor"},
    ["Quartermaster Lewis"] = {"Collecting Kelp"},
    ["William Pestle"] = {"Kobold Candles"},
    ["Brother Wilhelm"] = {"Wine Shop Advert", "Garments of the Light"},
    ["Ma Stonefield"] = {"Lost Necklace", "Princess Must Die!"},
    ["Billy Maclure"] = {"Pie for Billy", "Back to Billy"},
    ["Auntie Bernice Stonefield"] = {"Pie for Billy", "Back to Billy"},
    ["Gramma Stonefield"] = {"Note to William"},
    ["Tommy Joe Stonefield"] = {"A Bundle of Trouble"},
    
    -- Dun Morogh / Coldridge Valley
    ["Sten Stoutarm"] = {"Dwarven Outfitters", "Coldridge Valley Mail Delivery"},
    ["Balir Frosthammer"] = {"A Refugee's Quandary"},
    ["Talin Keeneye"] = {"The Boar Hunter"},
    ["Grelin Whitebeard"] = {"A New Threat", "The Troll Cave", "The Stolen Journal"},
    ["Mountaineer Barleybrew"] = {"Coldridge Valley Mail Delivery", "Scalding Mornbrew Delivery", "Bring Back the Mug"},
    ["Nori Pridedrift"] = {"Senir's Observations"},
    ["Pilot Bellowfiz"] = {"Ammo For Rumbleshot", "Return to Bellowfiz"},
    ["Rejold Barleybrew"] = {"Evershine", "A Favor For Evershine", "The Perfect Stout", "Shimmer Stout", "Bitter Rivals", "Return to Marleth"},
    ["Tharek Blackstone"] = {"Frostmane Hold"},
    ["Pilot Stonegear"] = {"The Powers That Be", "The Reports"},
    ["Ragnar Thunderbrew"] = {"Beer Basted Boar Ribs", "Bitter Rivals"},
    ["Beldin Steelgrill"] = {"Tools For Steelgrill"},
    ["Rudra Amberstill"] = {"Protecting the Herd"},
    ["Senator Mehr Stonehallow"] = {"Those Blasted Troggs!"},
    
    -- Teldrassil / Shadowglen
    ["Conservator Ilthalaine"] = {"The Balance of Nature", "The Balance of Nature (Part 2)"},
    ["Gilshalan Windwalker"] = {"The Woodland Protector", "Webwood Venom"},
    ["Tarindrella"] = {"The Woodland Protector", "The Woodland Protector (Part 2)", "Iverron's Antidote"},
    ["Dirania Silvershine"] = {"A Good Friend"},
    ["Porthannius"] = {"Dolanaar Delivery"},
    ["Zenn Foulhoof"] = {"Zenn's Bidding", "Seek Redemption!"},
    ["Syral Bladeleaf"] = {"Denalan's Earth", "Timberling Seeds", "Timberling Sprouts", "Return to Denalan"},
    ["Denalan"] = {"Denalan's Earth", "Timberling Seeds", "Timberling Sprouts", "Tumors", "Return to Denalan", "Oakenscowl", "Rellian Greenspyre"},
    ["Athridas Bearmantle"] = {"The Relics of Wakening", "Ursal the Mauler", "Crown of the Earth"},
    ["Corithras Moonrage"] = {"Crown of the Earth"},
    ["Sentinel Amara Nightblade"] = {"Twisted Hatred"},
    ["Tallonkai Swiftroot"] = {"The Emerald Dreamcatcher", "Ferocitas the Dream Eater", "The Road to Darnassus"},
    ["Fandral Staghelm"] = {"Crown of the Earth (Part 5)"},
    
    -----------------------------------------
    -- Horde Starting Zone NPCs (1-12)
    -----------------------------------------
    -- Durotar / Valley of Trials
    ["Kaltunk"] = {"Your Place In The World"},
    ["Gornek"] = {"Cutting Teeth", "Etched Tablet", "Simple Parchment", "Glyphic Scroll", "Encrypted Parchment", "Tainted Parchment"},
    ["Zureetha Fargaze"] = {"Vile Familiars", "Burning Blade Medallion"},
    ["Galgar"] = {"Galgar's Cactus Apple Surprise"},
    ["Foreman Thazz'ril"] = {"Lazy Peons", "Thazz'ril's Pick"},
    ["Sarkoth"] = {"Sarkoth"},
    ["Rwag"] = {"Sarkoth"},
    ["Furl Scornbrow"] = {"A Peon's Burden"},
    ["Ukor"] = {"Report to Sen'jin Village"},
    ["Gar'Thok"] = {"Report to Orgnil", "Vanquish the Betrayers", "Encroachment"},
    ["Innkeeper Grosk"] = {"A Peon's Burden"},
    ["Master Gadrin"] = {"Minshina's Skull", "Zalazane", "Report to Sen'jin Village"},
    ["Lar Prowltusk"] = {"Thwarting Kolkar Aggression", "A Solvent Spirit", "Practical Prey"},
    ["Vel'rin Fang"] = {"Break a Few Eggs"},
    ["Misha Tor'kren"] = {"Lost But Not Forgotten"},
    ["Orgnil Soulscar"] = {"Dark Storms", "The Admiral's Orders"},
    ["Rezlak"] = {"Winds in the Desert", "Securing the Lines"},
    ["Takrin Pathseeker"] = {"Carry Your Weight"},
    
    -- Mulgore / Camp Narache
    ["Chief Hawkwind"] = {"The Hunt Begins", "A Humble Task", "Rite of Strength"},
    ["Grull Hawkwind"] = {"A Humble Task", "A Humble Task (Part 2)"},
    ["Seer Graytongue"] = {"Rites of the Earthmother", "Rite of Vision", "Rite of Vision (Part 2)"},
    ["Baine Bloodhoof"] = {"Rite of Strength", "Sharing the Land", "Poison Water", "Mazzranache"},
    ["Antur Fallow"] = {"Swoop Hunting"},
    ["Harken Windtotem"] = {"The Battleboars", "Break Sharptusk!"},
    ["Skorn Whitecloud"] = {"Journey into Thunder Bluff"},
    ["Mull Thunderhorn"] = {"Attack on Camp Narache"},
    
    -- Tirisfal Glades / Deathknell
    ["Undertaker Mordo"] = {"The Mindless Ones", "Rattling the Rattlecages"},
    ["Shadow Priest Sarvis"] = {"Rude Awakening", "The Damned", "Night Web's Hollow"},
    ["Novice Elreth"] = {"Marla's Last Wish"},
    ["Deathguard Saltain"] = {"Fields of Grief", "The Scarlet Crusade"},
    ["Executor Zygand"] = {"The Scarlet Crusade", "Proof of Demise", "At War With The Scarlet Crusade"},
    ["Deathguard Simmer"] = {"Return to the Magistrate"},
    ["Apothecary Johaan"] = {"A New Plague"},
    ["Magistrate Sevren"] = {"Graverobbers", "Wanted: Maggot Eye"},
    ["Coleman Farthing"] = {"The Mills Overrun"},
    
    -----------------------------------------
    -- Alliance Leveling Zones (12-30)
    -----------------------------------------
    -- Westfall
    ["Gryan Stoutmantle"] = {"The People's Militia", "Red Leather Bandanas", "The Defias Brotherhood", "Patrolling Westfall"},
    ["Farmer Furlbrow"] = {"Furlbrow's Deed", "Westfall Stew"},
    ["Verna Furlbrow"] = {"Poor Old Blanchy"},
    ["Captain Danuvin"] = {"Patrolling Westfall"},
    ["Scout Galiaan"] = {"Westbrook Garrison Needs Help!"},
    ["Salma Saldean"] = {"Westfall Stew"},
    ["Farmer Saldean"] = {"The Killing Fields"},
    ["Scout Riell"] = {"Patrolling Westfall"},
    ["Captain Vaneesia Chambers"] = {"Coastal Menace"},
    ["Wilder Thistlenettle"] = {"Oh Brother..."},
    ["Mama Celeste"] = {"Collector's Schedule"},
    
    -- Loch Modan
    ["Mountaineer Stormpike"] = {"In Defense of the King's Lands", "The Trogg Threat"},
    ["Vidra Hearthstove"] = {"Thelsamar Blood Sausages"},
    ["Magistrate Bluntnose"] = {"Rat Catching"},
    ["Jern Hornhelm"] = {"Excavation Progress Report", "Resupplying the Excavation", "Protecting the Shipment", "After the Ambush"},
    ["Prospector Ironboot"] = {"Gathering Idols", "Powder to Ironband"},
    ["Bingles Blastenheimer"] = {"Filthy Paws"},
    ["Captain Rugelfuss"] = {"A Hunter's Boast"},
    ["Mountaineer Kadrell"] = {"In Defense of the King's Lands"},
    ["Pilot Hammerfoot"] = {"Excavation Progress Report"},
    
    -- Darkshore
    ["Terenthis"] = {"For Love Eternal", "How Big a Threat?", "The Tower of Althalaxx"},
    ["Thundris Windweaver"] = {"Plagued Lands", "Cleansing of the Infected", "Cave Mushrooms", "The Red Crystal", "As Water Cascades"},
    ["Wizbang Cranktoggle"] = {"Buzzbox 827", "Buzzbox 411", "Buzzbox 525", "Buzzbox 323"},
    ["Asterion"] = {"Bashal'Aran"},
    ["Sentinel Tysha Moonblade"] = {"The Tower of Althalaxx"},
    ["Volcor"] = {"Escape Through Force", "Escape Through Stealth"},
    ["Night Runner"] = {"The Red Crystal"},
    ["Sentinel Glynda Nal'Shea"] = {"The Sleeper Has Awakened"},
    
    -- Redridge Mountains
    ["Magistrate Solomon"] = {"Messenger to Stormwind", "Blackrock Menace", "Shadow Magic", "Saving Private Thorsen"},
    ["Deputy Feldon"] = {"Encroaching Gnolls", "Assessing the Threat"},
    ["Marshal Marris"] = {"Shadow Magic", "Tharil'zun"},
    ["Chef Breanna"] = {"Murloc Poachers"},
    ["Foreman Oslow"] = {"The Lost Tools"},
    ["Verner Osgood"] = {"Underbelly Scales", "Blackrock Bounty"},
    
    -- Wetlands
    ["Mikhail"] = {"Uncovering the Past"},
    ["Sidas"] = {"Daily Delivery"},
    ["James Halloran"] = {"Fall of Dun Modr"},
    ["First Mate Fitzsimmons"] = {"The Third Fleet", "The Cursed Crew"},
    ["Captain Stoutfist"] = {"Claws from the Deep", "Reclaiming Goods"},
    ["Dragonmaw Catapult"] = {"War Banners"},
    
    -- Ashenvale
    ["Raene Wolfrunner"] = {"Raene's Cleansing"},
    ["Orendil Broadleaf"] = {"The Zoram Strand"},
    ["Shindrell Swiftfire"] = {"An Aggressive Defense", "Pridewings of Stonetalon"},
    ["Vindicator Pahaliah"] = {"Clear the Forest"},
    ["Sentinel Thenysil"] = {"Bathran's Hair", "The Tower of Althalaxx"},
    ["Illiyana"] = {"Supplies for Auberdine"},
    ["Delgren the Purifier"] = {"The Tower of Althalaxx"},
    
    -- Duskwood
    ["Commander Althea Ebonlocke"] = {"Night Watch", "Worgen in the Woods", "The Legend of Stalvan"},
    ["Lord Ello Ebonlocke"] = {"The Hermit", "Deliveries to Sven"},
    ["Sven Yorgen"] = {"Sven's Revenge", "Proving Your Worth"},
    ["Abercrombie"] = {"The Hermit", "Ogre Thieves"},
    ["Clerk Daltry"] = {"The Legend of Stalvan"},
    ["Madame Eva"] = {"Fortune Telling"},
    
    -----------------------------------------
    -- Horde Leveling Zones (12-30)
    -----------------------------------------
    -- Silverpine Forest
    ["High Executor Hadrec"] = {"The Dead Fields", "Prove Your Worth", "Arugal's Folly"},
    ["Apothecary Renferrel"] = {"A Recipe For Death", "Journey to Hillsbrad Foothills"},
    ["Shadow Priest Allister"] = {"Border Crossings", "Maps and Runes"},
    ["Dalar Dawnweaver"] = {"Arugal's Folly"},
    ["Rane Yorick"] = {"Ivar the Foul", "Rot Hide Clues"},
    ["Sentinel Melyria Frostshadow"] = {"A Lesson in Fear"},
    ["Astor Hadren"] = {"Speak with Renferrel"},
    
    -- The Barrens
    ["Sergra Darkthorn"] = {"Crossroads Conscription", "Plainstrider Menace", "The Forgotten Pools", "Raptor Thieves", "Echeyakee", "The Angry Scytheclaws"},
    ["Thork"] = {"Disrupt the Attacks", "The Disruption Ends", "Supplies for the Crossroads"},
    ["Regthar Deathgate"] = {"Centaur Bracers", "Kolkar Leaders", "Verog the Dervish", "Hezrul Bloodmark"},
    ["Apothecary Helbrim"] = {"Fungal Spores", "Apothecary Zamah", "Altered Beings"},
    ["Mangletooth"] = {"Consumed by Hatred", "Lost in Battle", "Revenge of the Earthmother"},
    ["Gazlowe"] = {"Southsea Freebooters", "The Baron of Gadgetzan"},
    ["Wharfmaster Dizzywig"] = {"WANTED: Baron Longshore"},
    ["Captain Thalo'thas Brightsun"] = {"The Guns of Northwatch"},
    ["Seereth Stonebreak"] = {"Samophlange", "Wenikee Boltbucket"},
    ["Tonga Runetotem"] = {"Altered Beings"},
    ["Mahren Skyseer"] = {"Ishamuhale"},
    
    -- Stonetalon Mountains
    ["Ziz Fizziks"] = {"Gerenzo Wrenchwhistle", "Super Reaper 6000"},
    ["Braug Dimspirit"] = {"Bloodfury Bloodline"},
    ["Keeper Albagorm"] = {"Boulderslide Ravine"},
    ["Sun Rock Retreat NPCs"] = {"New Life", "Goblin Invaders"},
    ["Kaela Shadowspear"] = {"On Guard in Stonetalon"},
    
    -- Ashenvale (Horde Side)
    ["Senani Thunderheart"] = {"Satyr Horns", "Stonetalon Standstill"},
    ["Mastok Wrilehiss"] = {"The Ashenvale Hunt"},
    ["Warsong Scout"] = {"Warsong Supplies"},
    
    -- Thousand Needles
    ["Cliffwatcher Longhorn"] = {"Pacify the Centaur", "Test of Endurance", "Test of Faith"},
    ["Motega Firemane"] = {"Sacred Fire", "Arikara"},
    ["Rau Cliffrunner"] = {"Wind Rider"},
    ["Hagar Lightninghoof"] = {"Wanted - Arnak Grimtotem"},
    ["Pao'ka Swiftmountain"] = {"Homeward Bound"},
    ["Dorn Plainstalker"] = {"Test of Lore"},
    ["Freewind Post NPCs"] = {"Alien Egg"},
    
    -----------------------------------------
    -- Mid-Level Zones (30-45)
    -----------------------------------------
    -- Stranglethorn Vale
    ["Hemet Nesingwary"] = {"Welcome to the Jungle", "Tiger Mastery", "Panther Mastery", "Raptor Mastery", "Big Game Hunter"},
    ["Sir S. J. Erlgadin"] = {"Tiger Mastery"},
    ["Ajeck Rouack"] = {"Panther Mastery"},
    ["Barnil Stonepot"] = {"Raptor Mastery"},
    ["Nimboya"] = {"Hunt for Yenniku", "Headhunting", "Bloodscalp Ears"},
    ["Kin'weelay"] = {"Bloodscalp Insight", "The Vile Reef", "Mok'thardin's Enchantment", "The Mind's Eye"},
    ["Dizzy One-Eye"] = {"Singing Blue Shards"},
    ["Crank Fizzlebub"] = {"Venture Company Mining"},
    ["Kravel Koalbeard"] = {"The Rumormonger", "Krazek's Cookery"},
    ["Sea Wolf MacKinley"] = {"Scaring Shaky", "Return to MacKinley"},
    ["Fleet Master Seahorn"] = {"The Bloodsail Buccaneers", "Cracking Maury's Foot"},
    ["First Mate Crazz"] = {"Hostile Takeover"},
    ["Baron Revilgaz"] = {"Troll Witchery", "Water Elementals"},
    ["Corporal Kaleb"] = {"Bad Medicine", "Kurzen's Mystery"},
    ["Sergeant Yohwa"] = {"Jungle Secrets"},
    
    -- Hillsbrad Foothills
    ["High Executor Darthalia"] = {"Time To Strike", "Battle of Hillsbrad", "WANTED: Syndicate Personnel"},
    ["Apothecary Lydon"] = {"Elixir of Suffering", "Elixir of Pain", "Elixir of Agony"},
    ["Krusk"] = {"Deadly Blunderbuss"},
    ["Baron Vardus"] = {"Humbert's Sword"},
    ["Novice Thaivand"] = {"Helcular's Revenge"},
    ["Deathguard Humbert"] = {"Helcular's Revenge"},
    ["Clerk Horrace Whitesteed"] = {"Preemptive Strike"},
    ["Magistrate Henry Maleb"] = {"Crushridge Bounty"},
    ["Marshal Redpath"] = {"Crushridge Warmongers"},
    
    -- Desolace
    ["Corporal Melkins"] = {"Vahlarriel's Search"},
    ["Takata Steelblade"] = {"Gelkis Alliance", "Khan Dez'hepah"},
    ["Uthek the Wise"] = {"Centaur Bounty", "Stealing Supplies"},
    ["Bibbly F'utzbuckle"] = {"Bone Collector"},
    ["Smeed Scrabblescrew"] = {"Kodo Roundup"},
    ["Ghost of Magatha"] = {"The Pariah's Instructions"},
    ["Maurin Bonesplitter"] = {"The Burning of Spirits"},
    ["Natalia Seline"] = {"Down the Scarlet Path"},
    ["Cork Gizelton"] = {"Gizelton Caravan"},
    ["Rigger Gizelton"] = {"Gizelton Caravan"},
    
    -- Arathi Highlands
    ["Captain Nials"] = {"Stromgarde Badges", "Call to Arms"},
    ["Skuerto"] = {"The Princess Trapped"},
    ["Tor'gan"] = {"Foul Magics", "Hammerfall"},
    ["Zengu"] = {"Worth Its Weight in Gold"},
    ["Doctor Gregory Victor"] = {"Triage"},
    ["Kinelory"] = {"Hints of a New Plague?"},
    ["Hammerfall Guardian"] = {"The Hammerfall Guardian"},
    ["Drumlin Ironpatch"] = {"Northfold Manor"},
    
    -- Badlands
    ["Rigglefuzz"] = {"A Dwarf and His Tools", "Mirages", "Power Stones", "This Is Going to Be Hard"},
    ["Martek the Exiled"] = {"Martek the Exiled", "Barbecued Buzzard Wings", "Coolant Heads Prevail", "Gyro... What?"},
    ["Lotwil Veriatus"] = {"Badlands Reagent Run", "Study of the Elements: Rock", "Broken Alliances"},
    ["Sigrun Ironhew"] = {"Fiery Blaze Enchantments"},
    ["Prospector Ryedol"] = {"A Sign of Hope"},
    ["Dustbelcher Ogre Quest Giver"] = {"Ogre Thieves"},
    
    -- Dustwallow Marsh
    ["Captain Garran Vimes"] = {"The Theramore Docks", "Lieutenant Paval Reethe", "Traitors Among Us", "The Black Shield"},
    ["Morgan Stern"] = {"Soothing Turtle Bisque"},
    ["Mudcrush Durtfeet"] = {"Hungry!", "Mudrock Soup and Bugs"},
    ["Nat Pagle"] = {"Nat's Bargain", "Nat Pagle, Angler Extreme"},
    ["Ogron"] = {"Challenge Overlord Mok'Morokk"},
    ["Mogg"] = {"Deadmire"},
    ["Tabetha"] = {"The Archmage's Staff"},
    
    -- Swamp of Sorrows
    ["Galen Goodward"] = {"Galen's Escape"},
    ["Fallen Hero of the Horde"] = {"The Disgraced One", "Heroes of Old"},
    ["Holaaru"] = {"Draenethyst Crystals"},
    ["Magtoor"] = {"Draenethyst Crystals"},
    ["Fel'zerul"] = {"The Atal'ai Exile"},
    
    -----------------------------------------
    -- High-Level Zones (45-60)
    -----------------------------------------
    -- Tanaris
    ["Marin Noggenfogger"] = {"Noggenfogger Elixir"},
    ["Chief Engineer Bilgewhizzle"] = {"Wastewander Justice", "More Wastewander Justice"},
    ["Tran'rek"] = {"Thistleshrub Valley", "The Dunemaul Compound"},
    ["Sprinkle"] = {"Sprinkle's Secret Ingredient"},
    ["Yeh'kinya"] = {"Screecher Spirits", "The Prophecy of Mosh'aru"},
    ["Eridan Bluewind"] = {"Verifying the Corruption"},
    ["Trenton Lighthammer"] = {"Gadgetzan Water Survey"},
    ["Lead Prospector Durdin"] = {"Gahz'ridian"},
    
    -- Feralas
    ["Pratt McGrubben"] = {"The Mark of Quality", "Pristine Yeti Hide"},
    ["Krueg Skullsplitter"] = {"War on the Woodpaw", "Woodpaw Investigation"},
    ["Hadoken Swiftstrider"] = {"Hippogryph Muisek", "Faerie Dragon Muisek", "Treant Muisek"},
    ["Orwin Gizzmick"] = {"The Mark of Quality"},
    ["Witch Doctor Uzer'i"] = {"Natural Materials"},
    ["Rok Orhan"] = {"A Strange Request", "Screecher Spirits"},
    ["Gor'mul"] = {"The Gordunni Scroll"},
    
    -- Felwood
    ["Greta Mosshide"] = {"Cleansing Felwood"},
    ["Arathandris Silversky"] = {"Cleansing Felwood", "Salve Via Hunting", "Salve Via Mining", "Salve Via Gathering"},
    ["Eridan Bluewind"] = {"Verifying the Corruption"},
    ["Nafien"] = {"Forces of Jaedenar", "Corrupted Sabers"},
    ["Tammra Windfield"] = {"Corrupted Sabers"},
    ["Gorn One Eye"] = {"Forces of Jaedenar"},
    ["Donova Snowden"] = {"Wild Guardians"},
    
    -- Un'Goro Crater
    ["Torwa Pathfinder"] = {"The Fare of Lar'korwi", "The Scent of Lar'korwi", "Bloodpetal Poison"},
    ["Williden Marshal"] = {"Lost!", "Chasing A-Me 01"},
    ["Krakle"] = {"A Little Help From My Friends"},
    ["Dadanga"] = {"Roll the Bones"},
    ["Karna Remtravel"] = {"Expedition Salvation"},
    ["J.D. Collie"] = {"Crystals of Power", "Making Sense of It", "Finding the Source"},
    ["Muigin"] = {"Muigin and Larion"},
    ["Larion"] = {"Muigin and Larion"},
    
    -- Searing Gorge / Burning Steppes
    ["Kibler"] = {"Kibler's Exotic Pets"},
    ["Oralius"] = {"FIFTY! YEP!", "Broodling Essence"},
    ["Kalaran Windblade"] = {"Caught!", "The Key to Freedom"},
    ["Overseer Oilfist"] = {"Curse These Fat Fingers"},
    ["Hansel Heavyhands"] = {"Fiery Menace!", "Incendosaurs? Whateverosaur is More Like It"},
    ["Taskmaster Scrange"] = {"Diplomatic Immunity"},
    ["Marshall Maxwell"] = {"Dragonhide Emulsion"},
    ["Morgan's Watch NPCs"] = {"Blackrock Spies"},
    
    -- Winterspring
    ["Donova Snowden"] = {"The Threat of the Winterfall", "Winterfall Firewater", "Falling to Corruption"},
    ["Rivern Frostwind"] = {"Frostsaber Provisions", "Winterfall Intrusion"},
    ["Salfa"] = {"Are We There, Yeti?"},
    ["Haleh"] = {"The Matron Protectorate", "Brood of Nozdormu"},
    ["Jaron Stoneshaper"] = {"Ursius of the Shardtooth"},
    ["Starfall Village NPCs"] = {"The Ruins of Kel'Theril"},
    
    -- Eastern Plaguelands
    ["Tirion Fordring"] = {"Of Forgotten Memories", "Of Lost Honor", "Of Love and Family", "Redemption"},
    ["Aurora Skycaller"] = {"The Active Agent"},
    ["Caretaker Alen"] = {"Zaeldarr the Outcast"},
    ["Nathanos Blightcaller"] = {"The Ranger Lord's Behest", "Stormers and Rumblers"},
    ["Augustus the Touched"] = {"Demons", "Carrion Grubbage"},
    ["Egan"] = {"When Smokey Sings, I Get Violent"},
    ["Pamela Redpath"] = {"Sister Pamela"},
    ["Marlene Redpath"] = {"Auntie Marlene"},
    ["Carlin Redpath"] = {"Heroes of Darrowshire"},
    
    -- Western Plaguelands
    ["Commander Ashlam Valorfist"] = {"Clear the Way", "All Along the Watchtowers"},
    ["High Priestess MacDonnell"] = {"A Plague Upon Thee"},
    ["Chromie"] = {"A Matter of Time", "Temporal Parasites"},
    ["Alchemist Arbington"] = {"Target: Felstone Field", "Target: Dalson's Tears", "Target: Writhing Haunt", "Target: Gahrron's Withering"},
    ["Hilde Hagene"] = {"Better Late Than Never"},
    ["Eva Sarkhoff"] = {"Scholomance", "The Lich, Ras Frostwhisper"},
    ["Flamekin Torch"] = {"The Scourge Cauldrons"},
    
    -- Silithus
    ["Cenarion Hold NPCs"] = {"Wanted - Deathclasp", "Deadly Desert Venom", "The Twilight Mystery"},
    ["Hermit Wordshift"] = {"The Calling"},
    ["Rutgar Glyphshaper"] = {"Glyph Chasing", "Noggle's Lost Satchel"},
    ["Bor Wildmane"] = {"Into the Maws of Madness"},
    ["Windcaller Proudhorn"] = {"A Terrible Purpose"},
    ["Aurel Goldleaf"] = {"The Perfect Poison"},
    ["Vish Kozus"] = {"Dearest Natalia"},
    
    -----------------------------------------
    -- Dungeon Quest NPCs
    -----------------------------------------
    -- Ragefire Chasm
    ["Thrall"] = {"Hidden Enemies"},
    ["Neeru Fireblade"] = {"Slaying the Beast", "The Power to Destroy..."},
    ["Varimathras"] = {"Testing an Enemy's Strength"},
    
    -- Wailing Caverns
    ["Nara Wildmane"] = {"Leaders of the Fang"},
    ["Muyoh"] = {"Serpentbloom"},
    ["Ebru"] = {"Deviate Eradication", "Deviate Hides"},
    ["Waldor"] = {"Trouble at the Docks"},
    
    -- Deadmines
    ["Shoni the Shilent"] = {"Underground Assault"},
    ["Wilder Thistlenettle"] = {"Oh Brother...", "Collecting Memories"},
    ["Mathias Shaw"] = {"The Unsent Letter"},
    
    -- Shadowfang Keep
    ["Historian Archsonus"] = {"Arugal Must Die"},
    ["Archmage Arugal"] = {"Deathstalkers in Shadowfang"},
    ["Sorcerer Ashcrombe"] = {"The Book of Ur"},
    ["High Executor Hadrec"] = {"Arugal's Folly"},
    
    -- Blackfathom Deeps
    ["Argent Guard Thaelrid"] = {"Blackfathom Villainy"},
    ["Lorgalis Manuscript"] = {"Knowledge in the Deeps"},
    ["Je'neu Sancrea"] = {"Allegiance to the Old Gods"},
    ["Bashana Runetotem"] = {"Trouble in the Deeps"},
    
    -- Gnomeregan
    ["High Tinker Mekkatorque"] = {"Gnogaine", "The Grand Betrayal"},
    ["Ozzie Togglevolt"] = {"The Only Cure is More Green Glow"},
    ["Gnoarn"] = {"Save Techbot's Brain!"},
    ["Kernobee"] = {"Escape from Gnomeregan"},
    
    -- Scarlet Monastery
    ["Brother Anton"] = {"In the Name of the Light"},
    ["Raleigh the Devout"] = {"Down the Scarlet Path"},
    ["Brother Crowley"] = {"Mythology of the Titans"},
    ["High Inquisitor Whitemane"] = {"Into The Scarlet Monastery"},
    ["Varimathras"] = {"Hearts of Zeal"},
    
    -- Razorfen Kraul
    ["Auld Stonespire"] = {"Mortality Wanes"},
    ["Falfindel Waywarder"] = {"A Dark Influence"},
    ["Willix the Importer"] = {"Willix the Importer"},
    
    -- Razorfen Downs
    ["Belnistrasz"] = {"Scourge of the Downs"},
    ["Andrew Brownell"] = {"A Host of Evil"},
    ["Myriam Moonsinger"] = {"Bring the End"},
    
    -- Uldaman
    ["Lead Prospector Durdin"] = {"Reclaimed Treasures", "Solution to Doom"},
    ["Historian Karnik"] = {"The Platinum Discs"},
    ["High Explorer Magellas"] = {"The Platinum Discs"},
    ["Stone Watcher of Norgannon"] = {"The Platinum Discs"},
    
    -- Zul'Farrak
    ["Trenton Lighthammer"] = {"Sacred Flame"},
    ["Wizzle Brassbolts"] = {"The Divino-matic Rod"},
    ["Chief Engineer Bilgewhizzle"] = {"Gahz'rilla", "The Prophecy of Mosh'aru"},
    
    -- Maraudon
    ["Celebras the Cursed"] = {"The Pariah's Instructions"},
    ["Cavindra"] = {"Legends of Maraudon"},
    ["Veng"] = {"The Scepter of Celebras"},
    
    -- Sunken Temple
    ["Atal'ai Exile"] = {"Into the Temple of Atal'Hakkar"},
    ["Marvon Rivetseeker"] = {"The Stone Circle"},
    ["Yeh'kinya"] = {"The Prophecy of Mosh'aru", "Screecher Spirits"},
    ["Jammal'an the Prophet"] = {"Jammal'an the Prophet"},
    
    -- Blackrock Depths
    ["Marshal Windsor"] = {"A Crumpled Up Note", "A Shred of Hope", "Jail Break!"},
    ["Kharan Mighthammer"] = {"The Fate of the Kingdom"},
    ["Princess Moira Bronzebeard"] = {"The Princess's Surprise"},
    ["Commander Gor'shak"] = {"The Royal Rescue"},
    ["Lokhtos Darkbargainer"] = {"Lokhtos Darkbargainer"},
    
    -- Lower Blackrock Spire
    ["Bijou"] = {"Bijou's Belongings"},
    ["Warosh"] = {"Warlord's Command"},
    ["Shadow Hunter Vosh'gajin"] = {"For The Horde!"},
    
    -- Upper Blackrock Spire
    ["Marshal Maxwell"] = {"General Drakkisath's Demise"},
    ["Warchief Rend Blackhand"] = {"For The Horde!"},
    
    -- Stratholme
    ["Commander Eligor Dawnbringer"] = {"Of Love and Family", "Above and Beyond"},
    ["Leonid Barthalomew the Revered"] = {"Houses of the Holy"},
    ["Magistrate Barthilas"] = {"The Archivist"},
    
    -- Scholomance
    ["Eva Sarkhoff"] = {"Doctor Theolen Krastinov, the Butcher"},
    ["Kirtonos the Herald"] = {"Kirtonos the Herald"},
    ["Magistrate Marduke"] = {"Krastinov's Bag of Horrors"},
    
    -- Dire Maul
    ["Shen'dralar Ancient"] = {"The Treasure of the Shen'dralar"},
    ["Lorekeeper Lydros"] = {"Foror's Compendium"},
    ["Estulan"] = {"Lethtendris's Web"},
    
    -----------------------------------------
    -- Class Quest NPCs (Common)
    -----------------------------------------
    -- Warrior
    ["Wulf Hansreim"] = {"Strength of the Steel"},
    ["Mathias Shaw"] = {"The Defias Brotherhood"},
    ["Grimand Elmore"] = {"The Tome of Divinity"},
    
    -- Paladin
    ["Duthorian Rall"] = {"The Tome of Divinity"},
    ["Brother Benjamin"] = {"Chillwind Horns"},
    ["Lord Grayson Shadowbreaker"] = {"Lord Grayson Shadowbreaker", "In Search of Anthion", "Charger"},
    
    -- Hunter
    ["Dargh Trueaim"] = {"Taming the Beast"},
    ["Huntress Kella Nightbow"] = {"Taming the Beast"},
    ["Grif Wildheart"] = {"Taming the Beast", "The Hunter's Path"},
    ["Ogtinc"] = {"The Hunter's Charm"},
    
    -- Rogue
    ["Hulfdan Blackbeard"] = {"Encrypted Letter"},
    ["Garion Wendell"] = {"Mathias and the Defias"},
    ["Lord Ravenholdt"] = {"A Simple Request"},
    
    -- Mage
    ["High Sorcerer Andromath"] = {"Ur's Treatise on Shadow Magic"},
    ["Archmage Xylem"] = {"Skullsplitter Shaman Magic", "The Arcane Way"},
    
    -- Warlock
    ["Gakin the Darkbinder"] = {"The Binding"},
    ["Gan'rul Bloodeye"] = {"Creature of the Void"},
    ["Mor'zul Bloodbringer"] = {"Lord Banehollow", "Dreadsteed of Xoroth"},
    
    -- Priest
    ["High Priestess Laurena"] = {"In Search of the Temple"},
    ["Brother Anton"] = {"In the Name of the Light"},
    
    -- Druid
    ["Mathrengyl Bearwalker"] = {"Moonglade", "A Reliquary of Purity"},
    ["Dendrite Starblaze"] = {"Trial of the Lake"},
    ["Loganaar"] = {"Aquatic Form"},
    
    -- Shaman
    ["Canaga Earthcaller"] = {"Call of Fire"},
    ["Islen Waterseer"] = {"Call of Water"},
    ["Bath'rah the Windwatcher"] = {"Material Assistance"},
    
    -----------------------------------------
    -- Additional Quest NPCs (Various Zones)
    -----------------------------------------
    -- More Barrens
    ["Thork"] = {"Disrupt the Attacks", "The Disruption Ends", "Supplies for the Crossroads"},
    ["Gazlowe"] = {"Southsea Freebooters", "The Baron of Gadgetzan", "Stolen Booty"},
    ["Seereth Stonebreak"] = {"Samophlange"},
    ["Captain Thalo'thas Brightsun"] = {"The Guns of Northwatch"},
    ["Tonga Runetotem"] = {"Altered Beings"},
    ["Mangletooth"] = {"Consumed by Hatred", "Lost in Battle", "Revenge of the Earthmother", "Blood Shards of Agamaggan"},
    
    -- More Ashenvale
    ["Shindrell Swiftfire"] = {"An Aggressive Defense", "Pridewings of Stonetalon"},
    ["Sentinel Thenysil"] = {"Bathran's Hair", "The Tower of Althalaxx"},
    ["Raene Wolfrunner"] = {"Raene's Cleansing"},
    ["Vindicator Pahaliah"] = {"Clear the Forest"},
    ["Senani Thunderheart"] = {"Satyr Horns", "Stonetalon Standstill"},
    
    -- More STV
    ["Fleet Master Seahorn"] = {"The Bloodsail Buccaneers", "Cracking Maury's Foot"},
    ["First Mate Crazz"] = {"Hostile Takeover"},
    ["Baron Revilgaz"] = {"Troll Witchery", "Water Elementals", "Venture Company Mining"},
    ["Corporal Kaleb"] = {"Bad Medicine", "Kurzen's Mystery"},
    ["Krazek"] = {"Krazek's Cookery", "Favor for Krazek"},
    
    -- Alterac/Hillsbrad
    ["Lieutenant Farren Orinelle"] = {"Syndicate Assassins", "The Rescue"},
    ["Magistrate Maleb"] = {"Crushridge Bounty", "WANTED: Syndicate Personnel"},
    ["Bartolo Ginsetti"] = {"Bartolo's Yeti Fur Cloak"},
    
    -- Searing Gorge/Burning Steppes
    ["Grark Lorkrub"] = {"Precarious Predicament"},
    ["Overseer Oilfist"] = {"Curse These Fat Fingers"},
    ["Hansel Heavyhands"] = {"Fiery Menace!", "Incendosaurs"},
    ["Kalaran Windblade"] = {"Caught!", "The Key to Freedom"},
    ["Zaruk"] = {"Krom'Grul"},
    ["Oralius"] = {"FIFTY! YEP!", "Broodling Essence"},
    ["Kibler"] = {"Kibler's Exotic Pets", "Warlord's Command"},
    
    -- Blasted Lands
    ["Fallen Hero of the Horde"] = {"The Disgraced One", "Heroes of Old", "Thadius Grimshade"},
    ["Kum'isha the Collector"] = {"Everything Counts In Large Amounts"},
    ["Thadius Grimshade"] = {"Nekrum's Medallion"},
    
    -- Azshara
    ["Archmage Xylem"] = {"An Apprentice's Enchantment", "Magic Dust"},
    ["Loramus Thalipedes"] = {"Fragments of the Past"},
    ["Kim'jael"] = {"Kim'jael Indeed!"},
}

-- Mob patterns for quest item drops
VGuideQuestTooltip.QuestMobPatterns = {
    -----------------------------------------
    -- Starting Zones (1-12)
    -----------------------------------------
    -- Durotar
    {"Mottled Boar", "Cutting Teeth", "Boar Meat"},
    {"Scorpid Worker", "Sting of the Scorpid", "Scorpid Tail"},
    {"Vile Familiar", "Vile Familiars", "Vile Familiar Head"},
    {"Burning Blade", "Burning Blade Medallion", "Burning Blade Medallion"},
    {"Kul Tiras", "The Admiral's Orders", "Admiral's Orders"},
    {"Kolkar", "Thwarting Kolkar Aggression", "Centaur Ears"},
    {"Makrura", "A Solvent Spirit", "Makrura Eye"},
    {"Durotar Tiger", "Practical Prey", "Durotar Tiger Fur"},
    {"Scorpid", "Sting of the Scorpid", "Scorpid Stinger"},
    
    -- Mulgore
    {"Plainstrider", "The Hunt Begins", "Plainstrider Feather"},
    {"Battleboar", "The Battleboars", "Battleboar Snout"},
    {"Swoop", "Swoop Hunting", "Swoop Talon"},
    {"Bristleback", "Attack on Camp Narache", "Bristleback Belt"},
    {"Prairie Wolf", "Rite of Strength", "Prairie Wolf Paw"},
    {"Mountain Cougar", "Rite of Strength", "Mountain Cougar Pelt"},
    
    -- Tirisfal Glades
    {"Mindless Zombie", "The Mindless Ones", "Embalming Ichor"},
    {"Scarlet", "The Scarlet Crusade", "Scarlet Insignia"},
    {"Night Web Spider", "Night Web's Hollow", "Spider Ichor"},
    {"Duskbat", "The Damned", "Duskbat Wing"},
    {"Rotting Dead", "Rattling the Rattlecages", "Putrid Claw"},
    {"Young Scavenger", "The Damned", "Scavenger Paw"},
    
    -- Elwynn Forest
    {"Kobold", "Gold Dust Exchange", "Gold Dust"},
    {"Wolf", "Wolves Across the Border", "Wolf Meat"},
    {"Defias", "The Defias Brotherhood", "Red Bandana"},
    {"Murloc", "Murloc Poachers", "Murloc Fin"},
    {"Forest Spider", "Garments of the Light", "Spider Venom"},
    {"Riverpaw Gnoll", "Riverpaw Gnoll Bounty", "Painted Gnoll Armband"},
    
    -- Dun Morogh
    {"Crag Boar", "Dwarven Outfitters", "Tough Boar Meat"},
    {"Rockjaw", "Rockjaw Invaders", "Rockjaw Ear"},
    {"Frostmane", "The Troll Cave", "Troll Bead"},
    {"Wendigo", "The Grizzled Den", "Wendigo Mane"},
    {"Leper Gnome", "Operation Recombobulation", "Gyromechanic Gear"},
    {"Ice Claw Bear", "Protecting the Herd", "Bear Claw"},
    {"Trogg", "Those Blasted Troggs!", "Trogg Stone Tooth"},
    
    -- Teldrassil
    {"Young Nightsaber", "The Balance of Nature", "Nightsaber Fang"},
    {"Webwood Spider", "Webwood Venom", "Webwood Venom Sac"},
    {"Timberling", "Timberling Seeds", "Timberling Seed"},
    {"Gnarlpine", "The Relics of Wakening", "Gnarlpine Fang"},
    {"Grell", "Zenn's Bidding", "Grell Earring"},
    {"Strigid Owl", "The Balance of Nature", "Owl Feather"},
    {"Nightsaber", "The Balance of Nature", "Nightsaber Fang"},
    
    -----------------------------------------
    -- Leveling Zones (12-30)
    -----------------------------------------
    -- Westfall
    {"Harvest Golem", "The Killing Fields", "Harvest Golem Part"},
    {"Defias Bandit", "Red Leather Bandanas", "Red Bandana"},
    {"Defias Looter", "The People's Militia", "Defias Loot"},
    {"Goretusk", "Westfall Stew", "Goretusk Liver"},
    {"Shore Crawler", "Poor Old Blanchy", "Crawler Mucus"},
    
    -- Loch Modan
    {"Stonesplinter", "In Defense of the King's Lands", "Trogg Armband"},
    {"Loch Crocolisk", "Crocolisk Hunting", "Crocolisk Skin"},
    {"Mountain Buzzard", "Buzzard Beaks", "Buzzard Beak"},
    {"Mo'grosh", "Excavation Progress Report", "Mo'grosh Ear"},
    
    -- Darkshore
    {"Moonstalker", "How Big a Threat?", "Moonstalker Fang"},
    {"Rabid Thistle Bear", "Cleansing of the Infected", "Diseased Bear"},
    {"Thresher", "Buzzbox 411", "Thresher Eye"},
    {"Reef Crawler", "Buzzbox 827", "Crawler Leg"},
    {"Foreststrider", "Buzzbox 323", "Foreststrider Feather"},
    {"Grizzled Thistle Bear", "Buzzbox 525", "Grizzled Bear Heart"},
    {"Blackwood", "The Blackwood Corrupted", "Blackwood Nut"},
    
    -- Silverpine Forest
    {"Rot Hide", "Rot Hide Clues", "Rot Hide Ichor"},
    {"Ravenclaw", "Border Crossings", "Ravenclaw Talon"},
    {"Son of Arugal", "Arugal's Folly", "Arugal's Favor"},
    {"Moonrage", "Prove Your Worth", "Moonrage Leather"},
    {"Dalaran", "A Recipe For Death", "Dalaran Pendant"},
    
    -- The Barrens
    {"Razormane", "Consumed by Hatred", "Razormane Snout"},
    {"Harpy", "Harpy Raiders", "Harpy Feather"},
    {"Centaur", "Centaur Bracers", "Centaur Bracer"},
    {"Raptor", "Raptor Thieves", "Raptor Head"},
    {"Zhevra", "The Zhevra", "Zhevra Hooves"},
    {"Savannah Prowler", "Prowlers of the Barrens", "Prowler Claws"},
    {"Quillboar", "Quillboar Menace", "Quillboar Tusk"},
    {"Thunderhawk", "Altered Beings", "Thunderhawk Feather"},
    {"Oasis Snapjaw", "The Stagnant Oasis", "Snapjaw Shell"},
    {"Deviate", "Deviate Eradication", "Deviate Hide"},
    
    -- Stonetalon Mountains
    {"Venture Co.", "Goblin Invaders", "Venture Co. Documents"},
    {"Grimtotem", "Wanted - Arnak Grimtotem", "Grimtotem Horn"},
    {"Deepmoss", "Deepmoss Spider Eggs", "Deepmoss Egg"},
    {"Bloodfury", "Bloodfury Bloodline", "Bloodfury Ripper Horn"},
    
    -- Ashenvale
    {"Naga", "The Zoram Strand", "Naga Scale"},
    {"Satyr", "Satyr Horns", "Satyr Horn"},
    {"Foulweald", "Raene's Cleansing", "Foulweald Totem"},
    {"Thistlefur", "Thistlefur Avengers", "Thistlefur Cloak"},
    {"Wrathtail", "The Zoram Strand", "Wrathtail Head"},
    
    -- Redridge Mountains
    {"Blackrock", "Blackrock Bounty", "Blackrock Head"},
    {"Redridge Gnoll", "Assessing the Threat", "Gnoll Paw"},
    {"Shadow Hide", "Shadow Magic", "Shadow Eye"},
    
    -- Duskwood
    {"Worgen", "Worgen in the Woods", "Worgen Paw"},
    {"Skeletal", "Night Watch", "Skeletal Finger"},
    {"Ghoul", "Night Watch", "Ghoul Rib"},
    {"Plague Spreader", "Deliveries to Sven", "Diseased Wolf Pelt"},
    {"Nightbane", "The Legend of Stalvan", "Nightbane Claw"},
    
    -- Hillsbrad Foothills  
    {"Hillsbrad", "Battle of Hillsbrad", "Hillsbrad Human Skull"},
    {"Syndicate", "WANTED: Syndicate Personnel", "Syndicate Emblem"},
    {"Crushridge", "Crushridge Bounty", "Crushridge Head"},
    {"Yeti", "Helcular's Revenge", "Yeti Fur"},
    
    -- Thousand Needles
    {"Galak", "Pacify the Centaur", "Galak Ear"},
    {"Roguefeather", "Wind Rider", "Roguefeather Quill"},
    
    -----------------------------------------
    -- Mid-Level Zones (30-45)
    -----------------------------------------
    -- Stranglethorn Vale
    {"Tiger", "Tiger Mastery", "Tiger Fang"},
    {"Panther", "Panther Mastery", "Panther Fang"},
    {"Bloodscalp", "Bloodscalp Ears", "Bloodscalp Ear"},
    {"Skullsplitter", "Skullsplitter Tusks", "Skullsplitter Tusk"},
    {"Venture Co", "Venture Company Mining", "Venture Co. Badge"},
    {"Lashtail", "Raptor Mastery", "Lashtail Raptor Feather"},
    {"Kurzen", "Bad Medicine", "Kurzen Medicine"},
    {"Bloodsail", "The Bloodsail Buccaneers", "Bloodsail Chart"},
    {"Southsea", "Southsea Shakedown", "Southsea Strongbox"},
    
    -- Desolace
    {"Magram", "Gelkis Alliance", "Magram Ear"},
    {"Gelkis", "Magram Alliance", "Gelkis Ear"},
    {"Scorpashi", "Bone Collector", "Scorpashi Claw"},
    {"Kodo", "Kodo Roundup", "Aged Kodo Hide"},
    
    -- Arathi Highlands
    {"Witherbark", "Witherbark Trolls", "Witherbark Tusk"},
    {"Boulderfist", "Stromgarde Badges", "Stromgarde Badge"},
    
    -- Badlands
    {"Ogre", "Crushridge Bounty", "Ogre Ear"},
    {"Dustbelcher", "Power Stones", "Dustbelcher Manacle"},
    {"Rock Elemental", "Study of the Elements: Rock", "Rock Elemental Shard"},
    {"Buzzard", "Barbecued Buzzard Wings", "Buzzard Wing"},
    {"Shadowforge", "Broken Alliances", "Shadowforge Relic"},
    
    -- Dustwallow Marsh
    {"Mudrock", "Mudrock Soup and Bugs", "Mudrock Claw"},
    {"Mirefin", "Hungry!", "Mirefin Head"},
    {"Deadmire", "Deadmire", "Deadmire's Scale"},
    
    -- Swamp of Sorrows
    {"Swampwalker", "Draenethyst Crystals", "Draenethyst Crystal"},
    {"Lost One", "Galen's Escape", "Lost One Muck"},
    
    -----------------------------------------
    -- High-Level Zones (45-60)
    -----------------------------------------
    -- Tanaris
    {"Wastewander", "Wastewander Justice", "Wastewander Water Pouch"},
    {"Dunemaul", "The Dunemaul Compound", "Dunemaul Sign"},
    {"Thistleshrub", "Thistleshrub Valley", "Thistleshrub Dew"},
    {"Sandfury", "The Prophecy of Mosh'aru", "Sandfury Relic"},
    
    -- Feralas
    {"Woodpaw", "War on the Woodpaw", "Woodpaw Gnoll Mane"},
    {"Gordunni", "The Gordunni Scroll", "Gordunni Scroll"},
    {"Sprite Darter", "Sprite Darter Hatchling", "Sprite Darter Egg"},
    {"Yeti", "The Mark of Quality", "Pristine Yeti Hide"},
    
    -- Felwood
    {"Deadwood", "Deadwood Headdress Feather", "Deadwood Headdress Feather"},
    {"Jadefire", "Verifying the Corruption", "Felwood Slime"},
    {"Furbolg", "Timbermaw Furbolg", "Furbolg Medicine"},
    {"Angerclaw", "Forces of Jaedenar", "Angerclaw Mauler Claw"},
    
    -- Un'Goro Crater
    {"Devilsaur", "The Fare of Lar'korwi", "Devilsaur Tooth"},
    {"Ravasaur", "The Scent of Lar'korwi", "Ravasaur Pheromone"},
    {"Silithid", "Making Sense of It", "Silithid Goo"},
    {"Pterrordax", "Roll the Bones", "Pterrordax Bone"},
    {"Bloodpetal", "Bloodpetal Poison", "Bloodpetal Sprout"},
    {"Gorilla", "A Little Help From My Friends", "Un'Goro Gorilla Pelt"},
    
    -- Winterspring
    {"Winterfall", "The Threat of the Winterfall", "Winterfall Spirit Beads"},
    {"Frostsaber", "Frostsaber Provisions", "Frostsaber Meat"},
    {"Ice Thistle", "Are We There, Yeti?", "Pristine Yeti Horn"},
    {"Frostmaul", "Are We There, Yeti?", "Frostmaul Shards"},
    {"Shardtooth", "Ursius of the Shardtooth", "Shardtooth Meat"},
    
    -- Burning Steppes / Searing Gorge
    {"Black Dragonspawn", "Broodling Essence", "Black Dragonspawn Eye"},
    {"Firegut", "FIFTY! YEP!", "Firegut Brute Ear"},
    {"Dark Iron", "Curse These Fat Fingers", "Dark Iron Rune"},
    {"Incendosaur", "Incendosaurs? Whateverosaur is More Like It", "Incendosaur Scale"},
    {"Flamescale", "Kibler's Exotic Pets", "Flamescale Hatchling"},
    
    -- Eastern Plaguelands
    {"Plaguehound", "Zaeldarr the Outcast", "Plaguehound Blood"},
    {"Skeletal", "Of Forgotten Memories", "Skeletal Fragments"},
    {"Carrion", "Carrion Grubbage", "Carrion Grub"},
    {"Mossflayer", "When Smokey Sings, I Get Violent", "Mossflayer Remains"},
    {"Plaguebat", "Active Agent", "Plaguebat Lung"},
    
    -- Western Plaguelands
    {"Diseased Wolf", "A Plague Upon Thee", "Diseased Wolf Pelt"},
    {"Scarlet Spellbinder", "Clear the Way", "Scarlet Spellbinder"},
    
    -- Silithus
    {"Twilight", "The Twilight Mystery", "Twilight Pendant"},
    {"Cultist", "Disciples of the Infernal", "Cultist Medallion"},
    {"Silithid", "Deadly Desert Venom", "Silithid Venom"},
    {"Hive", "Into the Maws of Madness", "Hive Parts"},
    
    -- Blasted Lands
    {"Dreadmaul", "Krom'Grul", "Dreadmaul Earring"},
    {"Shadowsworn", "Heroes of Old", "Shadowsworn Amulet"},
    
    -- Dragonmaw
    {"Dragonmaw", "War Banners", "Dragonmaw War Banner"},
}

function VGuideQuestTooltip:Initialize()
    if self.initialized then return end
    
    -- Parse all guide tables for quest names
    self:ParseGuideTables()
    
    -- Build the NPC database
    self:BuildDatabase()
    
    -- Hook the GameTooltip
    self:HookTooltip()
    
    self.initialized = true
    Di("      - Quest Tooltips initialized (" .. self:CountNPCs() .. " NPCs, " .. self:CountGuideQuests() .. " guide quests)")
end

-- Parse all guide tables to extract quest names
function VGuideQuestTooltip:ParseGuideTables()
    -- List of all guide table names to check
    local guideTables = {
        -- Introduction
        "Table_001_Introduction",
        -- Horde starting zones
        "Table_002_Durotar",
        "Table_002_Mulgore", 
        "Table_002_TirisfalGlades",
        -- Alliance starting zones
        "Table_002_DunMorogh",
        "Table_002_ElwynnForest",
        "Table_002_Teldrassil",
        -- Horde leveling
        "Table_003_Horde_12to20",
        "Table_003_Horde_20to30",
        "Table_003_Horde_30to40",
        "Table_003_Horde_40to50",
        "Table_003_Horde_50to60",
        -- Alliance leveling
        "Table_003_Alliance_12to20",
        "Table_003_Alliance_20to30",
        "Table_003_Alliance_30to40",
        "Table_003_Alliance_40to50",
        "Table_003_Alliance_50to60",
        -- Other guides
        "Table_004_Professions",
        "Table_005_Dungeons",
        "Table_006_GoldFarming",
        "Table_007_Reputation",
        "Table_008_TalentGuides",
        "Table_009_GearGuides",
    }
    
    for _, tableName in ipairs(guideTables) do
        local guideTable = getglobal(tableName)
        if guideTable then
            self:ParseGuideTable(guideTable)
        end
    end
    
    Di("      - Parsed " .. self:CountGuideQuests() .. " quests from guide tables")
end

-- Parse a single guide table for quest names
function VGuideQuestTooltip:ParseGuideTable(guideTable)
    if type(guideTable) ~= "table" then return end
    
    for sectionKey, section in pairs(guideTable) do
        if type(section) == "table" and section.items then
            for itemKey, item in pairs(section.items) do
                if type(item) == "table" and item.str then
                    self:ExtractQuestsFromString(item.str)
                end
            end
        end
    end
end

-- Extract quest names from a guide step string
function VGuideQuestTooltip:ExtractQuestsFromString(str)
    if not str then return end
    
    -- Pattern 1: #ACCEPT"Quest Name"# or #TURNIN"Quest Name"# or #DOQUEST"Quest Name"#
    for questType, questName in string.gfind(str, "#(ACCEPT)\"([^\"]+)\"#") do
        self:AddGuideQuest(questName, "accept")
    end
    for questType, questName in string.gfind(str, "#(TURNIN)\"([^\"]+)\"#") do
        self:AddGuideQuest(questName, "turnin")
    end
    for questType, questName in string.gfind(str, "#(DOQUEST)\"([^\"]+)\"#") do
        self:AddGuideQuest(questName, "do")
    end
    
    -- Pattern 2: #ACCEPTQuest Name# (without quotes) - match until next # or end
    for questName in string.gfind(str, "#ACCEPT([^#\"]+)#") do
        -- Clean up the quest name (trim whitespace)
        questName = string.gsub(questName, "^%s+", "")
        questName = string.gsub(questName, "%s+$", "")
        if questName ~= "" then
            self:AddGuideQuest(questName, "accept")
        end
    end
    for questName in string.gfind(str, "#TURNIN([^#\"]+)#") do
        questName = string.gsub(questName, "^%s+", "")
        questName = string.gsub(questName, "%s+$", "")
        if questName ~= "" then
            self:AddGuideQuest(questName, "turnin")
        end
    end
    for questName in string.gfind(str, "#DOQUEST([^#\"]+)#") do
        questName = string.gsub(questName, "^%s+", "")
        questName = string.gsub(questName, "%s+$", "")
        if questName ~= "" then
            self:AddGuideQuest(questName, "do")
        end
    end
end

-- Add a quest from guide parsing
function VGuideQuestTooltip:AddGuideQuest(questName, questType)
    if not questName or questName == "" then return end
    
    -- Clean up common issues
    questName = string.gsub(questName, " pt%.%d+", "")  -- Remove "pt.1", "pt.2" etc
    questName = string.gsub(questName, " Pt%.%d+", "")
    questName = string.gsub(questName, " part %d+", "")
    questName = string.gsub(questName, " Part %d+", "")
    
    if not self.GuideQuests[questName] then
        self.GuideQuests[questName] = { accept = false, turnin = false, doquest = false }
    end
    
    if questType == "accept" then
        self.GuideQuests[questName].accept = true
    elseif questType == "turnin" then
        self.GuideQuests[questName].turnin = true
    elseif questType == "do" then
        self.GuideQuests[questName].doquest = true
    end
    
    self.AllQuests[questName] = true
end

function VGuideQuestTooltip:CountGuideQuests()
    local count = 0
    for _ in pairs(self.GuideQuests) do
        count = count + 1
    end
    return count
end

function VGuideQuestTooltip:BuildDatabase()
    if self.databaseBuilt then return end
    
    -- Convert KnownNPCs to NPCQuests format
    for npcName, quests in pairs(self.KnownNPCs) do
        if type(quests) == "table" then
            self.NPCQuests[npcName] = { quests = {} }
            for _, questName in ipairs(quests) do
                table.insert(self.NPCQuests[npcName].quests, { name = questName, type = "both" })
                self.AllQuests[questName] = true
            end
        end
    end
    
    -- Build MobDrops from patterns
    for _, patternData in ipairs(self.QuestMobPatterns) do
        local pattern, questName, dropName = patternData[1], patternData[2], patternData[3]
        if not self.MobDrops[pattern] then
            self.MobDrops[pattern] = {}
        end
        table.insert(self.MobDrops[pattern], { item = dropName, quest = questName })
    end
    
    self.databaseBuilt = true
end

function VGuideQuestTooltip:CountNPCs()
    local count = 0
    for _ in pairs(self.NPCQuests) do
        count = count + 1
    end
    return count
end

function VGuideQuestTooltip:HookTooltip()
    local originalOnTooltipSetUnit = GameTooltip:GetScript("OnTooltipSetUnit")
    
    GameTooltip:SetScript("OnTooltipSetUnit", function()
        if originalOnTooltipSetUnit then
            originalOnTooltipSetUnit()
        end
        
        if VGuideQuestTooltip.enabled then
            VGuideQuestTooltip:AddQuestInfo()
        end
    end)
end

function VGuideQuestTooltip:AddQuestInfo()
    local name, unit = GameTooltip:GetUnit()
    if not name or not unit then return end
    
    local added = false
    
    -- Check if this NPC gives/accepts quests (exact match)
    local npcQuests = self.NPCQuests[name]
    if npcQuests and npcQuests.quests then
        added = self:AddNPCQuestLines(npcQuests.quests, added)
    end
    
    -- Check if this mob drops quest items (exact match first)
    local mobDrops = self.MobDrops[name]
    if mobDrops then
        added = self:AddMobDropLines(mobDrops, added)
    else
        -- Try pattern matching for mobs
        for pattern, drops in pairs(self.MobDrops) do
            if string.find(name, pattern) then
                added = self:AddMobDropLines(drops, added)
                break
            end
        end
    end
    
    if added then
        GameTooltip:Show()
    end
end

function VGuideQuestTooltip:AddNPCQuestLines(quests, added)
    local questsAdded = false
    
    for _, questInfo in ipairs(quests) do
        local questName = questInfo.name
        local questType = questInfo.type
        
        local statusText = nil
        local r, g, b = 1, 1, 1
        local shouldShow = false
        
        if questType == "start" or questType == "both" then
            if not self:IsQuestInLog(questName) then
                statusText = "|cFFFFCC00!|r " .. questName
                r, g, b = 1, 0.82, 0
                shouldShow = true
            end
        end
        
        if not shouldShow and (questType == "end" or questType == "both") then
            if self:IsQuestInLog(questName) then
                local complete = self:IsQuestReadyToTurnIn(questName)
                if complete then
                    statusText = "|cFFFFCC00?|r " .. questName .. " |cFF00FF00(Complete)|r"
                    r, g, b = 0.2, 1, 0.2
                else
                    statusText = "|cFF888888?|r " .. questName .. " |cFFFFFF00(In Progress)|r"
                    r, g, b = 1, 1, 0.5
                end
                shouldShow = true
            end
        end
        
        if shouldShow and statusText then
            if not questsAdded then
                if not added then
                    GameTooltip:AddLine(" ")
                end
                GameTooltip:AddLine("Quests:", 0.2, 0.8, 1)
                questsAdded = true
                added = true
            end
            GameTooltip:AddLine(statusText, r, g, b)
        end
    end
    
    return added
end

function VGuideQuestTooltip:AddMobDropLines(drops, added)
    local dropsAdded = false
    
    for _, dropInfo in ipairs(drops) do
        if self:IsQuestInLog(dropInfo.quest) then
            if not dropsAdded then
                if not added then
                    GameTooltip:AddLine(" ")
                end
                GameTooltip:AddLine("Quest Drops:", 0.2, 0.8, 1)
                dropsAdded = true
                added = true
            end
            GameTooltip:AddLine("  " .. dropInfo.item .. " (" .. dropInfo.quest .. ")", 0.8, 0.8, 0.8)
        end
    end
    
    return added
end

function VGuideQuestTooltip:IsQuestInLog(questName)
    if not questName then return false end
    
    local numEntries = GetNumQuestLogEntries()
    for i = 1, numEntries do
        local title, _, _, isHeader = GetQuestLogTitle(i)
        if not isHeader and title == questName then
            return true
        end
    end
    return false
end

function VGuideQuestTooltip:IsQuestReadyToTurnIn(questName)
    if not questName then return false end
    
    local numEntries = GetNumQuestLogEntries()
    for i = 1, numEntries do
        local title, _, _, isHeader, _, isComplete = GetQuestLogTitle(i)
        if not isHeader and title == questName then
            return isComplete == 1
        end
    end
    return false
end

function VGuideQuestTooltip:Toggle()
    self.enabled = not self.enabled
    local status = self.enabled and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00VanillaGuide:|r Quest tooltips " .. status)
end

-- Initialize when addon loads
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
initFrame:SetScript("OnEvent", function()
    this:UnregisterAllEvents()
    local delayFrame = CreateFrame("Frame")
    delayFrame.elapsed = 0
    delayFrame:SetScript("OnUpdate", function()
        this.elapsed = this.elapsed + arg1
        if this.elapsed > 1 then
            this:Hide()
            VGuideQuestTooltip:Initialize()
        end
    end)
end)

Dv(" VGuide QuestTooltip.lua End")
