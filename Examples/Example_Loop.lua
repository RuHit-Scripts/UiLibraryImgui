-- UiLibraryStyleImgui — Loop Example (local)
-- Shows the UI with live-updating elements:
--  * FPS / tick counter label (updates every frame)
--  * auto-moving slider (loop drives Slider:Set)
--  * toggle + button that react to the loop
-- Loads the library from a local file first, then falls back to GitHub.

local function LoadLibrary()
	local tried = {
		"Library.lua",
		"./Library.lua",
		"../Library.lua",
	}
	for _, path in ipairs(tried) do
		local ok, res = pcall(function()
			if readfile and isfile and isfile(path) then
				return loadstring(readfile(path))()
			end
		end)
		if ok and res then return res end
	end
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()
end

local Library = LoadLibrary()
if not Library then
	warn("UiLibraryStyleImgui: could not load library")
	return
end

Library:SetTheme("Mint")

local Window, WindowObj = Library:AddWindow("Loop Example", {
	main_color = Color3.fromRGB(0, 180, 140),
	min_size = Vector2.new(200, 160),
	can_resize = true,
})

local Main = Window:AddTab("Main")

local FpsLabel = Main:AddLabel("fps: 0")
local TickLabel = Main:AddLabel("tick: 0")
local LoopLabel = Main:AddLabel("slider: 50")

local Slider
Slider = Main:AddSlider("Auto", function(v)
	LoopLabel.Text = "slider: " .. tostring(v)
end, { min = 0, max = 100 })
Slider:Set(50)

local EnableSwitch
EnableSwitch = Main:AddSwitch("Loop on", function(v)
	print("switch:", v)
end)
EnableSwitch:Set(true)

Main:AddButton("Reset slider", function()
	Slider:Set(50)
	LoopLabel.Text = "slider: 50"
end)

Library:FormatWindows()

-- ===== loop =====
local RunService = game:GetService("RunService")
local fpsTime, fpsCount = 0, 0
local dir = 1
local val = 50

RunService.RenderStepped:Connect(function(dt)
	fpsTime = fpsTime + dt
	fpsCount = fpsCount + 1
	if fpsTime >= 0.5 then
		FpsLabel.Text = "fps: " .. tostring(math.floor(fpsCount / fpsTime))
		fpsTime = 0
		fpsCount = 0
	end

	TickLabel.Text = "tick: " .. tostring(os.clock())

	-- auto-move the slider back and forth
	val = val + dir * dt * 40
	if val >= 100 then
		val = 100
		dir = -1
	elseif val <= 0 then
		val = 0
		dir = 1
	end
	Slider:Set(val)
end)
