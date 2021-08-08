local CreateThread = CreateThread
local PlayerPedId = PlayerPedId

-- Threads
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local armor = GetPedArmour(ped)
        local health = (GetEntityHealth(ped) - 100)
        local minutes, hours = GetClockMinutes(), GetClockHours()
        if (minutes <= 9) then
			minutes = "0" .. minutes
		end
		if (hours <= 9) then
			hours = "0" .. hours
		end
        SendNUIMessage({
            action = "updateInfo",
            health = health,
            armor = armor,
            time = hours .. ":" .. minutes
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
        name = info.name,
		money = info.money,
		bank = info.bankMoney
	})
end)