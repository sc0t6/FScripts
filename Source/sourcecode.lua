-- GUI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() -- GUI Loader dont remove

-- Rayfield Window

local Window = Rayfield:CreateWindow({
   Name = "FScripts",
   Icon = 111948200153431, -- Icon for the window
   LoadingTitle = "FScripts",
   LoadingSubtitle = "by scot",
   ShowText = "FS", -- Mobile Menu TXT
   Theme = "Default", -- Custom Theme

   ToggleUIKeybind = "L",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = FScripts, -- Config Folder
      FileName = "config"
   },

   KeySystem = false,
   KeySettings = {
      Title = "Key System",
      Subtitle = "FScript Key System",
      Note = "Isn't available",
      FileName = "keylock",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"robinho"}
   }
})

-- Notifier

Rayfield:Notify({
   Title = "Warning",
   Content = "Some scripts are dead, buggy or discontinued. Make a ticket in the discord if so.",
   Duration = 6.5,
   Image = 4483362458,
})

-- Tabs

local MiscTab = Window:CreateTab("Misc", 12120687742) -- Misc Tab

local MainTab = Window:CreateTab("PC Scripts", 12684119225) -- PC Scripts Tab

-- Labels

local Label = MainTab:CreateLabel("Menu Keybind: L")-- Label for menu

-- Buttons

local SelfFlingButton = MainTab:CreateButton({
   Name = "Self-Fling",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/Self-Fling.lua"))() -- Script for Self Fling
   end,
})

local WallBtn = MainTab:CreateButton({
   Name = "Walk On Walls", -- Walking on walls
   Callback = function(f)
   f = loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
   end,
})

local printBtn = MainTab:CreateButton({
   Name = "Print to see if it executed",
   Callback = function(g)
   g = print("Works")
   end,
})

-- Unloads the menu

local UnloadBtn = MiscTab:CreateButton({
   Name = "Unload",
   Callback = function(l)
   l = Rayfield:Destroy()
   end,
})
