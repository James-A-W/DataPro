local DataStoreService = game:GetService("DataStoreService")
local Store = {}
local Response = require(script.Parent.Response)
local Error = require(script.Parent.Error)
Store.__index = Store

Store.NewStore = function(Key,DefaultValues)
	
	local self = setmetatable({},Store)
	self.DefaultValues = DefaultValues or {DataID = 0}
	self.Key = Key or "DATASTORE"
	self.RawStore = DataStoreService:GetDataStore(Key)
	if self.DefaultValues.DataID == nil then
		self.DefaultValues.DataID = 0
	end
	return self
end

function Store:SetDefaultValues(NewValues)
	self.DefaultValues = NewValues
	self.DefaultValue.DataID = 0
end

function Store:ForceSave(SaveKey,Data)
	local RS = self.RawStore
	local Errorr,Message = pcall(function()
		RS:SetAsync(SaveKey,Data)
	end)
		
	if not Errorr then
		return Response.NewResponse("Error",Error.NewError("ForceSave",Message))
	else
		return Response.NewResponse("Successful",true)
	end
end

function Store:ClearData(SaveKey)
	self:Save(SaveKey,nil)
end

function Store:Save(SaveKey,Data)
	if Data == nil then
		Data = self.DefaultValues
	end
	
	if type(Data) ~= "table" then
		return Response.NewResponse("Error",Error.NewError("SaveType","You can only save tables"))
	end
	
	local RS = self.RawStore
	local Errorr,Message = pcall(function()
		RS:UpdateAsync(SaveKey,function(OldData)
			if OldData.DataID == Data.DataID then
				if Data.DataID > 1000 then
					Data.DataID = 0
				else
					Data.DataID = Data.DataID + 1
				end
				return Data
			end
		end)
	end)
		
	if not Errorr then
		return Response.NewResponse("Error",Error.NewError("Save",Message))
	else
		return Response.NewResponse("Successful",true)
	end
end

function Store:Load(SaveKey)
	local RS = self.RawStore
	local Errorr,Message = pcall(function()
		Data = RS:GetAsync(SaveKey) or self.DefaultValues
	end)
	
	if not Errorr then
		return Response.NewResponse("Error",Error.NewError("Load",Message))
	else
		return Response.NewResponse("Successful",Data)
	end
end

return Store
