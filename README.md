# VanillaGuide

A powerful in-game leveling guide addon for World of Warcraft 1.12.1 (Vanilla) with modern features like built-in waypoint arrows, quest log tracking, and auto-advance.

![Version](https://img.shields.io/badge/version-1.10.0-blue)
![WoW Version](https://img.shields.io/badge/WoW-1.12.1-orange)
![License](https://img.shields.io/badge/license-MIT-green)

## Features

### Core Features
- **Step-by-Step Leveling Guides** - Complete 1-60 guides for both Alliance and Horde (based on Joana and Brian Kopp's work)
- **Quest Database** - Built-in quest/NPC ID lookup for enhanced functionality
- **Coordinate System** - Automatic coordinate parsing from guide text
- **FuBar Support** - Optional FuBar plugin for quick access

### pfQuest-Style Quest Tracker (NEW)
- **Quest Overview Panel** - Shows all active quests grouped by zone
- **Live Objectives** - See all objectives with progress (e.g., "Rockjaw Trogg: 3/6")
- **Difficulty Colors** - Quest levels colored by difficulty (red/orange/yellow/green/gray)
- **Completion Icons** - `?` icon shows quests ready to turn in
- **Collapsible** - Click any quest to collapse/expand its objectives
- **Draggable** - Position the tracker anywhere on screen
- **Auto-Updates** - Refreshes automatically on quest progress
- **Toggle** - Use `/vguide tracker` to show/hide

### pfQuest-Style Mob Tooltips (NEW)
- **Quest Info on Hover** - Hover over any mob to see related quests
- **Kill Quest Progress** - Shows "A New Threat: Rockjaw Trogg slain: 3/6"
- **Item Drop Quests** - Shows item collection progress for mobs that drop quest items
- **400+ Mob Database** - Comprehensive mob→item drop mapping for all zones 1-60
- **Smart Matching** - Matches mob variants (e.g., "Frostmane Troll Whelp" shows "Frostmane" quests)
- **NPC Quest Givers** - Shows `!` for available quests, `?` for turn-ins
- **Toggle** - Use `/vguide questtips` to enable/disable

### Built-in Waypoint Arrow
- **TomTom-style Arrow** - Direction arrow points toward your current objective
- **Distance Display** - Shows remaining yards/distance to destination
- **Zone Awareness** - Shows "Go to: Zone Name" when in wrong zone
- **Arrival Detection** - Notifies when you've reached the waypoint
- **Draggable** - Position the arrow anywhere on screen
- **Auto-Update** - Arrow automatically updates when changing guide steps

### Quest Log Tracking
- **Real-time Progress** - See quest completion percentage in the guide
- **Status Indicators**:
  - `[?]` - Quest not in your log
  - `[45%]` - Quest in progress with completion percentage
  - `[!]` - Quest ready to turn in (100% complete)
- **Color Coding** - Visual feedback for quest status

### Quest List Pop-Out
- **Active Quest View** - Shows all guide quests currently in your quest log
- **Progress Display** - See completion percentage for each quest
- **Click to Navigate** - Click any quest to jump to that step and set waypoint
- **Draggable Window** - Position the quest list anywhere on screen
- **Toggle Button** - Quick access from the main guide window
- **Slash Command** - Use `/vguide quests` to toggle

### Auto-Advance
Automatically progress through the guide when you:
- **Accept** a quest
- **Complete** quest objectives
- **Turn in** a quest

Each trigger can be individually enabled/disabled in settings.

### Auto Quest Accept/Turn-In
- **Auto-Accept** - Automatically accepts quests from the guide when talking to NPCs
- **Auto-Turn-In** - Automatically completes quests (unless reward choice needed)
- **Reward Choice Protection** - Stops if quest has multiple reward options to let you choose
- **Gossip Handling** - Works with NPC gossip dialogs too
- **Guide-Only** - Only affects quests in your current guide
- **Toggle** - Use `/vguide autoquest` to enable/disable

### World Map Pins
- **Current Objective** - Large gold pin shows your current step location
- **Route Preview** - Smaller pins show upcoming 5 steps on the map
- **Click to Navigate** - Click any pin to jump to that step
- **Zone-Aware** - Pins only show when viewing the correct zone
- **Toggle** - Use `/vguide mappins` or `/vguide route` to customize

### Quest Objective Map Pins (NEW)
- **pfQuest-Style Icons** - Proper exclamation marks (`!`) and question marks (`?`) on map
- **Quest Giver Pins** - Shows where to pick up quests
- **Turn-in Pins** - Shows where to complete quests
- **Objective Areas** - Shows zones for kill/collect objectives
- **Proper Tooltips** - Hover for quest names, follows cursor for better visibility
- **Toggle** - Use `/vguide questpins` to show/hide

### NPC Model Viewer
- **3D Preview** - See what quest NPCs look like before finding them
- **Rotatable** - Drag to rotate the model
- **Database** - Includes 200+ common quest NPCs
- **Fallback** - Shows generic faction model if NPC not in database
- **Quick Access** - Button in main frame or from step context

### Auto-Level Detection
- **Automatic Guide Suggestions** - On login, suggests the best guide for your level
- **Level-Up Detection** - When you level up, can auto-switch to appropriate guide
- **Smart Matching** - Finds guides that match your current level range

### Skip Completed Quests
- **Completed Quest Tracking** - Remembers quests you've turned in
- **Auto-Skip** - Automatically skips steps for already-completed quests
- **Manual Skip** - Use `/vguide skip` to jump to next incomplete step
- **Mark Complete** - Use `/vguide complete` to manually mark steps done

### Minimap Button
- **Quick Toggle** - Click to show/hide the guide window
- **Right-Click** - Open settings
- **Shift-Click** - Open guide selection
- **Draggable** - Reposition around the minimap
- **No FuBar Required** - Works standalone

### Item Tooltips
- **Gear Guide Integration** - Hover over gear items to see tooltips
- **Item Links** - Items show full WoW tooltips with stats
- **Instant Info** - No need to search for items

### Smart Travel Suggestions
- **Hearthstone Tips** - Suggests when to rebind your hearthstone
- **Flight Path Hints** - Shows quickest routes to destinations
- **Zone Change Alerts** - Notifies of travel shortcuts when you zone in
- **Boat/Zeppelin Info** - Reminds about ship routes

### Dungeon Auto-Detection
- **Automatic Guide Switch** - Switches to dungeon guide when entering an instance
- **Position Memory** - Returns to your previous guide when leaving
- **Level-Appropriate** - Only suggests dungeons within your level range
- **Faction-Aware** - Shows correct dungeons for your faction

### Progress Persistence
- **Per-Character Tracking** - Each character has separate progress
- **Step Completion** - Tracks which steps you've completed
- **Position Memory** - Remembers your last position in each guide
- **Auto-Resume** - Opens to where you left off

## Installation

1. Download the latest release
2. Extract to your `Interface/AddOns/` folder
3. Rename the folder to `VanillaGuide` (remove any version suffix)
4. Restart WoW or `/reload`

### Folder Structure
```
Interface/
└── AddOns/
    └── VanillaGuide/
        ├── VanillaGuide.toc
        ├── Core.lua
        ├── GuideTables/
        │   ├── Alliance/
        │   └── Horde/
        └── libs/
```

## Optional Dependencies

These addons enhance VanillaGuide but are **not required**:

| Addon | Benefit |
|-------|---------|
| [FuBar](https://github.com/shirsig/FuBar) | Quick-access toolbar button |
| [MetaMap](https://github.com/laytya/MetaMap) | Alternative map integration |

## Usage

### Slash Commands

| Command | Description |
|---------|-------------|
| `/vguide` | Toggle main window |
| `/vguide show` | Show main window |
| `/vguide hide` | Hide main window |
| `/vguide next` | Go to next step |
| `/vguide prev` | Go to previous step |
| `/vguide reset` | Reset to step 1 |
| `/vguide options` | Open settings |
| `/vguide suggest` | Switch to guide for your level |
| `/vguide skip` | Skip to next incomplete step |
| `/vguide complete` | Mark current step as completed |
| `/vguide quests` | Toggle quest list pop-out |
| `/vguide arrow` | Toggle waypoint arrow |
| `/vguide autoquest` | Toggle auto accept/turn-in |
| `/vguide mappins` | Toggle world map pins |
| `/vguide questpins` | Toggle quest objective pins on map |
| `/vguide questtips` | Toggle quest info in mob tooltips |
| `/vguide tracker` | Toggle quest tracker panel |
| `/vguide minimapmobs` | Toggle minimap objective dots |
| `/vguide route` | Toggle route preview on map |
| `/vguide npcviewer` | Toggle NPC model viewer |
| `/vguide minimap` | Toggle minimap button visibility |
| `/vguide resetminimap` | Reset minimap button position |
| `/vguide progress` | Show current guide progress |
| `/vguide markdone` | Mark current step as done |
| `/vguide resetprogress` | Reset progress for current guide |

### Navigation
- **Arrow Buttons** - Navigate between steps
- **Double Arrows** - Jump to next/previous guide section
- **Dropdown Menus** - Select faction, zone, and guide
- **Scroll Wheel** - Scroll through visible steps

### Settings

Access settings via the gear icon or `/vguide options`:

#### Display Settings
- Window scale and opacity
- Border style selection
- Lock/unlock window position
- Show/hide on login

#### Arrow Settings
- Enable/disable waypoint arrow
- Arrow position (draggable)

#### Map Pins Settings
- Enable/disable world map pins
- Show/hide route preview (upcoming steps)

#### NPC Viewer Settings
- Enable/disable NPC model viewer

#### Auto Quest Settings
- Enable/disable auto quest system
- Auto-accept guide quests
- Auto-turn-in completed quests
- Skip quests with reward choices
- Show notification messages

#### Auto-Advance Settings
- Enable/disable auto-advance
- Trigger on quest accept
- Trigger on quest complete
- Trigger on quest turn-in
- Show notification messages

#### Level Detection Settings
- Enable/disable level detection
- Auto-suggest guide on login
- Auto-switch guide on level-up
- Skip completed quests
- Show notification messages

## Supported Servers

VanillaGuide is compatible with:
- **Kronos** (1.12.1)
- **Elysium/Light's Hope** (1.12.1)
- **Turtle WoW** (1.12.1 with custom content)
- **Vanilla+ servers** (1.12.1)
- Any other 1.12.1 private server

## Guide Coverage

### Alliance (1-60)
| Level Range | Zones |
|-------------|-------|
| 1-12 | Elwynn Forest, Dun Morogh, Teldrassil |
| 12-20 | Westfall, Loch Modan, Darkshore, Redridge |
| 20-30 | Duskwood, Wetlands, Ashenvale |
| 30-40 | Stranglethorn Vale, Desolace, Arathi |
| 40-50 | Tanaris, Feralas, Hinterlands |
| 50-60 | Un'Goro, Felwood, Winterspring, EPL/WPL |

### Horde (1-60)
| Level Range | Zones |
|-------------|-------|
| 1-12 | Durotar, Mulgore, Tirisfal Glades |
| 12-20 | The Barrens, Silverpine Forest |
| 20-30 | Stonetalon, Ashenvale, Hillsbrad |
| 30-40 | Thousand Needles, Desolace, STV |
| 40-50 | Tanaris, Feralas, Hinterlands |
| 50-60 | Un'Goro, Felwood, Winterspring, EPL/WPL |

### Profession Guides (1-300)
| Profession | Coverage |
|------------|----------|
| Alchemy | Full 1-300 Guide |
| Blacksmithing | Full 1-300 Guide |
| Cooking | Alliance & Horde Guides |
| Enchanting | Full 1-300 Guide |
| Engineering | Full 1-300 Guide |
| First Aid | Full 1-300 Guide |
| Fishing | Full 1-300 Guide |
| Leatherworking | Full 1-300 Guide |
| Tailoring | Full 1-300 Guide |

### Dungeon Guides
Complete guides for all vanilla dungeons with boss strategies, loot, and quest pickups:

| Dungeon | Level Range |
|---------|-------------|
| Ragefire Chasm | 13-18 |
| Deadmines | 17-26 |
| Wailing Caverns | 17-24 |
| Shadowfang Keep | 22-30 |
| Blackfathom Deeps | 24-32 |
| Gnomeregan | 29-38 |
| Scarlet Monastery (All Wings) | 28-45 |
| Razorfen Kraul | 29-38 |
| Uldaman | 41-51 |
| Zul'Farrak | 44-54 |
| Maraudon | 46-55 |
| Sunken Temple | 50-60 |
| Blackrock Depths | 52-60 |
| Lower Blackrock Spire | 55-60 |
| Upper Blackrock Spire | 58-60 |
| Stratholme | 58-60 |
| Scholomance | 58-60 |
| Dire Maul (All Wings) | 55-60 |

### Gold Making Guides
| Guide | Description |
|-------|-------------|
| General Tips | Fundamentals of gold making |
| Auction House | Buying/selling strategies |
| Level 30-40 Spots | Farming locations for mid levels |
| Level 40-50 Spots | Pre-mount farming |
| Level 50-60 Spots | Endgame farming |
| Dungeon Farms | DM, Strat, Mara runs |
| Profession Gold | Making gold with professions |
| Vendor Tricks | Limited supply flipping |
| Epic Mount Guide | Getting your 1000g |
| Raid Consumables | Farming for raids |

### Talent Guides
Complete talent builds for all 9 classes with level-by-level progression:

| Class | Specs Covered |
|-------|---------------|
| Warrior | Fury DPS, Arms PvP, Protection Tank |
| Rogue | Combat Swords, Dagger |
| Mage | Frost Leveling, Fire Raid |
| Priest | Shadow Leveling, Holy Healing |
| Warlock | SM/Ruin, DS/Ruin |
| Hunter | Marksmanship, Beast Mastery |
| Druid | Feral Tank, Restoration |
| Shaman | Enhancement, Restoration |
| Paladin | Holy Healing, Retribution |

Each guide includes talent order, rotation tips, and stat priorities.

### Gear Guides
| Guide | Description |
|-------|-------------|
| Gearing Overview | Stat priorities, hit caps, defense cap |
| Warrior Fury BiS | Pre-raid best-in-slot for DPS |
| Warrior Prot BiS | Pre-raid tanking gear |
| Rogue BiS | Pre-raid daggers/swords gear |
| Mage BiS | Pre-raid caster gear |
| Healer BiS | Pre-raid healing gear (all classes) |
| Hunter BiS | Pre-raid ranged DPS gear |
| Warlock BiS | Pre-raid caster gear |
| Leveling Upgrades | Key weapon/armor upgrades by level |

### Reputation Guides
| Faction | Rewards |
|---------|---------|
| Argent Dawn | Head/leg enchants, Naxx attunement |
| Timbermaw Hold | Transmute recipes, Enchant Agility |
| Cenarion Circle | AQ gear, Nature Resist |
| Thorium Brotherhood | Fire Resist gear, Dark Iron crafting |
| Hydraxian Waterlords | MC attunement (douse runes) |
| Brood of Nozdormu | AQ40 rings, Scepter quest |
| Zandalar Tribe | ZG enchants, class gear |
| Steamwheedle/Bloodsail | Admiral hat, goblin access |
| Wintersaber Trainers | Frostsaber mount (Alliance) |
| Home Cities | Ride other race mounts |
| Shen'dralar | Dire Maul enchants |

## Contributing

### Adding/Updating Guides

Guide files are located in `GuideTables/`. Each step follows this format:

```lua
{
    step = 1,
    text = "Accept |cFF00FF00A Threat Within|r from Deputy Willem (48.2, 42.6)",
    action = "Accept",
    questId = 783,
    x = 48.2,
    y = 42.6,
    zone = "Elwynn Forest"
}
```

Coordinates in the text `(48.2, 42.6)` are automatically parsed if `x`/`y` aren't specified.

### Quest Database

Add quest IDs to `QuestDatabase.lua`:

```lua
VGuide_QuestDB = {
    ["Quest Name"] = questId,
    -- ...
}
```

## Comparison with Other Guides

| Feature | VanillaGuide | Zygor | Joana PDF |
|---------|--------------|-------|-----------|
| In-game display | ✅ | ✅ | ❌ |
| Quest tracking | ✅ | ✅ | ❌ |
| Waypoint arrows | ✅ (pfQuest) | ✅ | ❌ |
| Auto-advance | ✅ | ✅ | ❌ |
| Progress % | ✅ | ✅ | ❌ |
| Auto-level detection | ✅ | ✅ | ❌ |
| Skip completed quests | ✅ | ✅ | ❌ |
| Talent guides | ✅ | ✅ | ❌ |
| Gear suggestions | ✅ | ✅ | ❌ |
| Dungeon guides | ✅ | ✅ | ❌ |
| Gold/farming guides | ✅ | ✅ | ❌ |
| Reputation guides | ✅ | ✅ | ❌ |
| Minimap button | ✅ | ✅ | ❌ |
| Item tooltips | ✅ | ✅ | ❌ |
| Travel suggestions | ✅ | ✅ | ❌ |
| Dungeon auto-detect | ✅ | ✅ | ❌ |
| Progress persistence | ✅ | ✅ | ❌ |
| Quest tooltips on mobs | ✅ | ❌ | ❌ |
| Quest overview panel | ✅ | ✅ | ❌ |
| Mob item drops DB | ✅ | ❌ | ❌ |
| Free & open source | ✅ | ❌ | ❌ |
| 1.12.1 compatible | ✅ | ❌ | ✅ |

## Troubleshooting

### Common Issues

**"VanillaGuide not showing"**
- Type `/vguide show`
- Check if addon is enabled in character select

**"Waypoints not working"**
- Install pfQuest
- Enable pfQuest integration in settings

**"Guide not advancing"**
- Enable Auto-Advance in settings
- Ensure quest names match exactly

**"UI looks wrong with pfUI"**
- Enable pfUI skinning in settings
- Reload UI with `/reload`

## Changelog

### Version 1.10.0 (February 2026)

#### New Features
- **pfQuest-Style Quest Tracker** - New draggable panel showing all active quests with objectives and progress
- **Quest Tooltips on Mobs** - Hover over any mob to see related quests and objectives
- **Quest Map Pins** - Proper exclamation (`!`) and question mark (`?`) icons on world map
- **Mob Item Database** - 400+ mobs with item drop info for collection quests

#### Improvements
- Fixed "banana-shaped" quest markers - Now uses proper GossipFrame icons
- Fixed tooltip overlapping issues - Tooltips now anchor to cursor
- Fixed dropdown menu overlapping - Submenus now properly position to the right
- Improved quest objective matching with fuzzy/word matching
- Added comprehensive NPC database (250+ quest NPCs from all zones)

#### Technical Fixes
- Fixed `OnTooltipSetUnit` error for WoW 1.12 compatibility
- Fixed `GetUnit()` error - Now uses `UnitName("mouseover")`
- Fixed `ipairs` nil index errors with safer `table.getn` loops
- Improved tooltip hook using OnUpdate frame approach

## Credits

### Guide Authors
- **Joana (Mancow)** - Original Horde 1-60 speedrun guide
- **Brian Kopp** - Alliance leveling guide

### Original Addon
- **Ssjhero** - Original VanillaGuide addon

### Resources
- [Joana's World](http://www.joanasworld.com/)
- [Classic WoW Wiki](https://classic.wowhead.com/)

## License

This project is open source. Guide content is credited to original authors.

## Links

- [GitHub Repository](https://github.com/theKennethy/VanillaGuide-Updated)
- [Report Issues](https://github.com/theKennethy/VanillaGuide-Updated/issues)
- [pfQuest](https://github.com/shagu/pfQuest)
- [pfUI](https://github.com/shagu/pfUI)
