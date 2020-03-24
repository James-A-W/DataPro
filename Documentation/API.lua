--[[

If an argument has a * after it then it is required

NewStore
Arguments: StoreKey*,DefaultValues
	StoreKey: The unique key for the store
	DefaultValues: The default values for the store
Returns: A Store Object (Read Documentation > Store

ClearData
Arguments: Store*,DataKey*
	Store: The store object
	DataKey: The key for the data you are clearing
Returns: Nothing

ForceSave
Arguments: Store*,Key*,Data*
	Store: The store object
	Key: The data key
	Data: The data you are saving
Returns: Nothing

Save
Arguments: Store*,Key*,Data*
	Store: The store object
	Key: The data key
	Data: The data you are saving
Returns: Nothing

Load
Arguments: Store*,Key*
	Store: The store object
	Key: The data key
Returns: Either an empty table or the data

SetValues
Arguments: Store*,Values*
	Store: The store object
	Values: The new default values
Returns: Nothing

LoadValues
Arguments: Values*,Location*
	Values: The values to load
	Location: The location to load them to
Returns: Nothing
Note: This loads the values as objects (int,string,bool)
]]--
