-- GUI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() -- GUI Loader dont remove

-- Rayfield Window

local Window = Rayfield:CreateWindow({
   Name = "FScripts",
   Icon = 111948200153431, -- Icon for the window
   LoadingTitle = "FScripts",
   LoadingSubtitle = "by scot",
   ShowText = "FS", -- Mobile Menu TXT
   Theme = "AmberGlow", -- Custom Theme

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
   Name = "Zero Gravity",
   Callback = function(g)
   g = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
   end,
})

local InfYButton = MiscTab:CreateButton({
   Name = "Infinite Yield (ADMIN)",
   Callback = function(y)
   y = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() -- Script for Infinite yield
   end,
})

local SHButton = MiscTab:CreateButton({
   Name = "Server Hop",
   Callback = function(y)
   y = loadstring(game:HttpGet("https://github.com/sc0t6/FScripts/blob/main/Scripts/serverhop.lua"))() -- Script for server hop
   end,
})

local FlyButton = MiscTab:CreateButton({
   Name = "FLY",
   Callback = function(y)
   y = loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
   end,
})

local flashButton = MainTab:CreateButton({
   Name = "Flashback",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/flashback.lua"))() -- Script for flashback
   end,
})

-- Unloads the menu

local UnloadBtn = MiscTab:CreateButton({
   Name = "Unload",
   Callback = function(l)
   l = Rayfield:Destroy()
   end,
})
