# UiLibraryStyleImgui

A lightweight **IMGUI-style** Roblox UI library with a native look, built for both **mobile and desktop**.

![GitHub](https://img.shields.io/badge/Language-Luau-blue)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Features

- 🖥️ **IMGUI-style** — flat, native, minimal window layout
- 📱 **Mobile optimized** — sliders, color pickers and drag interactions work with **touch**
- 🎨 **Themes** — switchable color schemes (`Ocean`, `Night`, `Candy`, `Mint`, `Light`)
- 🪟 **Resizable & draggable** windows
- 🔤 Window tabs, buttons, switches, sliders, text boxes, keybinds, dropdowns, color pickers, folders, consoles
- ⚡ No external assets — works on any executor with `Drawing` / standard UI

---

## Installation

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/UiLibraryStyleImgui/main/Library.lua"))()
```

Or copy `Library.lua` into your project and `require` it.

---

## Quick Start

```lua
local Library = loadstring(game:HttpGet("...Library.lua"))()

-- pick a theme
Library:SetTheme("Ocean") -- Ocean | Night | Candy | Mint | Light

-- create a window
local Window, WindowObj = Library:AddWindow("My Script", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(420, 340),
	can_resize = true,
})

-- add a tab
local Main = Window:AddTab("Main")

-- add elements
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
end):Add("Head"):Add("Torso"):Add("Root")

Main:AddColorPicker(function(color)
	print("color:", color)
end)

Library:FormatWindows()
```

---

## API Reference

See [docs/API.md](docs/API.md) for the full documentation.

---

## License

MIT
