local DataStoreService = game:GetService("DataStoreService")
local Response = {}
Response.__index = Response

Response.NewResponse = function(Status,Response)
	local self = setmetatable({},Response)
	self.Status = Status
	self.Response = Response
	return self
end

return Response
