local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
​local LocalPlayer = Players.LocalPlayer
​local Library = {
Elements = {},
Options = {},
Toggles = {},
Theme = {
MainColor = Color3.fromRGB(41, 74, 122),
HeaderColor = Color3.fromRGB(30, 30, 40),
BackgroundColor = Color3.fromRGB(20, 20, 25),
GroupColor = Color3.fromRGB(28, 28, 35),
TextColor = Color3.fromRGB(240, 240, 240),
SubTextColor = Color3.fromRGB(160, 160, 170),
AccentColor = Color3.fromRGB(50, 120, 220),
BorderColor = Color3.fromRGB(50, 50, 60),
DividerColor = Color3.fromRGB(45, 45, 55)
},
NotifySide = "Right",
DPIScale = 1,
Windows = {}
}
​-- Target Container Setup
local TargetGui = CoreGui
if not pcall(function() local _ = CoreGui.Name end) then
TargetGui = LocalPlayer:WaitForChild("PlayerGui")
end
​local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RuHit_UiLibrary_" .. tostring(math.random(100000, 999999))
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 100
ScreenGui.Parent = TargetGui
​local NotifyHolder = Instance.new("Frame")
NotifyHolder.Name = "NotifyHolder"
NotifyHolder.Size = UDim2.new(0, 280, 1, -20)
NotifyHolder.Position = UDim2.new(1, -290, 0, 10)
NotifyHolder.BackgroundTransparency = 1
NotifyHolder.Parent = ScreenGui
​local NotifyLayout = Instance.new("UIListLayout")
NotifyLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifyLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifyLayout.Padding = UDim.new(0, 6)
NotifyLayout.Parent = NotifyHolder
​-- Safe Element Registration Logic (Fixes infinite recursion)
local function RegisterElement(id, elementObj, isToggle)
if not id or type(id) ~= "string" or id == "" then return end
​Library.Elements[id] = elementObj
Library.Options[id] = elementObj
if isToggle then
Library.Toggles[id] = elementObj
end
​setmetatable(elementObj, {
__index = function(tbl, key)
if key == "Value" then
if rawget(tbl, "Get") then
return tbl:Get()
end
end
return rawget(tbl, key)
end,
__newindex = function(tbl, key, val)
if key == "Value" then
if rawget(tbl, "SetValue") then
tbl:SetValue(val)
elseif rawget(tbl, "Set") then
tbl:Set(val)
else
rawset(tbl, "Value", val)
end
else
rawset(tbl, key, val)
end
end
})
end
​-- Global Library API
function Library:GetElement(id)
return Library.Elements[id] or Library.Options[id] or Library.Toggles[id]
end
​function Library:SetNotifySide(side)
side = tostring(side):sub(1, 1):upper() .. tostring(side):sub(2):lower()
if side == "Left" then
Library.NotifySide = "Left"
NotifyHolder.Position = UDim2.new(0, 10, 0, 10)
else
Library.NotifySide = "Right"
NotifyHolder.Position = UDim2.new(1, -290, 0, 10)
end
end
​function Library:Notify(opts)
opts = type(opts) == "table" and opts or { Title = "Notification", Description = tostring(opts) }
local title = opts.Title or opts.title or "Notice"
local desc = opts.Description or opts.description or opts.Text or ""
local duration = opts.Time or opts.time or opts.Duration or 4
​local Card = Instance.new("Frame")
Card.Size = UDim2.new(1, 0, 0, 0)
Card.BackgroundColor3 = Library.Theme.HeaderColor
Card.BorderSizePixel = 0
Card.ClipsDescendants = true
Card.Parent = NotifyHolder
​local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = Card
​local Stroke = Instance.new("UIStroke")
Stroke.Color = Library.Theme.BorderColor
Stroke.Thickness = 1
Stroke.Parent = Card
​local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -16, 0, 20)
TitleLbl.Position = UDim2.new(0, 8, 0, 6)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Font = Enum.Font.SourceSansBold
TitleLbl.TextSize = 14
TitleLbl.TextColor3 = Library.Theme.AccentColor
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.Text = title
TitleLbl.Parent = Card
​local DescLbl = Instance.new("TextLabel")
DescLbl.Size = UDim2.new(1, -16, 0, 0)
DescLbl.Position = UDim2.new(0, 8, 0, 26)
DescLbl.BackgroundTransparency = 1
DescLbl.Font = Enum.Font.SourceSans
DescLbl.TextSize = 13
DescLbl.TextColor3 = Library.Theme.TextColor
DescLbl.TextXAlignment = Enum.TextXAlignment.Left
DescLbl.TextWrapped = true
DescLbl.Text = desc
DescLbl.Parent = Card
​local targetHeight = 32 + (desc ~= "" and 20 or 0)
TweenService:Create(Card, TweenInfo.new(0.25), { Size = UDim2.new(1, 0, 0, targetHeight) }):Play()
​task.delay(duration, function()
if Card and Card.Parent then
local tw = TweenService:Create(Card, TweenInfo.new(0.25), { Size = UDim2.new(1, 0, 0, 0) })
tw:Play()
tw.Completed:Connect(function()
Card:Destroy()
end)
end
end)
end
​function Library:SetDPIScale(scale)
scale = math.clamp(scale or 1, 0.5, 2)
Library.DPIScale = scale
for _, child in ipairs(ScreenGui:GetChildren()) do
if child:IsA("Frame") and child.Name ~= "NotifyHolder" then
child.UIScale.Scale = scale
end
end
end
​function Library:FormatWindows()
for _, win in ipairs(Library.Windows) do
if win and win.Frame then
win.Frame.Visible = true
end
end
end
​-- Window Construction
function Library:AddWindow(title, config)
config = config or {}
local mainColor = config.main_color or config.MainColor or Library.Theme.MainColor
local minSize = config.min_size or Vector2.new(380, 280)
​local WindowFrame = Instance.new("Frame")
WindowFrame.Name = "Window_" .. title
WindowFrame.Size = UDim2.new(0, minSize.X, 0, minSize.Y)
WindowFrame.Position = UDim2.new(0.5, -minSize.X / 2, 0.5, -minSize.Y / 2)
WindowFrame.BackgroundColor3 = Library.Theme.BackgroundColor
WindowFrame.BorderSizePixel = 0
WindowFrame.ClipsDescendants = true
WindowFrame.Parent = ScreenGui
​local UIScale = Instance.new("UIScale")
UIScale.Scale = Library.DPIScale
UIScale.Parent = WindowFrame
​local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 8)
WindowCorner.Parent = WindowFrame
​local WindowStroke = Instance.new("UIStroke")
WindowStroke.Color = Library.Theme.BorderColor
WindowStroke.Thickness = 1
WindowStroke.Parent = WindowFrame
​local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, 0, 0, 30)
HeaderFrame.BackgroundColor3 = mainColor
HeaderFrame.BorderSizePixel = 0
HeaderFrame.Parent = WindowFrame
​local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = HeaderFrame
​local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -12, 1, 0)
TitleLbl.Position = UDim2.new(0, 10, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Font = Enum.Font.SourceSansBold
TitleLbl.TextSize = 15
TitleLbl.TextColor3 = Library.Theme.TextColor
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.Text = title
TitleLbl.Parent = HeaderFrame
​-- Dragging Logic
local dragging, dragInput, dragStart, startPos
HeaderFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = WindowFrame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
​HeaderFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
​UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
WindowFrame.Position = UDim2.new(
startPos.X.Scale, startPos.X.Offset + delta.X,
startPos.Y.Scale, startPos.Y.Offset + delta.Y
)
end
end)
​-- Tab Bar
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -12, 0, 26)
TabBar.Position = UDim2.new(0, 6, 0, 34)
TabBar.BackgroundTransparency = 1
TabBar.Parent = WindowFrame
​local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 4)
TabLayout.Parent = TabBar
​-- Main Content Body
local ContentHolder = Instance.new("Frame")
ContentHolder.Size = UDim2.new(1, -12, 1, -68)
ContentHolder.Position = UDim2.new(0, 6, 0, 64)
ContentHolder.BackgroundTransparency = 1
ContentHolder.Parent = WindowFrame
​local Tabs = {}
local WindowObj = { Frame = WindowFrame }
local Window = WindowObj -- Fixed Window nil declaration issue
​table.insert(Library.Windows, WindowObj)
​function WindowObj:SetAlwaysOnTop(alwaysOnTop)
ScreenGui.DisplayOrder = alwaysOnTop and 999 or 100
end
​function WindowObj:SetCornerRadius(radius)
WindowCorner.CornerRadius = UDim.new(0, radius)
HeaderCorner.CornerRadius = UDim.new(0, radius)
end
​function Window:AddTab(tabName, icon)
local TabButton = Instance.new("TextButton")
TabButton.Size = UDim2.new(0, 80, 1, 0)
TabButton.BackgroundColor3 = Library.Theme.HeaderColor
TabButton.BorderSizePixel = 0
TabButton.Font = Enum.Font.SourceSansBold
TabButton.TextSize = 13
TabButton.TextColor3 = Library.Theme.SubTextColor
TabButton.Text = (icon and (icon .. " ") or "") .. tabName
TabButton.Parent = TabBar
​local TabBtnCorner = Instance.new("UICorner")
TabBtnCorner.CornerRadius = UDim.new(0, 4)
TabBtnCorner.Parent = TabButton
​local TabPage = Instance.new("Frame")
TabPage.Size = UDim2.new(1, 0, 1, 0)
TabPage.BackgroundTransparency = 1
TabPage.Visible = false
TabPage.Parent = ContentHolder
​local LeftColumn = Instance.new("ScrollingFrame")
LeftColumn.Size = UDim2.new(0.5, -3, 1, 0)
LeftColumn.BackgroundTransparency = 1
LeftColumn.BorderSizePixel = 0
LeftColumn.ScrollBarThickness = 2
LeftColumn.Parent = TabPage
​local RightColumn = Instance.new("ScrollingFrame")
RightColumn.Size = UDim2.new(0.5, -3, 1, 0)
RightColumn.Position = UDim2.new(0.5, 3, 0, 0)
RightColumn.BackgroundTransparency = 1
RightColumn.BorderSizePixel = 0
RightColumn.ScrollBarThickness = 2
RightColumn.Parent = TabPage
​local LeftLayout = Instance.new("UIListLayout")
LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
LeftLayout.Padding = UDim.new(0, 6)
LeftLayout.Parent = LeftColumn
​local RightLayout = Instance.new("UIListLayout")
RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
RightLayout.Padding = UDim.new(0, 6)
RightLayout.Parent = RightColumn
​LeftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
LeftColumn.CanvasSize = UDim2.new(0, 0, 0, LeftLayout.AbsoluteContentSize.Y + 10)
end)
​RightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
RightColumn.CanvasSize = UDim2.new(0, 0, 0, RightLayout.AbsoluteContentSize.Y + 10)
end)
​TabButton.MouseButton1Click:Connect(function()
for _, t in pairs(Tabs) do
t.Page.Visible = false
t.Button.TextColor3 = Library.Theme.SubTextColor
t.Button.BackgroundColor3 = Library.Theme.HeaderColor
end
TabPage.Visible = true
TabButton.TextColor3 = Library.Theme.TextColor
TabButton.BackgroundColor3 = Library.Theme.AccentColor
end)
​if #TabBar:GetChildren() == 2 then -- First added tab automatically activates
TabPage.Visible = true
TabButton.TextColor3 = Library.Theme.TextColor
TabButton.BackgroundColor3 = Library.Theme.AccentColor
end
​local TabObj = {}
​local function ResolveParent(side)
if side == "Right" or side == "right" then
return RightColumn
end
return LeftColumn
end
​-- Define BindElementMethods BEFORE AddGroupbox (Fixes nil call bug)
function TabObj:BindElementMethods(targetObj, container)
container = container or LeftColumn
​-- 1. AddLabel
function targetObj:AddLabel(text, id)
local LabelFrame = Instance.new("Frame")
LabelFrame.Size = UDim2.new(1, 0, 0, 22)
LabelFrame.BackgroundTransparency = 1
LabelFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, 0, 1, 0)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = tostring(text)
Lbl.Parent = LabelFrame
​local labelData = {
Text = tostring(text),
SetText = function(self, newText)
rawset(self, "Text", tostring(newText))
Lbl.Text = rawget(self, "Text")
end,
Get = function(self) return rawget(self, "Text") end,
Set = function(self, newText) self:SetText(newText) end,
SetValue = function(self, newText) self:SetText(newText) end
}
​if id then RegisterElement(id, labelData) end
return labelData
end
​-- 2. AddButton
function targetObj:AddButton(name, callback)
callback = callback or function() end
local BtnFrame = Instance.new("Frame")
BtnFrame.Size = UDim2.new(1, 0, 0, 28)
BtnFrame.BackgroundTransparency = 1
BtnFrame.Parent = container
​local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(1, 0, 1, 0)
Btn.BackgroundColor3 = Library.Theme.HeaderColor
Btn.BorderSizePixel = 0
Btn.Font = Enum.Font.SourceSansBold
Btn.TextSize = 14
Btn.TextColor3 = Library.Theme.TextColor
Btn.Text = name
Btn.Parent = BtnFrame
​local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 4)
Corner.Parent = Btn
​local Stroke = Instance.new("UIStroke")
Stroke.Color = Library.Theme.BorderColor
Stroke.Thickness = 1
Stroke.Parent = Btn
​Btn.MouseButton1Click:Connect(function()
pcall(callback)
end)
​local buttonData = {
SetText = function(_, newText) Btn.Text = tostring(newText) end
}
return buttonData
end
​-- 3. AddSwitch / AddToggle
function targetObj:AddSwitch(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local defaultVal = opts.Default or opts.default or false
​local SwitchFrame = Instance.new("Frame")
SwitchFrame.Size = UDim2.new(1, 0, 0, 24)
SwitchFrame.BackgroundTransparency = 1
SwitchFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, -40, 1, 0)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = SwitchFrame
​local ToggleBg = Instance.new("TextButton")
ToggleBg.Size = UDim2.new(0, 36, 0, 18)
ToggleBg.Position = UDim2.new(1, -36, 0.5, -9)
ToggleBg.BackgroundColor3 = defaultVal and Library.Theme.AccentColor or Library.Theme.HeaderColor
ToggleBg.Text = ""
ToggleBg.Parent = SwitchFrame
​local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBg
​local ToggleDot = Instance.new("Frame")
ToggleDot.Size = UDim2.new(0, 14, 0, 14)
ToggleDot.Position = defaultVal and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
ToggleDot.BackgroundColor3 = Library.Theme.TextColor
ToggleDot.BorderSizePixel = 0
ToggleDot.Parent = ToggleBg
​local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = ToggleDot
​local switchData = {
Value = defaultVal,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, val)
rawset(self, "Value", not not val)
local currentVal = rawget(self, "Value")
TweenService:Create(ToggleBg, TweenInfo.new(0.2), {
BackgroundColor3 = currentVal and Library.Theme.AccentColor or Library.Theme.HeaderColor
}):Play()
TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
Position = currentVal and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
}):Play()
pcall(callback, currentVal)
end,
SetValue = function(self, val) self:Set(val) end
}
​ToggleBg.MouseButton1Click:Connect(function()
switchData:Set(not rawget(switchData, "Value"))
end)
​if elementId then RegisterElement(elementId, switchData, true) end
return switchData
end
​targetObj.AddToggle = targetObj.AddSwitch
​-- 4. AddSlider
function targetObj:AddSlider(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local minVal = opts.Min or opts.min or 0
local maxVal = opts.Max or opts.max or 100
local roundDigits = opts.Rounding or opts.rounding or 0
local suffix = opts.Suffix or opts.suffix or ""
local defaultVal = math.clamp(opts.Default or opts.default or minVal, minVal, maxVal)
​local SliderFrame = Instance.new("Frame")
SliderFrame.Size = UDim2.new(1, 0, 0, 42)
SliderFrame.BackgroundTransparency = 1
SliderFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(0.6, 0, 0, 18)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = SliderFrame
​local ValLbl = Instance.new("TextLabel")
ValLbl.Size = UDim2.new(0.4, 0, 0, 18)
ValLbl.Position = UDim2.new(0.6, 0, 0, 0)
ValLbl.BackgroundTransparency = 1
ValLbl.Font = Enum.Font.SourceSansBold
ValLbl.TextSize = 13
ValLbl.TextColor3 = Library.Theme.SubTextColor
ValLbl.TextXAlignment = Enum.TextXAlignment.Right
ValLbl.Text = tostring(defaultVal) .. suffix
ValLbl.Parent = SliderFrame
​local Track = Instance.new("Frame")
Track.Size = UDim2.new(1, 0, 0, 8)
Track.Position = UDim2.new(0, 0, 0, 24)
Track.BackgroundColor3 = Library.Theme.HeaderColor
Track.BorderSizePixel = 0
Track.Parent = SliderFrame
​local TrackCorner = Instance.new("UICorner")
TrackCorner.CornerRadius = UDim.new(1, 0)
TrackCorner.Parent = Track
​local Fill = Instance.new("Frame")
Fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
Fill.BackgroundColor3 = Library.Theme.AccentColor
Fill.BorderSizePixel = 0
Fill.Parent = Track
​local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = Fill
​local sliderData = {
Value = defaultVal,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, val)
local clamped = math.clamp(tonumber(val) or minVal, minVal, maxVal)
if roundDigits > 0 then
local mult = 10 ^ roundDigits
clamped = math.round(clamped * mult) / mult
else
clamped = math.round(clamped)
end
rawset(self, "Value", clamped)
ValLbl.Text = tostring(clamped) .. suffix
Fill.Size = UDim2.new((clamped - minVal) / (maxVal - minVal), 0, 1, 0)
pcall(callback, clamped)
end,
SetValue = function(self, val) self:Set(val) end
}
​local isSliding = false
local function UpdateSlider(input)
local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
local val = minVal + ((maxVal - minVal) * pos)
sliderData:Set(val)
end
​Track.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
isSliding = true
UpdateSlider(input)
end
end)
​UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
isSliding = false
end
end)
​UserInputService.InputChanged:Connect(function(input)
if isSliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
UpdateSlider(input)
end
end)
​if elementId then RegisterElement(elementId, sliderData) end
return sliderData
end
​-- 5. AddInput / AddTextBox
function targetObj:AddInput(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local defaultVal = opts.Default or opts.default or ""
local placeholder = opts.Placeholder or opts.placeholder or "Type here..."
local clearText = opts.ClearTextOnFocus == true
​local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, 0, 0, 46)
InputFrame.BackgroundTransparency = 1
InputFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, 0, 0, 18)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = InputFrame
​local Box = Instance.new("TextBox")
Box.Size = UDim2.new(1, 0, 0, 24)
Box.Position = UDim2.new(0, 0, 0, 20)
Box.BackgroundColor3 = Library.Theme.HeaderColor
Box.BorderSizePixel = 0
Box.Font = Enum.Font.SourceSans
Box.TextSize = 13
Box.TextColor3 = Library.Theme.TextColor
Box.PlaceholderText = placeholder
Box.PlaceholderColor3 = Library.Theme.SubTextColor
Box.Text = defaultVal
Box.ClearTextOnFocus = clearText
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.Parent = InputFrame
​local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 4)
BoxCorner.Parent = Box
​local BoxPadding = Instance.new("UIPadding")
BoxPadding.PaddingLeft = UDim.new(0, 6)
BoxPadding.Parent = Box
​local inputData = {
Value = defaultVal,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, val)
rawset(self, "Value", tostring(val or ""))
Box.Text = rawget(self, "Value")
pcall(callback, rawget(self, "Value"))
end,
SetValue = function(self, val) self:Set(val) end
}
​Box.FocusLost:Connect(function()
inputData:Set(Box.Text)
end)
​if elementId then RegisterElement(elementId, inputData) end
return inputData
end
​targetObj.AddTextBox = targetObj.AddInput
​-- 6. AddDropdown (Single & Multi-Select)
function targetObj:AddDropdown(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local values = opts.Values or opts.values or {}
local isMulti = opts.Multi == true
local defaultVal = opts.Default or (isMulti and {} or values[1] or "")
​local DropFrame = Instance.new("Frame")
DropFrame.Size = UDim2.new(1, 0, 0, 46)
DropFrame.BackgroundTransparency = 1
DropFrame.ClipsDescendants = true
DropFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, 0, 0, 18)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = DropFrame
​local MainBtn = Instance.new("TextButton")
MainBtn.Size = UDim2.new(1, 0, 0, 24)
MainBtn.Position = UDim2.new(0, 0, 0, 20)
MainBtn.BackgroundColor3 = Library.Theme.HeaderColor
MainBtn.BorderSizePixel = 0
MainBtn.Font = Enum.Font.SourceSans
MainBtn.TextSize = 13
MainBtn.TextColor3 = Library.Theme.TextColor
MainBtn.TextXAlignment = Enum.TextXAlignment.Left
MainBtn.Text = " Select..."
MainBtn.Parent = DropFrame
​local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = MainBtn
​local ListHolder = Instance.new("Frame")
ListHolder.Size = UDim2.new(1, 0, 0, 0)
ListHolder.Position = UDim2.new(0, 0, 0, 48)
ListHolder.BackgroundColor3 = Library.Theme.HeaderColor
ListHolder.BorderSizePixel = 0
ListHolder.Parent = DropFrame
​local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 4)
ListCorner.Parent = ListHolder
​local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ListHolder
​local isOpen = false
local dropdownData = {
Value = isMulti and {} or "",
Values = values,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, option)
if isMulti then
local currentVal = rawget(self, "Value") or {}
if type(option) == "table" then
currentVal = option
else
currentVal[tostring(option)] = not currentVal[tostring(option)]
end
rawset(self, "Value", currentVal)
​local selectedKeys = {}
for k, v in pairs(currentVal) do
if v then table.insert(selectedKeys, k) end
end
MainBtn.Text = " " .. (#selectedKeys > 0 and table.concat(selectedKeys, ", ") or "None")
else
rawset(self, "Value", tostring(option))
MainBtn.Text = " " .. rawget(self, "Value")
end
pcall(callback, rawget(self, "Value"))
end,
SetValue = function(self, opt) self:Set(opt) end,
SetValues = function(self, newValues)
rawset(self, "Values", newValues or {})
for _, child in ipairs(ListHolder:GetChildren()) do
if child:IsA("TextButton") then child:Destroy() end
end
​for _, val in ipairs(rawget(self, "Values")) do
local OptBtn = Instance.new("TextButton")
OptBtn.Size = UDim2.new(1, 0, 0, 20)
OptBtn.BackgroundTransparency = 1
OptBtn.Font = Enum.Font.SourceSans
OptBtn.TextSize = 13
OptBtn.TextColor3 = Library.Theme.SubTextColor
OptBtn.TextXAlignment = Enum.TextXAlignment.Left
OptBtn.Text = " " .. tostring(val)
OptBtn.Parent = ListHolder
​OptBtn.MouseButton1Click:Connect(function()
self:Set(val)
if not isMulti then
isOpen = false
DropFrame.Size = UDim2.new(1, 0, 0, 46)
end
end)
end
end
}
​MainBtn.MouseButton1Click:Connect(function()
isOpen = not isOpen
if isOpen then
local count = #(rawget(dropdownData, "Values") or {})
ListHolder.Size = UDim2.new(1, 0, 0, count * 20)
DropFrame.Size = UDim2.new(1, 0, 0, 52 + count * 20)
else
DropFrame.Size = UDim2.new(1, 0, 0, 46)
end
end)
​dropdownData:SetValues(values)
dropdownData:Set(defaultVal)
​if elementId then RegisterElement(elementId, dropdownData) end
return dropdownData
end
​-- 7. AddDivider
function targetObj:AddDivider()
local DivFrame = Instance.new("Frame")
DivFrame.Size = UDim2.new(1, 0, 0, 6)
DivFrame.BackgroundTransparency = 1
DivFrame.Parent = container
​local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Position = UDim2.new(0, 0, 0.5, 0)
Line.BackgroundColor3 = Library.Theme.DividerColor
Line.BorderSizePixel = 0
Line.Parent = DivFrame
end
​-- 8. AddKeybind / AddKeyPicker (Fixed duplicated assignments)
function targetObj:AddKeybind(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local defaultKey = opts.Default or opts.default or Enum.KeyCode.E
if type(defaultKey) == "string" then
defaultKey = Enum.KeyCode[defaultKey] or Enum.KeyCode.E
end
​local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(1, 0, 0, 24)
KeyFrame.BackgroundTransparency = 1
KeyFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, -70, 1, 0)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = KeyFrame
​local KeyBtn = Instance.new("TextButton")
KeyBtn.Size = UDim2.new(0, 60, 0, 20)
KeyBtn.Position = UDim2.new(1, -60, 0.5, -10)
KeyBtn.BackgroundColor3 = Library.Theme.HeaderColor
KeyBtn.Font = Enum.Font.SourceSansBold
KeyBtn.TextSize = 12
KeyBtn.TextColor3 = Library.Theme.TextColor
KeyBtn.Text = defaultKey.Name
KeyBtn.Parent = KeyFrame
​local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = KeyBtn
​local binding = false
local keybindData = {
Value = defaultKey,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, key)
if type(key) == "string" then key = Enum.KeyCode[key] end
rawset(self, "Value", key)
KeyBtn.Text = key and key.Name or "None"
end,
SetValue = function(self, key) self:Set(key) end
}
​KeyBtn.MouseButton1Click:Connect(function()
binding = true
KeyBtn.Text = "..."
end)
​UserInputService.InputBegan:Connect(function(input, gpe)
if binding and input.UserInputType == Enum.UserInputType.Keyboard then
binding = false
keybindData:Set(input.KeyCode)
pcall(callback, input.KeyCode)
elseif not gpe and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == rawget(keybindData, "Value") then
pcall(callback, rawget(keybindData, "Value"))
end
end)
​if elementId then RegisterElement(elementId, keybindData) end
return keybindData
end
​targetObj.AddKeyPicker = targetObj.AddKeybind
​-- 9. AddColorPicker
function targetObj:AddColorPicker(name, callback, opts)
opts = opts or {}
callback = callback or function() end
local elementId = opts.id or opts.Id or name
local defaultColor = opts.Default or opts.default or Color3.fromRGB(255, 255, 255)
​local ColorFrame = Instance.new("Frame")
ColorFrame.Size = UDim2.new(1, 0, 0, 24)
ColorFrame.BackgroundTransparency = 1
ColorFrame.Parent = container
​local Lbl = Instance.new("TextLabel")
Lbl.Size = UDim2.new(1, -30, 1, 0)
Lbl.BackgroundTransparency = 1
Lbl.Font = Enum.Font.SourceSans
Lbl.TextSize = 14
Lbl.TextColor3 = Library.Theme.TextColor
Lbl.TextXAlignment = Enum.TextXAlignment.Left
Lbl.Text = name
Lbl.Parent = ColorFrame
​local ColorBox = Instance.new("Frame")
ColorBox.Size = UDim2.new(0, 20, 0, 20)
ColorBox.Position = UDim2.new(1, -20, 0.5, -10)
ColorBox.BackgroundColor3 = defaultColor
ColorBox.BorderSizePixel = 0
ColorBox.Parent = ColorFrame
​local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 4)
BoxCorner.Parent = ColorBox
​local colorData = {
Value = defaultColor,
Get = function(self) return rawget(self, "Value") end,
Set = function(self, col)
rawset(self, "Value", col)
ColorBox.BackgroundColor3 = col
pcall(callback, col)
end,
SetValue = function(self, col) self:Set(col) end
}
​if elementId then RegisterElement(elementId, colorData) end
return colorData
end
end
​-- Groupbox creation method
function TabObj:AddGroupbox(groupConfig)
groupConfig = type(groupConfig) == "string" and { Name = groupConfig } or (groupConfig or {})
local groupName = groupConfig.Name or groupConfig.Text or "Group"
local side = groupConfig.Side or "Left"
local targetParent = ResolveParent(side)
​local GroupFrame = Instance.new("Frame")
GroupFrame.Name = "Group_" .. groupName
GroupFrame.Size = UDim2.new(1, -6, 0, 40)
GroupFrame.BackgroundColor3 = Library.Theme.GroupColor
GroupFrame.BorderSizePixel = 0
GroupFrame.Parent = targetParent
​local GroupCorner = Instance.new("UICorner")
GroupCorner.CornerRadius = UDim.new(0, 5)
GroupCorner.Parent = GroupFrame
​local GroupStroke = Instance.new("UIStroke")
GroupStroke.Color = Library.Theme.BorderColor
GroupStroke.Thickness = 1
GroupStroke.Parent = GroupFrame
​local GroupHeader = Instance.new("TextLabel")
GroupHeader.Size = UDim2.new(1, -16, 0, 24)
GroupHeader.Position = UDim2.new(0, 8, 0, 4)
GroupHeader.BackgroundTransparency = 1
GroupHeader.Font = Enum.Font.SourceSansBold
GroupHeader.TextSize = 14
GroupHeader.TextColor3 = Library.Theme.AccentColor
GroupHeader.TextXAlignment = Enum.TextXAlignment.Left
GroupHeader.Text = groupName
GroupHeader.Parent = GroupFrame
​local GroupContainer = Instance.new("Frame")
GroupContainer.Name = "Container"
GroupContainer.Size = UDim2.new(1, -16, 0, 0)
GroupContainer.Position = UDim2.new(0, 8, 0, 30)
GroupContainer.BackgroundTransparency = 1
GroupContainer.Parent = GroupFrame
​local GroupLayout = Instance.new("UIListLayout")
GroupLayout.SortOrder = Enum.SortOrder.LayoutOrder
GroupLayout.Padding = UDim.new(0, 6)
GroupLayout.Parent = GroupContainer
​GroupLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
GroupContainer.Size = UDim2.new(1, -16, 0, GroupLayout.AbsoluteContentSize.Y)
GroupFrame.Size = UDim2.new(1, -6, 0, GroupLayout.AbsoluteContentSize.Y + 36)
end)
​local ContainerObj = {}
TabObj:BindElementMethods(ContainerObj, GroupContainer)
return ContainerObj
end
​TabObj:BindElementMethods(TabObj, LeftColumn)
Tabs[tabName] = { Button = TabButton, Page = TabPage, Object = TabObj }
return TabObj
end
​return Window, WindowObj
end
​return Library
