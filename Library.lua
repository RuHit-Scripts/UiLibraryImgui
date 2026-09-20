-- STREAMING_CHUNK:Initializing Services and Core Library Structure...
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
​local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer and LocalPlayer:GetMouse()
​local Library = {
Options = {},
Toggles = {},
Elements = {},
Notifications = {},
NotifySide = "Right", -- "Left" or "Right"
DPIScale = 1,
Theme = {
MainColor = Color3.fromRGB(41, 74, 122),
BackgroundColor = Color3.fromRGB(24, 24, 28),
HeaderColor = Color3.fromRGB(32, 32, 38),
GroupColor = Color3.fromRGB(28, 28, 34),
TextColor = Color3.fromRGB(230, 230, 235),
SubTextColor = Color3.fromRGB(150, 150, 160),
BorderColor = Color3.fromRGB(50, 50, 60),
AccentColor = Color3.fromRGB(60, 115, 190),
ActiveColor = Color3.fromRGB(80, 140, 230),
DividerColor = Color3.fromRGB(45, 45, 55)
}
}
​-- STREAMING_CHUNK:Creating Screen Container and DPI Scaler...
local ParentContainer
pcall(function()
if gethui then
ParentContainer = gethui()
elseif syn and syn.protect_gui then
local sg = Instance.new("ScreenGui")
syn.protect_gui(sg)
sg.Parent = CoreGui
ParentContainer = sg
else
ParentContainer = CoreGui
end
end)
​if not ParentContainer then
ParentContainer = LocalPlayer:WaitForChild("PlayerGui")
end
​local GuiScreen = Instance.new("ScreenGui")
GuiScreen.Name = "RuHit_ImGui_Enhanced"
GuiScreen.ResetOnSpawn = false
GuiScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GuiScreen.Parent = ParentContainer
​local ToastContainer = Instance.new("Frame")
ToastContainer.Name = "ToastContainer"
ToastContainer.Size = UDim2.new(0, 300, 1, -20)
ToastContainer.Position = UDim2.new(1, -310, 0, 10)
ToastContainer.BackgroundTransparency = 1
ToastContainer.ZIndex = 999999
ToastContainer.Parent = GuiScreen
​local ToastListLayout = Instance.new("UIListLayout")
ToastListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ToastListLayout.Padding = UDim.new(0, 8)
ToastListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
ToastListLayout.Parent = ToastContainer
​-- STREAMING_CHUNK:Implementing Library Global Configuration Methods...
function Library:SetNotifySide(side)
side = string.lower(tostring(side))
if side == "left" then
Library.NotifySide = "Left"
ToastContainer.Position = UDim2.new(0, 10, 0, 10)
else
Library.NotifySide = "Right"
ToastContainer.Position = UDim2.new(1, -310, 0, 10)
end
end
​function Library:SetDPIScale(scale)
Library.DPIScale = math.clamp(tonumber(scale) or 1, 0.5, 2.5)
for , child in ipairs(GuiScreen:GetChildren()) do
if child:IsA("Frame") and child.Name:find("Window") then
local originalSize = child:GetAttribute("BaseSize") or child.Size
child.Size = UDim2.new(0, originalSize.X.Offset * Library.DPIScale, 0, originalSize.Y.Offset * Library.DPIScale)
end
end
end
​function Library:GetElement(id)
return Library.Elements[id] or Library.Options[id] or Library.Toggles[id]
end
​-- STREAMING_CHUNK:Implementing Element Registration and Proxy Wrapper...
local function RegisterElement(id, elementObj, isToggle)
if not id or type(id) ~= "string" or id == "" then return end
​Library.Elements[id] = elementObj
Library.Options[id] = elementObj
if isToggle then
Library.Toggles[id] = elementObj
end
​-- Support .Value reading and writing directly
setmetatable(elementObj, {
__index = function(tbl, key)
if key == "Value" then
return tbl:Get()
end
return rawget(tbl, key)
end,
__newindex = function(tbl, key, val)
if key == "Value" then
if tbl.SetValue then
tbl:SetValue(val)
elseif tbl.Set then
tbl:Set(val)
end
else
rawset(tbl, key, val)
end
end
})
end
​-- STREAMING_CHUNK:Implementing Notification System (Notify Toast)...
function Library:Notify(config)
config = config or {}
local title = config.Title or "Notification"
local description = config.Description or ""
local duration = config.Time or config.Duration or 4
​local Toast = Instance.new("Frame")
Toast.Size = UDim2.new(1, 0, 0, 60)
Toast.BackgroundColor3 = Library.Theme.HeaderColor
Toast.BorderSizePixel = 0
Toast.ClipsDescendants = true
Toast.Parent = ToastContainer
​local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = Toast
​local Stroke = Instance.new("UIStroke")
Stroke.Color = Library.Theme.AccentColor
Stroke.Thickness = 1
Stroke.Parent = Toast
​local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -20, 0, 22)
TitleLbl.Position = UDim2.new(0, 10, 0, 6)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Font = Enum.Font.SourceSansBold
TitleLbl.TextSize = 15
TitleLbl.TextColor3 = Library.Theme.TextColor
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.Text = title
TitleLbl.Parent = Toast
​local DescLbl = Instance.new("TextLabel")
DescLbl.Size = UDim2.new(1, -20, 0, 28)
DescLbl.Position = UDim2.new(0, 10, 0, 26)
DescLbl.BackgroundTransparency = 1
DescLbl.Font = Enum.Font.SourceSans
DescLbl.TextSize = 13
DescLbl.TextColor3 = Library.Theme.SubTextColor
DescLbl.TextXAlignment = Enum.TextXAlignment.Left
DescLbl.TextWrapped = true
DescLbl.Text = description
DescLbl.Parent = Toast
​local TimerBar = Instance.new("Frame")
TimerBar.Size = UDim2.new(1, 0, 0, 3)
TimerBar.Position = UDim2.new(0, 0, 1, -3)
TimerBar.BackgroundColor3 = Library.Theme.AccentColor
TimerBar.BorderSizePixel = 0
TimerBar.Parent = Toast
​Toast.Position = UDim2.new(Library.NotifySide == "Left" and -1 or 1, 0, 0, 0)
TweenService:Create(Toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
TweenService:Create(TimerBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 3)}):Play()
​task.delay(duration, function()
local closeTween = TweenService:Create(Toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Position = UDim2.new(Library.NotifySide == "Left" and -1 or 1, 0, 0, 0)
})
closeTween:Play()
closeTween.Completed:Connect(function()
Toast:Destroy()
end)
end)
end
​-- STREAMING_CHUNK:Implementing Window Creation Logic...
function Library:AddWindow(title, config)
config = config or {}
local mainColor = config.main_color or config.MainColor or Library.Theme.MainColor
local minSize = config.min_size or config.MinSize or Vector2.new(500, 380)
local canResize = config.can_resize ~= false
​Library.Theme.MainColor = mainColor
Library.Theme.AccentColor = mainColor
​local WindowFrame = Instance.new("Frame")
WindowFrame.Name = "Window_" .. title
WindowFrame.Size = UDim2.new(0, minSize.X, 0, minSize.Y)
WindowFrame.Position = UDim2.new(0.5, -minSize.X / 2, 0.5, -minSize.Y / 2)
WindowFrame.BackgroundColor3 = Library.Theme.BackgroundColor
WindowFrame.BorderSizePixel = 0
WindowFrame.ClipsDescendants = true
WindowFrame.Active = true
WindowFrame.Parent = GuiScreen
WindowFrame:SetAttribute("BaseSize", UDim2.new(0, minSize.X, 0, minSize.Y))
​local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 6)
WindowCorner.Parent = WindowFrame
​local WindowStroke = Instance.new("UIStroke")
WindowStroke.Color = Library.Theme.BorderColor
WindowStroke.Thickness = 1
WindowStroke.Parent = WindowFrame
​-- Top Bar / Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 32)
Header.BackgroundColor3 = Library.Theme.HeaderColor
Header.BorderSizePixel = 0
Header.Parent = WindowFrame
​local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 6)
HeaderCorner.Parent = Header
​local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Size = UDim2.new(1, -20, 1, 0)
HeaderTitle.Position = UDim2.new(0, 10, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Font = Enum.Font.SourceSansBold
HeaderTitle.TextSize = 15
HeaderTitle.TextColor3 = Library.Theme.TextColor
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Text = title
HeaderTitle.Parent = Header
​-- Window Dragging Logic
local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
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
​Header.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
​UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
WindowFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
​-- Navigation Bar (Tabs Header)
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -20, 0, 28)
TabBar.Position = UDim2.new(0, 10, 0, 38)
TabBar.BackgroundTransparency = 1
TabBar.Parent = WindowFrame
​local TabListLayout = Instance.new("UIListLayout")
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 6)
TabListLayout.Parent = TabBar
​-- Container for Tab Contents
local TabContentContainer = Instance.new("Frame")
TabContentContainer.Name = "TabContentContainer"
TabContentContainer.Size = UDim2.new(1, -20, 1, -76)
TabContentContainer.Position = UDim2.new(0, 10, 0, 70)
TabContentContainer.BackgroundTransparency = 1
TabContentContainer.Parent = WindowFrame
​local Tabs = {}
local ActiveTab = nil
​-- STREAMING_CHUNK:Implementing Window Object API Methods...
local WindowObj = {
Frame = WindowFrame,
Tabs = Tabs
}
​function WindowObj:SetAlwaysOnTop(alwaysOnTop)
GuiScreen.DisplayOrder = alwaysOnTop and 9999 or 1
end
​function WindowObj:SetCornerRadius(radius)
WindowCorner.CornerRadius = UDim.new(0, radius)
HeaderCorner.CornerRadius = UDim.new(0, radius)
end
​-- STREAMING_CHUNK:Implementing Tab Creation and Layout Engine...
function Window:AddTab(tabName, icon)
local TabButton = Instance.new("TextButton")
TabButton.Name = "Tab_" .. tabName
TabButton.Size = UDim2.new(0, 100, 1, 0)
TabButton.BackgroundColor3 = Library.Theme.GroupColor
TabButton.BorderSizePixel = 0
TabButton.Font = Enum.Font.SourceSansBold
TabButton.TextSize = 14
TabButton.TextColor3 = Library.Theme.SubTextColor
TabButton.Text = (icon and (icon .. " ") or "") .. tabName
TabButton.Parent = TabBar
​local TabBtnCorner = Instance.new("UICorner")
TabBtnCorner.CornerRadius = UDim.new(0, 4)
TabBtnCorner.Parent = TabButton
​-- Content frame for Tab (Columns: Left & Right)
local TabPage = Instance.new("Frame")
TabPage.Name = "TabPage_" .. tabName
TabPage.Size = UDim2.new(1, 0, 1, 0)
TabPage.BackgroundTransparency = 1
TabPage.Visible = false
TabPage.Parent = TabContentContainer
​local LeftColumn = Instance.new("ScrollingFrame")
LeftColumn.Name = "LeftColumn"
LeftColumn.Size = UDim2.new(0.49, 0, 1, 0)
LeftColumn.Position = UDim2.new(0, 0, 0, 0)
LeftColumn.BackgroundTransparency = 1
LeftColumn.BorderSizePixel = 0
LeftColumn.ScrollBarThickness = 3
LeftColumn.ScrollBarImageColor3 = Library.Theme.AccentColor
LeftColumn.CanvasSize = UDim2.new(0, 0, 0, 0)
LeftColumn.Parent = TabPage
​local RightColumn = Instance.new("ScrollingFrame")
RightColumn.Name = "RightColumn"
RightColumn.Size = UDim2.new(0.49, 0, 1, 0)
RightColumn.Position = UDim2.new(0.51, 0, 0, 0)
RightColumn.BackgroundTransparency = 1
RightColumn.BorderSizePixel = 0
RightColumn.ScrollBarThickness = 3
RightColumn.ScrollBarImageColor3 = Library.Theme.AccentColor
RightColumn.CanvasSize = UDim2.new(0, 0, 0, 0)
RightColumn.Parent = TabPage
​local function SetupColumnLayout(col)
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.Parent = col
​layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
col.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)
end
​SetupColumnLayout(LeftColumn)
SetupColumnLayout(RightColumn)
​local function ActivateTab()
for _, tabData in pairs(Tabs) do
tabData.Button.BackgroundColor3 = Library.Theme.GroupColor
tabData.Button.TextColor3 = Library.Theme.SubTextColor
tabData.Page.Visible = false
end
TabButton.BackgroundColor3 = Library.Theme.AccentColor
TabButton.TextColor3 = Library.Theme.TextColor
TabPage.Visible = true
ActiveTab = tabName
end
​TabButton.MouseButton1Click:Connect(ActivateTab)
​if not ActiveTab then
ActivateTab()
end
​-- STREAMING_CHUNK:Implementing Component Parent Engine (Groupbox / Direct Parent)...
local TabObj = {}
​local function ResolveParent(side)
if side == "Right" or side == "right" then
return RightColumn
end
return LeftColumn
end
​-- STREAMING_CHUNK:Implementing AddGroupbox and Container Methods...
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
​-- STREAMING_CHUNK:Implementing UI Elements Binding Logic...
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
self.Text = tostring(newText)
Lbl.Text = self.Text
end,
Get = function(self) return self.Text end,
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
Get = function(self) return self.Value end,
Set = function(self, val)
self.Value = not not val
TweenService:Create(ToggleBg, TweenInfo.new(0.2), {
BackgroundColor3 = self.Value and Library.Theme.AccentColor or Library.Theme.HeaderColor
}):Play()
TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
Position = self.Value and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
}):Play()
pcall(callback, self.Value)
end,
SetValue = function(self, val) self:Set(val) end
}
​ToggleBg.MouseButton1Click:Connect(function()
switchData:Set(not switchData.Value)
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
Get = function(self) return self.Value end,
Set = function(self, val)
local clamped = math.clamp(tonumber(val) or minVal, minVal, maxVal)
if roundDigits > 0 then
local mult = 10 ^ roundDigits
clamped = math.round(clamped * mult) / mult
else
clamped = math.round(clamped)
end
self.Value = clamped
ValLbl.Text = tostring(self.Value) .. suffix
Fill.Size = UDim2.new((self.Value - minVal) / (maxVal - minVal), 0, 1, 0)
pcall(callback, self.Value)
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
Get = function(self) return self.Value end,
Set = function(self, val)
self.Value = tostring(val or "")
Box.Text = self.Value
pcall(callback, self.Value)
end,
SetValue = function(self, val) self:Set(val) end
}
​Box.FocusLost:Connect(function()
inputData.Value = Box.Text
pcall(callback, inputData.Value)
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
Get = function(self) return self.Value end,
Set = function(self, option)
if isMulti then
if type(option) == "table" then
self.Value = option
else
self.Value[tostring(option)] = not self.Value[tostring(option)]
end
​local selectedKeys = {}
for k, v in pairs(self.Value) do
if v then table.insert(selectedKeys, k) end
end
MainBtn.Text = " " .. (#selectedKeys > 0 and table.concat(selectedKeys, ", ") or "None")
else
self.Value = tostring(option)
MainBtn.Text = " " .. self.Value
end
pcall(callback, self.Value)
end,
SetValue = function(self, opt) self:Set(opt) end,
SetValues = function(self, newValues)
self.Values = newValues or {}
for _, child in ipairs(ListHolder:GetChildren()) do
if child:IsA("TextButton") then child:Destroy() end
end
​for _, val in ipairs(self.Values) do
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
local count = #dropdownData.Values
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
​-- 8. AddKeybind / AddKeyPicker
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
BtnCorner.Parent = KeyBtn
BtnCorner.Parent = KeyBtn
BtnCorner.Parent = KeyBtn
BtnCorner.Parent = KeyBtn
BtnCorner.Parent = KeyBtn
BtnCorner.Parent = KeyBtn
​local binding = false
local keybindData = {
Value = defaultKey,
Get = function(self) return self.Value end,
Set = function(self, key)
if type(key) == "string" then key = Enum.KeyCode[key] end
self.Value = key
KeyBtn.Text = key.Name
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
elseif not gpe and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == keybindData.Value then
pcall(callback, keybindData.Value)
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
Get = function(self) return self.Value end,
Set = function(self, col)
self.Value = col
ColorBox.BackgroundColor3 = col
pcall(callback, col)
end,
SetValue = function(self, col) self:Set(col) end
}
​if elementId then RegisterElement(elementId, colorData) end
return colorData
end
end
​TabObj:BindElementMethods(TabObj, LeftColumn)
Tabs[tabName] = { Button = TabButton, Page = TabPage, Object = TabObj }
return TabObj
end
​return Window, WindowObj
end
​-- STREAMING_CHUNK:Implementing Format Windows Helper...
function Library:FormatWindows()
-- Legacy compatibility call
end
​return Library
