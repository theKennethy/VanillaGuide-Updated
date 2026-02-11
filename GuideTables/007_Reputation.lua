--[[--------------------------------------------------
007_Reputation.lua
Authors: theKennethy
Version: 1.05.0
------------------------------------------------------
Description: Reputation Guides for Vanilla WoW
    - Major factions
    - Grinding paths
    - Rewards
------------------------------------------------------
]]--

Table_007_Reputation = {
-----------Argent Dawn
	[10001] = {
		title = "Argent Dawn Reputation",
		items = {
			[1] = { str = "#NPCArgent Dawn# - Holy crusaders fighting the Scourge" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Arcanum of Focus/Protection/Rapidity# - BiS head/leg enchants!" },
			[4] = { str = "#ACCEPT- Nature Resist gear recipes# - Required for AQ40." },
			[5] = { str = "#ACCEPT- Naxxramas attunement discount# - Saves 60g+ at Exalted." },
			[6] = { str = "#ACCEPT- Corrupted Ashbringer interaction# - Lore!" },
			[7] = { str = "#DOQUESTRep Sources: Friendly to Honored#" },
			[8] = { str = "#TURNIN- Kill Undead in EPL/WPL# - 5 rep per kill until Honored. " ..
				"Best spots: Andorhal, Hearthglen, Corin's Crossing." },
			[9] = { str = "#TURNIN- Quests# - Complete all AD quests in EPL/WPL." },
			[10] = { str = "#DOQUESTRep Sources: Honored to Revered#" },
			[11] = { str = "#TURNIN- Scholomance/Stratholme bosses# - Full rep until Revered." },
			[12] = { str = "#TURNIN- Scourgestones turn-ins# - Wear AD trinket, collect stones, turn in." },
			[13] = { str = "#DOQUESTRep Sources: Revered to Exalted#" },
			[14] = { str = "#TURNIN- Only Scourgestones/Naxx# - Dungeon bosses stop giving rep." },
			[15] = { str = "#TURNIN- Run Scholo/Strat for Corruptor's Stones# - Turn in for rep." },
			[16] = { str = "#DOQUESTTips#: Wear Argent Dawn Commission trinket ALWAYS in Plaguelands. " ..
				"Stones only drop with trinket equipped!" },
		}
	},

-----------Timbermaw Hold
	[10002] = {
		title = "Timbermaw Hold Reputation",
		items = {
			[1] = { str = "#NPCTimbermaw Hold# - Furbolg faction in Felwood/Winterspring tunnel" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Transmute: Earth to Water# - Alchemy, worth 50g+ per day!" },
			[4] = { str = "#ACCEPT- Enchant Weapon: Agility# - BiS hunter/rogue enchant." },
			[5] = { str = "#ACCEPT- Pattern: Warbear Woolies# - Good leather legs." },
			[6] = { str = "#ACCEPT- Recipe: Transmute Earth to Water# - Daily gold!" },
			[7] = { str = "#DOQUESTRep Sources#" },
			[8] = { str = "#TURNIN- Kill Deadwood Furbolgs (Felwood)# - South of tunnel. " ..
				"20 rep per kill until 11,000/12,000 Honored." },
			[9] = { str = "#TURNIN- Kill Winterfall Furbolgs (Winterspring)# - North of tunnel. " ..
				"20 rep per kill until 11,000/12,000 Honored." },
			[10] = { str = "#TURNIN- Deadwood Headdress Feathers# - 5 turn-ins, 50 rep each. " ..
				"Drops from Deadwood furbolgs. Turn in until Revered." },
			[11] = { str = "#TURNIN- Winterfall Spirit Beads# - 5 turn-ins, 50 rep each. " ..
				"Drops from Winterfall furbolgs. Turn in until Revered." },
			[12] = { str = "#DOQUESTRevered to Exalted#" },
			[13] = { str = "#TURNIN- Requires runecloth turn-ins# - 20 Runecloth + 2 Coal per turn-in. " ..
				"Alternative: More feathers/beads for 25 rep each (nerfed)." },
			[14] = { str = "#DOQUESTBest Strategy#: Farm Felwood spot (respawns faster). " ..
				"Save all feathers, turn in at Honored. ~8-12 hours to Exalted." },
		}
	},

-----------Cenarion Circle
	[10003] = {
		title = "Cenarion Circle Reputation",
		items = {
			[1] = { str = "#NPCCenarion Circle# - Druid faction, AQ content hub" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- AQ20/AQ40 gear tokens# - Trade tokens + rep for gear!" },
			[4] = { str = "#ACCEPT- Nature Resist recipes# - Crafting patterns for AQ." },
			[5] = { str = "#ACCEPT- Ring upgrades# - Exalted rewards great rings." },
			[6] = { str = "#DOQUESTRep Sources: Neutral to Friendly#" },
			[7] = { str = "#TURNIN- Complete Silithus quests# - Lots of rep from quests." },
			[8] = { str = "#TURNIN- Encrypted Twilight Texts# - 10 per turn-in, 100 rep. " ..
				"Drops from Twilight Cultists. Best early rep!" },
			[9] = { str = "#DOQUESTRep Sources: Friendly to Honored#" },
			[10] = { str = "#TURNIN- AQ20 (Ruins of Ahn'Qiraj)# - Bosses give rep." },
			[11] = { str = "#TURNIN- Twilight Texts# - Continue turning in." },
			[12] = { str = "#TURNIN- Silithus Field Duty quests# - Repeatable, 100 rep each." },
			[13] = { str = "#DOQUESTRep Sources: Honored to Revered#" },
			[14] = { str = "#TURNIN- AQ40 (Temple of Ahn'Qiraj)# - Full rep from bosses." },
			[15] = { str = "#TURNIN- Abyssal Council summoning# - Kill summoned bosses for rep." },
			[16] = { str = "#DOQUESTRep Sources: Revered to Exalted#" },
			[17] = { str = "#TURNIN- AQ40 boss kills only# - Slow grind. " ..
				"Some turn-ins still work (Twilight gear sets)." },
			[18] = { str = "#DOQUESTTips#: Farm Twilight Cultists for texts AND their gear (summon bosses). " ..
				"AQ raids give significant rep - run weekly." },
		}
	},

-----------Thorium Brotherhood
	[10004] = {
		title = "Thorium Brotherhood Reputation",
		items = {
			[1] = { str = "#NPCThorium Brotherhood# - Dark Iron dwarf smiths in BRD" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Fire Resist gear recipes# - ESSENTIAL for MC/BWL tanks!" },
			[4] = { str = "#ACCEPT- Enchant Weapon: Strength# - BiS warrior enchant." },
			[5] = { str = "#ACCEPT- Dark Iron crafting# - Powerful gear." },
			[6] = { str = "#DOQUESTRep Sources: Unfriendly to Friendly#" },
			[7] = { str = "#TURNIN- Dark Iron Residue# - 100 per turn-in. " ..
				"Drops from Dark Iron dwarves (Searing Gorge, BRD)." },
			[8] = { str = "#TURNIN- Incendosaur Scales# - 80 per turn-in. " ..
				"Drops from Incendosaurs in Searing Gorge." },
			[9] = { str = "#DOQUESTRep Sources: Friendly to Honored#" },
			[10] = { str = "#TURNIN- Dark Iron Ore# - 10 ore per turn-in, 25 rep. " ..
				"Mine in BRD only!" },
			[11] = { str = "#TURNIN- Core Leather# - 2 per turn-in, 25 rep. " ..
				"Skinners get from MC trash." },
			[12] = { str = "#TURNIN- Fiery Core# - 1 per turn-in, 25 rep. " ..
				"Drops from MC elementals." },
			[13] = { str = "#TURNIN- Lava Core# - 1 per turn-in, 25 rep. " ..
				"Drops from MC elementals." },
			[14] = { str = "#DOQUESTRep Sources: Honored to Revered#" },
			[15] = { str = "#TURNIN- Blood of the Mountain# - 1 per turn-in, 50 rep. " ..
				"Rare from Dark Iron Deposit/Molten Destroyer." },
			[16] = { str = "#TURNIN- Core Leather# - Continues to work." },
			[17] = { str = "#TURNIN- Fiery/Lava Core# - Continues to work." },
			[18] = { str = "#DOQUESTRevered to Exalted#" },
			[19] = { str = "#TURNIN- Only Blood of the Mountain, Fiery/Lava Cores#" },
			[20] = { str = "#DOQUESTTips#: Join MC runs for cores. Dark Iron Residue farming in Searing Gorge is AFK-tier. " ..
				"BRD mining runs for Dark Iron Ore." },
		}
	},

-----------Hydraxian Waterlords
	[10005] = {
		title = "Hydraxian Waterlords Reputation",
		items = {
			[1] = { str = "#NPCHydraxian Waterlords# - Water elementals in Azshara" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Aqual Quintessence# - Required to douse runes in MC!" },
			[4] = { str = "#ACCEPT- Eternal Quintessence# - Exalted version, doesn't consume." },
			[5] = { str = "#ACCEPT- Required for MC progression# - Need Honored for quest." },
			[6] = { str = "#DOQUESTRep Sources: Neutral to Honored#" },
			[7] = { str = "#TURNIN- Kill Duke Hydraxis's enemies in Azshara# - Elementals give rep." },
			[8] = { str = "#TURNIN- Complete quests from Duke Hydraxis# - Island in Azshara (79,73)." },
			[9] = { str = "#DOQUESTRep Sources: Honored to Revered#" },
			[10] = { str = "#TURNIN- Kill MC bosses# - Each boss gives rep. " ..
				"Lucifron through Majordomo = rep." },
			[11] = { str = "#TURNIN- Hands of the Enemy quest# - Turn in boss hands." },
			[12] = { str = "#DOQUESTRep Sources: Revered to Exalted#" },
			[13] = { str = "#TURNIN- Only Ragnaros# - 200 rep per kill. " ..
				"Long grind - requires many MC clears." },
			[14] = { str = "#DOQUESTTips#: You will naturally hit Revered raiding MC. " ..
				"Exalted only matters for Eternal Quintessence (cosmetic mostly)." },
		}
	},

-----------Brood of Nozdormu
	[10006] = {
		title = "Brood of Nozdormu Reputation",
		items = {
			[1] = { str = "#NPCBrood of Nozdormu# - Bronze Dragon faction for AQ" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Scepter of the Shifting Sands# - AQ gate opening questline!" },
			[4] = { str = "#ACCEPT- Ring upgrades# - Powerful rings at each rep level." },
			[5] = { str = "#ACCEPT- Required for AQ40# - Need Neutral to enter Temple." },
			[6] = { str = "#DOQUESTRep Sources#" },
			[7] = { str = "#TURNIN- AQ40 trash# - Gives rep until Neutral." },
			[8] = { str = "#TURNIN- AQ40 bosses# - Rep through Friendly." },
			[9] = { str = "#TURNIN- Qiraji Lord's Insignia# - Turn-in for 500 rep. " ..
				"Drops from AQ40 trash (rare)." },
			[10] = { str = "#TURNIN- Ancient Qiraji Artifact# - Turn-in for 1000 rep. " ..
				"Rare drop from bosses." },
			[11] = { str = "#DOQUESTNotes#" },
			[12] = { str = "#TURNIN- Starts at Hated!# - 36,000 rep to Neutral. " ..
				"This is THE slowest rep grind in vanilla." },
			[13] = { str = "#TURNIN- Most guilds never hit Exalted# - Very long term goal." },
			[14] = { str = "#DOQUESTTips#: Only worry about this if doing Scepter quest. " ..
				"Natural AQ40 raiding will get you Friendly/Honored eventually." },
		}
	},

-----------Zandalar Tribe
	[10007] = {
		title = "Zandalar Tribe Reputation",
		items = {
			[1] = { str = "#NPCZandalar Tribe# - Troll faction on Yojamba Isle (STV)" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- ZG enchants# - Shoulder enchants: +30 AP, +18 SP, etc." },
			[4] = { str = "#ACCEPT- Zandalar gear# - Class-specific rewards." },
			[5] = { str = "#ACCEPT- Polymorph: Turtle# - Mage spell!" },
			[6] = { str = "#DOQUESTRep Sources#" },
			[7] = { str = "#TURNIN- Zul'Gurub trash# - All trash gives rep until Revered." },
			[8] = { str = "#TURNIN- ZG boss kills# - Significant rep per boss." },
			[9] = { str = "#TURNIN- Coin + Bijou turn-ins# - Bijou = 75 rep, Coins (3) = 25-50 rep." },
			[10] = { str = "#DOQUESTBijou/Coin Strategy#" },
			[11] = { str = "#TURNIN- Destroy Bijou at altar# - Grants ZG honor tokens + 75 rep." },
			[12] = { str = "#TURNIN- Turn in coin sets (3 of same type)# - 25-50 rep + ZG token." },
			[13] = { str = "#TURNIN- Use tokens for gear# - Class sets require tokens + rep." },
			[14] = { str = "#DOQUESTNotes#" },
			[15] = { str = "#TURNIN- ZG resets every 3 days# - Fast rep compared to other raids!" },
			[16] = { str = "#TURNIN- Farm coins/bijous from ZG trash# - Skip bosses for faster rep." },
			[17] = { str = "#DOQUESTTips#: Run ZG twice per reset if possible. " ..
				"Save coins/bijous until you decide what class gear you want." },
		}
	},

-----------Bloodsail Buccaneers & Steamwheedle
	[10008] = {
		title = "Steamwheedle Cartel / Bloodsail",
		items = {
			[1] = { str = "#NPCSteamwheedle Cartel# - Goblin neutral cities" },
			[2] = { str = "#NPCBloodsail Buccaneers# - Pirate faction" },
			[3] = { str = "#DOQUESTWhy Grind?#" },
			[4] = { str = "#ACCEPT- Steamwheedle (Exalted)# - Access to goblin vendors, quest lines." },
			[5] = { str = "#ACCEPT- Bloodsail (Honored)# - Bloodsail Admiral hat! (Requires killing goblins)" },
			[6] = { str = "#TURNINWARNING#: Bloodsail and Steamwheedle are OPPOSED! " ..
				"Raising one LOWERS the other significantly." },
			[7] = { str = "#DOQUESTSteamwheedle Cartel Factions#" },
			[8] = { str = "#ACCEPT- Booty Bay, Ratchet, Gadgetzan, Everlook# - All linked." },
			[9] = { str = "#ACCEPT- Kill Southsea Pirates# - Tanaris, Barrens coasts." },
			[10] = { str = "#ACCEPT- Kill Wastewander Bandits# - Tanaris." },
			[11] = { str = "#ACCEPT- Quest turn-ins# - Cloth turn-ins in Ratchet and others." },
			[12] = { str = "#DOQUESTBloodsail Buccaneers#" },
			[13] = { str = "#ACCEPT- Kill Booty Bay guards/NPCs# - 25 rep per kill." },
			[14] = { str = "#ACCEPT- This tanks your Steamwheedle rep!# - You'll be KOS in goblin cities." },
			[15] = { str = "#ACCEPT- At Friendly, get quest for Admiral's Hat#" },
			[16] = { str = "#DOQUESTRecovering Steamwheedle After Bloodsail#" },
			[17] = { str = "#TURNIN- Takes 40+ hours of pirate grinding# - Southsea/Wastewander." },
			[18] = { str = "#TURNIN- Cloth turn-ins# - Runecloth to goblin cities." },
			[19] = { str = "#DOQUESTTips#: Only grind Bloodsail if you REALLY want the hat. " ..
				"Recovery is painful. Do Bloodsail FIRST, then recover Steamwheedle." },
		}
	},

-----------Wintersaber Trainers (Alliance)
	[10009] = {
		title = "Wintersaber Trainers (Alliance)",
		items = {
			[1] = { str = "#NPCWintersaber Trainers# - Alliance-only mount faction!" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Reins of the Winterspring Frostsaber# - Unique cat mount!" },
			[4] = { str = "#ACCEPT- One of the longest grinds in vanilla# - ~30 days of dailies." },
			[5] = { str = "#ACCEPT- Status symbol# - Few players complete this." },
			[6] = { str = "#DOQUESTHow to Grind#" },
			[7] = { str = "#TURNIN- Find Rivern Frostwind# (65,64) in Winterspring, above Frostsaber Rock." },
			[8] = { str = "#TURNIN- Quest 1: 'Frostsaber Provisions'# - Kill Shardtooth bears and Chimeras. " ..
				"Turn in 5 meat, get 50 rep. Repeatable!" },
			[9] = { str = "#TURNIN- Quest 2: 'Winterfall Intrusion'# - Kill Winterfall furbolgs. " ..
				"Turn in quest, get 50 rep. Repeatable!" },
			[10] = { str = "#TURNIN- Quest 3: 'Rampaging Giants'# (Revered)# - Kill Frostmaul Giants. " ..
				"Turn in quest, get 50 rep. Harder mobs, same rep." },
			[11] = { str = "#DOQUESTMath#" },
			[12] = { str = "#TURNIN- Neutral to Exalted# = 42,000 rep needed." },
			[13] = { str = "#TURNIN- At 50 rep per quest# = 840 quest turn-ins." },
			[14] = { str = "#TURNIN- At ~30 turn-ins per hour# = ~28 hours of grinding." },
			[15] = { str = "#DOQUESTTips#: Do Winterfall quest while farming Timbermaw rep! " ..
				"Same mobs, double benefit. Bring Netflix, it's a long grind." },
		}
	},

-----------City Reputations
	[10010] = {
		title = "Home City Reputation",
		items = {
			[1] = { str = "#NPCCity Reputation# - For mount diversity!" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- Ride other race mounts!# - Gnome on a horse, Tauren on a raptor, etc." },
			[4] = { str = "#ACCEPT- Aesthetic choice# - Match your style." },
			[5] = { str = "#DOQUESTHow to Get Exalted#" },
			[6] = { str = "#TURNIN1. Do ALL quests in their zones#" },
			[7] = { str = "#ACCEPT- Human (Stormwind)# - Elwynn, Westfall, Redridge, Duskwood, STV." },
			[8] = { str = "#ACCEPT- Dwarf/Gnome (IF/GE)# - Dun Morogh, Loch Modan, Wetlands." },
			[9] = { str = "#ACCEPT- Night Elf (Darnassus)# - Teldrassil, Darkshore, Ashenvale, Felwood." },
			[10] = { str = "#ACCEPT- Orc/Troll (Org/SH)# - Durotar, Barrens, STV, Swamp of Sorrows." },
			[11] = { str = "#ACCEPT- Tauren (TB)# - Mulgore, Barrens, Thousand Needles, Desolace." },
			[12] = { str = "#ACCEPT- Undead (UC)# - Tirisfal, Silverpine, Hillsbrad, Arathi." },
			[13] = { str = "#TURNIN2. Runecloth turn-ins#" },
			[14] = { str = "#ACCEPT- 20 Runecloth per turn-in# = 50 rep." },
			[15] = { str = "#ACCEPT- Repeatable until Exalted#" },
			[16] = { str = "#ACCEPT- At 75 rep per turn-in: Need ~560 turn-ins from Revered#" },
			[17] = { str = "#ACCEPT- That's 11,200 Runecloth... expensive!#" },
			[18] = { str = "#TURNIN3. Morrowgrain turn-ins (Alliance)#" },
			[19] = { str = "#ACCEPT- Give to Darnassus NPC# - 50 rep per turn-in." },
			[20] = { str = "#DOQUESTTips#: Do quests on an alt, send cloth to main. " ..
				"AH is cheaper than grinding. Start early, do quests while leveling!" },
		}
	},

-----------Shen'dralar (Dire Maul)
	[10011] = {
		title = "Shen'dralar Reputation",
		items = {
			[1] = { str = "#NPCShen'dralar# - Highborne elves in Dire Maul" },
			[2] = { str = "#DOQUESTWhy Grind?#" },
			[3] = { str = "#ACCEPT- 'the Insane' title requirement# (in later expansions)" },
			[4] = { str = "#ACCEPT- Unique enchants# - Brilliant Mana Oil formula." },
			[5] = { str = "#DOQUESTRep Sources#" },
			[6] = { str = "#TURNINLibram turn-ins# - Found in DM. Requires rare materials:" },
			[7] = { str = "#ACCEPT- Libram of Focus# - Requires Pristine Black Diamond, 2 Large Brilliant Shards, 4 Skin of Shadow, 1 Blood of Heroes." },
			[8] = { str = "#ACCEPT- Libram of Protection# - Requires Pristine Black Diamond, 2 Large Brilliant Shards, 2 Frayed Abomination Stitching, 1 Blood of Heroes." },
			[9] = { str = "#ACCEPT- Libram of Rapidity# - Requires Pristine Black Diamond, 2 Large Brilliant Shards, 2 Blood of Heroes." },
			[10] = { str = "#TURNINClass Book turn-ins#" },
			[11] = { str = "#ACCEPT- Royal Seal of Eldre'Thalas# - Class-specific books drop in DM. " ..
				"Turn in for 200 rep + powerful enchant/item." },
			[12] = { str = "#DOQUESTNotes#" },
			[13] = { str = "#TURNIN- EXTREMELY expensive grind# - Pristine Black Diamonds cost 100-300g each." },
			[14] = { str = "#TURNIN- Most players don't bother# - Rewards aren't worth the cost." },
			[15] = { str = "#DOQUESTTips#: Only grind this for achievements or completionism. " ..
				"The gold investment is massive. Farm your own materials if possible." },
		}
	},
}
