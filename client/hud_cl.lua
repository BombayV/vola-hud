local CreateThread = CreateThread
local PlayerPedId = PlayerPedId

-- Threads
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local armor = GetPedArmour(ped)
        local health = (GetEntityHealth(ped) - 100)
        SendNUIMessage({
            action = "updateInfo",
            health = health,
            armor = armor
        })
        Wait(350)
    end
end)

CreateThread(function()
	while true do
		TriggerServerEvent('ev:getServerInfo')
		Wait(2000)
	end
end)

-- Events
RegisterNetEvent('ev:setInfo', function(info)
	SendNUIMessage({
		action = "status",
        name = GetPlayerName(PlayerId()),
		money = info.money,
		bank = info.bankMoney
	})
end)