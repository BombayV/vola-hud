local CreateThread = CreateThread
local PlayerPedId = PlayerPedId

local screenRes = {
	x = nil, 
	y = nil
}

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

CreateThread(function()
	while true do 
		if isPlayerLoaded then 
			local resX, resY = GetActiveScreenResolution()
			if screenRes.x == nil or screenRes.x ~= resX or screenRes.y == nil or screenRes.y ~= resY then 
				MoveHudToCorrectPos()
			end
		end
		Wait(10000)
	end
end)


function MoveHudToCorrectPos()
	local safezone = GetSafeZoneSize()
	local safezone_x = 1.0 / 20.0
	local safezone_y = 1.0 / 20.0
	local aspect_ratio = GetAspectRatio(0)
	screenRes.x, screenRes.y = GetActiveScreenResolution()
	local xscale = 1.0 / screenRes.x
	local yscale = 1.0 / screenRes.y
	local Minimap = {}
	Minimap.width = (xscale * (screenRes.x / (4 * aspect_ratio)))
	Minimap.height = yscale * (screenRes.y / 5.674)
	Minimap.left_x = (xscale * (screenRes.x * (safezone_x * ((math.abs(safezone - 1.0)) * 10))))
	Minimap.bottom_y = (1.0 - yscale * (screenRes.y * (safezone_y * ((math.abs(safezone - 1.0)) * 10))))
	Minimap.right_x = Minimap.left_x + Minimap.width
	Minimap.top_y = Minimap.bottom_y - Minimap.height
	Minimap.xunit = xscale
	Minimap.yunit = yscale
	SendNUIMessage({action = "updatePosition", position=Minimap})
end

-- Events
RegisterNetEvent('ev:setInfo', function(info)
	SendNUIMessage({
		action = "status",
        name = GetPlayerName(PlayerId()),
		money = info.money,
		bank = info.bankMoney
	})
end)