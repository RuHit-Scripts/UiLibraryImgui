# API Reference

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

### `Library:SetTheme(name)`
Applies a theme by name. Built-in: `Ocean`, `Night`, `Candy`, `Mint`, `Light`.

### `Library:FormatWindows()`
Re-layouts all windows after creating.

---

## Window

### `windowData:AddTab(name)` -> `tabData, tabObject`
Adds a tab.

---

## Tab elements

### `tabData:AddLabel(text)` -> `labelObject`
Static label.

### `tabData:AddButton(text, callback)` -> `buttonObject`
Clickable button. `callback()` fires on click.

### `tabData:AddSwitch(text, callback)` -> `switchData, switchObject`
Toggle switch. `callback(state)` fires on change.

`switchData:Set(bool)` — set switch state.

### `tabData:AddTextBox(placeholder, callback, options)` -> `textboxObject`
Text input. `callback(text)` fires on focus lost.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `clear` | `boolean` | `true` | Clear after submit |

### `tabData:AddSlider(text, callback, options)` -> `sliderData, sliderObject`
Slider. `callback(value)` fires on change. **Touch friendly.**

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `min` | `number` | `0` | Min value |
| `max` | `number` | `100` | Max value |
| `readonly` | `boolean` | `false` | Disable dragging |

`sliderData:Set(value)` — set value (0-100).

### `tabData:AddKeybind(name, callback, options)` -> `keybindData, keybindObject`
Keybind. `callback()` fires on key press.

`options`:
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `standard` | `Enum.KeyCode` | `RightShift` | Default key |

`keybindData:SetKeybind(keycode)` — set the bound key.

### `tabData:AddDropdown(name, callback)` -> `dropdownData, dropdownObject`
Dropdown menu. `callback(option)` fires on selection.

`dropdownData:Add(option)` — add an option (chainable). Returns `optionData` with `:Remove()`.

### `tabData:AddColorPicker(callback)` -> `colorPickerData, colorPickerObject`
Color picker. `callback(color)` fires on change. **Touch friendly.**

`colorPickerData:Set(color)` — set color.

### `tabData:AddFolder(name)` -> `folderData, folderObject`
Collapsible folder that can contain other elements.

### `tabData:AddConsole(options)` -> `consoleData`
Built-in console / code viewer.

---

## Mobile notes

- Sliders and color pickers are rewritten to use `InputBegan` / `InputChanged` / `InputEnded` so they work with **touch** and mouse.
- Element heights scale up automatically on mobile (`UI_SCALE`).
- Dropdowns, buttons, switches and keybinds work with tap input.
