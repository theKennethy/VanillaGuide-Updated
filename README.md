# VanillaGuide

A powerful in-game leveling guide addon for World of Warcraft 1.12.1 (Vanilla) with modern features like pfQuest integration, quest log tracking, and auto-advance.

![Version](https://img.shields.io/badge/version-1.05.0-blue)
![WoW Version](https://img.shields.io/badge/WoW-1.12.1-orange)
![License](https://img.shields.io/badge/license-MIT-green)

## Features

### Core Features
- **Step-by-Step Leveling Guides** - Complete 1-60 guides for both Alliance and Horde (based on Joana and Brian Kopp's work)
- **Quest Database** - Built-in quest/NPC ID lookup for enhanced functionality
- **Coordinate System** - Automatic coordinate parsing from guide text
- **FuBar Support** - Optional FuBar plugin for quick access

### pfQuest Integration
When [pfQuest](https://github.com/shagu/pfQuest) is installed:
- **Waypoint Arrows** - Automatic waypoint arrows pointing to objectives
- **Map Markers** - Show quest objectives on the world map
- **Quest Tracking** - Track quests directly through pfQuest's database

### pfUI Integration
When [pfUI](https://github.com/shagu/pfUI) is installed:
- **Automatic Skinning** - VanillaGuide frames match your pfUI theme
- **Seamless Integration** - Consistent look with your UI

### Quest Log Tracking
- **Real-time Progress** - See quest completion percentage in the guide
- **Status Indicators**:
  - `[?]` - Quest not in your log
  - `[45%]` - Quest in progress with completion percentage
  - `[!]` - Quest ready to turn in (100% complete)
- **Color Coding** - Visual feedback for quest status

### Auto-Advance
Automatically progress through the guide when you:
- **Accept** a quest
- **Complete** quest objectives
- **Turn in** a quest

Each trigger can be individually enabled/disabled in settings.

### Auto-Level Detection
- **Automatic Guide Suggestions** - On login, suggests the best guide for your level
- **Level-Up Detection** - When you level up, can auto-switch to appropriate guide
- **Smart Matching** - Finds guides that match your current level range

### Skip Completed Quests
- **Completed Quest Tracking** - Remembers quests you've turned in
- **Auto-Skip** - Automatically skips steps for already-completed quests
- **Manual Skip** - Use `/vguide skip` to jump to next incomplete step
- **Mark Complete** - Use `/vguide complete` to manually mark steps done

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
| [pfQuest](https://github.com/shagu/pfQuest) | Waypoint arrows, map markers, quest tracking |
| [pfQuest-turtle](https://github.com/shagu/pfQuest-turtle) | Turtle WoW specific quest data |
| [pfUI](https://github.com/shagu/pfUI) | Automatic UI skinning |
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

#### pfQuest Settings
- Enable/disable waypoint arrows
- Enable/disable map markers
- Auto-clear waypoints on step change

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
