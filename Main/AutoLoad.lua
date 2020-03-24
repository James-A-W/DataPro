local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)

return function(Store)
	game.Players.PlayerAdded:Connect(function(Player)
		local Stats = nil
		if Player:FindFirstChild("leaderstats") then 
			Stats = Player.leaderstats
		else
			Stats = Instance.new("Folder")
			Stats.Name = "leaderstats"
			Stats.Parent = Player
		end
		local PlayerData = Store:Load(Player.UserId)
		if PlayerData.Status == "Successful" then
			PlayerData = PlayerData.Response
		else
			PlayerData = {DataID = 2002040}
		end
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
	end)
end
