--[[--------------------------------------------------
----- VanillaGuide -----
------------------
QuestLogTracker.lua
Authors: VanillaGuide Contributors
Version: 1.05.0
------------------------------------------------------
Description: 
    Quest Log Integration module
    - Tracks which quests from guide steps are in player's log
    - Shows completion % for quest objectives
    - Highlights quest status in the guide display
    
    Uses vanilla 1.12 Quest Log API:
    - GetNumQuestLogEntries()
    - GetQuestLogTitle(index)
    - GetNumQuestLeaderBoards(questIndex)
    - GetQuestLogLeaderBoard(objIndex, questIndex)
------------------------------------------------------
Quest Status Icons:
    [?] = Quest available but not in log (yellow)
    [!] = Quest in log, incomplete (orange)
    [✓] = Quest complete, ready to turn in (green)
    [X] = Quest turned in / done (gray)
------------------------------------------------------
]]--

Dv(" VGuide QuestLogTracker.lua Start")

VGuideQuestLog = {}
VGuideQuestLog.__index = VGuideQuestLog

function VGuideQuestLog:new()
    local obj = {}
    setmetatable(obj, self)
    
    -- Cache of quest log data (refreshed on events)
    obj.questCache = {}
    obj.lastUpdate = 0
    obj.updateInterval = 1 -- seconds between cache updates
    
    ---------------------------------------
    -- Quest Log Scanning
    ---------------------------------------
    
    -- Scan the entire quest log and cache results
    obj.ScanQuestLog = function(self)
        local now = GetTime()
        -- Don't update too frequently
        if now - obj.lastUpdate < obj.updateInterval then
            return obj.questCache
        end
        
        obj.questCache = {}
        local numEntries, numQuests = GetNumQuestLogEntries()
        
        for i = 1, numEntries do
            local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, questId = GetQuestLogTitle(i)
            
            if not isHeader and questTitle then
                local questData = {
                    index = i,
                    title = questTitle,
                    level = level,
                    tag = questTag,
                    isComplete = isComplete,
                    objectives = {},
                    progress = 0,
                }
                
                -- Get quest objectives
                local numObjectives = GetNumQuestLeaderBoards(i)
                local totalProgress = 0
                local completedObjectives = 0
                
                if numObjectives and numObjectives > 0 then
                    for j = 1, numObjectives do
                        local text, objType, finished = GetQuestLogLeaderBoard(j, i)
                        if text then
                            -- Parse objective text like "Scorpid Workers slain: 4/8"
                            local current, required = obj:ParseObjectiveProgress(text)
                            
                            questData.objectives[j] = {
                                text = text,
                                type = objType,
                                finished = finished,
                                current = current,
                                required = required,
                            }
                            
                            if finished then
                                completedObjectives = completedObjectives + 1
                                totalProgress = totalProgress + 100
                            elseif current and required and required > 0 then
                                totalProgress = totalProgress + (current / required * 100)
                            end
                        end
                    end
                    
                    questData.progress = math.floor(totalProgress / numObjectives)
                else
                    -- Quest with no trackable objectives (talk to NPC, etc.)
                    if isComplete then
                        questData.progress = 100
                    end
                end
                
                -- Store by lowercase title for easy lookup
                obj.questCache[string.lower(questTitle)] = questData
            end
        end
        
        obj.lastUpdate = now
        return obj.questCache
    end
    
    -- Parse "X/Y" from objective text
    obj.ParseObjectiveProgress = function(self, text)
        if not text then return nil, nil end
        
        -- Pattern: "Something: 4/8" or "Something slain: 4/8"
        local _, _, current, required = string.find(text, "(%d+)/(%d+)")
        if current and required then
            return tonumber(current), tonumber(required)
        end
        
        return nil, nil
    end
    
    ---------------------------------------
    -- Quest Status Checking
    ---------------------------------------
    
    -- Check if a quest is in the log
    -- Returns: questData table or nil
    obj.GetQuestFromLog = function(self, questName)
        if not questName then return nil end
        
        obj:ScanQuestLog()
        
        local lowerName = string.lower(questName)
        
        -- Exact match
        if obj.questCache[lowerName] then
            return obj.questCache[lowerName]
        end
        
        -- Partial match (for quests with slightly different names)
        for cachedName, questData in pairs(obj.questCache) do
            if string.find(cachedName, lowerName, 1, true) or 
               string.find(lowerName, cachedName, 1, true) then
                return questData
            end
        end
        
        return nil
    end
    
    -- Check if quest is in log
    obj.IsQuestInLog = function(self, questName)
        return obj:GetQuestFromLog(questName) ~= nil
    end
    
    -- Check if quest is complete (ready to turn in)
    obj.IsQuestComplete = function(self, questName)
        local questData = obj:GetQuestFromLog(questName)
        if questData then
            return questData.isComplete or questData.progress >= 100
        end
        return false
    end
    
    -- Get quest completion percentage
    obj.GetQuestProgress = function(self, questName)
        local questData = obj:GetQuestFromLog(questName)
        if questData then
            return questData.progress
        end
        return 0
    end
    
    -- Get detailed objective progress
    obj.GetQuestObjectives = function(self, questName)
        local questData = obj:GetQuestFromLog(questName)
        if questData then
            return questData.objectives
        end
        return nil
    end
    
    ---------------------------------------
    -- Status String Generation
    ---------------------------------------
    
    -- Get status indicator for a quest
    -- Returns: statusIcon, statusColor
    obj.GetQuestStatusIndicator = function(self, questName, stepType)
        -- stepType: "ACCEPT", "DOQUEST", "TURNIN"
        local questData = obj:GetQuestFromLog(questName)
        
        if not questData then
            -- Quest not in log
            if stepType == "ACCEPT" then
                return "[?]", "|cffffd100"  -- Yellow - available to pick up
            else
                return "[?]", "|cff888888"  -- Gray - need to pick up first
            end
        end
        
        if questData.isComplete or questData.progress >= 100 then
            -- Quest complete
            if stepType == "TURNIN" then
                return "[!]", "|cff00ff00"  -- Green - ready to turn in!
            else
                return "[✓]", "|cff00ff00"  -- Green checkmark
            end
        end
        
        -- Quest in progress
        local progressStr = ""
        if questData.progress > 0 then
            progressStr = " " .. questData.progress .. "%"
        end
        return "[" .. questData.progress .. "%]", "|cffff9900"  -- Orange - in progress
    end
    
    -- Generate a formatted status string for display
    obj.GetQuestStatusString = function(self, questName, stepType)
        local icon, color = obj:GetQuestStatusIndicator(questName, stepType)
        return color .. icon .. "|r"
    end
    
    ---------------------------------------
    -- Step Text Enhancement
    ---------------------------------------
    
    -- Parse quest names from step text and add status indicators
    -- Input: raw step string (before colorization)
    -- Output: enhanced string with status indicators
    obj.EnhanceStepText = function(self, stepText)
        if not stepText then return stepText end
        
        local enhanced = stepText
        
        -- Find ACCEPT quests: #ACCEPT"Quest Name"#
        enhanced = string.gsub(enhanced, '#ACCEPT"([^"]+)"', function(questName)
            local status = obj:GetQuestStatusString(questName, "ACCEPT")
            local inLog = obj:IsQuestInLog(questName)
            if inLog then
                return status .. ' #ACCEPT"' .. questName .. '"'
            else
                return '#ACCEPT"' .. questName .. '"'
            end
        end)
        
        -- Find DOQUEST quests: #DOQUEST"Quest Name"#
        enhanced = string.gsub(enhanced, '#DOQUEST"([^"]+)"', function(questName)
            local questData = obj:GetQuestFromLog(questName)
            if questData then
                local progress = questData.progress or 0
                local color = "|cffff9900"  -- Orange
                if progress >= 100 then
                    color = "|cff00ff00"  -- Green
                end
                return color .. "[" .. progress .. "%]|r #DOQUEST\"" .. questName .. "\""
            else
                return "|cff888888[?]|r #DOQUEST\"" .. questName .. "\""
            end
        end)
        
        -- Find TURNIN quests: #TURNIN"Quest Name"#
        enhanced = string.gsub(enhanced, '#TURNIN"([^"]+)"', function(questName)
            local questData = obj:GetQuestFromLog(questName)
            if questData then
                if questData.isComplete or questData.progress >= 100 then
                    return "|cff00ff00[!]|r #TURNIN\"" .. questName .. "\""  -- Ready!
                else
                    return "|cffff0000[" .. questData.progress .. "%]|r #TURNIN\"" .. questName .. "\""  -- Not ready
                end
            else
                return "#TURNIN\"" .. questName .. "\""  -- Not in log (maybe already turned in)
            end
        end)
        
        return enhanced
    end
    
    -- Same as above but for already-colorized text
    -- Looks for the color codes instead of raw tags
    obj.EnhanceColorizedText = function(self, stepText)
        if not stepText then return stepText end
        
        local enhanced = stepText
        
        -- ACCEPT (cyan): |c0000ffff"Quest Name"|r
        enhanced = string.gsub(enhanced, '|c0000ffff"([^"]+)"|r', function(questName)
            local questData = obj:GetQuestFromLog(questName)
            if questData then
                return "|cff00ff00[✓]|r |c0000ffff\"" .. questName .. "\"|r"
            else
                return "|c0000ffff\"" .. questName .. "\"|r"
            end
        end)
        
        -- DOQUEST (blue): |c000079d2"Quest Name"|r
        enhanced = string.gsub(enhanced, '|c000079d2"([^"]+)"|r', function(questName)
            local questData = obj:GetQuestFromLog(questName)
            if questData then
                local progress = questData.progress or 0
                local color = "|cffff9900"  -- Orange
                if progress >= 100 then
                    color = "|cff00ff00"  -- Green
                end
                return color .. "[" .. progress .. "%]|r |c000079d2\"" .. questName .. "\"|r"
            else
                return "|cff666666[?]|r |c000079d2\"" .. questName .. "\"|r"
            end
        end)
        
        -- TURNIN (green): |c0000ff00"Quest Name"|r
        enhanced = string.gsub(enhanced, '|c0000ff00"([^"]+)"|r', function(questName)
            local questData = obj:GetQuestFromLog(questName)
            if questData then
                if questData.isComplete or questData.progress >= 100 then
                    return "|cff00ff00[!]|r |c0000ff00\"" .. questName .. "\"|r"
                else
                    return "|cffff0000[" .. questData.progress .. "%]|r |c0000ff00\"" .. questName .. "\"|r"
                end
            else
                return "|c0000ff00\"" .. questName .. "\"|r"
            end
        end)
        
        return enhanced
    end
    
    ---------------------------------------
    -- Event Registration (for cache invalidation)
    ---------------------------------------
    
    obj.InvalidateCache = function(self)
        obj.lastUpdate = 0
    end
    
    -- Call this to register for quest log update events
    obj.RegisterEvents = function(self, eventHandler)
        -- These events indicate quest log changes
        -- The calling code should hook these and call InvalidateCache
        return {
            "QUEST_LOG_UPDATE",
            "UNIT_QUEST_LOG_CHANGED", 
            "QUEST_ACCEPTED",
            "QUEST_FINISHED",
            "QUEST_COMPLETE",
        }
    end
    
    return obj
end

-- Global instance for easy access
VGuideQuestTracker = VGuideQuestLog:new()

Dv(" VGuide QuestLogTracker.lua End")
