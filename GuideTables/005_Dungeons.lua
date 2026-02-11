--[[--------------------------------------------------
005_Dungeons.lua
Authors: theKennethy
Version: 1.05.0
------------------------------------------------------
Description: Dungeon Guides for Vanilla WoW
    - Boss strategies
    - Recommended levels
    - Notable loot
    - Quest pickups
------------------------------------------------------
]]--

Table_005_Dungeons = {
-----------Ragefire Chasm (Horde Only)
	[8001] = {
		title = "Ragefire Chasm (13-18)",
		items = {
			[1] = { str = "#NPCRagefire Chasm# - Level 13-18 | Located in Orgrimmar Cleft of Shadow" },
			[2] = { str = "#DOQUESTQuests to Pick Up#: " ..
				"#TURNIN'Testing an Enemy's Strength'# - Rahauro, Thunder Bluff (Elder Rise) " ..
				"#TURNIN'The Power to Destroy...'# - Varimathras, Undercity " ..
				"#TURNIN'Searching for the Lost Satchel'# - Maur Raincaller, Thunder Bluff " ..
				"#TURNIN'Slaying the Beast'# - Neeru Fireblade, Orgrimmar (Cleft of Shadow) " ..
				"#TURNIN'Hidden Enemies'# - Thrall, Orgrimmar" },
			[3] = { str = "#ACCEPTBoss 1: Oggleflint# (Level 16 Elite) - Trogg at entrance. Tank and spank. " ..
				"#TURNINDrops#: Oggleflint's Inspirer (1H Mace)" },
			[4] = { str = "#ACCEPTBoss 2: Taragaman the Hungerer# (Level 16 Elite) - Felguard in lava room. " ..
				"Fire Nova - Run out when he casts. " ..
				"#TURNINDrops#: Subterranean Cape, Cursed Felblade" },
			[5] = { str = "#ACCEPTBoss 3: Jergosh the Invoker# (Level 16 Elite) - Orc Warlock at back. " ..
				"Interrupt his casts. Kill imps first. " ..
				"#TURNINDrops#: Robe of Evocation, Cavedweller Bracers" },
			[6] = { str = "#ACCEPTBoss 4: Bazzalan# (Level 16 Elite) - Satyr at end. " ..
				"Sinister Strike spam. Simple tank and spank. " ..
				"#TURNINDrops#: Chanting Blade" },
			[7] = { str = "#DOQUESTTips#: Great first dungeon for Horde. Quick run, good intro to group content. " ..
				"The 'Hidden Enemies' quest chain from Thrall is important for Horde lore!" },
		}
	},

-----------Deadmines (Alliance Primarily)
	[8002] = {
		title = "Deadmines (17-26)",
		items = {
			[1] = { str = "#NPCDeadmines# - Level 17-26 | Located in Moonbrook, Westfall" },
			[2] = { str = "#DOQUESTQuests to Pick Up#: " ..
				"#TURNIN'The Defias Brotherhood'# - Gryan Stoutmantle, Sentinel Hill (long chain) " ..
				"#TURNIN'Red Silk Bandanas'# - Scout Riell, Sentinel Hill " ..
				"#TURNIN'Collecting Memories'# - Wilder Thistlenettle, Stormwind (Dwarven District) " ..
				"#TURNIN'Oh Brother...'# - Wilder Thistlenettle, Stormwind " ..
				"#TURNIN'Underground Assault'# - Shoni the Shilent, Stormwind (Dwarven District)" },
			[3] = { str = "#ACCEPTBoss 1: Rhahk'Zor# (Level 19 Elite) - Ogre with big axe. " ..
				"Rhahk'Zor Slam - Knockback, tank against wall. " ..
				"#TURNINDrops#: Rhahk'Zor's Hammer (2H Mace)" },
			[4] = { str = "#ACCEPTBoss 2: Sneed's Shredder# (Level 20 Elite) - Goblin Shredder. " ..
				"Kill Shredder first, then Sneed pops out - kill him too! " ..
				"#TURNINDrops#: Buzzer Blade, Taskmaster Axe, Gold-flecked Gloves" },
			[5] = { str = "#ACCEPTBoss 3: Gilnid# (Level 20 Elite) - Goblin engineer. " ..
				"Molten Metal - Fire damage, healers watch out. " ..
				"#TURNINDrops#: Lavishly Jeweled Ring, Smelting Pants" },
			[6] = { str = "#ACCEPTBoss 4: Mr. Smite# (Level 20 Elite) - Tauren First Mate on ship. " ..
				"Stuns party and changes weapons at 66% and 33%. " ..
				"Wait for stun to end, don't panic! " ..
				"#TURNINDrops#: Smite's Mighty Hammer, Smite's Reaver, Thief's Blade" },
			[7] = { str = "#ACCEPTBoss 5: Captain Greenskin# (Level 20 Elite) - Goblin on ship deck. " ..
				"Simple fight, cleave damage. " ..
				"#TURNINDrops#: Emberstone Staff, Impaling Harpoon" },
			[8] = { str = "#ACCEPTFinal Boss: Edwin VanCleef# (Level 21 Elite) - In Captain's cabin. " ..
				"Spawns 2 adds at 50% and 25% - CC or AoE them! " ..
				"#TURNINDrops#: Cape of the Brotherhood, Blackened Defias Armor (Rogue set!), VanCleef's Head" },
			[9] = { str = "#DOQUESTTips#: Iconic Alliance dungeon. The Blackened Defias Armor is BiS for rogues until 30s. " ..
				"Take the ship's cannon at the end for a fun ride!" },
		}
	},

-----------Wailing Caverns
	[8003] = {
		title = "Wailing Caverns (17-24)",
		items = {
			[1] = { str = "#NPCWailing Caverns# - Level 17-24 | Located in The Barrens (cave entrance at 46,36)" },
			[2] = { str = "#DOQUESTQuests to Pick Up#: " ..
				"#TURNIN'Deviate Hides'# - Nalpak (above entrance) " ..
				"#TURNIN'Deviate Eradication'# - Ebru (above entrance) " ..
				"#TURNIN'Serpentbloom'# - Apothecary Zamah, Thunder Bluff " ..
				"#TURNIN'Leaders of the Fang'# - Nara Wildmane, Thunder Bluff " ..
				"#TURNIN'The Glowing Shard'# - Drops from Mutanus" },
			[3] = { str = "#DOQUESTDungeon Layout#: This dungeon is a MAZE. General order: " ..
				"Lady Anacondra → Lord Cobrahn → Kresh → Lord Pythas → " ..
				"Skum → Lord Serpentis → Verdan the Everliving → Mutanus" },
			[4] = { str = "#ACCEPTBoss: Lady Anacondra# - Druid boss. Sleep, healing. Interrupt heals!" },
			[5] = { str = "#ACCEPTBoss: Lord Cobrahn# - Druid boss. Snake form, poison. Cure poison!" },
			[6] = { str = "#ACCEPTBoss: Kresh# (Rare) - Giant turtle. #TURNINDrops#: Kresh's Back (Shield) - Very good!" },
			[7] = { str = "#ACCEPTBoss: Lord Pythas# - Druid boss. Sleep, healing. Same as Anacondra." },
			[8] = { str = "#ACCEPTBoss: Skum# - Thunder Lizard. Simple tank and spank." },
			[9] = { str = "#ACCEPTBoss: Lord Serpentis# - Final Fang Lord. Lightning Bolt spam, interrupt!" },
			[10] = { str = "#ACCEPTBoss: Verdan the Everliving# - Giant walking tree. Big damage, tank cooldowns. " ..
				"#TURNINDrops#: Living Root (Caster Staff)" },
			[11] = { str = "#ACCEPTFinal Boss: Mutanus the Devourer# - Spawns after escort. " ..
				"Talk to Disciple of Naralex to start event. Protect him! " ..
				"#TURNINDrops#: Mutanus's Maw, Deep Fathom Ring" },
			[12] = { str = "#DOQUESTFang Set#: Full Druid of the Fang set drops here - good for leather wearers!" },
		}
	},

-----------Shadowfang Keep
	[8004] = {
		title = "Shadowfang Keep (22-30)",
		items = {
			[1] = { str = "#NPCShadowfang Keep# - Level 22-30 | Located in Silverpine Forest (near Pyrewood Village)" },
			[2] = { str = "#DOQUESTQuests to Pick Up#: " ..
				"#TURNIN'The Book of Ur'# - Keeper Bel'dugur, Undercity (Apothecarium) " ..
				"#TURNIN'Deathstalkers in Shadowfang'# - High Executor Hadrec, The Sepulcher " ..
				"#TURNIN'Arugal Must Die'# - Dalar Dawnweaver, The Sepulcher " ..
				"#TURNIN'The Orb of Soran'ruk'# - Warlock quest, Barrens" },
			[3] = { str = "#ACCEPTBoss 1: Rethilgore# - Worgen in cells. Opens prison, free Deathstalkers for quest!" },
			[4] = { str = "#ACCEPTBoss 2: Razorclaw the Butcher# - Worgen in kitchen. " ..
				"Butcher Drain - Self heal, burn him fast!" },
			[5] = { str = "#ACCEPTBoss 3: Baron Silverlaine# - Ghost in dining hall. " ..
				"Veil of Shadow - Reduces healing. Dispel if possible. " ..
				"#TURNINDrops#: Baron's Scepter" },
			[6] = { str = "#ACCEPTBoss 4: Commander Springvale# - Ghost paladin. " ..
				"Holy Light - Interrupt! Divine Shield at low HP. Wait it out. " ..
				"#TURNINDrops#: Commander's Crest (Shield), Arced War Axe" },
			[7] = { str = "#ACCEPTBoss 5: Odo the Blindwatcher# - Bat boss in tower. " ..
				"Howling Rage - Enrage, big damage. Dispel or tank CD. " ..
				"#TURNINDrops#: Girdle of the Blindwatcher" },
			[8] = { str = "#ACCEPTBoss 6: Fenrus the Devourer# - Wolf in Arugal's room. " ..
				"Spawns Voidwalker adds on death. AoE them down!" },
			[9] = { str = "#ACCEPTBoss 7: Wolf Master Nandos# - Hunter with wolves. Kill wolves first!" },
			[10] = { str = "#ACCEPTFinal Boss: Archmage Arugal# (Level 26 Elite) - Top of tower. " ..
				"Teleports around room. Ranged stay center. " ..
				"Arugal's Curse - Turns player into Worgen (they attack party!) " ..
				"Void Bolt - Heavy shadow damage to tank. " ..
				"#TURNINDrops#: Robes of Arugal (Cloth BiS!), Belt of Arugal, Meteor Shard" },
			[11] = { str = "#DOQUESTTips#: Robes of Arugal is BiS for cloth until 40+! Great twink dungeon. " ..
				"Alliance need to run through Horde territory to get here." },
		}
	},

-----------Blackfathom Deeps
	[8005] = {
		title = "Blackfathom Deeps (24-32)",
		items = {
			[1] = { str = "#NPCBlackfathom Deeps# - Level 24-32 | Located in Ashenvale (northwest coast)" },
			[2] = { str = "#DOQUESTQuests (Alliance)#: " ..
				"#TURNIN'Researching the Corruption'# - Gershala Nightwhisper, Auberdine " ..
				"#TURNIN'In Search of Thaelrid'# - Sentinel Aluwyn, Darnassus " ..
				"#TURNIN'Twilight Falls'# - Argent Guard Manados, Darnassus " ..
				"#TURNIN'The Essence of Aku'Mai'# - Pick up inside" },
			[3] = { str = "#DOQUESTQuests (Horde)#: " ..
				"#TURNIN'Amongst the Ruins'# - Je'neu Sancrea, Zoram'gar Outpost " ..
				"#TURNIN'Allegiance to the Old Gods'# - Je'neu Sancrea, Zoram'gar " ..
				"#TURNIN'The Essence of Aku'Mai'# - Pick up inside" },
			[4] = { str = "#ACCEPTBoss: Ghamoo-ra# - Giant turtle. Simple. #TURNINDrops#: Ghamoo-ra's Bind" },
			[5] = { str = "#ACCEPTBoss: Lady Sarevess# - Naga archer. Forked Lightning - Spread out! " ..
				"#TURNINDrops#: Naga Battle Gloves, Darkwater Talwar" },
			[6] = { str = "#ACCEPTBoss: Gelihast# - Murloc boss. Summons adds. AoE! " ..
				"#TURNINDrops#: Algae Fists" },
			[7] = { str = "#ACCEPTBoss: Baron Aquanis# (Horde quest) - Water elemental. " ..
				"#TURNINDrops#: Strange Water Globe (starts quest)" },
			[8] = { str = "#ACCEPTBoss: Twilight Lord Kelris# - Twilight cultist. " ..
				"Mind Blast/Sleep - Interrupt! " ..
				"#TURNINDrops#: Gaze Dreamer Pants, Rod of the Sleepwalker" },
			[9] = { str = "#ACCEPTFinal Boss: Aku'mai# - Hydra in underwater temple. " ..
				"Light the braziers to summon! Poison Cloud - Move out. " ..
				"#TURNINDrops#: Leech Pants, Strike of the Hydra" },
			[10] = { str = "#DOQUESTTips#: Bring water breathing potions or have a Warlock. " ..
				"Multiple underwater sections. Good for leveling enchanting (Twilight mobs)." },
		}
	},

-----------Gnomeregan
	[8006] = {
		title = "Gnomeregan (29-38)",
		items = {
			[1] = { str = "#NPCGnomeregan# - Level 29-38 | Located in Dun Morogh (train from Ironforge or backdoor in Badlands)" },
			[2] = { str = "#DOQUESTQuests (Get in Ironforge/Tinkertown)#: " ..
				"#TURNIN'Save Techbot's Brain!'# - Tinkmaster Overspark " ..
				"#TURNIN'Gnogaine'# - Ozzie Togglevolt " ..
				"#TURNIN'The Only Cure is More Green Glow'# - Ozzie " ..
				"#TURNIN'Gyrodrillmatic Excavationators'# - Shoni, Stormwind " ..
				"#TURNIN'Essential Artificials'# - Klockmort Spannerspan, Ironforge " ..
				"#TURNIN'Data Rescue'# - Master Mechanic Castpipe, Ironforge" },
			[3] = { str = "#DOQUESTHorde Access#: Get 'Rig Wars' quest from Nogg in Orgrimmar. " ..
				"Use backdoor in Badlands at Uldaman dig site entrance." },
			[4] = { str = "#ACCEPTBoss: Grubbis# - Trogg after Techbot event. Kill adds first!" },
			[5] = { str = "#ACCEPTBoss: Viscous Fallout# - Patrol in irradiated hallway. Slime. Simple." },
			[6] = { str = "#ACCEPTBoss: Electrocutioner 6000# - Robot. Chain Lightning on melee - spread! " ..
				"#TURNINDrops#: Electrocutioner Leg, Electrocutioner Lagnut (Engineering)" },
			[7] = { str = "#ACCEPTBoss: Crowd Pummeler 9-60# - Robot, multiple spawns. " ..
				"#TURNINDrops#: Manual Crowd Pummeler (Feral Druid BiS until Naxx!)" },
			[8] = { str = "#ACCEPTBoss: Dark Iron Ambassador# (Rare) - In side room. Good loot!" },
			[9] = { str = "#ACCEPTFinal Boss: Mekgineer Thermaplugg# - Gnome in bomb room. " ..
				"Bombs spawn from pillars - 1 person runs around pressing buttons! " ..
				"Knockback - Tank against wall. " ..
				"#TURNINDrops#: Civinad Robes, Thermaplugg's Left Arm (Gun)" },
			[10] = { str = "#DOQUESTTips#: LONG dungeon - 1.5-2 hours. Jump down to skip trash. " ..
				"Feral Druids: Farm Crowd Pummelers, the haste proc is insane!" },
		}
	},

-----------Scarlet Monastery (All Wings)
	[8007] = {
		title = "Scarlet Monastery - Graveyard (28-33)",
		items = {
			[1] = { str = "#NPCScarlet Monastery - Graveyard# - Level 28-33 | Tirisfal Glades (northeast)" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Vorrel's Revenge'# - Monika Sengutz, Tarren Mill (loot Vorrel's ring) " ..
				"#TURNIN'Hearts of Zeal'# - Master Apothecary Faranell, Undercity " ..
				"#TURNIN'Going, Going, Guano!'# - drops from Graveyard" },
			[3] = { str = "#ACCEPTBoss: Interrogator Vishas# - In crypt. " ..
				"#TURNINDrops#: Bloody Brass Knuckles, Torturing Poker" },
			[4] = { str = "#ACCEPTBoss: Bloodmage Thalnos# - Undead mage in crypt. " ..
				"Shadow Bolt, Flame Spike - Interrupt! Fire Nova on melee." },
			[5] = { str = "#ACCEPTRare: Fallen Champion# - Patrols graveyard. Good loot!" },
			[6] = { str = "#DOQUESTTips#: Shortest SM wing. Can clear in 15-20 min. Great for grinding!" },
		}
	},

	[8008] = {
		title = "Scarlet Monastery - Library (29-39)",
		items = {
			[1] = { str = "#NPCScarlet Monastery - Library# - Level 29-39 | Tirisfal Glades" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Mythology of the Titans'# - Librarian Mae Paledust, Ironforge (Ally) " ..
				"#TURNIN'Compendium of the Fallen'# - Sage Truthseeker, Thunder Bluff (Horde) " ..
				"#TURNIN'In the Name of the Light'# - Raleigh the Devout, Southshore (Ally)" },
			[3] = { str = "#ACCEPTBoss: Houndmaster Loksey# - With dogs at entrance. Kill dogs first! " ..
				"#TURNINDrops#: Dog Training Gloves, Loksey's Training Stick" },
			[4] = { str = "#ACCEPTFinal Boss: Arcanist Doan# - In locked room (need Scarlet Key). " ..
				"Arcane Explosion - Run out at ~50% mana! " ..
				"Polymorph - Will sheep someone, dispel if possible. " ..
				"Detonation at low HP - RUN AWAY then come back! " ..
				"#TURNINDrops#: Illusionary Rod (Caster BiS!), Mantle of Doan, Robe of Doan, Hypnotic Blade" },
			[5] = { str = "#DOQUESTTips#: Illusionary Rod is BiS until 45+! Doan drops lots of caster gear." },
		}
	},

	[8009] = {
		title = "Scarlet Monastery - Armory (32-42)",
		items = {
			[1] = { str = "#NPCScarlet Monastery - Armory# - Level 32-42 | Tirisfal Glades" },
			[2] = { str = "#DOQUESTQuests#: Same as Library - 'In the Name of the Light'" },
			[3] = { str = "#ACCEPTFinal Boss: Herod# - Scarlet Champion. " ..
				"Whirlwind - KITE HIM! Don't stand in melee during WW! " ..
				"Enrage at 30% - Burn him! " ..
				"After death, Scarlet Trainees spawn - EASY AoE, great XP! " ..
				"#TURNINDrops#: Herod's Shoulder, Raging Berserker's Helm, Ravager (AoE god axe!)" },
			[4] = { str = "#DOQUESTTips#: Ravager is insane for AoE farming! Proc spin hits everything. " ..
				"Train pulls are very dangerous here - careful pullers needed." },
		}
	},

	[8010] = {
		title = "Scarlet Monastery - Cathedral (35-45)",
		items = {
			[1] = { str = "#NPCScarlet Monastery - Cathedral# - Level 35-45 | Tirisfal Glades" },
			[2] = { str = "#DOQUESTQuests#: 'In the Name of the Light' completes here. Bring Whitemane's head!" },
			[3] = { str = "#ACCEPTBoss: High Inquisitor Fairbanks# (Hidden) - Under altar. " ..
				"Curse of Blood, Fear. Tank and spank. Drops quest item for Corrupted Ashbringer chain." },
			[4] = { str = "#ACCEPTBoss: Scarlet Commander Mograine# - Front of cathedral. " ..
				"Retribution Aura - Don't attack when he bubbles! " ..
				"Lay on Hands at 50% - Hurts but survive it. " ..
				"When he dies, Whitemane res's him!" },
			[5] = { str = "#ACCEPTFinal Boss: High Inquisitor Whitemane# - Comes out after Mograine 'dies'. " ..
				"Sleep - Sleeps everyone, res's Mograine with full HP! " ..
				"Kill Whitemane first (lower HP), then Mograine again. " ..
				"#TURNINDrops#: Aegis of the Scarlet Commander, Whitemane's Chapeau, Mograine's Might, Scarlet Leggings, Triune Amulet, Hand of Righteousness" },
			[6] = { str = "#DOQUESTScarlet Set#: Full Scarlet Crusade mail set drops across wings - great for hunters/shamans!" },
			[7] = { str = "#DOQUESTTips#: Whitemane's Chapeau looks amazing and is good for healers! " ..
				"Mograine's Might is a top 2H mace for warriors/paladins." },
		}
	},

-----------Razorfen Kraul
	[8011] = {
		title = "Razorfen Kraul (29-38)",
		items = {
			[1] = { str = "#NPCRazorfen Kraul# - Level 29-38 | The Barrens (south, near Great Lift)" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Blueleaf Tubers'# - Mebok Mizzyrix, Ratchet " ..
				"#TURNIN'Willix the Importer'# - Escort inside " ..
				"#TURNIN'Mortality Wanes'# - Heralda Tallstrider, Camp Taurajo (Horde) " ..
				"#TURNIN'The Crone of the Kraul'# - Falfindel Waywarder, Theramore (Ally)" },
			[3] = { str = "#ACCEPTBoss: Roogug# - Quilboar in beginning. Simple." },
			[4] = { str = "#ACCEPTBoss: Aggem Thorncurse# - Geomancer. Interrupts needed." },
			[5] = { str = "#ACCEPTBoss: Death Speaker Jargba# - Caster. Kill adds first." },
			[6] = { str = "#ACCEPTBoss: Overlord Ramtusk# - Big quilboar. " ..
				"Spirit Wolves at 20% - AoE them down!" },
			[7] = { str = "#ACCEPTBoss: Agathelos the Raging# - Boar. Enrage at 50% - big damage!" },
			[8] = { str = "#ACCEPTFinal Boss: Charlga Razorflank# - Crone at the end. " ..
				"Chain Bolt - Spread out! " ..
				"#TURNINDrops#: Agamaggan's Clutch (Caster), Heart of Agamaggan (Shield)" },
			[9] = { str = "#DOQUESTTips#: Long escort quest (Willix) - do it for good XP!" },
		}
	},

-----------Uldaman
	[8012] = {
		title = "Uldaman (41-51)",
		items = {
			[1] = { str = "#NPCUldaman# - Level 41-51 | Badlands (north center)" },
			[2] = { str = "#DOQUESTQuests (Long List!)#: " ..
				"#TURNIN'The Lost Dwarves'# - Prospector Stormpike, Ironforge " ..
				"#TURNIN'Agmond's Fate'# - Hammertoe Grez, Badlands " ..
				"#TURNIN'Solution to Doom'# - Theldurin the Lost, Badlands " ..
				"#TURNIN'Power Stones'# - Rigglefuzz, Badlands " ..
				"#TURNIN'Reclaimed Treasures'# - Krom Stoutarm, Ironforge " ..
				"#TURNIN'The Platinum Discs'# - Pick up inside at end" },
			[3] = { str = "#ACCEPTBoss: Revelosh# - Stone giant. Spawns adds. " ..
				"#TURNINDrops#: Revelosh's Gloves, Shards (quest)" },
			[4] = { str = "#ACCEPTBoss: Ironaya# - Titan construct, locked door. " ..
				"Arcing Smash - Frontal cleave, face away from group. " ..
				"#TURNINDrops#: Ironaya's Bracers" },
			[5] = { str = "#ACCEPTBoss: Obsidian Sentinel# - Rare, wanders. Split into adds on death!" },
			[6] = { str = "#ACCEPTBoss: Ancient Stone Keeper# - Vault guardian. " ..
				"Sand Storms - Run out!" },
			[7] = { str = "#ACCEPTBoss: Galgann Firehammer# - Dark Iron dwarf with adds. CC adds!" },
			[8] = { str = "#ACCEPTBoss: Grimlok# - Trogg leader. Kill adds, interrupt heals." },
			[9] = { str = "#ACCEPTFinal Boss: Archaedas# - Titan watcher. " ..
				"Activate with staff in center room. " ..
				"Spawns adds throughout fight - kill them or get overwhelmed! " ..
				"#TURNINDrops#: Stoneslayer, Archaedic Stone" },
			[10] = { str = "#DOQUESTTips#: Very long dungeon! Discs of Norgannon quest gives great lore." },
		}
	},

-----------Zul'Farrak
	[8013] = {
		title = "Zul'Farrak (44-54)",
		items = {
			[1] = { str = "#NPCZul'Farrak# - Level 44-54 | Tanaris (northwest)" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Tiara of the Deep'# - Tabetha, Dustwallow Marsh " ..
				"#TURNIN'Nekrum's Medallion'# - Thadius Grimshade, Blasted Lands " ..
				"#TURNIN'Scarab Shells'# - Tran'rek, Gadgetzan " ..
				"#TURNIN'Divino-matic Rod'# - Chief Engineer Bilgewhizzle, Gadgetzan " ..
				"#TURNIN'Gahz'rilla'# - Wizzle Brassbolts, Shimmering Flats (need mallet)" },
			[3] = { str = "#ACCEPTBoss: Antu'sul# - Basilisk boss. Shadow Bolt Valley - group up to avoid. " ..
				"#TURNINDrops#: Sang'thraze the Deflector (half of Sul'thraze!)" },
			[4] = { str = "#ACCEPTBoss: Theka the Martyr# - Becomes immune to physical at low HP - casters finish!" },
			[5] = { str = "#ACCEPTBoss: Witch Doctor Zum'rah# - Summons skeletons. AoE fest!" },
			[6] = { str = "#ACCEPTSTAIRS EVENT# - Free prisoners, survive waves! " ..
				"Best AoE XP/loot event in game. Waves come down stairs. " ..
				"Tank top of stairs, AoE everything. AMAZING!" },
			[7] = { str = "#ACCEPTBoss: Nekrum Gutchewer & Sezz'ziz# - After stairs. Tank both, kill Sezz first (heals)." },
			[8] = { str = "#ACCEPTBoss: Chief Ukorz Sandscalp# - After graves. With Ruuzlu add. " ..
				"#TURNINDrops#: Jang'thraze the Protector (other half of Sul'thraze!)" },
			[9] = { str = "#ACCEPTBoss: Gahz'rilla# - Optional hydra, need Sacred Mallet to summon. " ..
				"Freeze - Everyone frozen, wait it out. Slam - Knockback. " ..
				"#TURNINDrops#: Gahz'rilla Scale Armor, Gahz'rilla Fang" },
			[10] = { str = "#DOQUESTTips#: ZF is the BEST dungeon for AoE grinding! Stairs event gives insane XP. " ..
				"Combine both swords to make Sul'thraze the Lasher - amazing 2H sword!" },
		}
	},

-----------Maraudon
	[8014] = {
		title = "Maraudon (46-55)",
		items = {
			[1] = { str = "#NPCMaraudon# - Level 46-55 | Desolace (east side, Valley of Spears)" },
			[2] = { str = "#DOQUESTTwo entrances#: Orange (Foulspore) and Purple (Wicked Grotto). " ..
				"Full run: Orange → Purple → Inner. Can skip to Inner with Scepter." },
			[3] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Legends of Maraudon'# - Cavindra, at entrance " ..
				"#TURNIN'The Pariah's Instructions'# - Centaur Pariah, Desolace " ..
				"#TURNIN'Shadowshard Fragments'# - Archmage Xylem, Azshara " ..
				"#TURNIN'Vyletongue Corruption'# - Talendria, Nijel's Point" },
			[4] = { str = "#ACCEPTOrange Side - Noxxion# - Elemental. Splits into 5 adds at 50%! " ..
				"Kill adds, he reforms, burn him down." },
			[5] = { str = "#ACCEPTOrange Side - Razorlash# - Lasher plant. Cleave, simple tank and spank." },
			[6] = { str = "#ACCEPTPurple Side - Lord Vyletongue# - Satyr with imps. Kill imps first!" },
			[7] = { str = "#ACCEPTPurple Side - Celebras the Cursed# - Keeper. " ..
				"After kill, his spirit gives Scepter of Celebras (shortcut to inner!)." },
			[8] = { str = "#ACCEPTInner - Landslide# - Rock elemental. Big damage, knockback. " ..
				"#TURNINDrops#: Fist of Stone, Blackstone Ring" },
			[9] = { str = "#ACCEPTInner - Tinkerer Gizlock# - Goblin with tech. " ..
				"Bombs, grenades. Move out of them!" },
			[10] = { str = "#ACCEPTInner - Rotgrip# - Crocolisk in water. Pull to shore. " ..
				"#TURNINDrops#: Rotgrip Mantle (good caster shoulders)" },
			[11] = { str = "#ACCEPTFinal Boss - Princess Theradras# - Earth elemental. " ..
				"Dust Field - Silence/pacify, run out! " ..
				"Thrash - Big melee damage, tank CDs. " ..
				"#TURNINDrops#: Blackstone Ring, Princess Theradras' Scepter, Gemshard Heart" },
			[12] = { str = "#DOQUESTTips#: Get Scepter of Celebras! Allows you to skip to inner Maraudon. " ..
				"Inner Maraudon is great for gold farming - lots of herbs and vendorables." },
		}
	},

-----------Sunken Temple
	[8015] = {
		title = "Sunken Temple (50-60)",
		items = {
			[1] = { str = "#NPCSunken Temple# - Level 50-60 | Swamp of Sorrows (Pool of Tears)" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'The Temple of Atal'Hakkar'# - Brohann Caskbelly, Stormwind (Ally) " ..
				"#TURNIN'Pool of Tears'# - Holaaru, Sunken Temple entrance " ..
				"#TURNIN'Into the Depths'# - Marvon Rivetseeker, Tanaris " ..
				"#TURNIN'Secret of the Circle'# - Marvon Rivetseeker " ..
				"#TURNIN'Class quest at 50'# - Check your trainer!" },
			[3] = { str = "#DOQUEST50 Class Quests#: Every class has a quest here! Great rewards, head slot enchant." },
			[4] = { str = "#DOQUESTDragon Statue Puzzle#: Light statues in order (varies) to spawn mini boss." },
			[5] = { str = "#ACCEPTBoss: Atal'alarion# - Guardian. Summons adds, tank and spank." },
			[6] = { str = "#ACCEPTTroll Mini-Bosses (6)#: Kill all 6 around balcony to unlock Jammal'an. " ..
				"Gasher, Mijan, Loro, Hukku, Zolo, Zul'Lor." },
			[7] = { str = "#ACCEPTBoss: Jammal'an the Prophet# - In center. With Ogom. " ..
				"Hex of Jammal'an - Turns player against party! Focus Jammal'an first." },
			[8] = { str = "#ACCEPTDragon Bosses - Dreamscythe & Weaver# - Two dragons patrol basement. AoE sleep." },
			[9] = { str = "#ACCEPTBoss: Avatar of Hakkar# - Summoned after clicking egg. " ..
				"Big elemental. Burn him fast, he has a lot of HP." },
			[10] = { str = "#ACCEPTFinal Boss: Shade of Eranikus# - Green dragon. " ..
				"War Stomp - AoE stun, spread out. " ..
				"Deep Slumber - Sleeps random player. " ..
				"#TURNINDrops#: Dragon's Call (summons whelp!), Rod of Corrosion, Crest of Supremacy" },
			[11] = { str = "#DOQUESTTips#: Very confusing layout! Bring someone who knows way. " ..
				"Class quest rewards are great - don't skip them!" },
		}
	},

-----------Blackrock Depths
	[8016] = {
		title = "Blackrock Depths (52-60)",
		items = {
			[1] = { str = "#NPCBlackrock Depths# - Level 52-60 | Blackrock Mountain (center)" },
			[2] = { str = "#DOQUESTThis is a MASSIVE dungeon! Multiple 'routes' for different goals:#" },
			[3] = { str = "#DOQUESTArena/Anger Route (30min)#: Prison → Arena → Anger. Quick loot run." },
			[4] = { str = "#DOQUESTLava Run (45min)#: Prison → Pyromancer → Magmus. Attunement to MC." },
			[5] = { str = "#DOQUESTEmperor Run (2hr+)#: Full clear to Emperor. Onyxia attunement." },
			[6] = { str = "#DOQUESTKey Quests#: " ..
				"#TURNIN'Dark Iron Legacy'# - Starts attunement, Franclorn Forgewright (ghost by lava) " ..
				"#TURNIN'Attunement to the Core'# - Lothos Riftwaker, at entrance " ..
				"#TURNIN'A Taste of Flame'# - Cyrus Therepentous, Burning Steppes " ..
				"#TURNIN'The Love Potion'# - Mistress Nagmara, Grim Guzzler" },
			[7] = { str = "#ACCEPTHigh Interrogator Gerstahn# - Prison. Has key to Shadowforge." },
			[8] = { str = "#ACCEPTRing of Law (Arena)# - Survive waves, random boss spawns. " ..
				"Theldren and adds is hardest - CC and focus!" },
			[9] = { str = "#ACCEPTLord Incendius# - Fire elemental. Fire resist helps. " ..
				"#TURNINDrops#: Ace of Elementals, Lord Incendius' Wrath" },
			[10] = { str = "#ACCEPTGolem Lord Argelmach# - With two golems. Kill golems first!" },
			[11] = { str = "#ACCEPTGrim Guzzler# - Bar with neutral Dark Irons. " ..
				"Don't attack anyone! Get key from Plugger or do quest. " ..
				"Phalanx can be activated - big damage dealer." },
			[12] = { str = "#ACCEPTGeneral Angerforge# - Arena upstairs. Enrages. " ..
				"#TURNINDrops#: Officer's Cloak, Angerforge's Onslaught" },
			[13] = { str = "#ACCEPTBael'Gar# - Fire elemental. Kill adds that spawn!" },
			[14] = { str = "#ACCEPTMagmus# - Before Emperor. Lava burst totem - destroy it immediately! " ..
				"War Stomp - AoE stun. #TURNINDrops#: Core from him = MC attunement!" },
			[15] = { str = "#ACCEPTEmperor Dagran Thaurissan# - With Princess Moira. " ..
				"If you kill Moira, she doesn't drop loot (for Onyxia quest, keep her alive). " ..
				"Hand of Thaurissan - Stun on tank, burn Emperor fast. " ..
				"#TURNINDrops#: Emperor's Seal, Ironfoe, Imperial Jewel" },
			[16] = { str = "#DOQUESTTips#: Get Shadowforge Key from Gerstahn! You need it for attunement runs. " ..
				"Ironfoe is a meme weapon for proc warriors." },
		}
	},

-----------Lower Blackrock Spire
	[8017] = {
		title = "Lower Blackrock Spire (55-60)",
		items = {
			[1] = { str = "#NPCLower Blackrock Spire# - Level 55-60 | Blackrock Mountain (upper doorway)" },
			[2] = { str = "#DOQUESTFor UBRS# - You need Seal of Ascension (UBRS key). Quest starts here!" },
			[3] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Kibler's Exotic Pets'# - Kibler, Burning Steppes " ..
				"#TURNIN'Urok Doomhowl'# - Warosh, LBRS (Ogre area) " ..
				"#TURNIN'Mother's Milk'# - Ragged John, Burning Steppes" },
			[4] = { str = "#ACCEPTUBRS Key (Seal of Ascension)#: " ..
				"1. Loot Unadorned Seal from Scarshield Quartermaster (LBRS entrance) " ..
				"2. Loot gems from LBRS ogres (Spirestone, Roughshod)" ..
				"3. Loot Unforged Seal from Overlord Wyrmthalak " ..
				"4. Combine at Emberstrife in Dustwallow (with party)" },
			[5] = { str = "#ACCEPTBoss: Highlord Omokk# - Ogre. Knockback. Simple fight. " ..
				"#TURNINDrops#: Skyshroud Leggings, Plate of the Shaman King" },
			[6] = { str = "#ACCEPTBoss: Shadow Hunter Vosh'gajin# - Troll. Hex - sheep party member!" },
			[7] = { str = "#ACCEPTBoss: War Master Voone# - Troll. Cleave, mortal strike. Tank and spank." },
			[8] = { str = "#ACCEPTBoss: Mother Smolderweb# - Spider. Crystallize - stuns. " ..
				"#TURNINDrops#: Smolderweb Egg (pet!)" },
			[9] = { str = "#ACCEPTBoss: Urok Doomhowl# - Summoned with pike. Hard fight with adds!" },
			[10] = { str = "#ACCEPTBoss: Quartermaster Zigris# - Rare. Good loot!" },
			[11] = { str = "#ACCEPTFinal Boss: Overlord Wyrmthalak# - Dragonkin. " ..
				"Summons two Chromatic drakes at 50% - CC or burn! " ..
				"#TURNINDrops#: Trindlehaven Staff, Wyrmthalak's Shackles" },
			[12] = { str = "#DOQUESTTips#: Get your UBRS key! You'll need it for many raid attunements." },
		}
	},

-----------Upper Blackrock Spire
	[8018] = {
		title = "Upper Blackrock Spire (58-60)",
		items = {
			[1] = { str = "#NPCUpper Blackrock Spire# - Level 58-60 | Blackrock Mountain (need UBRS key!)" },
			[2] = { str = "#DOQUESTThis is a 10-15 man dungeon (pre-nerf) or 5-man (later patches).# " ..
				"UBRS is the final step before raiding!" },
			[3] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'General Drakkisath's Demise'# - Eitrigg, Orgrimmar (Onyxia chain finale) " ..
				"#TURNIN'Finkle Einhorn, At Your Service!'# - Inside The Beast " ..
				"#TURNIN'Blackhand's Command'# - Scarshield Quartermaster (BWL attunement!)" },
			[4] = { str = "#ACCEPTBoss: Pyroguard Emberseer# - Dragon in first room. " ..
				"Free him by killing channelers! Fire Nova - run out." },
			[5] = { str = "#ACCEPTBoss: Solakar Flamewreath# - Optional dragon, spawns eggs. AoE adds!" },
			[6] = { str = "#ACCEPTBoss: Jed Runewatcher# - Rare. Pull carefully, has friends." },
			[7] = { str = "#ACCEPTBoss: Goraluk Anvilcrack# - Blacksmith. Drops Felstriker! " ..
				"#TURNINDrops#: Felstriker (Rogue dream weapon!)" },
			[8] = { str = "#ACCEPTBoss: Warchief Rend Blackhand# - On dragon. " ..
				"Dismounts at 50%. Kill dragon fast. " ..
				"#TURNINDrops#: Warblade of Caer Darrow, Dal'Rend's set (swords!)" },
			[9] = { str = "#ACCEPTBoss: Gyth# - Rend's dragon mount. Kill after Rend dismounts." },
			[10] = { str = "#ACCEPTBoss: The Beast# - Giant dog with fire breath. " ..
				"Fire damage heavy - FR gear helps. " ..
				"Finkle Einhorn is INSIDE The Beast - loot and save him! " ..
				"#TURNINDrops#: Bloodmoon Cloak, Finkle's Skinner (skinning dagger)" },
			[11] = { str = "#ACCEPTFinal Boss: General Drakkisath# - Dragonkin general. " ..
				"Conflagration - Fire DoT, can't do anything. Healer dispel! " ..
				"Cleave - Frontal cone, tank faces away. " ..
				"#TURNINDrops#: Brigam Girdle, Doomhide Gauntlets, Drakkisath's Blood (BWL attunement)" },
			[12] = { str = "#DOQUESTTips#: UBRS is your gateway to raiding! " ..
				"Get BWL attunement (Drakkisath's Blood) and Onyxia chain completion here." },
		}
	},

-----------Stratholme
	[8019] = {
		title = "Stratholme (58-60)",
		items = {
			[1] = { str = "#NPCStratholme# - Level 58-60 | Eastern Plaguelands (two entrances)" },
			[2] = { str = "#DOQUESTTwo sides#: Live (Scarlet) and Dead (Undead). Need Key to the City for Dead side shortcut." },
			[3] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'The Archivist'# - Duke Nicholas Zverenhoff, Light's Hope " ..
				"#TURNIN'Of Love and Family'# - Tirion Fordring, EPL " ..
				"#TURNIN'The Medallion of Faith'# - Aurius, Live side " ..
				"#TURNIN'Houses of the Holy'# - Leonid Barthalomew, Light's Hope" },
			[4] = { str = "#DOQUESTLive Side (Scarlet):#" },
			[5] = { str = "#ACCEPTBoss: The Unforgiven# - Ghost in beginning. Spawns banshees." },
			[6] = { str = "#ACCEPTBoss: Timmy the Cruel# - Ghoul. Enrages. Burn him!" },
			[7] = { str = "#ACCEPTBoss: Commander Malor# - Scarlet commander. Drops key to Cannon Master." },
			[8] = { str = "#ACCEPTBoss: Willey Hopebreaker (Cannon Master)# - Use his cannons against him! " ..
				"#TURNINDrops#: Cannonball Runner (Gun BiS)" },
			[9] = { str = "#ACCEPTBoss: Instructor Galford# - Mage. Burns library after death - loot fast!" },
			[10] = { str = "#ACCEPTBoss: Balnazzar# - Dreadlord disguised as Grand Crusader. " ..
				"Mind Control - Kill controlled player's damage fast! " ..
				"#TURNINDrops#: Crown of Tyranny, Shroud of the Nathrezim" },
			[11] = { str = "#DOQUESTDead Side (Scourge):#" },
			[12] = { str = "#ACCEPTBoss: Baroness Anastari# - Banshee. Possesses player - DPS them carefully! " ..
				"#TURNINDrops#: Banshee Finger, Wail of the Banshee" },
			[13] = { str = "#ACCEPTBoss: Nerub'enkan# - Nerubian. Web Wrap, poison. " ..
				"#TURNINDrops#: Crypt Stalker Leggings" },
			[14] = { str = "#ACCEPTBoss: Maleki the Pallid# - Lich. Frost damage." },
			[15] = { str = "#ACCEPTBoss: Magistrate Barthilas# - Undead magistrate. Drops Key to the City!" },
			[16] = { str = "#ACCEPTBoss: Ramstein the Gorger# - Abomination. Spawns after killing ziggurats. " ..
				"Trample - Knockback. Spawns ghouls on death - AoE!" },
			[17] = { str = "#ACCEPTFinal Boss: Baron Rivendare# - Death Knight. 45 MINUTE TIMER for mount! " ..
				"Unholy Aura - Damage aura, burn fast. Skeleton adds. " ..
				"#TURNINDrops#: Deathcharger's Reins (0.02% mount!), Runeblade of Baron Rivendare, Cape of the Black Baron" },
			[18] = { str = "#DOQUESTTips#: Baron run is iconic! Kill within 45 mins to save Ysida for mount chance. " ..
				"Need Key to the City for quick Dead side access." },
		}
	},

-----------Scholomance
	[8020] = {
		title = "Scholomance (58-60)",
		items = {
			[1] = { str = "#NPCScholomance# - Level 58-60 | Western Plaguelands (Caer Darrow island)" },
			[2] = { str = "#DOQUESTNeed Skeleton Key# - Quest from Eva Sarkhoff on Caer Darrow island." },
			[3] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Plagued Hatchlings'# - Betina Bigglezink, Light's Hope " ..
				"#TURNIN'Doctor Theolen Krastinov, the Butcher'# - Eva Sarkhoff, Caer Darrow " ..
				"#TURNIN'Dawn's Gambit'# - Betina Bigglezink " ..
				"#TURNIN'Kirtonos the Herald'# - Eva Sarkhoff (summon boss)" },
			[4] = { str = "#ACCEPTBoss: Kirtonos the Herald# - Summoned with Blood of Innocents. " ..
				"Gargoyle. Swoop attack, Shadow Bolt Volley. " ..
				"#TURNINDrops#: Heart of the Fiend, Kirtonos's Shawl" },
			[5] = { str = "#ACCEPTBoss: Jandice Barov# - Mage. Creates 30 illusions at 66% and 33%! " ..
				"Kill the real one (not the clones). Tank builds threat first. " ..
				"#TURNINDrops#: Barovian Family Sword, Wraithplate Leggings" },
			[6] = { str = "#ACCEPTBoss: Rattlegore# - Bone golem. Lots of HP. Tank and spank." },
			[7] = { str = "#ACCEPTBoss: Marduk Blackpool# - Warlock. Kill in classroom. " ..
				"#TURNINDrops#: Necropile set tokens" },
			[8] = { str = "#ACCEPTBoss: Vectus# - Mage. With two students. AoE adds!" },
			[9] = { str = "#ACCEPTBoss: Ras Frostwhisper# - Lich. " ..
				"Frost Nova + Blizzard combo - healers spam heals! " ..
				"Fear - Tremor totem or Fear Ward. " ..
				"#TURNINDrops#: Bonechill Hammer, Freezing Lich Robes, Spellbound Tome" },
			[10] = { str = "#ACCEPTBoss: Instructor Malicia# - Shadow priest. Mind Control tank - stop attacks!" },
			[11] = { str = "#ACCEPTBoss: Doctor Theolen Krastinov# - The Butcher. Physical damage, Frenzy. " ..
				"#TURNINDrops#: Bloody Surgeon's Mitts, Butcher's Apron" },
			[12] = { str = "#ACCEPTBoss: Lorekeeper Polkelt# - Optional in basement. Drops Corruptor's Scourgestones." },
			[13] = { str = "#ACCEPTBoss: The Ravenian# - Optional in basement. Big damage." },
			[14] = { str = "#ACCEPTBoss: Lord Alexei Barov# - Undead lord. Immolate, Veil of Shadow (reduce healing)." },
			[15] = { str = "#ACCEPTBoss: Lady Illucia Barov# - Ghost. Mind Control, Silence." },
			[16] = { str = "#ACCEPTFinal Boss: Darkmaster Gandling# - Headmaster. " ..
				"Teleports random player to side room - they must kill adds to escape! " ..
				"Shadow Shield - Dispel if possible. " ..
				"#TURNINDrops#: Gandling's Pauldrons, Headmaster's Charge (BiS caster staff!)" },
			[17] = { str = "#DOQUESTTips#: Get Skeleton Key first! Long dungeon, lots of bosses. " ..
				"Headmaster's Charge is BiS for casters until AQ40." },
		}
	},

-----------Dire Maul (All Wings)
	[8021] = {
		title = "Dire Maul East (55-60)",
		items = {
			[1] = { str = "#NPCDire Maul East# - Level 55-60 | Feralas (ancient Highborne ruins)" },
			[2] = { str = "#DOQUEST'Jump runs' for gold farming popular here!# Imp in a jar!"},
			[3] = { str = "#ACCEPTBoss: Lethtendris# - Blood Elf warlock. Curse of Tongues, Shadow Bolt. " ..
				"#TURNINDrops#: Lethtendris's Web" },
			[4] = { str = "#ACCEPTBoss: Hydrospawn# - Water elemental. Summons water adds. " ..
				"#TURNINDrops#: Waterspout Boots" },
			[5] = { str = "#ACCEPTBoss: Zevrim Thornhoof# - Satyr. Teleports player to altar for sacrifice - interrupt/kill fast!" },
			[6] = { str = "#ACCEPTBoss: Alzzin the Wildshaper# - Satyr. Shapeshifts into different forms. " ..
				"Thorns - Melee take damage. Tree form heals him - interrupt! " ..
				"#TURNINDrops#: Razor Gauntlets, Shadewood Cloak, Energized Chestplate" },
			[7] = { str = "#ACCEPTRare: Pusillin# - Imp chase! Chase him through instance, he drops Crescent Key at end." },
			[8] = { str = "#DOQUESTTips#: Get Crescent Key from Pusillin imp chase!" },
		}
	},

	[8022] = {
		title = "Dire Maul West (55-60)",
		items = {
			[1] = { str = "#NPCDire Maul West# - Level 55-60 | Need Crescent Key from DM East" },
			[2] = { str = "#DOQUESTQuests#: " ..
				"#TURNIN'Elven Legends'# - Scholar Runethorn, Feathermoon " ..
				"#TURNIN'The Madness Within'# - Shen'dralar Ancients, inside"},
			[3] = { str = "#ACCEPTBoss: Tendris Warpwood# - Ancient. Roots players. DoT damage." },
			[4] = { str = "#ACCEPTBoss: Illyanna Ravenoak# - Hunter with bear Ferra. Kill bear first!" },
			[5] = { str = "#ACCEPTBoss: Magister Kalendris# - Priest. Mind Flay, Shadow Word: Pain. Interrupt!" },
			[6] = { str = "#ACCEPTBoss: Immol'thar# - Demon imprisoned. Released by killing pylons. " ..
				"Eyes - Targets random player with mark, heavy damage. " ..
				"Portal - Spawns adds, AoE them. " ..
				"#TURNINDrops#: Eyestalk Cord, Immol'thar's Eyelash Belt" },
			[7] = { str = "#ACCEPTFinal Boss: Prince Tortheldrin# - Highborne prince. " ..
				"Whirlwind - Run through him to avoid! Thrash. " ..
				"#TURNINDrops#: Eldritch Reinforced Legplates, Chestplate of Tranquility" },
			[8] = { str = "#DOQUEST Note#: Can do 'Tribute' run by NOT killing bosses for extra loot!" },
		}
	},

	[8023] = {
		title = "Dire Maul North - Tribute (55-60)",
		items = {
			[1] = { str = "#NPCDire Maul North - Tribute# - Level 55-60 | The famous 'Tribute Run'!" },
			[2] = { str = "#DOQUESTTribute Run# - Skip/CC bosses to get EXTRA LOOT from King! " ..
				"More bosses alive = better loot from tribute chest." },
			[3] = { str = "#DOQUESTRequired Items#: " ..
				"#TURNINOgre Suit# - Made with Ogre Tannin (drops here), Bolt of Runecloth, Rugged Leather, Rune Thread " ..
				"#TURNINOgre Tannin# - Basket near Guard Slip'kik " ..
				"#TURNINFrost Oil# - To freeze Kromcrush's dogs (Alchemy)"},
			[4] = { str = "#DOQUESTStep 1#: Clear to Guard Mol'dar and Guard Fengus - DON'T KILL!" },
			[5] = { str = "#DOQUESTStep 2#: Get Ogre Tannin from basket near Slip'kik." },
			[6] = { str = "#DOQUESTStep 3#: Have Leatherworker make Ogre Suit (or buy pre-made)." },
			[7] = { str = "#DOQUESTStep 4#: Throw Frost Oil on Kromcrush's dogs, he walks away." },
			[8] = { str = "#DOQUESTStep 5#: (Optional) Kill Stomper Kreeg for free booze!" },
			[9] = { str = "#ACCEPTFinal Boss: King Gordok# - ONLY boss you kill. " ..
				"Berserker Charge - High damage, tank cooldowns. " ..
				"War Stomp - AoE stun. Mortal Strike. " ..
				"#TURNINDrops#: Barbarous Blade, Mud Stained Boots, Crown of the Ogre King" },
			[10] = { str = "#DOQUESTTribute Chest# contains extra loot based on bosses skipped: " ..
				"Gordok's Handwraps, Gordok's Handguards, Gordok's Gauntlets, " ..
				"Leggings of Destruction, Mana Channeling Wand, Sedge Boots, " ..
				"Rod of the Ogre Magi, Observer's Shield, Ogre Forged Hauberk" },
			[11] = { str = "#DOQUESTAfter King dies#: Guard Slip'kik becomes friendly vendor! " ..
				"You are now 'King of the Ogres.' Get king buff from Mizzle the Crafty. " ..
				"#TURNINDM Tribute Buffs#: +15 Stamina, +200 AP (melee) OR +3% spell crit (caster)" },
			[12] = { str = "#DOQUESTTips#: Tribute runs are THE pre-raid gold farm! Learn this route. " ..
				"World buff from tribute is useful for raiding." },
		}
	},
}
