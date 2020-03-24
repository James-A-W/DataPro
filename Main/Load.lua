return function(Data,Stats)
	for Name,Value in pairs(Data) do
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
	DataID.Parent = Stats.Parent
	DataID.Value = Data.DataID
end
