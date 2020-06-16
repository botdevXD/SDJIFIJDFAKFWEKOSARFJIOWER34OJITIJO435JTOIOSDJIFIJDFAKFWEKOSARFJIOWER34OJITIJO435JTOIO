
--[[
    This was created by 0x74#6141
    I made this for people who wondered how Script Dumpers are created, 
    all script dumpers work different this just checks through ReplicatedStorage and PlayerScripts currently.
    you can modify it to do more if you want,
    This is very basic, as the creator of this I won't be doing support as this is open source now that I've released it.
]]
local player = game:GetService("Players").LocalPlayer
local Rep = game:GetService("ReplicatedStorage");
local PlrScripts = player:FindFirstChild("PlayerScripts")
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local MainFolder = "DecompiledGames/"
local MainWithoutSlash = "DecompiledGames"

local FailedTable = {}
local CompletedTable = {}

local Decompiling = false

local TopBarMessage = Instance.new("Hint",game:GetService("Workspace"))

local TotalDecompiled = 0
local TotalAmountOfScripts = 0

local function CreateFolders(foldername)
    pcall(function()
        local GameFolder = makefolder(MainFolder .. foldername)
        local ReplicatedFolder = makefolder(MainFolder .. foldername .. "/ReplicatedStorage")
        local PlayerScriptsFolder = makefolder(MainFolder .. foldername .. "/PlayerScripts")
        
        local LocalScriptsFolderRep = makefolder(MainFolder .. foldername .. "/ReplicatedStorage/LocalScripts")
        local ModuleScriptsFolderRep = makefolder(MainFolder .. foldername .. "/ReplicatedStorage/Modules")

        local LocalScriptsFolderPlrScripts = makefolder(MainFolder .. foldername .. "/PlayerScripts/LocalScripts")
        local ModuleScriptsFolderPlrScripts = makefolder(MainFolder .. foldername .. "/PlayerScripts/Modules")
    end)
end

local function removeCharacters(str)
    return str:gsub("/", "_")
end

local function DecompiledScripts(arg1, arg2)
    if (arg1) == ("Rep") and (arg2) == ("Success") then
        print("1")
    elseif (arg1) == ("Rep") and (arg2) == ("Failed") then
        print("2")
    elseif (arg1) == ("PlrScripts") and (arg2) == ("Success") then
        print("3")
    elseif (arg1) == ("PlrScripts") and (arg2) == ("Failed") then
        print("4")
    end
end

local function SetA()
    TotalDecompiled = TotalDecompiled + 1
    TopBarMessage.Text = "Decomplied: " .. TotalDecompiled .. "/" .. TotalAmountOfScripts .. " Scripts!"
end

local function SearchAndDecompile(State, Location)
    pcall(function()
        for i,v in pairs(State:GetDescendants()) do
            if v:IsA("LocalScript") then
                if Decompiling == false then
                    Decompiling = true
                    local src = decompile(v)
                    if src then
                        if tostring(State) == "ReplicatedStorage" then
                            writefile(MainFolder..Location.."/ReplicatedStorage/".."LocalScripts".."/"..tostring(v)..".lua", src)
                            SetA()
                            Decompiling = false
                        elseif tostring(State) == "PlayerScripts" then                    
                            writefile(MainFolder..Location.."/PlayerScripts/".."LocalScripts".."/"..tostring(v)..".lua", src)
                            SetA()
                            Decompiling = false
                        end
                    end
                end
            elseif v:IsA("ModuleScript") then
                if Decompiling == false then
                    Decompiling = true
                    local src = decompile(v)
                    if src then
                        if tostring(State) == "ReplicatedStorage" then
                            writefile(MainFolder..Location.."/ReplicatedStorage/".."Modules".."/"..tostring(v)..".lua", src)
                            SetA()
                            Decompiling = false
                        elseif tostring(State) == "PlayerScripts" then                    
                            writefile(MainFolder..Location.."/PlayerScripts/".."Modules".."/"..tostring(v)..".lua", src)
                            SetA()
                            Decompiling = false
                        end
                    end
                end
            end
        end
    end)
end

local function dump(foldername)
    CreateFolders(foldername)
    SearchAndDecompile(Rep, foldername)
    SearchAndDecompile(PlrScripts, foldername)
end

local function GetTotal(State)
    for i,v in pairs(State:GetDescendants()) do
        if v:IsA("LocalScript") then
            TotalAmountOfScripts = TotalAmountOfScripts + 1
        elseif v:IsA("ModuleScript") then
            TotalAmountOfScripts = TotalAmountOfScripts + 1
        end
    end
end

GetTotal(Rep)
GetTotal(PlrScripts)

TopBarMessage.Text = "Decompiling: " .. TotalAmountOfScripts .. " Scripts!"

if isfolder(MainWithoutSlash) then
    dump(removeCharacters(GameName.Name))
else
    makefolder(MainWithoutSlash)
    dump(removeCharacters(GameName.Name))
end