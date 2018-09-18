Config									= {}
Config.Locale						= 'fr'
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

}

