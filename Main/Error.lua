local DataStoreService = game:GetService("DataStoreService")
local Error = {}
Error.__index = Error

Error.NewError = function(Type,Message)
	local self = setmetatable({},Error)
	self.Type = Type
	self.Message = Message
	print("Error ["..Type.."]:\n"..Message)
	return self
end

return Error
