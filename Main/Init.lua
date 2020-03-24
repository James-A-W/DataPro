local Init = {}
local MainFolder = script.Parent.Parent
local Settings = require(MainFolder.Settings.Settings)
local StoreModule = require(script.Parent.Store)
Init.__Init = function()
	local Store = nil
	if Settings.UseDefaultScript then
		local ScriptToUse = Settings.DefaultScript
		if ScriptToUse == "Custom" then
			Store = StoreModule.NewStore("GeneratedStore3",Settings.Values)
		elseif ScriptToUse ~= "None" then
			ScriptToUse = script.Parent.DefaultScripts[ScriptToUse]
			Store = StoreModule.NewStore("GeneratedStore3",{})
			if ScriptToUse ~= nil then
				require(ScriptToUse).Run(Store)
			end
		end
	end
	
	coroutine.resume(coroutine.create(function()
		if Settings.AutoSave then
			require(script.Parent.AutoSave)(Store)
		end
	end))
	if Settings.GameLeaveSave then
		require(script.Parent.GameLeaveSave)(Store)
	end
		
	if Settings.ManualSave then
		require(script.Parent.ManualSave)(Store)
	end
		
	if Settings.AutoLoad then
		require(script.Parent.AutoLoad)(Store)
	end
		
	if Settings.ManualLoad then
		require(script.Parent.AutoSave)(Store)
	end
end

return Init
