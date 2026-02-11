--[[--------------------------------------------------
----- VanillaGuide -----
------------------
ItemDatabase.lua
------------------------------------------------------
Description: 
    Item name to ID mappings for tooltip links.
    Makes gear guide items clickable with proper tooltips.
--]]--------------------------------------------------

VGuideItemDB = {
    Items = {},
}

-- Populate item database with name -> itemId mappings
VGuideItemDB.Items = {
    -----------------------------------------
    -- Warrior Gear (Pre-Raid BiS)
    -----------------------------------------
    ["Lionheart Helm"] = 12640,
    ["Mask of the Unforgiven"] = 13404,
    ["Mark of Fordring"] = 15411,
    ["Imperial Jewel"] = 12053,
    ["Truestrike Shoulders"] = 12927,
    ["Wyrmhide Spaulders"] = 12054,
    ["Cape of the Black Baron"] = 13340,
    ["Stoneskin Gargoyle Cape"] = 13359,
    ["Savage Gladiator Chain"] = 11726,
    ["Cadaverous Armor"] = 14637,
    ["Battleborn Armbraces"] = 13120,
    ["Vambraces of the Sadist"] = 14895,
    ["Devilsaur Gauntlets"] = 15063,
    ["Edgemaster's Handguards"] = 14551,
    ["Brigam Girdle"] = 13142,
    ["Omokk's Girth Restrainer"] = 13965,
    ["Devilsaur Leggings"] = 15062,
    ["Cloudkeeper Legplates"] = 14554,
    ["Battlechaser's Greaves"] = 15067,
    ["Bloodmail Boots"] = 14615,
    ["Don Julio's Band"] = 19325,
    ["Blackstone Ring"] = 17713,
    ["Painweaver Band"] = 13098,
    ["Blackhand's Breadth"] = 13965,
    ["Hand of Justice"] = 11815,
    ["Dal'Rend's Sacred Charge"] = 12940,
    ["Dal'Rend's Tribal Guardian"] = 12939,
    ["Chromatically Tempered Sword"] = 19352,
    ["Mirah's Song"] = 15806,
    
    -- Tank Gear
    ["Golem Skull Helm"] = 11624,
    ["Helm of the Holy Avenger"] = 12633,
    ["Amulet of the Darkmoon"] = 19491,
    ["Medallion of Grand Marshal Morris"] = 12993,
    ["Stockade Pauldrons"] = 11905,
    ["Razorsteel Shoulders"] = 12936,
    ["Enchanted Thorium Breastplate"] = 12618,
    ["Deathbone Chestplate"] = 14624,
    ["Hands of Power"] = 13253,
    ["Stonegrip Gauntlets"] = 12549,
    ["Skullflame Shield"] = 1168,
    ["Draconian Deflector"] = 12602,
    ["Force Reactive Disk"] = 18168,
    ["Quel'Serrar"] = 18348,
    ["Blackguard"] = 19168,
    ["Alcor's Sunrazor"] = 14555,
    
    -----------------------------------------
    -- Rogue Gear (Pre-Raid BiS)
    -----------------------------------------
    ["Mask of the Unforgiven"] = 13404,
    ["Blooddrenched Mask"] = 14561,
    ["Barbed Choker"] = 18723,
    ["Eye of Rend"] = 12587,
    ["Nightslayer Shoulder Pads"] = 16823,
    ["Black Dragonscale Shoulders"] = 15051,
    ["Shadow Prowler's Cloak"] = 20218,
    ["Cloak of Firemaw"] = 19398,
    ["Vest of Elements"] = 16672,
    ["Nightslayer Bracelets"] = 16825,
    ["Shadowcraft Bracers"] = 16710,
    ["Aged Core Leather Gloves"] = 18823,
    ["Shadowcraft Gloves"] = 16712,
    ["Mugger's Belt"] = 18391,
    ["Shadowcraft Belt"] = 16713,
    ["Darkmantle Pants"] = 22006,
    ["Shadowcraft Pants"] = 16709,
    ["Swiftwalker Boots"] = 12553,
    ["Shadowcraft Boots"] = 16711,
    ["Tarnished Elven Ring"] = 18500,
    ["Quick Strike Ring"] = 18821,
    ["Drake Fang Talisman"] = 19406,
    ["Rune of the Guard Captain"] = 19120,
    ["Core Hound Tooth"] = 18805,
    ["Perdition's Blade"] = 18816,
    ["Gutgutter"] = 15234,
    ["Distracting Dagger"] = 18392,
    
    -----------------------------------------
    -- Mage Gear (Pre-Raid BiS)
    -----------------------------------------
    ["Crimson Felt Hat"] = 18727,
    ["Spellweaver's Turban"] = 22267,
    ["Star of Mystaria"] = 12103,
    ["Diana's Pearl Necklace"] = 15530,
    ["Archivist Cape"] = 13386,
    ["Amplifying Cloak"] = 18510,
    ["Robe of the Void"] = 14153,
    ["Robe of Winter Night"] = 14136,
    ["Arcanist Boots"] = 16800,
    ["Felcloth Boots"] = 14108,
    ["Hands of Power"] = 13253,
    ["Felcloth Gloves"] = 14111,
    ["Ban'thok Sash"] = 11662,
    ["Sash of Whispered Secrets"] = 18327,
    ["Skyshroud Leggings"] = 12978,
    ["Felcloth Pants"] = 14107,
    ["Rockfury Bracers"] = 21186,
    ["Arcanist Bindings"] = 16802,
    ["Eye of the Beast"] = 13968,
    ["Ring of Spell Power"] = 11669,
    ["Maidens Circle"] = 16058,
    ["Briarwood Reed"] = 12930,
    ["Talisman of Ephemeral Power"] = 18820,
    ["Blade of the New Moon"] = 23351,
    ["Rod of the Ogre Magi"] = 18534,
    
    -----------------------------------------
    -- Priest Gear (Pre-Raid BiS - Healing)
    -----------------------------------------
    ["Cassandra's Grace"] = 18314,
    ["White Bandit Mask"] = 10008,
    ["Animated Chain Necklace"] = 13091,
    ["Jin'do's Bag of Whammies"] = 19890,
    ["Hide of the Wild"] = 18510,
    ["Truefaith Vestments"] = 14154,
    ["Robes of the Exalted"] = 14489,
    ["Bracers of Prosperity"] = 20257,
    ["Harmonious Gauntlets"] = 18309,
    ["Whipvine Cord"] = 18327,
    ["Padre's Trousers"] = 11766,
    ["Boots of the Full Moon"] = 18424,
    ["Fordring's Seal"] = 16058,
    ["Rosewine Circle"] = 13178,
    ["Second Wind"] = 11819,
    ["Mindtap Talisman"] = 11821,
    ["Ebon Hand"] = 19356,
    ["Mace of Unending Life"] = 19360,
    ["Lei of the Lifegiver"] = 22383,
    
    -----------------------------------------
    -- Warlock Gear (Pre-Raid BiS)
    -----------------------------------------
    ["Spellweaver's Turban"] = 22267,
    ["Mana Igniting Cord"] = 18809,
    ["Robe of the Void"] = 14153,
    ["Gloves of Spell Mastery"] = 14146,
    ["Felcloth Hood"] = 14112,
    ["Dreadmist Sandals"] = 16886,
    ["Choker of the Fire Lord"] = 18814,
    ["Eye of Flame"] = 11797,
    ["Ring of Spell Power"] = 11669,
    ["Zanzil's Band"] = 20032,
    ["Blade of the New Moon"] = 23351,
    ["Azuresong Mageblade"] = 17103,
    
    -----------------------------------------
    -- Hunter Gear (Pre-Raid BiS)
    -----------------------------------------
    ["Beaststalker's Cap"] = 16676,
    ["Mask of the Unforgiven"] = 13404,
    ["Barbed Choker"] = 18723,
    ["Will Truestrike Shoulders"] = 12927,
    ["Black Dragonscale Shoulders"] = 15051,
    ["Cloak of Warding"] = 18496,
    ["Savage Gladiator Chain"] = 11726,
    ["Black Dragonscale Breastplate"] = 15050,
    ["Beaststalker's Bindings"] = 16681,
    ["Devilsaur Gauntlets"] = 15063,
    ["Beaststalker's Belt"] = 16680,
    ["Devilsaur Leggings"] = 15062,
    ["Beaststalker's Boots"] = 16675,
    ["Painweaver Band"] = 13098,
    ["Blackhand's Breadth"] = 13965,
    ["Royal Seal of Eldre'Thalas"] = 18473,
    ["Rhok'delar, Longbow of the Ancient Keepers"] = 18713,
    ["Crossbow of Imminent Doom"] = 18738,
    ["Barbarous Blade"] = 12781,
    
    -----------------------------------------
    -- Druid Gear
    -----------------------------------------
    -- Feral
    ["Smoking Heart of the Mountain"] = 11811,
    ["Mark of Tyranny"] = 13966,
    ["Warden Staff"] = 943,
    ["Manual Crowd Pummeler"] = 9449,
    ["Mask of the Unforgiven"] = 13404,
    ["Cloak of Warding"] = 18496,
    ["Shifting Cloak"] = 22329,
    ["Heavy Dark Iron Ring"] = 18879,
    ["Thick Silithid Chestguard"] = 20476,
    ["Primal Batskin Bracers"] = 19835,
    ["Primal Batskin Gloves"] = 19836,
    ["Primal Batskin Jerkin"] = 20000,
    
    -- Resto
    ["Stormrage Cover"] = 16900,
    ["Wildheart Cowl"] = 16718,
    ["Rejuvenating Gem"] = 19381,
    
    -----------------------------------------
    -- Paladin Gear
    -----------------------------------------
    -- Holy
    ["Crown of Tyranny"] = 17735,
    ["Lawbringer Helm"] = 16854,
    ["Aurastone Hammer"] = 17105,
    ["Lei of the Lifegiver"] = 22383,
    
    -- Protection
    ["Helm of Wrath"] = 16963,
    ["Stockade Pauldrons"] = 11905,
    ["Intricately Runed Shield"] = 21269,
    
    -- Retribution
    ["Lionheart Helm"] = 12640,
    ["Helm of Valor"] = 16731,
    ["Ashkandi, Greatsword of the Brotherhood"] = 19364,
    ["Obsidian Edged Blade"] = 18822,
    ["Barman Shanker"] = 12791,
    
    -----------------------------------------
    -- Shaman Gear
    -----------------------------------------
    -- Enhancement
    ["Helm of Fire"] = 11765,
    ["Stormstrike Hammer"] = 2877, -- Placeholder
    ["Flurry Axe"] = 871,
    ["Fiery War Axe"] = 870,
    
    -- Elemental
    ["Crimson Felt Hat"] = 18727,
    ["Azuresong Mageblade"] = 17103,
    
    -- Resto
    ["Lok'amir il Romathis"] = 19360,
    
    -----------------------------------------
    -- Common/Shared Gear
    -----------------------------------------
    ["Onyxia Scale Cloak"] = 15138,
    ["Fire Resistance Cloak"] = 5818,
    ["Gyth's Skull"] = 12952,
    ["Circle of Applied Force"] = 18821,
    ["Quick Strike Ring"] = 18821,
    ["Band of Accuria"] = 17063,
    ["Master Dragonslayer's Ring"] = 19402,
    
    -----------------------------------------
    -- Leveling Gear
    -----------------------------------------
    ["Sword of Serenity"] = 6829,
    ["Bonebiter"] = 2042,
    ["Thrash Blade"] = 17705,
    ["Blade of Titans"] = 10626,
    ["Keller's Girdle"] = 11081,
    ["Lagnos' Beads"] = 11085,
    ["Mark of the Chosen"] = 17774,
    ["Ring of Protection"] = 11669,
    ["Tidal Charm"] = 1404,
    ["Arena Grand Master"] = 19024,
    ["Carrot on a Stick"] = 11122,
    ["Mithril Spurs"] = 7969,
    ["Minor Speed Boots Enchant"] = 13890, -- Recipe ID
    
    -----------------------------------------
    -- Dungeon Set 2 (0.5 Tier)
    -----------------------------------------
    -- Warrior
    ["Helm of Heroism"] = 21994,
    ["Spaulders of Heroism"] = 21997,
    ["Breastplate of Heroism"] = 21999,
    ["Legplates of Heroism"] = 21995,
    ["Gauntlets of Heroism"] = 21996,
    ["Belt of Heroism"] = 21998,
    ["Bracers of Heroism"] = 21993,
    ["Boots of Heroism"] = 22000,
    
    -- Rogue
    ["Darkmantle Cap"] = 22005,
    ["Darkmantle Spaulders"] = 22004,
    ["Darkmantle Tunic"] = 22009,
    ["Darkmantle Pants"] = 22006,
    ["Darkmantle Gloves"] = 22008,
    ["Darkmantle Belt"] = 22002,
    ["Darkmantle Bracers"] = 22007,
    ["Darkmantle Boots"] = 22003,
    
    -- Mage
    ["Sorcerer's Crown"] = 22065,
    ["Sorcerer's Mantle"] = 22068,
    ["Sorcerer's Robes"] = 22069,
    ["Sorcerer's Leggings"] = 22066,
    ["Sorcerer's Gloves"] = 22063,
    ["Sorcerer's Belt"] = 22062,
    ["Sorcerer's Bindings"] = 22064,
    ["Sorcerer's Boots"] = 22067,
    
    -- Priest
    ["Virtuous Crown"] = 22078,
    ["Virtuous Mantle"] = 22081,
    ["Virtuous Robe"] = 22082,
    ["Virtuous Skirt"] = 22079,
    ["Virtuous Gloves"] = 22076,
    ["Virtuous Belt"] = 22075,
    ["Virtuous Bracers"] = 22077,
    ["Virtuous Sandals"] = 22080,
    
    -- Warlock
    ["Deathmist Mask"] = 22073,
    ["Deathmist Mantle"] = 22074,
    ["Deathmist Robe"] = 22504,
    ["Deathmist Leggings"] = 22070,
    ["Deathmist Wraps"] = 22501,
    ["Deathmist Belt"] = 22503,
    ["Deathmist Bracers"] = 22071,
    ["Deathmist Sandals"] = 22072,
    
    -- Hunter
    ["Beastmaster's Cap"] = 22011,
    ["Beastmaster's Mantle"] = 22015,
    ["Beastmaster's Tunic"] = 22060,
    ["Beastmaster's Pants"] = 22016,
    ["Beastmaster's Gloves"] = 22010,
    ["Beastmaster's Belt"] = 22061,
    ["Beastmaster's Bindings"] = 22013,
    ["Beastmaster's Boots"] = 22014,
    
    -- Druid
    ["Feralheart Cowl"] = 22109,
    ["Feralheart Spaulders"] = 22112,
    ["Feralheart Vest"] = 22113,
    ["Feralheart Kilt"] = 22110,
    ["Feralheart Gloves"] = 22107,
    ["Feralheart Belt"] = 22106,
    ["Feralheart Bracers"] = 22108,
    ["Feralheart Boots"] = 22111,
    
    -- Paladin
    ["Soulforge Helm"] = 22088,
    ["Soulforge Spaulders"] = 22089,
    ["Soulforge Breastplate"] = 22090,
    ["Soulforge Legplates"] = 22086,
    ["Soulforge Gauntlets"] = 22085,
    ["Soulforge Belt"] = 22083,
    ["Soulforge Bracers"] = 22084,
    ["Soulforge Boots"] = 22087,
    
    -- Shaman
    ["Coif of The Five Thunders"] = 22097,
    ["Pauldrons of The Five Thunders"] = 22101,
    ["Vest of The Five Thunders"] = 22102,
    ["Kilt of The Five Thunders"] = 22098,
    ["Gauntlets of The Five Thunders"] = 22095,
    ["Belt of The Five Thunders"] = 22095,
    ["Bindings of The Five Thunders"] = 22096,
    ["Boots of The Five Thunders"] = 22100,
}

-- Helper function to get item ID from name
function VGuideItemDB:GetItemId(itemName)
    if not itemName then return nil end
    
    -- Clean up the item name (remove special characters like # tags)
    local cleanName = itemName
    _, _, cleanName = string.find(itemName, "^#?%a*#?%s*[%-]?%s*(.+)$")
    if not cleanName then
        cleanName = itemName
    end
    
    -- Look up in database
    return self.Items[cleanName]
end

-- Create an item link from item name
function VGuideItemDB:GetItemLink(itemName)
    local itemId = self:GetItemId(itemName)
    if not itemId then return nil end
    
    -- In vanilla WoW, item links are constructed differently
    -- Format: |cQUALITY|Hitem:ITEMID:ENCHANT:SUFFIX:UNIQUE|h[NAME]|h|r
    -- We'll use GetItemInfo if available, otherwise construct a basic link
    
    local name, link = GetItemInfo(itemId)
    if link then
        return link
    end
    
    -- Fallback: construct a basic item link (may not work for all items until cached)
    -- This forces the client to request item info
    return "|cffffffff|Hitem:" .. itemId .. ":0:0:0|h[" .. itemName .. "]|h|r"
end

-- Check if text contains an item name and return the item info
function VGuideItemDB:FindItemInText(text)
    if not text then return nil end
    
    for itemName, itemId in pairs(self.Items) do
        if string.find(text, itemName, 1, true) then -- plain text search
            return itemName, itemId
        end
    end
    
    return nil
end

-- Parse guide step text and return items found
function VGuideItemDB:ParseStepForItems(stepText)
    if not stepText then return {} end
    
    local items = {}
    
    -- Look for item names between # tags that match pattern "- ItemName#"
    local startPos = 1
    while true do
        local dashStart, dashEnd = string.find(stepText, "-%s+", startPos)
        if not dashStart then break end
        
        -- Find the end of this item entry (next # or end of string)
        local entryEnd = string.find(stepText, "#", dashEnd + 1)
        if not entryEnd then
            entryEnd = string.len(stepText)
        end
        
        local itemEntry = string.sub(stepText, dashEnd + 1, entryEnd - 1)
        -- Clean up parenthetical notes
        local itemName = itemEntry
        local parenPos = string.find(itemEntry, "%(")
        if parenPos then
            itemName = string.sub(itemEntry, 1, parenPos - 1)
        end
        
        -- Trim whitespace
        itemName = string.gsub(itemName, "^%s+", "")
        itemName = string.gsub(itemName, "%s+$", "")
        
        -- Check if this is an item in our database
        local itemId = self.Items[itemName]
        if itemId then
            table.insert(items, {
                name = itemName,
                id = itemId,
                startPos = dashStart,
                endPos = entryEnd
            })
        end
        
        startPos = dashEnd + 1
    end
    
    return items
end

-- Show item tooltip at cursor position
function VGuideItemDB:ShowItemTooltip(itemId)
    if not itemId then return end
    
    GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
    GameTooltip:SetHyperlink("item:" .. itemId .. ":0:0:0")
    GameTooltip:Show()
end

-- Hide item tooltip
function VGuideItemDB:HideItemTooltip()
    GameTooltip:Hide()
end
