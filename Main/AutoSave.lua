local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)

return function(Store)
	local WaitTime = Settings.AutoSaveTime
	
	while true do
		wait(WaitTime)
		for _,Player in pairs(game.Players:GetPlayers()) do
			local Data = {}
			for _,DataValue in pairs(Player.leaderstats:GetChildren()) do
				Data[DataValue.Name] = DataValue.Value
			end
			Data.DataID = Player.DataID.Value
			Store:Save(Player.UserId,Data)
		end
	end
end
