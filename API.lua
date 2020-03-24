local API = {}
local Main = script.Parent.Main

API.NewStore = function(...)
	local Store = require(Main.Store)
	
	return Store.NewStore(...)
end

API.ClearData = function(...)
	local CD = require(Main.ClearData)
	
	return CD(...)
end

API.ForceSave = function(Store,Key,Data)
	return Store:ForceSave(Key,Data)
end

API.Save = function(Store,Key,Data)
	return Store:Save(Key,Data)
end

API.Load = function(Store,Key)
	local d = Store:Load(Key)
	if d.Status == "Successful" then
		return d.Response
	else
		return {}
	end
end

API.SetValues = function(Store,Values)
	return Store:SetDefaultValues(Values)
end

API.LoadValues = function(Values,Location)
	return require(Main.Load)(Values,Location)
end



return API
