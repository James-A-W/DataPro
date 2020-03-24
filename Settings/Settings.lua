local Settings = {

-- If you plan on doing things with just the API then set Enabled to false

Enabled = true,

--\\\\\\\\\\
-- Default Scripts
--\\\\\\\\\\

UseDefaultScript = true,
DefaultScript = "Custom",

--\\\\\\\\\\
-- Auto Save
--\\\\\\\\\\

AutoSave = true,
AutoSaveTime = 60,

--\\\\\\\\\\
-- Game Leave Save
--\\\\\\\\\\

GameLeaveSave = true,

--\\\\\\\\\\
-- Manual Save
--\\\\\\\\\\

ManualSave = true,
ManualSaveCommand = "..SaveData",

--\\\\\\\\\\
-- Auto Load
--\\\\\\\\\\

AutoLoad = true,

--\\\\\\\\\\
-- Manual Load
--\\\\\\\\\\

ManualLoad = true,
ManualLoadCommand = "..LoadData",

--\\\\\\\\\\
-- Custom Data
--\\\\\\\\\\

Values = {
Money = 10,
},

HolderName = "leaderstats",

}

return Settings
