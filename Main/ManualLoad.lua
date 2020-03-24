local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)
local Store = require(script.Parent.Store)

function Load(Store,Player,Stats)
	local PlayerData = Store:Load(Player.UserId).Response
	for Name,Value in pairs(PlayerData) do
		if Name ~= "DataID" then
			local ValueO = nil
			if typeof(Value) == "number" then
				ValueO = Instance.new("IntValue")
			elseif typeof(Value) == "string" then
				ValueO = Instance.new("StringValue")
			elseif typeof(Value) == "boolean" then
				ValueO = Instance.new("BoolValue")
			end
			ValueO.Name = Name
			ValueO.Value = Value
			ValueO.Parent = Stats
		end
	end
	local DataID = Instance.new("IntValue")
	DataID.Parent = Player
	DataID.Value = PlayerData.DataID
end

return function(Store)
	game.Players.PlayerAdded:Connect(function(Player)
		Player.Chatted:Connect(function(Message)
			local Prefix = Settings.ManualLoadCommand
			if Message:lower() == Prefix:lower() then
				local Stats = nil
				if Player:FindFirstChild("leaderstats") then 
					Stats = Player.leaderstats
					for _,Item in pairs(Stats:GetChildren()) do
						Item:Destroy()
					end
				else
					Stats = Instance.new("Folder")
					Stats.Name = "leaderstats"
					Stats.Parent = Player
				end
				Load(Store,Player,Stats)
			end
		end)
	end)
end
