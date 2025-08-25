QBCore = exports['qb-core']:GetCoreObject()
Citizen.CreateThread(function()
    Wait(5000) 
    function spawnSalesMan()
        local numberOfSalesman =  MySQL.Sync.fetchAll('SELECT `positionX`, `positionY`, `positionZ` FROM `salesman`')
        for i=1,#numberOfSalesman,1 do
            local positionX = numberOfSalesman[i]['positionX']
            local positionY = numberOfSalesman[i]['positionY']
            local positionZ = numberOfSalesman[i]['positionZ']
            TriggerClientEvent("SpawnExistingSalesman:client",-1, positionX, positionY, positionZ)
        end
    end
    spawnSalesMan()
end)
RegisterNetEvent('createSalesman:server',function(playerId,ped,x,y,z)
    local numberOfRows = MySQL.Sync.fetchAll('SELECT COUNT(*) FROM salesman')
    local pedId = numberOfRows[1]["COUNT(*)"]
    pedId = pedId + 1
    MySQL.insert('INSERT INTO salesman (id,positionX,positionY,positionZ) VALUES (?, ?, ? ,?)',{
        pedId,
        x,
        y,
        z
    })
end)
RegisterNetEvent('addWeaponToSalsemanInventory:server',function(indexOfClosestPed,gunName)
    print('testing')
    --TODO--
end)
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