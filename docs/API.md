# UiLibraryStyleImgui — Documentation

IMGUI-style Roblox UI library for mobile and desktop.

---

## Features

- IMGUI-style, flat, native, minimal window layout
- Mobile optimized — sliders, color pickers and drag interactions work with touch
- Resizable and draggable windows
- Window tabs, buttons, switches, sliders, text boxes, keybinds, dropdowns, color pickers, folders, consoles
- Floating mobile toggle button of the menu

---

## Resources

UI images are bundled in this repository under `files/assets/`:

- `files/assets/2851926732.png`
- `files/assets/2851929490.png`
- `files/assets/2851928141.png`
- `files/assets/3641079629.png`
- `files/assets/698052001.png`
- `files/assets/266543268.png`
- `files/assets/4731371541.png`
- `files/assets/4744658743.png`

The library references those asset IDs by `rbxassetid://`. The files are kept here as a backup in case the assets change or disappear.

---

## Installation

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()
```

Or copy `Library.lua` into your project and require it.

---

## Quick Start

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()

local Window, WindowObj = Library:AddWindow("My Script", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(320, 240),
	can_resize = true,
})

local Main = Window:AddTab("Main")

Main:AddLabel("Hello world")

Main:AddButton("Click", function()
	print("clicked")
end)

Main:AddSwitch("Feature", function(state)
	print("switch:", state)
end)

Main:AddSlider("Speed", function(value)
	print("speed:", value)
end, { min = 0, max = 200 })

Main:AddKeybind("Menu", function()
	print("key pressed")
end, { standard = Enum.KeyCode.RightShift })

Main:AddTextBox("Input...", function(text)
	print("typed:", text)
end, { clear = true })

Main:AddDropdown("Target", function(option)
	print("chose:", option)
end)
-- add options:
-- Dropdown:Add("Head") etc

Main:AddColorPicker(function(color)
	print("color:", color)
end)

Library:FormatWindows()
```

Full example: `Examples/Example.lua`

---

## Menu Toggle

- RightShift toggles the window visibility.
- Mobile: a floating "UI" button appears and toggles the menu.

---

## Symbols

UI text uses plain symbols instead of emojis — bullets, degrees, diameters, pipes, root and delta marks.

---

## Unload

```lua
Library:Unload()
```

Destroys the GUI and removes resources.

---

## Library

### `Library:AddWindow(title, options)` -> `windowData, windowObject`
Creates a new window.

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `title` | `string` | `"New Window"` | Window title |
| `options` | `table` | — | Window options |

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `main_color` | `Color3` | `Color3.fromRGB(41,74,122)` | Accent color |
| `min_size` | `Vector2` | `Vector2.new(400,300)` | Minimum size |
| `toggle_key` | `Enum.KeyCode` | `RightShift` | Window toggle key |
| `can_resize` | `boolean` | `true` | Allow resizing |
| `mobile_toggle_button` | `boolean` | `true` | Show floating UI button on mobile |

### `Library:FormatWindows()`
Re-layouts all windows after creating.

### `Library:Unload()`
Destroys the GUI and resources.

---

## Window

### `windowData:AddTab(name)` -> `tabData, tabObject`
Adds a tab.

---

## Tab elements

### `tabData:AddLabel(text)` -> `labelObject`
Static label.

### `tabData:AddButton(text, callback)` -> `buttonObject`
Clickable button. `callback()` fires on click/tap.

### `tabData:AddSwitch(text, callback)` -> `switchData, switchObject`
Toggle switch. `callback(state)` fires on change.

`switchData:Set(bool)` sets the switch state.

### `tabData:AddTextBox(placeholder, callback, options)` -> `textboxObject`
Text input. `callback(text)` fires on focus lost.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `clear` | `boolean` | `true` | Clear after submit |

### `tabData:AddSlider(text, callback, options)` -> `sliderData, sliderObject`
Slider. `callback(value)` fires on change. Touch friendly.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `min` | `number` | `0` | Min value |
| `max` | `number` | `100` | Max value |
| `readonly` | `boolean` | `false` | Disable dragging |

`sliderData:Set(value)` sets the slider value (within min/max).

### `tabData:AddKeybind(name, callback, options)` -> `keybindData, keybindObject`
Keybind. `callback()` fires on key press.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `standard` | `Enum.KeyCode` | `RightShift` | Default key |

`keybindData:SetKeybind(keycode)` sets the bound key.

### `tabData:AddDropdown(name, callback)` -> `dropdownData, dropdownObject`
Dropdown menu. `callback(option)` fires on selection.

`dropdownData:Add(option)` adds an option. Returns `optionData` with `:Remove()`.

### `tabData:AddColorPicker(callback)` -> `colorPickerData, colorPickerObject`
Color picker. `callback(color)` fires on change. Touch friendly.

`colorPickerData:Set(color)` sets the color.

### `tabData:AddFolder(name)` -> `folderData, folderObject`
Collapsible folder that can contain other elements.

### `tabData:AddConsole(options)` -> `consoleData`
Built-in console / code viewer.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `y` | `number` | `200` | Height |
| `source` | `string` | `"Logs"` | `"Logs"` or `"Lua"` |
| `readonly` | `boolean` | `true` | Disable editing |
| `full` | `boolean` | `false` | Expand to full width |

`consoleData:Set(code)`, `consoleData:Get()`, `consoleData:Log(msg)`.

### `tabData:AddHorizontalAlignment()` -> `data, object`
Adds buttons in a horizontal row.

---

## Mobile notes

- Sliders, color pickers, drag and resize use `InputBegan` / `InputChanged` / `InputEnded`, so they work with touch and mouse.
- Dropdowns, buttons, switches and keybinds work with tap input.
- A floating "UI" button is shown on mobile to open and close the menu.