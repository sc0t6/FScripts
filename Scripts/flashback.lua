--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local key = "C" -- Key to initiate the flashback
local killKey = "P" -- Key to kill the script
local flashbacklength = 80 -- How long the flashback should be stored in approx seconds
local flashbackspeed = 0.9 -- How many frames to skip during flashback (set to 0 to disable)

if not game:IsLoaded() then game.Loaded:Wait() end -- Ensure game is fully loaded before execution

local name = "FlashbackSystem" -- Unique name to prevent conflicts
local frames, uis, LP, RS = {}, game:GetService("UserInputService"), game:GetService("Players").LocalPlayer, game:GetService("RunService")

-- Prevent issues with VR Navigation
local VRService = game:GetService("VRService")
if VRService.VREnabled then return end -- Stop execution if VR is enabled

game:GetService("StarterPlayer").DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
game:GetService("StarterPlayer").DevTouchMovementMode = Enum.DevTouchMovementMode.Thumbstick

if not LP or not uis then return end -- Ensure LocalPlayer and UserInputService exist

pcall(RS.UnbindFromRenderStep, RS, name) -- Unbind the function if previously bound

local function getchar()
   return LP.Character or LP.CharacterAdded:Wait()
end

function gethrp(c)
   return c and (c:FindFirstChild("HumanoidRootPart") or c.RootPart or c.PrimaryPart or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso") or c:FindFirstChildWhichIsA("BasePart"))
end

local flashback = { lastinput = false, canrevert = true }

function flashback:Advance(char, hrp, hum, allowinput)
   if not char or not hrp or not hum then return end -- Ensure necessary components exist
   if #frames > flashbacklength * 60 then -- Ensure history does not exceed limit
       table.remove(frames, 1)
   end

   if allowinput and not self.canrevert then
       self.canrevert = true
   end

   if self.lastinput then -- Restore platformstand
       hum.PlatformStand = false
       self.lastinput = false
   end

   table.insert(frames, {
       hrp.CFrame,
       hrp.Velocity,
       hum:GetState(),
       hum.PlatformStand,
       char:FindFirstChildOfClass("Tool")
   })
end

function flashback:Revert(char, hrp, hum)
   if not char or not hrp or not hum or #frames == 0 or not self.canrevert then
       self.canrevert = false
       self:Advance(char, hrp, hum)
       return
   end

   local num = #frames
   for i = 1, flashbackspeed do -- Skip frames if enabled
       table.remove(frames, num)
       num = num - 1
   end
   
   self.lastinput = true
   local lastframe = frames[num]
   table.remove(frames, num)
   hrp.CFrame = lastframe[1]
   hrp.Velocity = -lastframe[2]
   hum:ChangeState(lastframe[3])
   hum.PlatformStand = lastframe[4] 
   
   local currenttool = char:FindFirstChildOfClass("Tool")
   if lastframe[5] then -- Equip/unequip tools
       if not currenttool then
           hum:EquipTool(lastframe[5])
       end
   else
       hum:UnequipTools()
   end
end

local function step()
   local char = getchar()
   local hrp = gethrp(char)
   local hum = char and char:FindFirstChildWhichIsA("Humanoid")
   if not char or not hrp or not hum then return end -- Ensure valid state
   
   if uis:IsKeyDown(Enum.KeyCode[key]) then -- Begin flashback
       flashback:Revert(char, hrp, hum)
   else
       flashback:Advance(char, hrp, hum, true)
   end
   
   if uis:IsKeyDown(Enum.KeyCode[killKey]) then -- Kill the script
       RS:UnbindFromRenderStep(name)
       script:Destroy()
   end
end

-- Bind function safely
pcall(function()
   RS:BindToRenderStep(name, 1, step)
end)
