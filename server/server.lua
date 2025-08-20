QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('buyWeapon:server',function(playerId,gunName,price)
    
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local money = Player.PlayerData.money
    local cash = money.cash
    local bank = money.bank
    if cash >= price then

        local search = string.find(gunName,"ammo")
        Player.Functions.SetMoney('cash', Player.PlayerData.money.cash - price)
        if search ~= nil then
            exports['qb-inventory']:AddItem(playerId, gunName, 30, false, false, 'qb-inventory:itemBought')
        end
        exports['qb-inventory']:AddItem(playerId, gunName, 1, false, false, 'qb-inventory:itemBought')
    end
end)