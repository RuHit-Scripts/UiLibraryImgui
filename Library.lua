local ui_options = {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(400, 300),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
    mobile_toggle_button = true,
}

do
    local imgui = game:GetService("CoreGui"):FindFirstChild("imgui")
    if imgui then imgui:Destroy() end
end

local cloneref = cloneref and cloneref or function(...) return ... end
local CoreGui = cloneref(game:GetService("CoreGui"))
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer and LocalPlayer:GetMouse()

local imgui = Instance.new("ScreenGui")
local prefabs = Instance.new("Frame")
local label = Instance.new("TextLabel")
local window = Instance.new("ImageLabel")
local resizer = Instance.new("Frame")
local bar = Instance.new("Frame")
local toggle = Instance.new("ImageButton")
local base = Instance.new("ImageLabel")
local top = Instance.new("ImageLabel")
local tabs = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local tabSelection = Instance.new("ImageLabel")
local tabButtons = Instance.new("Frame")
local uiListLayout = Instance.new("UIListLayout")
local frame = Instance.new("Frame")
local tab = Instance.new("ScrollingFrame")
local uiListLayout2 = Instance.new("UIListLayout")
local textBox = Instance.new("TextBox")
local textBoxRoundify4px = Instance.new("ImageLabel")
local slider = Instance.new("ImageLabel")
local sliderTitle = Instance.new("TextLabel")
local indicator = Instance.new("ImageLabel")
local sliderValue = Instance.new("TextLabel")
local textLabel = Instance.new("TextLabel")
local textLabel2 = Instance.new("TextLabel")
local circle = Instance.new("ImageLabel")
local uiListLayout3 = Instance.new("UIListLayout")
local dropdown = Instance.new("TextButton")
local dropdownIndicator = Instance.new("ImageLabel")
local dropdownBox = Instance.new("ImageButton")
local dropdownObjects = Instance.new("ScrollingFrame")
local uiListLayout4 = Instance.new("UIListLayout")
local textButtonRoundify4px = Instance.new("ImageLabel")
local tabButton = Instance.new("TextButton")
local textButtonRoundify4px_2 = Instance.new("ImageLabel")
local folder = Instance.new("ImageLabel")
local button = Instance.new("TextButton")
local textButtonRoundify4px_3 = Instance.new("ImageLabel")
local toggle2 = Instance.new("ImageLabel")
local objects2 = Instance.new("Frame")
local uiListLayout5 = Instance.new("UIListLayout")
local horizontalAlignment = Instance.new("Frame")
local uiListLayout6 = Instance.new("UIListLayout")
local console = Instance.new("ImageLabel")
local scrollingFrame = Instance.new("ScrollingFrame")
local source = Instance.new("TextBox")
local commentsLabel = Instance.new("TextLabel")
local globalsLabel = Instance.new("TextLabel")
local keywordsLabel = Instance.new("TextLabel")
local remoteHighlight = Instance.new("TextLabel")
local stringsLabel = Instance.new("TextLabel")
local tokensLabel = Instance.new("TextLabel")
local numbersLabel = Instance.new("TextLabel")
local infoLabel = Instance.new("TextLabel")
local linesLabel = Instance.new("TextLabel")
local colorPicker = Instance.new("ImageLabel")
local palette = Instance.new("ImageLabel")
local indicator3 = Instance.new("ImageLabel")
local sample = Instance.new("ImageLabel")
local saturation = Instance.new("ImageLabel")
local indicator4 = Instance.new("Frame")
local switchButton = Instance.new("TextButton")
local textButtonRoundify4px_4 = Instance.new("ImageLabel")
local title3Label = Instance.new("TextLabel")
local button2 = Instance.new("TextButton")
local textButtonRoundify4px_5 = Instance.new("ImageLabel")
local dropdownButton = Instance.new("TextButton")
local keybind = Instance.new("ImageLabel")
local title4Label = Instance.new("TextLabel")
local inputButton = Instance.new("TextButton")
local inputRoundify4px = Instance.new("ImageLabel")
local windowsFrame = Instance.new("Frame")

imgui.Name = "imgui"
imgui.Parent = gethui and gethui() or (CoreGui or LocalPlayer:WaitForChild("PlayerGui"))
imgui.ResetOnSpawn = false

prefabs.Name = "Prefabs"
prefabs.Parent = imgui
prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
prefabs.Size = UDim2.new(0, 100, 0, 100)
prefabs.Visible = false

label.Name = "Label"
label.Parent = prefabs
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 20)
label.Font = Enum.Font.GothamSemibold
label.Text = "Hello, world 123"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left

window.Name = "Window"
window.Parent = prefabs
window.Active = true
window.BackgroundColor3 = Color3.new(1, 1, 1)
window.BackgroundTransparency = 1
window.ClipsDescendants = true
window.Position = UDim2.new(0, 20, 0, 20)
window.Selectable = true
window.Size = UDim2.new(0, 200, 0, 200)
window.Image = "rbxassetid://2851926732"
window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
window.ScaleType = Enum.ScaleType.Slice
window.SliceCenter = Rect.new(12, 12, 12, 12)

resizer.Name = "Resizer"
resizer.Parent = window
resizer.Active = true
resizer.BackgroundColor3 = Color3.new(1, 1, 1)
resizer.BackgroundTransparency = 1
resizer.BorderSizePixel = 0
resizer.Position = UDim2.new(1, -20, 1, -20)
resizer.Size = UDim2.new(0, 20, 0, 20)
resizer.ZIndex = 10

bar.Name = "Bar"
bar.Parent = window
bar.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(0, 0, 0, 5)
bar.Size = UDim2.new(1, 0, 0, 15)

toggle.Name = "Toggle"
toggle.Parent = bar
toggle.BackgroundColor3 = Color3.new(1, 1, 1)
toggle.BackgroundTransparency = 1
toggle.Position = UDim2.new(0, 5, 0, -2)
toggle.Rotation = 90
toggle.Size = UDim2.new(0, 20, 0, 20)
toggle.ZIndex = 2
toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

base.Name = "Base"
base.Parent = bar
base.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
base.BorderSizePixel = 0
base.Position = UDim2.new(0, 0, 0.8, 0)
base.Size = UDim2.new(1, 0, 0, 10)
base.Image = "rbxassetid://2851926732"
base.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
base.ScaleType = Enum.ScaleType.Slice
base.SliceCenter = Rect.new(12, 12, 12, 12)

top.Name = "Top"
top.Parent = bar
top.BackgroundColor3 = Color3.new(1, 1, 1)
top.BackgroundTransparency = 1
top.Position = UDim2.new(0, 0, 0, -5)
top.Size = UDim2.new(1, 0, 0, 10)
top.Image = "rbxassetid://2851926732"
top.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
top.ScaleType = Enum.ScaleType.Slice
top.SliceCenter = Rect.new(12, 12, 12, 12)

tabs.Name = "Tabs"
tabs.Parent = window
tabs.BackgroundColor3 = Color3.new(1, 1, 1)
tabs.BackgroundTransparency = 1
tabs.Position = UDim2.new(0, 15, 0, 60)
tabs.Size = UDim2.new(1, -30, 1, -60)

titleLabel.Name = "Title"
titleLabel.Parent = window
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 30, 0, 3)
titleLabel.Size = UDim2.new(0, 200, 0, 20)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "Gamer Time"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

tabSelection.Name = "TabSelection"
tabSelection.Parent = window
tabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
tabSelection.BackgroundTransparency = 1
tabSelection.Position = UDim2.new(0, 15, 0, 30)
tabSelection.Size = UDim2.new(1, -30, 0, 25)
tabSelection.Visible = false
tabSelection.Image = "rbxassetid://2851929490"
tabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
tabSelection.ScaleType = Enum.ScaleType.Slice
tabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

tabButtons.Name = "TabButtons"
tabButtons.Parent = tabSelection
tabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
tabButtons.BackgroundTransparency = 1
tabButtons.Size = UDim2.new(1, 0, 1, 0)

uiListLayout.Parent = tabButtons
uiListLayout.FillDirection = Enum.FillDirection.Horizontal
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)

frame.Parent = tabSelection
frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Size = UDim2.new(1, 0, 0, 2)

tab.Name = "Tab"
tab.Parent = prefabs
tab.BackgroundColor3 = Color3.new(1, 1, 1)
tab.BackgroundTransparency = 1
tab.BorderSizePixel = 0
tab.Size = UDim2.new(1, 0, 1, 0)
tab.Visible = false
tab.CanvasSize = UDim2.new(0, 0, 0, 0)
tab.AutomaticCanvasSize = Enum.AutomaticSize.None
tab.ScrollBarThickness = 4
tab.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
tab.ClipsDescendants = true

uiListLayout2.Parent = tab
uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout2.Padding = UDim.new(0, 5)

textBox.Parent = prefabs
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.BackgroundTransparency = 1
textBox.BorderSizePixel = 0
textBox.Size = UDim2.new(1, 0, 0, 20)
textBox.ZIndex = 2
textBox.Font = Enum.Font.GothamSemibold
textBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
textBox.PlaceholderText = "Input Text"
textBox.Text = ""
textBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
textBox.TextSize = 14

textBoxRoundify4px.Name = "TextBox_Roundify_4px"
textBoxRoundify4px.Parent = textBox
textBoxRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textBoxRoundify4px.BackgroundTransparency = 1
textBoxRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textBoxRoundify4px.Image = "rbxassetid://2851929490"
textBoxRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textBoxRoundify4px.ScaleType = Enum.ScaleType.Slice
textBoxRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

slider.Name = "Slider"
slider.Parent = prefabs
slider.BackgroundColor3 = Color3.new(1, 1, 1)
slider.BackgroundTransparency = 1
slider.Position = UDim2.new(0, 0, 0.178571433, 0)
slider.Size = UDim2.new(1, 0, 0, 20)
slider.Image = "rbxassetid://2851929490"
slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
slider.ScaleType = Enum.ScaleType.Slice
slider.SliceCenter = Rect.new(4, 4, 4, 4)

sliderTitle.Name = "Title"
sliderTitle.Parent = slider
sliderTitle.BackgroundColor3 = Color3.new(1, 1, 1)
sliderTitle.BackgroundTransparency = 1
sliderTitle.Position = UDim2.new(0.5, 0, 0.5, -10)
sliderTitle.Size = UDim2.new(0, 0, 0, 20)
sliderTitle.ZIndex = 2
sliderTitle.Font = Enum.Font.GothamBold
sliderTitle.Text = "Slider"
sliderTitle.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderTitle.TextSize = 14

indicator.Name = "Indicator"
indicator.Parent = slider
indicator.BackgroundColor3 = Color3.new(1, 1, 1)
indicator.BackgroundTransparency = 1
indicator.Size = UDim2.new(0, 0, 0, 20)
indicator.Image = "rbxassetid://2851929490"
indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
indicator.ScaleType = Enum.ScaleType.Slice
indicator.SliceCenter = Rect.new(4, 4, 4, 4)

sliderValue.Name = "Value"
sliderValue.Parent = slider
sliderValue.BackgroundColor3 = Color3.new(1, 1, 1)
sliderValue.BackgroundTransparency = 1
sliderValue.Position = UDim2.new(1, -55, 0.5, -10)
sliderValue.Size = UDim2.new(0, 50, 0, 20)
sliderValue.Font = Enum.Font.GothamBold
sliderValue.Text = "0%"
sliderValue.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderValue.TextSize = 14

textLabel.Parent = slider
textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(1, -20, -0.75, 0)
textLabel.Size = UDim2.new(0, 26, 0, 50)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "]"
textLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel.TextSize = 14

textLabel2.Parent = slider
textLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel2.BackgroundTransparency = 1
textLabel2.Position = UDim2.new(1, -65, -0.75, 0)
textLabel2.Size = UDim2.new(0, 26, 0, 50)
textLabel2.Font = Enum.Font.GothamBold
textLabel2.Text = "["
textLabel2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel2.TextSize = 14

circle.Name = "Circle"
circle.Parent = prefabs
circle.BackgroundColor3 = Color3.new(1, 1, 1)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://266543268"
circle.ImageTransparency = 0.5

uiListLayout3.Parent = prefabs
uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout3.Padding = UDim.new(0, 20)

dropdown.Name = "Dropdown"
dropdown.Parent = prefabs
dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown.BackgroundTransparency = 1
dropdown.BorderSizePixel = 0
dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
dropdown.Size = UDim2.new(1, 0, 0, 20)
dropdown.ZIndex = 2
dropdown.Font = Enum.Font.GothamBold
dropdown.Text = "      Dropdown"
dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdown.TextSize = 14
dropdown.TextXAlignment = Enum.TextXAlignment.Left

dropdownIndicator.Name = "Indicator"
dropdownIndicator.Parent = dropdown
dropdownIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownIndicator.BackgroundTransparency = 1
dropdownIndicator.Position = UDim2.new(0.899999976, -10, 0.1, 0)
dropdownIndicator.Rotation = -90
dropdownIndicator.Size = UDim2.new(0, 15, 0, 15)
dropdownIndicator.ZIndex = 2
dropdownIndicator.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4744658743"

dropdownBox.Name = "Box"
dropdownBox.Parent = dropdown
dropdownBox.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownBox.BackgroundTransparency = 1
dropdownBox.Position = UDim2.new(0, 0, 0, 25)
dropdownBox.Size = UDim2.new(1, 0, 0, 150)
dropdownBox.ZIndex = 3
dropdownBox.Image = "rbxassetid://2851929490"
dropdownBox.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownBox.ScaleType = Enum.ScaleType.Slice
dropdownBox.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownObjects.Name = "Objects"
dropdownObjects.Parent = dropdownBox
dropdownObjects.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownObjects.BackgroundTransparency = 1
dropdownObjects.BorderSizePixel = 0
dropdownObjects.Size = UDim2.new(1, 0, 1, 0)
dropdownObjects.ZIndex = 3
dropdownObjects.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdownObjects.ScrollBarThickness = 8

uiListLayout4.Parent = dropdownObjects
uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder

textButtonRoundify4px.Name = "TextButton_Roundify_4px"
textButtonRoundify4px.Parent = dropdown
textButtonRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px.BackgroundTransparency = 1
textButtonRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px.Image = "rbxassetid://2851929490"
textButtonRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

tabButton.Name = "TabButton"
tabButton.Parent = prefabs
tabButton.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
tabButton.BackgroundTransparency = 1
tabButton.BorderSizePixel = 0
tabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
tabButton.Size = UDim2.new(0, 71, 0, 20)
tabButton.ZIndex = 2
tabButton.Font = Enum.Font.GothamSemibold
tabButton.Text = "Test tab"
tabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
tabButton.TextSize = 14

textButtonRoundify4px_2.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_2.Parent = tabButton
textButtonRoundify4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_2.BackgroundTransparency = 1
textButtonRoundify4px_2.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_2.Image = "rbxassetid://2851929490"
textButtonRoundify4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px_2.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

folder.Name = "Folder"
folder.Parent = prefabs
folder.BackgroundColor3 = Color3.new(1, 1, 1)
folder.BackgroundTransparency = 1
folder.Position = UDim2.new(0, 0, 0, 50)
folder.Size = UDim2.new(1, 0, 0, 20)
folder.Image = "rbxassetid://2851929490"
folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
folder.ScaleType = Enum.ScaleType.Slice
folder.SliceCenter = Rect.new(4, 4, 4, 4)

button.Name = "Button"
button.Parent = folder
button.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
button.BackgroundTransparency = 1
button.BorderSizePixel = 0
button.Size = UDim2.new(1, 0, 0, 20)
button.ZIndex = 2
button.Font = Enum.Font.GothamSemibold
button.Text = "      Folder"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 14
button.TextXAlignment = Enum.TextXAlignment.Left

textButtonRoundify4px_3.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_3.Parent = button
textButtonRoundify4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_3.BackgroundTransparency = 1
textButtonRoundify4px_3.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_3.Image = "rbxassetid://2851929490"
textButtonRoundify4px_3.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_3.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

toggle2.Name = "Toggle"
toggle2.Parent = button
toggle2.BackgroundColor3 = Color3.new(1, 1, 1)
toggle2.BackgroundTransparency = 1
toggle2.Position = UDim2.new(0, 5, 0, 0)
toggle2.Size = UDim2.new(0, 20, 0, 20)
toggle2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

objects2.Name = "Objects"
objects2.Parent = folder
objects2.BackgroundColor3 = Color3.new(1, 1, 1)
objects2.BackgroundTransparency = 1
objects2.Position = UDim2.new(0, 10, 0, 25)
objects2.Size = UDim2.new(1, -10, 1, -25)
objects2.Visible = false

uiListLayout5.Parent = objects2
uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout5.Padding = UDim.new(0, 5)

horizontalAlignment.Name = "HorizontalAlignment"
horizontalAlignment.Parent = prefabs
horizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
horizontalAlignment.BackgroundTransparency = 1
horizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

uiListLayout6.Parent = horizontalAlignment
uiListLayout6.FillDirection = Enum.FillDirection.Horizontal
uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout6.Padding = UDim.new(0, 5)

console.Name = "Console"
console.Parent = prefabs
console.BackgroundColor3 = Color3.new(1, 1, 1)
console.BackgroundTransparency = 1
console.Size = UDim2.new(1, 0, 0, 200)
console.Image = "rbxassetid://2851928141"
console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
console.ScaleType = Enum.ScaleType.Slice
console.SliceCenter = Rect.new(8, 8, 8, 8)

scrollingFrame.Parent = console
scrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Size = UDim2.new(1, 0, 1, 1)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 4

source.Name = "Source"
source.Parent = scrollingFrame
source.BackgroundColor3 = Color3.new(1, 1, 1)
source.BackgroundTransparency = 1
source.Position = UDim2.new(0, 40, 0, 0)
source.Size = UDim2.new(1, -40, 0, 10000)
source.ZIndex = 3
source.ClearTextOnFocus = false
source.Font = Enum.Font.Code
source.MultiLine = true
source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
source.Text = ""
source.TextColor3 = Color3.new(1, 1, 1)
source.TextSize = 15
source.TextStrokeColor3 = Color3.new(1, 1, 1)
source.TextWrapped = true
source.TextXAlignment = Enum.TextXAlignment.Left
source.TextYAlignment = Enum.TextYAlignment.Top

commentsLabel.Name = "Comments"
commentsLabel.Parent = source
commentsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
commentsLabel.BackgroundTransparency = 1
commentsLabel.Size = UDim2.new(1, 0, 1, 0)
commentsLabel.ZIndex = 5
commentsLabel.Font = Enum.Font.Code
commentsLabel.Text = ""
commentsLabel.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
commentsLabel.TextSize = 15
commentsLabel.TextXAlignment = Enum.TextXAlignment.Left
commentsLabel.TextYAlignment = Enum.TextYAlignment.Top

globalsLabel.Name = "Globals"
globalsLabel.Parent = source
globalsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
globalsLabel.BackgroundTransparency = 1
globalsLabel.Size = UDim2.new(1, 0, 1, 0)
globalsLabel.ZIndex = 5
globalsLabel.Font = Enum.Font.Code
globalsLabel.Text = ""
globalsLabel.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
globalsLabel.TextSize = 15
globalsLabel.TextXAlignment = Enum.TextXAlignment.Left
globalsLabel.TextYAlignment = Enum.TextYAlignment.Top

keywordsLabel.Name = "Keywords"
keywordsLabel.Parent = source
keywordsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
keywordsLabel.BackgroundTransparency = 1
keywordsLabel.Size = UDim2.new(1, 0, 1, 0)
keywordsLabel.ZIndex = 5
keywordsLabel.Font = Enum.Font.Code
keywordsLabel.Text = ""
keywordsLabel.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
keywordsLabel.TextSize = 15
keywordsLabel.TextXAlignment = Enum.TextXAlignment.Left
keywordsLabel.TextYAlignment = Enum.TextYAlignment.Top

remoteHighlight.Name = "RemoteHighlight"
remoteHighlight.Parent = source
remoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
remoteHighlight.BackgroundTransparency = 1
remoteHighlight.Size = UDim2.new(1, 0, 1, 0)
remoteHighlight.ZIndex = 5
remoteHighlight.Font = Enum.Font.Code
remoteHighlight.Text = ""
remoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
remoteHighlight.TextSize = 15
remoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
remoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

stringsLabel.Name = "Strings"
stringsLabel.Parent = source
stringsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
stringsLabel.BackgroundTransparency = 1
stringsLabel.Size = UDim2.new(1, 0, 1, 0)
stringsLabel.ZIndex = 5
stringsLabel.Font = Enum.Font.Code
stringsLabel.Text = ""
stringsLabel.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
stringsLabel.TextSize = 15
stringsLabel.TextXAlignment = Enum.TextXAlignment.Left
stringsLabel.TextYAlignment = Enum.TextYAlignment.Top

tokensLabel.Name = "Tokens"
tokensLabel.Parent = source
tokensLabel.BackgroundColor3 = Color3.new(1, 1, 1)
tokensLabel.BackgroundTransparency = 1
tokensLabel.Size = UDim2.new(1, 0, 1, 0)
tokensLabel.ZIndex = 5
tokensLabel.Font = Enum.Font.Code
tokensLabel.Text = ""
tokensLabel.TextColor3 = Color3.new(1, 1, 1)
tokensLabel.TextSize = 15
tokensLabel.TextXAlignment = Enum.TextXAlignment.Left
tokensLabel.TextYAlignment = Enum.TextYAlignment.Top

numbersLabel.Name = "Numbers"
numbersLabel.Parent = source
numbersLabel.BackgroundColor3 = Color3.new(1, 1, 1)
numbersLabel.BackgroundTransparency = 1
numbersLabel.Size = UDim2.new(1, 0, 1, 0)
numbersLabel.ZIndex = 4
numbersLabel.Font = Enum.Font.Code
numbersLabel.Text = ""
numbersLabel.TextColor3 = Color3.new(1, 0.776471, 0)
numbersLabel.TextSize = 15
numbersLabel.TextXAlignment = Enum.TextXAlignment.Left
numbersLabel.TextYAlignment = Enum.TextYAlignment.Top

infoLabel.Name = "Info"
infoLabel.Parent = source
infoLabel.BackgroundColor3 = Color3.new(1, 1, 1)
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.ZIndex = 5
infoLabel.Font = Enum.Font.Code
infoLabel.Text = ""
infoLabel.TextColor3 = Color3.new(0, 0.635294, 1)
infoLabel.TextSize = 15
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top

linesLabel.Name = "Lines"
linesLabel.Parent = scrollingFrame
linesLabel.BackgroundColor3 = Color3.new(1, 1, 1)
linesLabel.BackgroundTransparency = 1
linesLabel.BorderSizePixel = 0
linesLabel.Size = UDim2.new(0, 40, 0, 10000)
linesLabel.ZIndex = 4
linesLabel.Font = Enum.Font.Code
linesLabel.Text = "1\n"
linesLabel.TextColor3 = Color3.new(1, 1, 1)
linesLabel.TextSize = 15
linesLabel.TextWrapped = true
linesLabel.TextYAlignment = Enum.TextYAlignment.Top

colorPicker.Name = "ColorPicker"
colorPicker.Parent = prefabs
colorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
colorPicker.BackgroundTransparency = 1
colorPicker.Size = UDim2.new(0, 180, 0, 110)
colorPicker.Image = "rbxassetid://2851929490"
colorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
colorPicker.ScaleType = Enum.ScaleType.Slice
colorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

palette.Name = "Palette"
palette.Parent = colorPicker
palette.BackgroundColor3 = Color3.new(1, 1, 1)
palette.BackgroundTransparency = 1
palette.Position = UDim2.new(0.05, 0, 0.05, 0)
palette.Size = UDim2.new(0, 100, 0, 100)
palette.Image = "rbxassetid://698052001"
palette.ScaleType = Enum.ScaleType.Slice
palette.SliceCenter = Rect.new(4, 4, 4, 4)

indicator3.Name = "Indicator"
indicator3.Parent = palette
indicator3.BackgroundColor3 = Color3.new(1, 1, 1)
indicator3.BackgroundTransparency = 1
indicator3.Size = UDim2.new(0, 5, 0, 5)
indicator3.ZIndex = 2
indicator3.Image = "rbxassetid://2851926732"
indicator3.ImageColor3 = Color3.new(0, 0, 0)
indicator3.ScaleType = Enum.ScaleType.Slice
indicator3.SliceCenter = Rect.new(12, 12, 12, 12)

sample.Name = "Sample"
sample.Parent = colorPicker
sample.BackgroundColor3 = Color3.new(1, 1, 1)
sample.BackgroundTransparency = 1
sample.Position = UDim2.new(0.8, 0, 0.05, 0)
sample.Size = UDim2.new(0, 25, 0, 25)
sample.Image = "rbxassetid://2851929490"
sample.ScaleType = Enum.ScaleType.Slice
sample.SliceCenter = Rect.new(4, 4, 4, 4)

saturation.Name = "Saturation"
saturation.Parent = colorPicker
saturation.BackgroundColor3 = Color3.new(1, 1, 1)
saturation.Position = UDim2.new(0.65, 0, 0.05, 0)
saturation.Size = UDim2.new(0, 15, 0, 100)
saturation.Image = "rbxassetid://3641079629"

indicator4.Name = "Indicator"
indicator4.Parent = saturation
indicator4.BackgroundColor3 = Color3.new(1, 1, 1)
indicator4.BorderSizePixel = 0
indicator4.Size = UDim2.new(0, 20, 0, 2)
indicator4.ZIndex = 2

switchButton.Name = "Switch"
switchButton.Parent = prefabs
switchButton.BackgroundColor3 = Color3.new(1, 1, 1)
switchButton.BackgroundTransparency = 1
switchButton.BorderSizePixel = 0
switchButton.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
switchButton.Size = UDim2.new(0, 20, 0, 20)
switchButton.ZIndex = 2
switchButton.Font = Enum.Font.SourceSans
switchButton.Text = ""
switchButton.TextColor3 = Color3.new(1, 1, 1)
switchButton.TextSize = 18

textButtonRoundify4px_4.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_4.Parent = switchButton
textButtonRoundify4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_4.BackgroundTransparency = 1
textButtonRoundify4px_4.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_4.Image = "rbxassetid://2851929490"
textButtonRoundify4px_4.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_4.ImageTransparency = 0.5
textButtonRoundify4px_4.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

title3Label.Name = "Title"
title3Label.Parent = switchButton
title3Label.BackgroundColor3 = Color3.new(1, 1, 1)
title3Label.BackgroundTransparency = 1
title3Label.Position = UDim2.new(1.2, 0, 0, 0)
title3Label.Size = UDim2.new(0, 20, 0, 20)
title3Label.Font = Enum.Font.GothamSemibold
title3Label.Text = "Switch"
title3Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title3Label.TextSize = 14
title3Label.TextXAlignment = Enum.TextXAlignment.Left

button2.Name = "Button"
button2.Parent = prefabs
button2.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
button2.BackgroundTransparency = 1
button2.BorderSizePixel = 0
button2.Size = UDim2.new(0, 91, 0, 20)
button2.ZIndex = 2
button2.Font = Enum.Font.GothamSemibold
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14

textButtonRoundify4px_5.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_5.Parent = button2
textButtonRoundify4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_5.BackgroundTransparency = 1
textButtonRoundify4px_5.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_5.Image = "rbxassetid://2851929490"
textButtonRoundify4px_5.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
textButtonRoundify4px_5.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownButton.Name = "DropdownButton"
dropdownButton.Parent = prefabs
dropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownButton.BorderSizePixel = 0
dropdownButton.Size = UDim2.new(1, 0, 0, 20)
dropdownButton.ZIndex = 3
dropdownButton.Font = Enum.Font.GothamBold
dropdownButton.Text = "      Button"
dropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdownButton.TextSize = 14
dropdownButton.TextXAlignment = Enum.TextXAlignment.Left

keybind.Name = "Keybind"
keybind.Parent = prefabs
keybind.BackgroundColor3 = Color3.new(1, 1, 1)
keybind.BackgroundTransparency = 1
keybind.Size = UDim2.new(0, 200, 0, 20)
keybind.Image = "rbxassetid://2851929490"
keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
keybind.ScaleType = Enum.ScaleType.Slice
keybind.SliceCenter = Rect.new(4, 4, 4, 4)

title4Label.Name = "Title"
title4Label.Parent = keybind
title4Label.BackgroundColor3 = Color3.new(1, 1, 1)
title4Label.BackgroundTransparency = 1
title4Label.Size = UDim2.new(0, 0, 1, 0)
title4Label.Font = Enum.Font.GothamBold
title4Label.Text = "Keybind"
title4Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title4Label.TextSize = 14
title4Label.TextXAlignment = Enum.TextXAlignment.Left

inputButton.Name = "Input"
inputButton.Parent = keybind
inputButton.BackgroundColor3 = Color3.new(1, 1, 1)
inputButton.BackgroundTransparency = 1
inputButton.BorderSizePixel = 0
inputButton.Position = UDim2.new(1, -85, 0, 2)
inputButton.Size = UDim2.new(0, 80, 1, -4)
inputButton.ZIndex = 2
inputButton.Font = Enum.Font.GothamSemibold
inputButton.Text = "RShift"
inputButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
inputButton.TextSize = 12
inputButton.TextWrapped = true

inputRoundify4px.Name = "Input_Roundify_4px"
inputRoundify4px.Parent = inputButton
inputRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
inputRoundify4px.BackgroundTransparency = 1
inputRoundify4px.Size = UDim2.new(1, 0, 1, 0)
inputRoundify4px.Image = "rbxassetid://2851929490"
inputRoundify4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
inputRoundify4px.ScaleType = Enum.ScaleType.Slice
inputRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

windowsFrame.Name = "Windows"
windowsFrame.Parent = imgui
windowsFrame.BackgroundColor3 = Color3.new(1, 1, 1)
windowsFrame.BackgroundTransparency = 1
windowsFrame.Position = UDim2.new(0, 20, 0, 20)
windowsFrame.Size = UDim2.new(1, -20, 1, -20)

if ui_options.mobile_toggle_button then
    local mobileButton = Instance.new("TextButton")
    mobileButton.Name = "MobileToggleUI"
    mobileButton.Parent = imgui
    mobileButton.BackgroundColor3 = ui_options.main_color
    mobileButton.Position = UDim2.new(0, 10, 0.15, 0)
    mobileButton.Size = UDim2.new(0, 42, 0, 42)
    mobileButton.Font = Enum.Font.GothamBold
    mobileButton.Text = "UI"
    mobileButton.TextColor3 = Color3.new(1, 1, 1)
    mobileButton.TextSize = 16
    mobileButton.ZIndex = 9999
    mobileButton.Active = true

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 21)
    uiCorner.Parent = mobileButton

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(255, 255, 255)
    uiStroke.Transparency = 0.3
    uiStroke.Parent = mobileButton

    local draggingMB, dragStartMB, startPosMB
    local hasMovedMB = false

    mobileButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingMB = true
            hasMovedMB = false
            dragStartMB = input.Position
            startPosMB = mobileButton.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if draggingMB and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStartMB
            if delta.Magnitude > 5 then
                hasMovedMB = true
            end
            mobileButton.Position = UDim2.new(
                startPosMB.X.Scale,
                startPosMB.X.Offset + delta.X,
                startPosMB.Y.Scale,
                startPosMB.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingMB = false
        end
    end)

    mobileButton.MouseButton1Click:Connect(function()
        if not hasMovedMB then
            windowsFrame.Visible = not windowsFrame.Visible
        end
    end)
end

local root = imgui

local checks = {
    ["binding"] = false,
}

UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == ((typeof(ui_options.toggle_key) == "EnumItem") and ui_options.toggle_key or Enum.KeyCode.RightShift) then
        if root and not checks.binding then
            windowsFrame.Visible = not windowsFrame.Visible
        end
    end
end)

local function Resize(part, new, _delay)
    _delay = _delay or 0.5
    local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(part, tweenInfo, new)
    tween:Play()
end

local function rgbtohsv(r, g, b)
    r, g, b = r / 255, g / 255, b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v = max, 0, max

    local d = max - min
    s = max == 0 and 0 or d / max

    if max == min then
        h = 0
    else
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return h, s, v
end

local function hasprop(object, prop)
    local a, b = pcall(function()
        return object[tostring(prop)]
    end)
    if a then return b end
end

local function gNameLen(obj)
    return obj.TextBounds.X + 15
end

local function getInputPosition(inputObject)
    if inputObject and inputObject.Position then
        return Vector2.new(inputObject.Position.X, inputObject.Position.Y)
    end
    return UIS:GetMouseLocation()
end

local function isPrimaryInput(input)
    return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local function ripple(button, x, y)
    task.spawn(function()
        button.ClipsDescendants = true

        local circle = prefabs:FindFirstChild("Circle"):Clone()
        circle.Parent = button
        circle.ZIndex = 1000

        local new_x = x - circle.AbsolutePosition.X
        local new_y = y - circle.AbsolutePosition.Y
        circle.Position = UDim2.new(0, new_x, 0, new_y)

        local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 1.5

        circle:TweenSizeAndPosition(
            UDim2.new(0, size, 0, size),
            UDim2.new(0.5, -size / 2, 0.5, -size / 2),
            "Out", "Quad", 0.5, false, nil
        )
        Resize(circle, {ImageTransparency = 1}, 0.5)

        task.wait(0.5)
        circle:Destroy()
    end)
end

local windows = 0
local library = {}

local function format_windows()
    local ull = prefabs:FindFirstChild("UIListLayout"):Clone()
    ull.Parent = windowsFrame
    local data = {}

    for i, v in pairs(windowsFrame:GetChildren()) do
        if not (v:IsA("UIListLayout")) then
            data[v] = v.AbsolutePosition
        end
    end

    ull:Destroy()

    for i, v in pairs(data) do
        i.Position = UDim2.new(0, v.X, 0, v.Y)
    end
end

function library:FormatWindows()
    format_windows()
end

function library:AddWindow(title, options)
    windows = windows + 1
    local dropdown_open = false
    title = tostring(title or "New Window")
    options = (typeof(options) == "table") and options or ui_options
    options.tween_time = 0.1

    local Window = prefabs:FindFirstChild("Window"):Clone()
    Window.Parent = windowsFrame
    Window:FindFirstChild("Title").Text = title
    Window.Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)
    Window.ZIndex = Window.ZIndex + (windows * 10)

    do
        local Bar = Window:FindFirstChild("Bar")
        local Base = Bar:FindFirstChild("Base")
        local Top = Bar:FindFirstChild("Top")
        local SplitFrame = Window:FindFirstChild("TabSelection"):FindFirstChild("Frame")

        task.spawn(function()
            while Window and Window.Parent do
                Bar.BackgroundColor3 = options.main_color
                Base.BackgroundColor3 = options.main_color
                Base.ImageColor3 = options.main_color
                Top.ImageColor3 = options.main_color
                SplitFrame.BackgroundColor3 = options.main_color
                RS.Heartbeat:Wait()
            end
        end)
    end

    local Bar = Window:WaitForChild("Bar")
    local Resizer = Window:WaitForChild("Resizer")
    local window_data = {}

    do
        local dragging = false
        local dragStart, startPos, dragInput

        Bar.InputBegan:Connect(function(input)
            if isPrimaryInput(input) then
                dragging = true
                dragStart = input.Position
                startPos = Window.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        Bar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                Window.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end

    do
        local resizing = false
        local resizeInput

        Resizer.InputBegan:Connect(function(input)
            if isPrimaryInput(input) and options.can_resize then
                resizing = true
                resizeInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local pos = getInputPosition(input)
                local x = pos.X - Window.AbsolutePosition.X
                local y = pos.Y - Window.AbsolutePosition.Y

                local newX = math.max(x, options.min_size.X)
                local newY = math.max(y, options.min_size.Y)

                Resize(Window, {Size = UDim2.new(0, newX, 0, newY)}, options.tween_time)
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if isPrimaryInput(input) then
                resizing = false
            end
        end)
    end

    do
        local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
        local open = true
        local canopen = true

        local oldwindowdata = {}
        local oldy = Window.AbsoluteSize.Y

        open_close.MouseButton1Click:Connect(function()
            if canopen then
                canopen = false

                if open then
                    oldwindowdata = {}
                    for i, v in pairs(Window:FindFirstChild("Tabs"):GetChildren()) do
                        oldwindowdata[v] = v.Visible
                        v.Visible = false
                    end

                    Resizer.Active = false
                    oldy = Window.AbsoluteSize.Y
                    Resize(open_close, {Rotation = 0}, options.tween_time)
                    Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, 26)}, options.tween_time)
                    open_close.Parent:FindFirstChild("Base").Transparency = 1
                else
                    for i, v in pairs(oldwindowdata) do
                        i.Visible = v
                    end

                    Resizer.Active = true
                    Resize(open_close, {Rotation = 90}, options.tween_time)
                    Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, oldy)}, options.tween_time)
                    open_close.Parent:FindFirstChild("Base").Transparency = 0
                end

                open = not open
                task.wait(options.tween_time)
                canopen = true
            end
        end)
    end

    do
        local tabs = Window:FindFirstChild("Tabs")
        local tab_selection = Window:FindFirstChild("TabSelection")
        local tab_buttons = tab_selection:FindFirstChild("TabButtons")

        function window_data:AddTab(tab_name)
            local tab_data = {}
            tab_name = tostring(tab_name or "New Tab")
            tab_selection.Visible = true

            local new_button = prefabs:FindFirstChild("TabButton"):Clone()
            new_button.Parent = tab_buttons
            new_button.Text = tab_name
            new_button.Size = UDim2.new(0, gNameLen(new_button), 0, 20)
            new_button.ZIndex = new_button.ZIndex + (windows * 10)
            new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

            local new_tab = prefabs:FindFirstChild("Tab"):Clone()
            new_tab.Parent = tabs
            new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

            local layout = new_tab:FindFirstChildOfClass("UIListLayout")
            if layout then
                local function updateCanvas()
                    new_tab.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 25)
                end
                layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
                new_tab.ChildAdded:Connect(function() task.defer(updateCanvas) end)
                new_tab.ChildRemoved:Connect(function() task.defer(updateCanvas) end)
                task.defer(updateCanvas)
            end

            local function show()
                if dropdown_open then return end
                for i, v in pairs(tab_buttons:GetChildren()) do
                    if not (v:IsA("UIListLayout")) then
                        v:GetChildren()[1].ImageColor3 = Color3.fromRGB(52, 53, 56)
                        Resize(v, {Size = UDim2.new(0, v.AbsoluteSize.X, 0, 20)}, options.tween_time)
                    end
                end
                for i, v in pairs(tabs:GetChildren()) do
                    v.Visible = false
                end

                Resize(new_button, {Size = UDim2.new(0, new_button.AbsoluteSize.X, 0, 25)}, options.tween_time)
                new_button:GetChildren()[1].ImageColor3 = Color3.fromRGB(73, 75, 79)
                new_tab.Visible = true
            end

            new_button.MouseButton1Click:Connect(function()
                show()
            end)

            function tab_data:Show()
                show()
            end

            do
                function tab_data:AddLabel(label_text)
                    label_text = tostring(label_text or "New Label")

                    local label = prefabs:FindFirstChild("Label"):Clone()
                    label.Parent = new_tab
                    label.Text = label_text
                    label.Size = UDim2.new(0, gNameLen(label), 0, 20)
                    label.ZIndex = label.ZIndex + (windows * 10)

                    return label
                end

                function tab_data:AddButton(button_text, callback)
                    button_text = tostring(button_text or "New Button")
                    callback = typeof(callback) == "function" and callback or function() end

                    local button = prefabs:FindFirstChild("Button"):Clone()
                    button.Parent = new_tab
                    button.Text = button_text
                    button.Size = UDim2.new(0, gNameLen(button), 0, 20)
                    button.ZIndex = button.ZIndex + (windows * 10)
                    button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

                    task.spawn(function()
                        while button and button.Parent do
                            if button:GetChildren()[1] then
                                button:GetChildren()[1].ImageColor3 = options.main_color
                            end
                            RS.Heartbeat:Wait()
                        end
                    end)

                    button.InputBegan:Connect(function(input)
                        if isPrimaryInput(input) then
                            local pos = getInputPosition(input)
                            ripple(button, pos.X, pos.Y)
                            pcall(callback)
                        end
                    end)

                    return button
                end

                function tab_data:AddSwitch(switch_text, callback)
                    local switch_data = {}
                    switch_text = tostring(switch_text or "New Switch")
                    callback = typeof(callback) == "function" and callback or function() end

                    local switch = prefabs:FindFirstChild("Switch"):Clone()
                    switch.Parent = new_tab
                    switch:FindFirstChild("Title").Text = switch_text

                    switch:FindFirstChild("Title").ZIndex = switch:FindFirstChild("Title").ZIndex + (windows * 10)
                    switch.ZIndex = switch.ZIndex + (windows * 10)
                    switch:GetChildren()[1].ZIndex = switch:GetChildren()[1].ZIndex + (windows * 10)

                    task.spawn(function()
                        while switch and switch.Parent do
                            if switch:GetChildren()[1] then
                                switch:GetChildren()[1].ImageColor3 = options.main_color
                            end
                            RS.Heartbeat:Wait()
                        end
                    end)

                    local toggled = false
                    switch.InputBegan:Connect(function(input)
                        if isPrimaryInput(input) then
                            toggled = not toggled
                            switch.Text = toggled and utf8.char(10003) or ""
                            pcall(callback, toggled)
                        end
                    end)

                    function switch_data:Set(bool)
                        toggled = (typeof(bool) == "boolean") and bool or false
                        switch.Text = toggled and utf8.char(10003) or ""
                        pcall(callback, toggled)
                    end

                    return switch_data, switch
                end

                function tab_data:AddTextBox(textbox_text, callback, textbox_options)
                    textbox_text = tostring(textbox_text or "New TextBox")
                    callback = typeof(callback) == "function" and callback or function() end
                    textbox_options = typeof(textbox_options) == "table" and textbox_options or { ["clear"] = true }

                    local textbox = prefabs:FindFirstChild("TextBox"):Clone()
                    textbox.Parent = new_tab
                    textbox.PlaceholderText = textbox_text
                    textbox.ZIndex = textbox.ZIndex + (windows * 10)
                    textbox:GetChildren()[1].ZIndex = textbox:GetChildren()[1].ZIndex + (windows * 10)

                    textbox.FocusLost:Connect(function(ep)
                        if ep then
                            if #textbox.Text > 0 then
                                pcall(callback, textbox.Text)
                                if textbox_options.clear then
                                    textbox.Text = ""
                                end
                            end
                        end
                    end)

                    return textbox
                end

                function tab_data:AddSlider(slider_text, callback, slider_options)
                    local slider_data = {}

                    slider_text = tostring(slider_text or "New Slider")
                    callback = typeof(callback) == "function" and callback or function() end
                    slider_options = typeof(slider_options) == "table" and slider_options or {}
                    slider_options = {
                        ["min"] = slider_options.min or 0,
                        ["max"] = slider_options.max or 100,
                        ["readonly"] = slider_options.readonly or false,
                    }

                    local slider = prefabs:FindFirstChild("Slider"):Clone()
                    slider.Parent = new_tab
                    slider.ZIndex = slider.ZIndex + (windows * 10)

                    local title = slider:FindFirstChild("Title")
                    local indicator = slider:FindFirstChild("Indicator")
                    local value = slider:FindFirstChild("Value")
                    title.ZIndex = title.ZIndex + (windows * 10)
                    indicator.ZIndex = indicator.ZIndex + (windows * 10)
                    value.ZIndex = value.ZIndex + (windows * 10)

                    title.Text = slider_text

                    local isDragging = false

                    local function updateSlider(input)
                        local pos = getInputPosition(input)
                        local x = (pos.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X
                        x = math.clamp(x, 0, 1)

                        Resize(indicator, { Size = UDim2.new(x, 0, 0, 20) }, options.tween_time)

                        local maxv = slider_options.max
                        local minv = slider_options.min
                        local sel_value = math.floor(((maxv - minv) * x) + minv)

                        value.Text = tostring(sel_value)
                        pcall(callback, sel_value)
                    end

                    slider.InputBegan:Connect(function(input)
                        if isPrimaryInput(input) and not slider_options.readonly and not dropdown_open then
                            isDragging = true
                            updateSlider(input)
                        end
                    end)

                    UIS.InputChanged:Connect(function(input)
                        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateSlider(input)
                        end
                    end)

                    UIS.InputEnded:Connect(function(input)
                        if isPrimaryInput(input) then
                            isDragging = false
                        end
                    end)

                    function slider_data:Set(new_value)
                        new_value = tonumber(new_value) or slider_options.min
                        local clamped = math.clamp(new_value, slider_options.min, slider_options.max)
                        local alpha = (clamped - slider_options.min) / (slider_options.max - slider_options.min)

                        Resize(indicator, { Size = UDim2.new(alpha, 0, 0, 20) }, options.tween_time)
                        value.Text = tostring(math.floor(clamped))
                        pcall(callback, math.floor(clamped))
                    end

                    slider_data:Set(slider_options["min"])

                    return slider_data, slider
                end

                function tab_data:AddKeybind(keybind_name, callback, keybind_options)
                    local keybind_data = {}

                    keybind_name = tostring(keybind_name or "New Keybind")
                    callback = typeof(callback) == "function" and callback or function() end
                    keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
                    keybind_options = {
                        ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
                    }

                    local keybind = prefabs:FindFirstChild("Keybind"):Clone()
                    local input = keybind:FindFirstChild("Input")
                    local title = keybind:FindFirstChild("Title")
                    keybind.ZIndex = keybind.ZIndex + (windows * 10)
                    input.ZIndex = input.ZIndex + (windows * 10)
                    input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
                    title.ZIndex = title.ZIndex + (windows * 10)

                    keybind.Parent = new_tab
                    title.Text = "  " .. keybind_name
                    keybind.Size = UDim2.new(0, gNameLen(title) + 80, 0, 20)

                    local shortkeys = {
                        RightControl = 'RightCtrl',
                        LeftControl = 'LeftCtrl',
                        LeftShift = 'LShift',
                        RightShift = 'RShift',
                        MouseButton1 = "Mouse1",
                        MouseButton2 = "Mouse2"
                    }

                    local currentKey = keybind_options.standard

                    function keybind_data:SetKeybind(Keybind)
                        local key = shortkeys[Keybind.Name] or Keybind.Name
                        input.Text = key
                        currentKey = Keybind
                    end

                    UIS.InputBegan:Connect(function(a, b)
                        if checks.binding then
                            task.spawn(function()
                                task.wait()
                                checks.binding = false
                            end)
                            return
                        end
                        if a.KeyCode == currentKey and not b then
                            pcall(callback, currentKey)
                        end
                    end)

                    keybind_data:SetKeybind(keybind_options.standard)

                    input.MouseButton1Click:Connect(function()
                        if checks.binding then return end
                        input.Text = "..."
                        checks.binding = true
                        local a, _ = UIS.InputBegan:Wait()
                        keybind_data:SetKeybind(a.KeyCode)
                    end)

                    return keybind_data, keybind
                end

                function tab_data:AddDropdown(dropdown_name, callback)
                    local dropdown_data = {}
                    dropdown_name = tostring(dropdown_name or "New Dropdown")
                    callback = typeof(callback) == "function" and callback or function() end

                    local dropdown = prefabs:FindFirstChild("Dropdown"):Clone()
                    local box = dropdown:FindFirstChild("Box")
                    local objects = box:FindFirstChild("Objects")
                    local indicator = dropdown:FindFirstChild("Indicator")

                    dropdown.ZIndex = dropdown.ZIndex + (windows * 10)
                    box.ZIndex = box.ZIndex + (windows * 10)
                    objects.ZIndex = objects.ZIndex + (windows * 10)
                    indicator.ZIndex = indicator.ZIndex + (windows * 10)
                    dropdown:GetChildren()[3].ZIndex = dropdown:GetChildren()[3].ZIndex + (windows * 10)

                    dropdown.Parent = new_tab
                    dropdown.Size = UDim2.new(1, 0, 0, 20)
                    dropdown.Text = "      " .. dropdown_name
                    box.Size = UDim2.new(1, 0, 0, 0)

                    local open = false

                    local function updateDropdownSize()
                        local childCount = #objects:GetChildren() - 1
                        local itemHeight = 20
                        local maxVisibleItems = 8
                        local totalHeight = childCount * itemHeight
                        local displayHeight = math.min(totalHeight, maxVisibleItems * itemHeight)

                        objects.CanvasSize = UDim2.new(0, 0, 0, totalHeight)

                        if open then
                            Resize(dropdown, { Size = UDim2.new(1, 0, 0, 25 + displayHeight) }, options.tween_time)
                            Resize(box, { Size = UDim2.new(1, 0, 0, displayHeight) }, options.tween_time)
                        end
                    end

                    dropdown.MouseButton1Click:Connect(function()
                        open = not open

                        local childCount = #objects:GetChildren() - 1
                        local itemHeight = 20
                        local maxVisibleItems = 8
                        local totalHeight = childCount * itemHeight
                        local displayHeight = math.min(totalHeight, maxVisibleItems * itemHeight)

                        objects.CanvasSize = UDim2.new(0, 0, 0, totalHeight)

                        if open then
                            if dropdown_open then return end
                            dropdown_open = true
                            Resize(dropdown, { Size = UDim2.new(1, 0, 0, 25 + displayHeight) }, options.tween_time)
                            Resize(box, { Size = UDim2.new(1, 0, 0, displayHeight) }, options.tween_time)
                            Resize(indicator, { Rotation = 90 }, options.tween_time)
                        else
                            dropdown_open = false
                            Resize(dropdown, { Size = UDim2.new(1, 0, 0, 20) }, options.tween_time)
                            Resize(box, { Size = UDim2.new(1, 0, 0, 0) }, options.tween_time)
                            Resize(indicator, { Rotation = -90 }, options.tween_time)
                        end
                    end)

                    function dropdown_data:Add(n)
                        local object_data = {}
                        n = tostring(n or "New Object")

                        local object = prefabs:FindFirstChild("DropdownButton"):Clone()
                        object.Parent = objects
                        object.Text = n
                        object.ZIndex = object.ZIndex + (windows * 10)

                        object.MouseEnter:Connect(function()
                            object.BackgroundColor3 = options.main_color
                        end)
                        object.MouseLeave:Connect(function()
                            object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
                        end)

                        if open then
                            updateDropdownSize()
                        end

                        object.MouseButton1Click:Connect(function()
                            if dropdown_open then
                                dropdown.Text = "      [ " .. n .. " ]"
                                dropdown_open = false
                                open = false
                                Resize(dropdown, { Size = UDim2.new(1, 0, 0, 20) }, options.tween_time)
                                Resize(box, { Size = UDim2.new(1, 0, 0, 0) }, options.tween_time)
                                Resize(indicator, { Rotation = -90 }, options.tween_time)
                                pcall(callback, n)
                            end
                        end)

                        function object_data:Remove()
                            object:Destroy()
                            if open then
                                updateDropdownSize()
                            end
                        end

                        return object, object_data
                    end

                    return dropdown_data, dropdown
                end

                function tab_data:AddColorPicker(callback)
                    local color_picker_data = {}
                    callback = typeof(callback) == "function" and callback or function() end

                    local color_picker = prefabs:FindFirstChild("ColorPicker"):Clone()
                    color_picker.Parent = new_tab
                    color_picker.ZIndex = color_picker.ZIndex + (windows * 10)

                    local palette = color_picker:FindFirstChild("Palette")
                    local sample = color_picker:FindFirstChild("Sample")
                    local saturation = color_picker:FindFirstChild("Saturation")

                    palette.ZIndex = palette.ZIndex + (windows * 10)
                    sample.ZIndex = sample.ZIndex + (windows * 10)
                    saturation.ZIndex = saturation.ZIndex + (windows * 10)

                    do
                        local h = 0
                        local s = 1
                        local v = 1

                        local function update()
                            local color = Color3.fromHSV(h, s, v)
                            sample.ImageColor3 = color
                            saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
                            pcall(callback, color)
                        end

                        update()

                        local palette_indicator = palette:FindFirstChild("Indicator")
                        local saturation_indicator = saturation:FindFirstChild("Indicator")
                        palette_indicator.ZIndex = palette_indicator.ZIndex + (windows * 10)
                        saturation_indicator.ZIndex = saturation_indicator.ZIndex + (windows * 10)

                        local draggingPalette = false
                        local draggingSat = false

                        palette.InputBegan:Connect(function(input)
                            if isPrimaryInput(input) and not dropdown_open then
                                draggingPalette = true
                                local pos = getInputPosition(input)
                                local x = math.clamp((pos.X - palette.AbsolutePosition.X) / palette.AbsoluteSize.X, 0, 1)
                                local y = math.clamp((pos.Y - palette.AbsolutePosition.Y) / palette.AbsoluteSize.Y, 0, 1)

                                h = x
                                s = 1 - y

                                Resize(palette_indicator, { Position = UDim2.new(0, x * palette.AbsoluteSize.X - 2, 0, y * palette.AbsoluteSize.Y - 2) }, options.tween_time)
                                update()
                            end
                        end)

                        saturation.InputBegan:Connect(function(input)
                            if isPrimaryInput(input) and not dropdown_open then
                                draggingSat = true
                                local pos = getInputPosition(input)
                                local y = math.clamp((pos.Y - saturation.AbsolutePosition.Y) / saturation.AbsoluteSize.Y, 0, 1)

                                v = 1 - y
                                Resize(saturation_indicator, { Position = UDim2.new(0, 0, 0, y * saturation.AbsoluteSize.Y) }, options.tween_time)
                                update()
                            end
                        end)

                        UIS.InputChanged:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                                local pos = getInputPosition(input)

                                if draggingPalette then
                                    local x = math.clamp((pos.X - palette.AbsolutePosition.X) / palette.AbsoluteSize.X, 0, 1)
                                    local y = math.clamp((pos.Y - palette.AbsolutePosition.Y) / palette.AbsoluteSize.Y, 0, 1)

                                    h = x
                                    s = 1 - y

                                    Resize(palette_indicator, { Position = UDim2.new(0, x * palette.AbsoluteSize.X - 2, 0, y * palette.AbsoluteSize.Y - 2) }, options.tween_time)
                                    update()
                                elseif draggingSat then
                                    local y = math.clamp((pos.Y - saturation.AbsolutePosition.Y) / saturation.AbsoluteSize.Y, 0, 1)

                                    v = 1 - y
                                    Resize(saturation_indicator, { Position = UDim2.new(0, 0, 0, y * saturation.AbsoluteSize.Y) }, options.tween_time)
                                    update()
                                end
                            end
                        end)

                        UIS.InputEnded:Connect(function(input)
                            if isPrimaryInput(input) then
                                draggingPalette = false
                                draggingSat = false
                            end
                        end)

                        function color_picker_data:Set(color)
                            color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
                            local h2, s2, v2 = rgbtohsv(color.R * 255, color.G * 255, color.B * 255)
                            h, s, v = h2, s2, v2
                            sample.ImageColor3 = color
                            saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
                            pcall(callback, color)
                        end
                    end

                    return color_picker_data, color_picker
                end

                function tab_data:AddConsole(console_options)
                    local console_data = {}
                    console_options = typeof(console_options) == "table" and console_options or { ["readonly"] = true, ["full"] = false }
                    console_options = {
                        ["y"] = tonumber(console_options.y) or 200,
                        ["source"] = console_options.source or "Logs",
                        ["readonly"] = ((console_options.readonly) == true),
                        ["full"] = ((console_options.full) == true),
                    }

                    local console = prefabs:FindFirstChild("Console"):Clone()
                    console.Parent = new_tab
                    console.ZIndex = console.ZIndex + (windows * 10)
                    console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

                    local sf = console:GetChildren()[1]
                    local Source = sf:FindFirstChild("Source")
                    local Lines = sf:FindFirstChild("Lines")
                    Source.ZIndex = Source.ZIndex + (windows * 10)
                    Lines.ZIndex = Lines.ZIndex + (windows * 10)

                    Source.TextEditable = not console_options.readonly

                    for i, v in pairs(Source:GetChildren()) do
                        v.ZIndex = v.ZIndex + (windows * 10) + 1
                    end

                    local lua_keywords = { "and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while" }
                    local global_env = { "getrawmetatable", "newcclosure", "islclosure", "setclipboard", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "Instance", "Vector2", "Vector3", "CFrame", "UDim2", "Enum", "error", "warn" }

                    local Highlight = function(str, keywords)
                        local K = {}
                        for _, v in pairs(keywords) do K[v] = true end
                        str = str:gsub(".", function(c) return (c:match("[%w]") and c or "\32") end)
                        str = str:gsub("%S+", function(c) return K[c] and c or (" "):rep(#c) end)
                        return str
                    end

                    local highlight_lua = function()
                        Source.Text = Source.Text:gsub("\13", ""):gsub("\t", "      ")
                        local s = Source.Text

                        if Source:FindFirstChild("Keywords") then Source.Keywords.Text = Highlight(s, lua_keywords) end
                        if Source:FindFirstChild("Globals") then Source.Globals.Text = Highlight(s, global_env) end

                        local lin = 1
                        s:gsub("\n", function() lin = lin + 1 end)

                        Lines.Text = ""
                        for i = 1, lin do Lines.Text = Lines.Text .. i .. "\n" end
                        sf.CanvasSize = UDim2.new(0, 0, lin * 0.15, 0)
                    end

                    if console_options.source == "Lua" then
                        highlight_lua()
                        Source.Changed:Connect(highlight_lua)
                    else
                        Lines.Visible = false
                    end

                    function console_data:Set(code) Source.Text = tostring(code) end
                    function console_data:Get() return Source.Text end
                    function console_data:Log(msg) Source.Text = Source.Text .. "[*] " .. tostring(msg) .. "\n" end

                    return console_data, console
                end

                function tab_data:AddHorizontalAlignment()
                    local ha_data = {}
                    local ha = prefabs:FindFirstChild("HorizontalAlignment"):Clone()
                    ha.Parent = new_tab

                    function ha_data:AddButton(...)
                        local ret = { tab_data:AddButton(...) }
                        local object = typeof(ret[1]) == "table" and ret[2] or ret[1]
                        object.Parent = ha
                        return unpack(ret)
                    end

                    return ha_data, ha
                end

                function tab_data:AddFolder(folder_name)
                    local folder_data = {}
                    folder_name = tostring(folder_name or "New Folder")

                    local folder = prefabs:FindFirstChild("Folder"):Clone()
                    local button = folder:FindFirstChild("Button")
                    local objects = folder:FindFirstChild("Objects")
                    local toggle = button:FindFirstChild("Toggle")

                    folder.ZIndex = folder.ZIndex + (windows * 10)
                    button.ZIndex = button.ZIndex + (windows * 10)
                    objects.ZIndex = objects.ZIndex + (windows * 10)
                    toggle.ZIndex = toggle.ZIndex + (windows * 10)
                    button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

                    folder.Parent = new_tab
                    button.Text = "      " .. folder_name

                    task.spawn(function()
                        while folder and folder.Parent do
                            if button and button:GetChildren()[1] then
                                button:GetChildren()[1].ImageColor3 = options.main_color
                            end
                            RS.Heartbeat:Wait()
                        end
                    end)

                    local function gFolderLen()
                        local n = 25
                        for _, v in pairs(objects:GetChildren()) do
                            if not (v:IsA("UIListLayout")) then
                                n = n + v.AbsoluteSize.Y + 5
                            end
                        end
                        return n
                    end

                    local open = false
                    button.InputBegan:Connect(function(input)
                        if isPrimaryInput(input) then
                            if open then
                                Resize(toggle, { Rotation = 0 }, options.tween_time)
                                objects.Visible = false
                            else
                                Resize(toggle, { Rotation = 90 }, options.tween_time)
                                objects.Visible = true
                            end
                            open = not open
                        end
                    end)

                    task.spawn(function()
                        while folder and folder.Parent do
                            Resize(folder, { Size = UDim2.new(1, 0, 0, (open and gFolderLen() or 20)) }, options.tween_time)
                            task.wait(0.1)
                        end
                    end)

                    for i, v in pairs(tab_data) do
                        folder_data[i] = function(...)
                            local ret = { v(...) }
                            local object = typeof(ret[1]) == "table" and ret[2] or ret[1]
                            object.Parent = objects
                            return unpack(ret)
                        end
                    end

                    return folder_data, folder
                end
            end

            return tab_data, new_tab
        end
    end

    do
        for _, v in pairs(Window:GetDescendants()) do
            if hasprop(v, "ZIndex") then
                v.ZIndex = v.ZIndex + (windows * 10)
            end
        end
    end

    return window_data, Window
end

function library:Unload()
    if imgui then pcall(function() imgui:Destroy() end) end
end

_G.IMGUI = library
shared.IMGUI = library

return library
