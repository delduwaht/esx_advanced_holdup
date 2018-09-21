Config									= {}
Config.Locale						= 'en'
Config.DrawDistance			= 25.0

Config.PercentCurrentMoney = 40 -- % of store current money to transfert to bank
Config.MaxRandomMultiplier = 2	-- multiplier (musn't go over 100% of PercentCurrentMoney)
-- For example : if 25% : multiplieur max = 4 (4*25=100)
-- partOfCurrentMoney = CurrentMoney * Config.PercentCurrentMoney / 100
-- randomMoneyToBank 	= math.random(partOfCurrentMoney, partOfCurrentMoney * Config.MaxRandomMultiplier)

Config.AddMoneyToStoresTimeOut	= 10 -- minutes
Config.AddMoneyToBanksTimeOut		= 60 -- minutes

--[[
---------- TEMPLATES ----------

-- STORES
["My Little Store"] = {
	Pos				= { x = 28.288, y = -1339.537, z = 28.497 },
	Size  		= { x = 1.5, y = 1.5, z = 1.0 },
	Color 		= { r = 220, g = 110, b = 0 },
	Type  		= 1,
	AreaSize 	= 15, -- maximum area size the player can walk in without canceling the robbery
	CurrentMoney			= 1000, -- store starting money
	MaxMoney 					= 25000, -- store maximum money
	MoneyRegeneration	= math.random(1000,3000), -- store money generation each Config.AddMoneyToStoresTimeOut
	BankToDeliver 		= "My Little Bank", -- bank where the store money will go each Config.AddMoneyToBanksTimeOut
	Robbed						= 0, -- DO NOT CHANGE : current timer before new robbery allowed for this store
	TimeToRob					= 10, -- time to take the store money
	TimeBeforeNewRob 	= 100, -- time reference before new robbery allowed
	PoliceRequired		= 1 -- number of cops required to rob this store
},

-- BANKS (must be related to store's BankToDeliver)
["My Little Bank"] = {
	Pos				= { x = -706.193, y = -910.005, z = 18.216 },
	Size  		= { x = 1.5, y = 1.5, z = 1.0 },
	Color 		= { r = 220, g = 110, b = 0 },
	Type  		= 1,
	AreaSize 	= 15, -- maximum area size the player can walk in without canceling the robbery
	CurrentMoney			= 0, -- bank starting money
	MaxMoney 					= 200000,	-- bank maximum money
	Robbed						= 0, -- DO NOT CHANGE : current timer before new robbery allowed for this bank
	TimeToRob					= 10, -- time to take the bank money
	TimeBeforeNewRob 	= 100, -- time reference before new robbery allowed
	PoliceRequired		= 1 -- number of cops required to rob this bank
},

-------------------------------
]]--

Config.Zones = {

	-- STORES
	["24/7 Innocence Boulevard"] = {
		Pos				= { x = 28.288, y = -1339.537, z = 28.497 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Fleeca Bank Vespucci Boulevard",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 60,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["LTD Gasoline Grove Street"] = {
		Pos				= { x = -43.057, y = -1748.811, z = 28.421 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Fleeca Bank Vespucci Boulevard",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["24/7 Paleto Bay"] = {
		Pos = { x = 1736.32, y = 6419.47, z= 35.03 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Blaine County Savings",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1

	},
	["24/7 Sandy Shores"] = {
		Pos = { x = 1961.24, y = 3749.46, z= 32.34 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Blaine County Savings",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["24/7 Little Seoul"] = {
		Pos = { x = -709.17, y = -904.21, z= 19.21 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Daily Bank",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["Yellow Jack"] = {
		Pos = { x = 1990.57, y = 3044.95, z= 47.21 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Blaine County Savings",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["Robs Liquor Great Ocean Highway"] = {
		Pos = { x = -2959.33, y = 388.21, z= 14.00 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Fleeca Bank (Highway)",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["Robs Liquor El Rancho Blvd"] = {
		Pos = { x = 1126.80, y = -980.40, z= 45.41 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Fleeca Bank Vespucci Boulevard",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["Robs Liquor San Andreas Avenue"] = {
		Pos = { x = -1219.85, y = -916.27, z= 11.32 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Fleeca Bank Vespucci Boulevard",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	["LTD Gasoline Mirror Park Boulevard"] = {
		Pos = { x = 1160.67, y = -314.40, z= 69.20 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		AreaSize 	= 15,
		Type  		= 1,
		CurrentMoney			= 1000,
		MaxMoney 					= 30000,
		MoneyRegeneration	= math.random(1000,3000),
		BankToDeliver 		= "Daily Bank",
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 80,
		TimeBeforeNewRob 	= 3600,
		PoliceRequired		= 1
	},
	-- BANKS
	["Fleeca Bank Vespucci Boulevard"] = {
		Pos				= { x = 146.913, y = -1044.836, z = 28.376 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		Type  		= 1,
		AreaSize 	= 15,
		CurrentMoney			= 0,
		MaxMoney 					= 300000,
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 120,
		TimeBeforeNewRob 	= 7200,
		PoliceRequired		= 2
	},
	["Fleeca Bank (Highway)"] = {
		Pos = { x = -2957.6674804688, y = 481.45776367188, z= 15.697026252747 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		Type  		= 1,
		AreaSize 	= 15,
		CurrentMoney			= 0,
		MaxMoney 					= 300000,
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 120,
		TimeBeforeNewRob 	= 7200,
		PoliceRequired		= 2
	},
	["Blaine County Savings"] = {
		Pos = { x = -107.06505584717, y = 6474.8012695313, z= 31.62670135498 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		Type  		= 1,
		AreaSize 	= 15,
		CurrentMoney			= 0,
		MaxMoney 					= 300000,
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 120,
		TimeBeforeNewRob 	= 7200,
		PoliceRequired		= 2
	},
	["Daily Bank"] = {
		Pos = { x = 265.32, y = 213.83, z= 101.68 },
		Size  		= { x = 1.5, y = 1.5, z = 1.0 },
		Color 		= { r = 220, g = 110, b = 0 },
		Type  		= 1,
		AreaSize 	= 15,
		CurrentMoney			= 0,
		MaxMoney 					= 300000,
		Robbed						= 0, -- DO NOT CHANGE
		TimeToRob					= 120,
		TimeBeforeNewRob 	= 7200,
		PoliceRequired		= 2
	},

}

