--[[

SCRIPT TESTED WITH: Synapse X
Most full/near full lua executors should be able to handle it.
Make sure you have a gun out while executing and throughout the entire operation.

]]--

print('INITIALIZED')

local NighthawkTeam = game.Teams:FindFirstChild('Nighthawk')
local PlayerService = game:GetService('Players')

local PlayersTable = {}

for i,v in pairs (PlayerService:GetChildren()) do
    if v.Team == NighthawkTeam then
        table.insert(PlayersTable, v.Name)
        print('ADDED PLAYER TO TABLE: '..v.Name)
        wait(0.05)
end
end

print('DONE PLACING PLAYERS IN TABLES')

for t,p in pairs (PlayersTable) do
    local args = {
                    [1] = {
                        ["Victim"] = game:GetService("Players"):FindFirstChild(p).Character.Humanoid,
                        ["Amount"] = 100
                    }
                }
                
                    game:GetService("ReplicatedStorage").RemoteEvents.Guns.Damage:FireServer(unpack(args))           
                    print('Killed: '..p)
                    wait(1)

end
print('COMPLETED')
