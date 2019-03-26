ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local copsConnected 		= 0
local robberPlayers 		= {}
local isCurrentlyRobbed = false

function CountCops()

	local xPlayers = ESX.GetPlayers()
	copsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			copsConnected = copsConnected + 1
		end
	end
	TriggerClientEvent('esx_advanced_holdup:copsConnected', -1, copsConnected)

	SetTimeout(60000, CountCops)

end

function AddMoneyToStores()

	for _, v in pairs(Config.Zones) do
		if v.MoneyRegeneration ~= nil then
			local MaxMoney		= v.MaxMoney
			local MoneyRegen	= v.MoneyRegeneration
			if v.CurrentMoney < MaxMoney then
				v.CurrentMoney = v.CurrentMoney + MoneyRegen
			else
				v.CurrentMoney = MaxMoney
			end
		end
	end

	SetTimeout(Config.AddMoneyToStoresTimeOut * 60000, AddMoneyToStores)

end

function AddMoneyToBanks()

	for _, v in pairs(Config.Zones) do
		if v.MoneyRegeneration ~= nil then
			local partOfCurrentMoney 	= ESX.Round(v.CurrentMoney * Config.PercentCurrentMoney / 100)
			local randomMoneyToBank 	= math.random(partOfCurrentMoney, partOfCurrentMoney * Config.MaxRandomMultiplier)
			v.CurrentMoney = v.CurrentMoney - randomMoneyToBank
			Config.Zones[v.BankToDeliver].CurrentMoney = Config.Zones[v.BankToDeliver].CurrentMoney + randomMoneyToBank
			if Config.Zones[v.BankToDeliver].CurrentMoney > Config.Zones[v.BankToDeliver].MaxMoney then
				Config.Zones[v.BankToDeliver].CurrentMoney = Config.Zones[v.BankToDeliver].MaxMoney
			end
		end
	end

	SetTimeout(Config.AddMoneyToBanksTimeOut * 60000, AddMoneyToBanks)

end

RegisterServerEvent('esx_advanced_holdup:robberyCanceled')
AddEventHandler('esx_advanced_holdup:robberyCanceled', function(zone)
	local _source 	= source
	local xPlayer		= ESX.GetPlayerFromId(_source)
	local xPlayers 	= ESX.GetPlayers()

	isCurrentlyRobbed = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_advanced_holdup:robCompleteAtNotification', xPlayer.source, zone, false)
			TriggerClientEvent('esx_advanced_holdup:killBlip', xPlayer.source)
		end
	end

	if robberPlayers[_source] then
		robberPlayers[_source] = nil
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('robbery_has_cancelled'))
	end
end)

RegisterServerEvent('esx_advanced_holdup:robberyInProgress')
AddEventHandler('esx_advanced_holdup:robberyInProgress', function(mainZone)

	local _source 	= source
	local xPlayer		= ESX.GetPlayerFromId(_source)
	local xPlayers 	= ESX.GetPlayers()

	if Config.Zones[mainZone] then

		local zone = Config.Zones[mainZone]

		if not isCurrentlyRobbed then

			if zone.Robbed ~= 0 and (os.time() - zone.Robbed) < zone.TimeBeforeNewRob then
				local timerNewRob = zone.TimeBeforeNewRob - (os.time() - zone.Robbed)
				TriggerClientEvent('esx:showNotification', _source, _U('already_robbed_1'))
				TriggerClientEvent('esx:showNotification', _source, _U('already_robbed_2', timerNewRob))
				return
			elseif copsConnected < zone.PoliceRequired then
				TriggerClientEvent('esx:showNotification', _source, _U('police_required', zone.PoliceRequired))
				return
			end

			isCurrentlyRobbed = true
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx_advanced_holdup:robPoliceNotification', xPlayer.source, mainZone)
					TriggerClientEvent('esx_advanced_holdup:setBlip', xPlayer.source, Config.Zones[mainZone].Pos)
				end
			end

			TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob'))
			TriggerClientEvent('esx_advanced_holdup:startRobberingTimer', _source, mainZone)

			Config.Zones[mainZone].Robbed = os.time()
			robberPlayers[_source]	= mainZone
			local savedSource 			= _source

			SetTimeout(zone.TimeToRob * 1000, function()

				if robberPlayers[savedSource] then
					isCurrentlyRobbed = false
					if xPlayer then
						xPlayer.addAccountMoney('black_money', zone.CurrentMoney)
						TriggerClientEvent('esx_advanced_holdup:robCompleteNotification', xPlayer.source)

						for i=1, #xPlayers, 1 do
							local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
							if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx_advanced_holdup:robCompleteAtNotification', xPlayer.source, robberPlayers[savedSource], true)
								TriggerClientEvent('esx_advanced_holdup:killBlip', xPlayer.source)
							end
						end
					end
				end

			end)

		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('robbery_already_in_progress'))
		end

	end

end)

CountCops()
AddMoneyToStores()
AddMoneyToBanks()
