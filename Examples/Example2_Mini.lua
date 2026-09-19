local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RuHit-Scripts/UiLibraryImgui/main/Library.lua"))()

Library:SetTheme("Ocean")

local Window, WindowObj = Library:AddWindow("Test Mini", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(180, 120),
	can_resize = false,
})

local Main = Window:AddTab("Main")

Main:AddButton("Sit", function()
	local p = game.Players.LocalPlayer
	local c = p.Character
	if c then
		local h = c:FindFirstChildOfClass("Humanoid")
		if h then h.Sit = true end
	end
end)

Main:AddSwitch("Speed", function(v)
	local p = game.Players.LocalPlayer
	local c = p.Character
	if c then
		local h = c:FindFirstChildOfClass("Humanoid")
		if h then
			if v then
				h.WalkSpeed = 50
			else
				h.WalkSpeed = 16
			end
		end
	end
end)

Main:AddSlider("WalkSpeed", function(v)
	local p = game.Players.LocalPlayer
	local c = p.Character
	if c then
		local h = c:FindFirstChildOfClass("Humanoid")
		if h then h.WalkSpeed = v end
	end
end, { min = 0, max = 100 })

Library:FormatWindows()
