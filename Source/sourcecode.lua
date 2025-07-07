-- GUI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Rayfield Window

local Window = Rayfield:CreateWindow({
   Name = "FScripts",
   Icon = 111948200153431,
   LoadingTitle = "FScripts",
   LoadingSubtitle = "by scot",
   ShowText = "FS",
   Theme = "Default",

   ToggleUIKeybind = "L",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = FScripts, -- Create a custom folder for your hub/game
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
}})

-- Notifier

Rayfield:Notify({
   Title = "Warning",
   Content = "Some scripts are dead, buggy or discontinued. Make a ticket in the discord if so.",
   Duration = 6.5,
   Image = 4483362458,
})

-- Tabs

local MiscTab = Window:CreateTab("Misc", 12120687742)

local MainTab = Window:CreateTab("PC Scripts", 12684119225)

-- Labels

local Label = MainTab:CreateLabel("Menu Keybind: L")

-- Buttons

local SelfFlingButton = MainTab:CreateButton({
   Name = "Self-Fling",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/Self-Fling.lua",true))()
   end,
})

local PrintBtn = MainTab:CreateButton({
   Name = "test print",
   Callback = function(b)
   b = print('hello')
   end,
})

local UnloadBtn = MiscTab:CreateButton({
   Name = "Unload",
   Callback = function(l)
   l = Rayfield:Destroy()
   end,
})
