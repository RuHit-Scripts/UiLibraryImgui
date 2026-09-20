local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()

local Window, WindowObj = Library:AddWindow("Example", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(320, 240),
	can_resize = true,
})

local Main = Window:AddTab("Main")
local Combat = Window:AddTab("Combat")
local Misc = Window:AddTab("Misc")

Main:AddLabel("IMGUI UI library")
Main:AddLabel("mobile + desktop")

Main:AddButton("Click me", function()
	print("Button clicked!")
end)

Main:AddTextBox("Type...", function(text)
	print("Input:", text)
end, { clear = true })

local Switch
Switch = Main:AddSwitch("Enable feature", function(state)
	print("Switch:", state)
end)
Switch:Set(true)

local Slider
Slider = Main:AddSlider("Speed", function(value)
	print("Speed:", value)
end, { min = 0, max = 200 })
Slider:Set(100)

local Keybind
Keybind = Main:AddKeybind("Menu keybind", function()
	print("Keybind pressed!")
end, { standard = Enum.KeyCode.RightShift })

Combat:AddLabel("Combat settings")

local Color = Combat:AddColorPicker(function(color)
	print("Color:", color)
end)

local Dropdown = Combat:AddDropdown("Target", function(option)
	print("Dropdown:", option)
end)
Dropdown:Add("Head")
Dropdown:Add("Torso")
Dropdown:Add("HumanoidRootPart")

Misc:AddButton("Server hop", function()
	print("Server hop")
end)

Misc:AddButton("Unload UI", function()
	WindowObj:Destroy()
end)

Library:FormatWindows()
