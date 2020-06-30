local lib = {}

local UI = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local Container = Instance.new("Frame")
local ConTainerList_Align = Instance.new("UIListLayout")
local ConTainerList_Padding = Instance.new("UIPadding")
local SideBar = Instance.new("Frame")
local AlignMent_Spacer = Instance.new("UIListLayout")
local BottomGreenBar = Instance.new("Frame")
local TopGreenBar = Instance.new("Frame")

UI.Name = "BaconHub"
UI.Parent =	game.Players.LocalPlayer.PlayerGui
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TopBar.Name = "TopBar"
TopBar.Parent = UI
TopBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.290215582, 0, 0.257240206, 0)
TopBar.Size = UDim2.new(0, 506, 0, 22)

Container.Name = "Container"
Container.Parent = TopBar
Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0.265926689, 0, 0.95725596, 0)
Container.Size = UDim2.new(0, 371, 0, 253)

ConTainerList_Align.Name = "ConTainerList_Align"
ConTainerList_Align.Parent = Container
ConTainerList_Align.SortOrder = Enum.SortOrder.LayoutOrder

ConTainerList_Padding.Name = "ConTainerList_Padding"
ConTainerList_Padding.Parent = Container
ConTainerList_Padding.PaddingLeft = UDim.new(0, 6)
ConTainerList_Padding.PaddingTop = UDim.new(0, 6)

SideBar.Name = "SideBar"
SideBar.Parent = TopBar
SideBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SideBar.BorderSizePixel = 0
SideBar.Position = UDim2.new(-0.00087171112, 0, 0.95725596, 0)
SideBar.Size = UDim2.new(0, 135, 0, 253)

AlignMent_Spacer.Name = "AlignMent_Spacer"
AlignMent_Spacer.Parent = SideBar
AlignMent_Spacer.SortOrder = Enum.SortOrder.LayoutOrder
AlignMent_Spacer.Padding = UDim.new(0, 1)

BottomGreenBar.Name = "BottomGreenBar"
BottomGreenBar.Parent = TopBar
BottomGreenBar.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
BottomGreenBar.BorderSizePixel = 0
BottomGreenBar.Position = UDim2.new(0, 0, 12.454545, 0)
BottomGreenBar.Size = UDim2.new(0, 506, 0, 1)

TopGreenBar.Name = "TopGreenBar"
TopGreenBar.Parent = TopBar
TopGreenBar.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
TopGreenBar.BorderSizePixel = 0
TopGreenBar.Position = UDim2.new(-0.000871741271, 0, -0.0454545468, 0)
TopGreenBar.Size = UDim2.new(0, 506, 0, 1)

local function draggable(obj)
	local uis = game:GetService("UserInputService")
	local globals = {}
	globals.dragging=nil
	globals.uiorigin=nil
	globals.morigin=nil
	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			globals.dragging = true
			globals.uiorigin = obj.Position
			globals.morigin = input.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					globals.dragging = false
				end
			end)
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and globals.dragging then
			local change = input.Position - globals.morigin
			obj.Position = UDim2.new(globals.uiorigin.X.Scale,globals.uiorigin.X.Offset+change.X,globals.uiorigin.Y.Scale,globals.uiorigin.Y.Offset+change.Y)
		end
	end)
end
draggable(TopBar)

function lib:Resize(obj)
	obj.CanvasSize = UDim2.new(0, 0, 0, (#obj:GetChildren() - 0) * 160)
    obj.CanvasPosition = Vector2.new(0, 0)
end

function lib:NewTab(txt)
	local Example = Instance.new("Frame")
	local GreenSideBar = Instance.new("Frame")
	local TabBTN = Instance.new("TextButton")
	local ExampleTab = Instance.new("ScrollingFrame")
	local ExampleTab_Align = Instance.new("UIListLayout")
	Example.Name = tostring(txt)
	Example.Parent = SideBar
	Example.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Example.BorderSizePixel = 0
	Example.Position = UDim2.new(0.00326741533, 0, 0, 0)
	Example.Size = UDim2.new(0, 134, 0, 28)
	
	GreenSideBar.Name = "GreenSideBar"
	GreenSideBar.Parent = Example
	GreenSideBar.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	GreenSideBar.BorderSizePixel = 0
	GreenSideBar.Position = UDim2.new(0, 0, 0.142857149, 0)
	GreenSideBar.Size = UDim2.new(0, 5, 0, 19)
	
	TabBTN.Name = "TabBTN"
	TabBTN.Parent = Example
	TabBTN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabBTN.BackgroundTransparency = 1.000
	TabBTN.BorderSizePixel = 0
	TabBTN.Position = UDim2.new(0.0820895508, 0, 0.0714285746, 0)
	TabBTN.Size = UDim2.new(0, 104, 0, 23)
	TabBTN.Font = Enum.Font.Arial
	TabBTN.Text = tostring(txt)
	TabBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabBTN.TextSize = 18.000
	TabBTN.TextXAlignment = Enum.TextXAlignment.Left
	
	ExampleTab.Name = tostring(txt) .. "Tab"
	ExampleTab.Parent = Container
	ExampleTab.Active = true
	ExampleTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExampleTab.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ExampleTab.BorderSizePixel = 0
	ExampleTab.Position = UDim2.new(0.0161725059, 0, 0.0237154141, 0)
	ExampleTab.Size = UDim2.new(0, 190,0, 242)
	ExampleTab.Visible = false
	ExampleTab.ScrollBarThickness = 0
	ExampleTab.BackgroundTransparency = 1
	
	ExampleTab_Align.Name = tostring(txt) .. "Tab_Align"
	ExampleTab_Align.Parent = ExampleTab
	ExampleTab_Align.SortOrder = Enum.SortOrder.LayoutOrder
	ExampleTab_Align.Padding = UDim.new(0, 1)
	TabBTN.MouseButton1Click:Connect(function()
		if Container:FindFirstChild(tostring(txt) .. "Tab") then
			for i,v in pairs(Container:GetDescendants()) do
				if v:IsA("ScrollingFrame") then
					if v.Name == tostring(TabBTN.Text) .. "Tab" then
						v.Visible = true
					else
						v.Visible = false
					end
				end
			end
		end	
	end)
	lib:Resize(ExampleTab)
	return ExampleTab
end

function lib:NewCheck(pr, txt, callback)
	callback = callback or function() end
	local CheckBoxCon = Instance.new("Frame")
	local CheckBoxText = Instance.new("TextLabel")
	local CheckBoxBtn = Instance.new("TextButton")
	local RoundThing = Instance.new("ImageLabel")
	
	CheckBoxCon.Name = "CheckBoxCon" 
	CheckBoxCon.Parent = pr
	CheckBoxCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CheckBoxCon.BackgroundTransparency = 1.000
	CheckBoxCon.Size = UDim2.new(0, 190, 0, 30)
	
	CheckBoxText.Name = "CheckBoxText"
	CheckBoxText.Parent = CheckBoxCon
	CheckBoxText.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	CheckBoxText.BackgroundTransparency = 1.000
	CheckBoxText.BorderSizePixel = 0
	CheckBoxText.Position = UDim2.new(0, 0,0.033, 0)
	CheckBoxText.Size = UDim2.new(0, 136, 0, 30)
	CheckBoxText.Font = Enum.Font.SourceSansSemibold
	CheckBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
	CheckBoxText.TextSize = 18.000
	CheckBoxText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	CheckBoxText.TextWrapped = true
	CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left
	CheckBoxText.Text = tostring(txt)
	
	CheckBoxBtn.Name = "CheckBoxBtn"
	CheckBoxBtn.Parent = CheckBoxCon
	CheckBoxBtn.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	CheckBoxBtn.BackgroundTransparency = 1.000
	CheckBoxBtn.BorderSizePixel = 0
	CheckBoxBtn.Position = UDim2.new(0.826315761, 0, 0, 0)
	CheckBoxBtn.Size = UDim2.new(0, 33, 0, 30)
	CheckBoxBtn.Font = Enum.Font.SourceSans
	CheckBoxBtn.Text = ""
	CheckBoxBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	CheckBoxBtn.TextSize = 14.000
	
	RoundThing.Name = "RoundThing"
	RoundThing.Parent = CheckBoxBtn
	RoundThing.Active = true
	RoundThing.AnchorPoint = Vector2.new(0.5, 0.5)
	RoundThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RoundThing.BackgroundTransparency = 1.000
	RoundThing.Position = UDim2.new(0.469696969, 0, 0.550000012, 0)
	RoundThing.Selectable = true
	RoundThing.Size = UDim2.new(0.818181813, 0, 0.899999976, 0)
	RoundThing.Image = "rbxassetid://3570695787"
	RoundThing.ImageColor3 = Color3.fromRGB(168, 50, 50)
	RoundThing.ScaleType = Enum.ScaleType.Slice
	RoundThing.SliceCenter = Rect.new(100, 100, 100, 100)
	RoundThing.SliceScale = 0.060
	CheckBoxBtn.MouseButton1Click:Connect(function()
		if RoundThing.ImageColor3 == Color3.fromRGB(168, 50, 50) then
			RoundThing.ImageColor3 = Color3.fromRGB(85, 255, 127)
		else
			RoundThing.ImageColor3 = Color3.fromRGB(168, 50, 50)
		end
		callback()
	end)
	lib:Resize(pr)
end

function lib:NewButton(pr, txt, callback)
	callback = callback or function() end
	local ButtonLOL = Instance.new("ImageLabel")
	local BUTTONLOLBTN = Instance.new("TextButton")
	ButtonLOL.Name = tostring(txt)
	ButtonLOL.Parent = pr
	ButtonLOL.Active = true
	ButtonLOL.AnchorPoint = Vector2.new(0.5, 0.5)
	ButtonLOL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonLOL.BackgroundTransparency = 1.000
	ButtonLOL.Position = UDim2.new(0.5, 0, 0.5, 0)
	ButtonLOL.Selectable = true
	ButtonLOL.Size = UDim2.new(0.978999972, 0, 0.0529999994, 0)
	ButtonLOL.Image = "rbxassetid://3570695787"
	ButtonLOL.ImageColor3 = Color3.fromRGB(85, 255, 127)
	ButtonLOL.ScaleType = Enum.ScaleType.Slice
	ButtonLOL.SliceCenter = Rect.new(100, 100, 100, 100)
	ButtonLOL.SliceScale = 0.040
	
	BUTTONLOLBTN.Name = "BUTTONLOLBTN"
	BUTTONLOLBTN.Parent = ButtonLOL
	BUTTONLOLBTN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BUTTONLOLBTN.BackgroundTransparency = 1.000
	BUTTONLOLBTN.BorderSizePixel = 0
	BUTTONLOLBTN.Size = UDim2.new(0, 186, 0, 26)
	BUTTONLOLBTN.Font = Enum.Font.SourceSansSemibold
	BUTTONLOLBTN.TextColor3 = Color3.fromRGB(255,  	255, 255)
	BUTTONLOLBTN.TextSize = 21.000
	BUTTONLOLBTN.TextWrapped = true
	BUTTONLOLBTN.Text = tostring(txt)
	lib:Resize(pr)
	BUTTONLOLBTN.MouseButton1Click:Connect(callback)
	repeat wait()
		ButtonLOL.Size = UDim2.new(0, 186, 0, 26)
		BUTTONLOLBTN.Size = UDim2.new(0, 186, 0, 26)
	until false
end

return lib
