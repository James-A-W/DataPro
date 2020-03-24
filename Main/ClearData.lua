local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)

return function(Store,Key)
	Store:ClearData(Key)
end
