--[[--------------------------------------------------
006_GoldFarming.lua
Authors: theKennethy
Version: 1.05.0
------------------------------------------------------
Description: Gold Making & Farming Guides for Vanilla WoW
    - Farming spots by level
    - Profession money-making
    - AH tips
    - Vendor tricks
------------------------------------------------------
]]--

Table_006_GoldFarming = {
-----------General Gold Making Tips
	[9001] = {
		title = "Gold Making - General Tips",
		items = {
			[1] = { str = "#NPCGold Making Fundamentals# - Master these basics first!" },
			[2] = { str = "#DOQUEST1. ALWAYS loot everything!# Grey items vendor for gold. " ..
				"A full clear vendoring greys can be 5-10g per hour extra." },
			[3] = { str = "#DOQUEST2. Get bags ASAP!# 14-slot (Traveler's Backpack) or 16-slot (Mooncloth Bag). " ..
				"More bag space = longer farming sessions = more gold." },
			[4] = { str = "#DOQUEST3. Learn AH patterns!# Check prices before vendoring items. " ..
				"Some 'useless' items sell for 10x vendor price on AH." },
			[5] = { str = "#DOQUEST4. Gathering professions while leveling!# Mining + Herbalism or Mining + Skinning. " ..
				"Sell everything on AH. Level 60 mats are valuable!" },
			[6] = { str = "#DOQUEST5. Save cloth!# Don't vendor Runecloth. It's used for faction rep turn-ins." },
			[7] = { str = "#DOQUEST6. Farm during off-peak hours!# Less competition = faster farming." },
			[8] = { str = "#DOQUEST7. Develop a routine!# Consistent farming beats random play every time." },
		}
	},

-----------Auction House Guide
	[9002] = {
		title = "Auction House Mastery",
		items = {
			[1] = { str = "#NPCAuction House# - Where the real gold is made!" },
			[2] = { str = "#DOQUESTInstall Auctioneer addon!# Scans prices, shows profit margins." },
			[3] = { str = "#DOQUESTBuying Tips#:" },
			[4] = { str = "#ACCEPT- Scan AH daily# - Learn normal prices for your server." },
			[5] = { str = "#ACCEPT- Buy low on weekdays# - Fewer buyers, desperate sellers." },
			[6] = { str = "#ACCEPT- Snipe mispriced items# - People list epics for silvers by mistake!" },
			[7] = { str = "#ACCEPT- Buy raid consumables CHEAP on Tue/Wed# - Before raid resets." },
			[8] = { str = "#DOQUESTSelling Tips#:" },
			[9] = { str = "#ACCEPT- Post on weekends# - More buyers, higher prices." },
			[10] = { str = "#ACCEPT- 24-hour auctions# - Cheaper deposit, catches all time zones." },
			[11] = { str = "#ACCEPT- Undercut by 1 copper# - Don't crash markets!" },
			[12] = { str = "#ACCEPT- Post rare items on raid nights# - Raiders need consumables." },
			[13] = { str = "#DOQUESTHot Selling Items#:" },
			[14] = { str = "#TURNINRunecloth# - Always sells (faction rep)." },
			[15] = { str = "#TURNINRecipes# - Rare drops sell for huge gold." },
			[16] = { str = "#TURNINTwink gear# - 19/29/39/49 bracket items = goldmine." },
			[17] = { str = "#TURNINConsumables# - Potions, food, bandages before raid nights." },
			[18] = { str = "#TURNINPets# - Rare vendor pets from other faction sell well." },
		}
	},

-----------Level 30-40 Farming
	[9003] = {
		title = "Farming Spots: Level 30-40",
		items = {
			[1] = { str = "#NPCFarming Level 30-40# - Start building that epic mount fund!" },
			[2] = { str = "#DOQUESTDesolace - Kodo Graveyard# (32-38)" },
			[3] = { str = "#ACCEPTKodo Hides + Thick Leather#: Skin the kodo corpses and kill ghost kodos. " ..
				"Great for skinners. Low competition. 5-8g/hour." },
			[4] = { str = "#DOQUESTStranglethorn Vale - Tiger/Panther spawns# (35-42)" },
			[5] = { str = "#ACCEPTTiger Meat, Panther Sinew#: Skinning gives Heavy Leather, Thick Leather. " ..
				"Grind the cat camps. Vendor/AH everything. 8-12g/hour." },
			[6] = { str = "#DOQUESTArathi Highlands - Dabyrie's Farmstead# (35-40)" },
			[7] = { str = "#ACCEPTHumanoid drops#: Silk Cloth, random greens. Fast respawn. " ..
				"Good for cloth classes needing First Aid. 6-10g/hour." },
			[8] = { str = "#DOQUESTBadlands - Rock Elementals# (35-42)" },
			[9] = { str = "#ACCEPTElemental Earth, Solid Stone#: Both sell well on AH. " ..
				"Engineers and alchemists need these. 10-15g/hour." },
			[10] = { str = "#DOQUESTDustwallow Marsh - Murlocs# (38-42)" },
			[11] = { str = "#ACCEPTClam Meat, Soothing Spices#: Clams contain pearls (Golden Pearl = big gold!) " ..
				"Dense spawns, fast respawn. 8-12g/hour average, jackpot on pearls." },
		}
	},

-----------Level 40-50 Farming
	[9004] = {
		title = "Farming Spots: Level 40-50",
		items = {
			[1] = { str = "#NPCFarming Level 40-50# - Epic mount or saving for raid gear!" },
			[2] = { str = "#DOQUESTTanaris - Southsea Pirates# (43-47)" },
			[3] = { str = "#ACCEPTPirate camp farming#: Mageweave Cloth, Pirate hats (AH novelty). " ..
				"Chest spawns contain valuable items. 10-15g/hour." },
			[4] = { str = "#DOQUESTFeralas - Yetis# (46-50)" },
			[5] = { str = "#ACCEPTThick Yeti Hide, Thick Leather#: Skinners make bank here. " ..
				"Yeti caves have dense spawns. 12-18g/hour." },
			[6] = { str = "#DOQUESTThe Hinterlands - Trolls# (45-50)" },
			[7] = { str = "#ACCEPTMageweave, greens, Wildvine#: Trolls drop great loot. " ..
				"Herbalists: Wildvine from plants. 12-15g/hour." },
			[8] = { str = "#DOQUESTAzshara - Blood Elves# (48-52)" },
			[9] = { str = "#ACCEPTRunecloth, greens, recipes#: Start of endgame cloth. " ..
				"Rare recipe drops (Enchanting). 15-20g/hour." },
			[10] = { str = "#DOQUESTSearing Gorge - Dark Iron Dwarves# (45-50)" },
			[11] = { str = "#ACCEPTDark Iron Residue, Runecloth#: Turn-in for Thorium Brotherhood rep. " ..
				"Sell residue to rep farmers. Mining nearby. 12-18g/hour." },
		}
	},

-----------Level 50-60 Farming
	[9005] = {
		title = "Farming Spots: Level 50-60",
		items = {
			[1] = { str = "#NPCFarming Level 50-60# - Pre-raid and raid consumable gold!" },
			[2] = { str = "#DOQUESTWestern Plaguelands - Hearthglen# (55-58)" },
			[3] = { str = "#ACCEPTRunecloth, greens, Crusader enchant recipe#: " ..
				"Paladins/Warriors farm humanoids for Crusader recipe (200-500g!) " ..
				"20-30g/hour normal, jackpot on recipe." },
			[4] = { str = "#DOQUESTEastern Plaguelands - Tyr's Hand# (58-60)" },
			[5] = { str = "#ACCEPTElite farming#: Runecloth (2+ per mob), many greens, BoE epics. " ..
				"Need good gear. AoE classes excel. 40-60g/hour." },
			[6] = { str = "#DOQUESTWinterspring - Frostsabers/Owls# (55-60)" },
			[7] = { str = "#ACCEPTFrostsaber Leather, E'ko#: Skinning BiS in Winterspring. " ..
				"E'ko for juju buffs (sell well). 25-35g/hour." },
			[8] = { str = "#DOQUESTSilithus - Twilight Cultists# (55-60)" },
			[9] = { str = "#ACCEPTTwilight Set pieces#: Used to summon AQ bosses. " ..
				"Encrypted Twilight Texts for Cenarion rep. 20-30g/hour." },
			[10] = { str = "#DOQUESTAzshara - Satyrs# (55-60)" },
			[11] = { str = "#ACCEPTFelcloth farming#: Tailors need Felcloth for Felcloth gear. " ..
				"Also Demonic Rune (free Mana Potion basically). 25-40g/hour." },
		}
	},

-----------Dungeon Gold Farming
	[9006] = {
		title = "Dungeon Gold Farms",
		items = {
			[1] = { str = "#NPCDungeon Farming# - Consistent gold without world PvP!" },
			[2] = { str = "#DOQUESTDire Maul East - Jump Runs# (Solo or Duo)" },
			[3] = { str = "#ACCEPTHow it works#: Skip to end, kill Alzzin, vendor/DE loot, reset. " ..
				"Requires: Engineering for Dimensional Ripper, or a friend. " ..
				"Rogues, Hunters, Mages, Warlocks excel. 30-50g/hour." },
			[4] = { str = "#DOQUESTDire Maul North - Tribute Runs#" },
			[5] = { str = "#ACCEPTSkip bosses, kill King#: Extra chest loot from tribute. " ..
				"Learn the route. Ogre suit required. 40-60g/hour." },
			[6] = { str = "#DOQUESTStratholme - Undead Side#" },
			[7] = { str = "#ACCEPTRighteous Orb farming#: Drops from Live side, worth 20-50g each. " ..
				"Run with guild for orb rolls. Also Baron mount chance (0.02%)!" },
			[8] = { str = "#DOQUESTMaraudon - Inner Princess Runs#" },
			[9] = { str = "#ACCEPTSolo for gold#: Skip to Princess, kill her, vendor loot. " ..
				"Good for ungeared 60s. Herbs in instance. 20-30g/hour." },
			[10] = { str = "#DOQUESTBlackrock Depths - Pickpocket Runs# (Rogue only)" },
			[11] = { str = "#ACCEPTRogue gold#: Pickpocket every mob, junkboxes contain gold and items. " ..
				"Stealth entire instance. 30-50g/hour." },
		}
	},

-----------Profession Gold Making
	[9007] = {
		title = "Profession Gold Making",
		items = {
			[1] = { str = "#NPCProfessions for Gold# - Long term investment!" },
			[2] = { str = "#DOQUESTHerbalism# - Always profitable" },
			[3] = { str = "#ACCEPTBlack Lotus#: Spawn in EPL, Winterspring, Silithus, Burning Steppes. " ..
				"100-200g per lotus! Contested. Camp spawns." },
			[4] = { str = "#ACCEPTOther valuable herbs#: Plaguebloom (20-40g/stack), Dreamfoil (15-30g/stack), " ..
				"Mountain Silversage (20-40g/stack), Gromsblood (10-20g/stack)." },
			[5] = { str = "#DOQUESTMining# - Essential for raiders" },
			[6] = { str = "#ACCEPTThorium Ore#: 15-25g/stack. Found in Un'goro, WPL, EPL, Winterspring." },
			[7] = { str = "#ACCEPTArcane Crystal#: 30-50g each! Rare from Rich Thorium, Obsidian veins." },
			[8] = { str = "#ACCEPTDark Iron Ore#: BRD only. Used for FR gear. 50-100g/stack." },
			[9] = { str = "#DOQUESTSkinning# - Easy passive income" },
			[10] = { str = "#ACCEPTCore Leather#: MC trash skinning. 20-40g each." },
			[11] = { str = "#ACCEPTBlack Dragonscale#: Burning Steppes dragons. 5-10g each." },
			[12] = { str = "#DOQUESTEnchanting# - Endgame goldmine" },
			[13] = { str = "#ACCEPTDisenchanting#: DE dungeon greens, sell mats. " ..
				"Large Brilliant Shards: 5-10g each. Nexus Crystals: 50-100g." },
			[14] = { str = "#ACCEPTEnchant services#: Charge for enchants (especially Crusader, +15 Agility)." },
			[15] = { str = "#DOQUESTAlchemy# - Transmute master" },
			[16] = { str = "#ACCEPTArcanite Bar transmute#: Daily CD. 20-40g profit per day." },
			[17] = { str = "#ACCEPTFlask making#: Flasks sell 50-150g each on raid nights." },
		}
	},

-----------Vendor Flipping
	[9008] = {
		title = "Vendor Tricks & Flipping",
		items = {
			[1] = { str = "#NPCVendor Flipping# - Buy low, sell high!" },
			[2] = { str = "#DOQUESTLimited Supply Vendors# - Items that sell for 10x+ on AH:" },
			[3] = { str = "#ACCEPTRecipe: Savory Deviate Delight# - Vendor in Barrens (Alliance risky). " ..
				"Sells 5-20g on AH. Check vendor regularly!" },
			[4] = { str = "#ACCEPTPattern: Red Whelp Gloves# - Wetlands vendor. 10-30g on AH." },
			[5] = { str = "#ACCEPTRecipe: Thistle Tea# - SI:7 vendor, Stormwind (Rogue only). " ..
				"Sell to Horde rogues via Neutral AH - 50g+!" },
			[6] = { str = "#ACCEPTPets# - Cats from Donni Anthania (Elwynn), Cockroaches (Undercity), " ..
				"Parrots (Booty Bay), Owls (Darnassus). " ..
				"Sell opposite faction pets via Neutral AH!" },
			[7] = { str = "#ACCEPTEngineering schematics# - Various vendors. Check for limited supply." },
			[8] = { str = "#DOQUESTCross-Faction Trading# (Neutral AH)" },
			[9] = { str = "#ACCEPTBuy common items from your faction vendors# - Sell on Neutral AH for opposite faction. " ..
				"Pets are the most reliable. 200-500% markup!" },
			[10] = { str = "#DOQUESTTips#:" },
			[11] = { str = "#TURNIN- Learn vendor routes# - Hit limited supply vendors on cooldown." },
			[12] = { str = "#TURNIN- Check remote vendors# - Less visited = more stock available." },
			[13] = { str = "#TURNIN- Track respawn timers# - Limited items restock hourly-daily." },
		}
	},

-----------Epic Mount Gold Guide
	[9009] = {
		title = "Epic Mount Gold Guide",
		items = {
			[1] = { str = "#NPCEpic Mount Fund# - 1000g (900g Honored) goal!" },
			[2] = { str = "#DOQUESTPhase 1: Leveling (Goal: 100g by 40)#" },
			[3] = { str = "#ACCEPT- Take Mining + Skinning# - Sell everything on AH." },
			[4] = { str = "#ACCEPT- Vendor all grays immediately# - Don't let bag space slow you." },
			[5] = { str = "#ACCEPT- Skip 'fun' purchases# - No vanity items, minimal training." },
			[6] = { str = "#ACCEPT- Buy bigger bags when available# - Investment pays off." },
			[7] = { str = "#DOQUESTPhase 2: Level 40-50 (Goal: 300g by 50)#" },
			[8] = { str = "#ACCEPT- Farm 30min-1hr daily# - Consistency beats marathon sessions." },
			[9] = { str = "#ACCEPT- Learn Auction House# - Scan daily, flip cheap items." },
			[10] = { str = "#ACCEPT- Do profitable quests# - Some reward 2g+ at 40+." },
			[11] = { str = "#DOQUESTPhase 3: Level 50-60 (Goal: 1000g at 60)#" },
			[12] = { str = "#ACCEPT- Prioritize gold per hour# - Tyr's Hand is 40-60g/hr." },
			[13] = { str = "#ACCEPT- Run profitable dungeons# - DM East/North, Strat." },
			[14] = { str = "#ACCEPT- Save quest gold for 60# - Many quests give 6-10g at 60." },
			[15] = { str = "#DOQUESTQuick Math#:" },
			[16] = { str = "#TURNINAt 20g/hour farming#: 50 hours to epic mount." },
			[17] = { str = "#TURNINAt 40g/hour farming#: 25 hours to epic mount." },
			[18] = { str = "#TURNINDing 60 with 400g + 20 hours = Epic mount!#" },
		}
	},

-----------Raid Consumables Farming
	[9010] = {
		title = "Raid Consumables Farming",
		items = {
			[1] = { str = "#NPCRaid Consumables# - Farm or buy, you NEED these!" },
			[2] = { str = "#DOQUESTFlasks (Persist through death)#:" },
			[3] = { str = "#ACCEPTFlask of the Titans# - Black Lotus + Stonescale + Gromsblood. " ..
				"Farm: Black Lotus camps, Stonescale Eels in Azshara." },
			[4] = { str = "#ACCEPTFlask of Supreme Power# - Black Lotus + Dreamfoil + Mountain Silversage. " ..
				"Farm: EPL/Winterspring herb routes." },
			[5] = { str = "#DOQUESTElixirs (Important buffs)#:" },
			[6] = { str = "#ACCEPTMongoose Elixir# (Agi/Crit) - Gromsblood + Snakeskin. " ..
				"Farm: Felwood/Blasted demons, Swamp snakes." },
			[7] = { str = "#ACCEPTGreater Arcane Elixir# - Dreamfoil + Mountain Silversage. " ..
				"Farm: Standard herb route." },
			[8] = { str = "#DOQUESTFood Buffs#:" },
			[9] = { str = "#ACCEPTGrilled Squid# (+10 Agi) - Winter Squid, only in winter! " ..
				"Stock up during winter. Prices double in summer." },
			[10] = { str = "#ACCEPTNightfin Soup# (MP5) - Nightfin Snapper, night fishing only. " ..
				"Farm: Feralas, Azshara, any high level water at night." },
			[11] = { str = "#DOQUESTOther Consumables#:" },
			[12] = { str = "#ACCEPTMana Potions# - Dreamfoil + Icecap. Farm Winterspring." },
			[13] = { str = "#ACCEPTFree Action Potion# - Blackmouth + Stranglekelp. Coastal fishing." },
			[14] = { str = "#ACCEPTFire/Nature Protection Pots# - Elemental farming in various zones." },
			[15] = { str = "#DOQUESTTips#: Buy consumables on Tuesday (cheap), farm mats on weekends (raid night). " ..
				"Raiding guilds go through TONS of consumables - good market!" },
		}
	},
}
