# UiLibraryStyleImgui

IMGUI-style Roblox UI library for mobile and desktop.

- Example: `Examples/Example.lua`
- Docs: [docs/API.md](docs/API.md)
- Library: `Library.lua`

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()

local Window, WindowObj = Library:AddWindow("My Script", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(320, 240),
	can_resize = true,
})

local Main = Window:AddTab("Main")
Main:AddButton("Click", function() print("clicked") end)
Library:FormatWindows()
```