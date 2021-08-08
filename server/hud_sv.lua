local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vRP = Proxy.getInterface('vRP')

RegisterNetEvent('ev:getServerInfo', function()
	local source <const> = {source}
	local playerID = vRP.getUserId(source)
	local player = vRP.getUserSource({playerID})

	local info = {
		money = vRP.getMoney({playerID}),
		bankMoney = vRP.getBankMoney({playerID})
	}
	TriggerClientEvent('ev:setInfo', player, info) 
end)