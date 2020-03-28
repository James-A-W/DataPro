local Settings = require(script.Parent.Settings.Settings)
local Main = script.Parent.Main
local RunService = game:GetService("RunService")
local Init = require(Main.Init)

if not RunService:IsServer() then
	error("For some reason DataPro is not on the server. Please move it to ServerScriptService")
end

if RunService:IsStudio() then
	print("Thank you for using DataPro.")
	print("If you need any help then go DataPro > Documentation")
	print("<3")
	
	warn("DataPro may not work fully in Studio, try it in game before reporting a bug")
else
	print(game.Name.." is powered by DataPro.")
end

if Settings.Enabled then
	Init.__Init()
end
