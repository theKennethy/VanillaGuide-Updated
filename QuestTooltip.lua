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
------------------------------------------------------
]]--

Dv(" VGuide QuestTooltip.lua Start")

VGuideQuestTooltip = {}
VGuideQuestTooltip.enabled = true
VGuideQuestTooltip.initialized = false

-- NPC Name -> Quest relationships
-- Format: ["NPC Name"] = { quests = { {name, type} }, drops = { {item, quest} } }
-- type: "start" = gives quest, "end" = turn-in, "both" = starts and ends
VGuideQuestTooltip.NPCQuests = {
    -----------------------------------------
    -- Durotar Quest Givers
    -----------------------------------------
    ["Kaltunk"] = { quests = {
        { name = "Your Place In The World", type = "start" },
    }},
    ["Gornek"] = { quests = {
        { name = "Cutting Teeth", type = "start" },
        { name = "Cutting Teeth", type = "end" },
        { name = "Etched Tablet", type = "start" },
    }},
    ["Zureetha Fargaze"] = { quests = {
        { name = "Vile Familiars", type = "start" },
        { name = "Vile Familiars", type = "end" },
        { name = "Burning Blade Medallion", type = "start" },
        { name = "Burning Blade Medallion", type = "end" },
    }},
    ["Galgar"] = { quests = {
        { name = "Galgar's Cactus Apple Surprise", type = "both" },
    }},
    ["Foreman Thazz'ril"] = { quests = {
        { name = "Lazy Peons", type = "start" },
        { name = "Lazy Peons", type = "end" },
        { name = "Thazz'ril's Pick", type = "start" },
        { name = "Thazz'ril's Pick", type = "end" },
    }},
    
    -----------------------------------------
    -- Mulgore Quest Givers
    -----------------------------------------
    ["Chief Hawkwind"] = { quests = {
        { name = "The Hunt Begins", type = "start" },
        { name = "A Humble Task", type = "start" },
        { name = "Rite of Strength", type = "end" },
    }},
    ["Grull Hawkwind"] = { quests = {
        { name = "A Humble Task", type = "end" },
        { name = "A Humble Task (Part 2)", type = "both" },
    }},
    ["Seer Graytongue"] = { quests = {
        { name = "Rites of the Earthmother", type = "start" },
        { name = "Rite of Vision", type = "both" },
    }},
    
    -----------------------------------------
    -- Tirisfal Glades Quest Givers
    -----------------------------------------
    ["Undertaker Mordo"] = { quests = {
        { name = "The Mindless Ones", type = "start" },
        { name = "The Mindless Ones", type = "end" },
    }},
    ["Shadow Priest Sarvis"] = { quests = {
        { name = "Rattling the Rattlecages", type = "start" },
        { name = "Rattling the Rattlecages", type = "end" },
        { name = "The Damned", type = "start" },
        { name = "The Damned", type = "end" },
    }},
    ["Novice Elreth"] = { quests = {
        { name = "Marla's Last Wish", type = "start" },
        { name = "Marla's Last Wish", type = "end" },
    }},
    ["Executor Zygand"] = { quests = {
        { name = "The Scarlet Crusade", type = "start" },
        { name = "The Scarlet Crusade", type = "end" },
        { name = "Proof of Demise", type = "start" },
        { name = "Proof of Demise", type = "end" },
    }},
    
    -----------------------------------------
    -- Elwynn Forest Quest Givers
    -----------------------------------------
    ["Marshal McBride"] = { quests = {
        { name = "A Threat Within", type = "start" },
        { name = "Kobold Camp Cleanup", type = "start" },
        { name = "Kobold Camp Cleanup", type = "end" },
        { name = "Investigate Echo Ridge", type = "start" },
        { name = "Investigate Echo Ridge", type = "end" },
        { name = "Skirmish at Echo Ridge", type = "start" },
        { name = "Skirmish at Echo Ridge", type = "end" },
    }},
    ["Deputy Willem"] = { quests = {
        { name = "Report to Goldshire", type = "start" },
        { name = "Eagan Peltskinner", type = "start" },
    }},
    ["Eagan Peltskinner"] = { quests = {
        { name = "Wolves Across the Border", type = "both" },
    }},
    ["Marshal Dughan"] = { quests = {
        { name = "Report to Goldshire", type = "end" },
        { name = "The Fargodeep Mine", type = "start" },
        { name = "The Fargodeep Mine", type = "end" },
        { name = "The Jasperlode Mine", type = "start" },
        { name = "The Jasperlode Mine", type = "end" },
    }},
    ["Remy Two-Times"] = { quests = {
        { name = "Gold Dust Exchange", type = "start" },
        { name = "Gold Dust Exchange", type = "end" },
    }},
    
    -----------------------------------------
    -- Dun Morogh Quest Givers
    -----------------------------------------
    ["Sten Stoutarm"] = { quests = {
        { name = "Dwarven Outfitters", type = "start" },
        { name = "Dwarven Outfitters", type = "end" },
        { name = "Coldridge Valley Mail Delivery", type = "start" },
    }},
    ["Talin Keeneye"] = { quests = {
        { name = "The Boar Hunter", type = "start" },
        { name = "The Boar Hunter", type = "end" },
    }},
    ["Grelin Whitebeard"] = { quests = {
        { name = "A New Threat", type = "start" },
        { name = "A New Threat", type = "end" },
        { name = "The Troll Cave", type = "start" },
        { name = "The Troll Cave", type = "end" },
    }},
    ["Mountaineer Barleybrew"] = { quests = {
        { name = "Coldridge Valley Mail Delivery (Part 2)", type = "end" },
    }},
    
    -----------------------------------------
    -- Teldrassil Quest Givers
    -----------------------------------------
    ["Conservator Ilthalaine"] = { quests = {
        { name = "The Balance of Nature", type = "start" },
        { name = "The Balance of Nature", type = "end" },
        { name = "The Balance of Nature (Part 2)", type = "start" },
        { name = "The Balance of Nature (Part 2)", type = "end" },
    }},
    ["Gilshalan Windwalker"] = { quests = {
        { name = "The Woodland Protector", type = "start" },
    }},
    ["Tarindrella"] = { quests = {
        { name = "The Woodland Protector", type = "end" },
        { name = "The Woodland Protector (Part 2)", type = "start" },
        { name = "The Woodland Protector (Part 2)", type = "end" },
    }},
    ["Denalan"] = { quests = {
        { name = "Denalan's Earth", type = "end" },
        { name = "Timberling Seeds", type = "start" },
        { name = "Timberling Seeds", type = "end" },
        { name = "Tumors", type = "start" },
        { name = "Tumors", type = "end" },
    }},
    ["Athridas Bearmantle"] = { quests = {
        { name = "The Relics of Wakening", type = "start" },
        { name = "The Relics of Wakening", type = "end" },
        { name = "Ursal the Mauler", type = "start" },
        { name = "Ursal the Mauler", type = "end" },
    }},
}

-- Mob Name -> Quest item drops
-- Format: ["Mob Name"] = { {item = "Item Name", quest = "Quest Name"} }
VGuideQuestTooltip.MobDrops = {
    -----------------------------------------
    -- Durotar
    -----------------------------------------
    ["Mottled Boar"] = { 
        { item = "Boar Meat", quest = "Cutting Teeth" },
    },
    ["Scorpid Worker"] = {
        { item = "Scorpid Worker Tail", quest = "Sting of the Scorpid" },
    },
    ["Vile Familiar"] = {
        { item = "Vile Familiar Head", quest = "Vile Familiars" },
    },
    ["Burning Blade Fanatic"] = {
        { item = "Burning Blade Medallion", quest = "Burning Blade Medallion" },
    },
    ["Kul Tiras Sailor"] = {
        { item = "Admiral's Orders", quest = "The Admiral's Orders" },
    },
    
    -----------------------------------------
    -- Mulgore
    -----------------------------------------
    ["Plainstrider"] = {
        { item = "Plainstrider Feather", quest = "The Hunt Begins" },
        { item = "Plainstrider Talon", quest = "Swoop Hunting" },
    },
    ["Battleboar"] = {
        { item = "Battleboar Snout", quest = "The Battleboars" },
    },
    
    -----------------------------------------
    -- Tirisfal Glades
    -----------------------------------------
    ["Mindless Zombie"] = {
        { item = "Embalming Ichor", quest = "The Mindless Ones" },
    },
    ["Scarlet Convert"] = {
        { item = "Scarlet Crusade Insignia", quest = "The Scarlet Crusade" },
    },
    ["Scarlet Initiate"] = {
        { item = "Scarlet Crusade Insignia", quest = "The Scarlet Crusade" },
    },
    
    -----------------------------------------
    -- Elwynn Forest
    -----------------------------------------
    ["Kobold Vermin"] = {
        { item = "Gold Dust", quest = "Gold Dust Exchange" },
    },
    ["Kobold Worker"] = {
        { item = "Gold Dust", quest = "Gold Dust Exchange" },
    },
    ["Young Wolf"] = {
        { item = "Wolf Meat", quest = "Wolves Across the Border" },
    },
    ["Prowler"] = {
        { item = "Wolf Meat", quest = "Wolves Across the Border" },
    },
    
    -----------------------------------------
    -- Dun Morogh
    -----------------------------------------
    ["Small Crag Boar"] = {
        { item = "Tough Boar Meat", quest = "Dwarven Outfitters" },
    },
    ["Large Crag Boar"] = {
        { item = "Tough Boar Meat", quest = "Dwarven Outfitters" },
        { item = "Chunk of Boar Meat", quest = "The Boar Hunter" },
    },
    ["Rockjaw Trogg"] = {
        { item = "Rockjaw Trogg Ear", quest = "Rockjaw Invaders" },
    },
    ["Frostmane Troll"] = {
        { item = "Frostmane Troll Bead", quest = "The Troll Cave" },
    },
    
    -----------------------------------------
    -- Teldrassil
    -----------------------------------------
    ["Young Nightsaber"] = {
        { item = "Nightsaber Fang", quest = "The Balance of Nature" },
    },
    ["Webwood Spider"] = {
        { item = "Webwood Venom Sac", quest = "Twisted Hatred" },
    },
    ["Timberling"] = {
        { item = "Timberling Seed", quest = "Timberling Seeds" },
        { item = "Mossy Tumor", quest = "Tumors" },
    },
}

function VGuideQuestTooltip:Initialize()
    if self.initialized then return end
    
    -- Hook the GameTooltip
    self:HookTooltip()
    
    self.initialized = true
    Di("      - Quest Tooltips initialized")
end

function VGuideQuestTooltip:HookTooltip()
    -- Hook OnTooltipSetUnit to add quest info
    local originalOnTooltipSetUnit = GameTooltip:GetScript("OnTooltipSetUnit")
    
    GameTooltip:SetScript("OnTooltipSetUnit", function()
        -- Call original handler first
        if originalOnTooltipSetUnit then
            originalOnTooltipSetUnit()
        end
        
        -- Add our quest info
        if VGuideQuestTooltip.enabled then
            VGuideQuestTooltip:AddQuestInfo()
        end
    end)
end

function VGuideQuestTooltip:AddQuestInfo()
    -- Get the unit name
    local name, unit = GameTooltip:GetUnit()
    if not name or not unit then return end
    
    local added = false
    
    -- Check if this NPC gives/accepts quests
    local npcQuests = self.NPCQuests[name]
    if npcQuests and npcQuests.quests then
        for _, questInfo in ipairs(npcQuests.quests) do
            local questName = questInfo.name
            local questType = questInfo.type
            
            -- Check if we have/need this quest
            local statusText = nil
            local r, g, b = 1, 1, 1
            
            if questType == "start" or questType == "both" then
                -- Check if quest is available (not in quest log and not completed)
                if not self:IsQuestInLog(questName) and not self:IsQuestComplete(questName) then
                    statusText = "|cFFFFCC00!|r " .. questName
                    r, g, b = 1, 0.82, 0  -- Yellow
                    if not added then
                        GameTooltip:AddLine(" ")
                        GameTooltip:AddLine("Quests:", 0.2, 0.8, 1)
                        added = true
                    end
                    GameTooltip:AddLine(statusText, r, g, b)
                end
            end
            
            if questType == "end" or questType == "both" then
                -- Check if we have this quest and it's ready to turn in
                if self:IsQuestInLog(questName) then
                    local complete = self:IsQuestReadyToTurnIn(questName)
                    if complete then
                        statusText = "|cFFFFCC00?|r " .. questName .. " |cFF00FF00(Complete)|r"
                        r, g, b = 0.2, 1, 0.2  -- Green
                    else
                        statusText = "|cFF888888?|r " .. questName .. " |cFFFFFF00(In Progress)|r"
                        r, g, b = 1, 1, 0.5  -- Light yellow
                    end
                    if not added then
                        GameTooltip:AddLine(" ")
                        GameTooltip:AddLine("Quests:", 0.2, 0.8, 1)
                        added = true
                    end
                    GameTooltip:AddLine(statusText, r, g, b)
                end
            end
        end
    end
    
    -- Check if this mob drops quest items
    local mobDrops = self.MobDrops[name]
    if mobDrops then
        local dropsAdded = false
        for _, dropInfo in ipairs(mobDrops) do
            -- Check if we have the quest for this item
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
    end
    
    if added then
        GameTooltip:Show()
    end
end

-- Check if a quest is in the player's quest log
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

-- Check if a quest is ready to turn in (all objectives complete)
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

-- Check if a quest has been completed (in completed quests)
function VGuideQuestTooltip:IsQuestComplete(questName)
    -- In vanilla WoW, there's no easy way to check completed quests
    -- We'll just return false for now
    return false
end

-- Toggle tooltip enhancement
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
    -- Slight delay for other systems to load
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
