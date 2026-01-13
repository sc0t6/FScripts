local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local PlaceId = game.PlaceId
local JobId = game.JobId

local function serverHop()
    local servers = {}
    local cursor = ""

    repeat
        local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or "")
        local response = HttpService:JSONDecode(game:HttpGet(url))

        for _, server in pairs(response.data) do
            if server.playing < server.maxPlayers and server.id ~= JobId then
                table.insert(servers, server.id)
            end
        end

        cursor = response.nextPageCursor
    until cursor == nil or #servers > 0

    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
    end
end

serverHop()
