local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Fun Scripts", HidePremium = false, SaveConfig = false, ConfigFolder = "FScripts"})
local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://15771263462",
	PremiumOnly = false
})

CreditsTab:AddLabel("Credits to: sc0t6 (scot) for making the script.")

local MainTab = Window:MakeTab({
        Name = "Main"
        Icon = "rbxassestid://1108967379"
})

MainTab:AddButton({
	Name = "Self-Fling",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/Self-Fling.lua",true))()
  	end    
})

end
OrionLib:Init()
