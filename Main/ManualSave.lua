local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)
local Store = require(script.Parent.Store)
return function(Store)
	game.Players.PlayerAdded:Connect(function(Player)
		Player.Chatted:Connect(function(Message)
			local Prefix = Settings.ManualSaveCommand
			if Message:lower() == Prefix:lower() then
				local Data = {}
				for _,DataValue in pairs(Player.leaderstats:GetChildren()) do
					Data[DataValue.Name] = DataValue.Value
				end
				Data.DataID = Player.DataID.Value
				
				Store:Save(Player.UserId,Data)
			end
		end)
	end)
end
