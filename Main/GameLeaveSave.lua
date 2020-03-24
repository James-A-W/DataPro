local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)

return function(Store)	
	game.Players.PlayerRemoving:Connect(function(Player)
		local Data = {}
		for _,DataValue in pairs(Player.leaderstats:GetChildren()) do
			Data[DataValue.Name] = DataValue.Value
		end
		Data.DataID = Player.DataID.Value
		Store:Save(Player.UserId,Data)
	end)
		
	game:BindToClose(function()
		wait(3)
	end)
end
