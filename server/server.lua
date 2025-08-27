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
RegisterNetEvent('addWeaponToSalsemanInventory:server',function(index,gunName,price)
    local inventory = MySQL.Sync.fetchAll('SELECT inventory FROM salesman WHERE id = ?',{
        index
    },function()
        print("WORKS")
    end)
    inventory = inventory[1]['inventory']
    if inventory == nil then
        inventory = gunName
    else
        inventory = inventory..',' .. gunName
    end
    MySQL.update('UPDATE salesman SET inventory = ? WHERE id = ?', {
        inventory,
        index
    },function()
        print('Updated!')
    end)
    ------------------------------------------------------------------------------------------
    local inventoryPrice = MySQL.Sync.fetchAll('SELECT price FROM salesman WHERE id = ?',{
        index
    },function()
        print("WORKS")
    end)
    inventoryPrice = inventoryPrice[1]['price']
    if inventoryPrice == nil then
        inventoryPrice = price
    else
        inventoryPrice = inventoryPrice..',' .. price
    end
    MySQL.update('UPDATE salesman SET price = ? WHERE id = ?',{
        inventoryPrice,
        index
    })
end)
RegisterNetEvent('getInventoryNames',function(index)
    local src = source
    local inventory = MySQL.Sync.fetchAll('SELECT inventory FROM salesman WHERE id = ?',{
        index
    },function()
        print("WORKS")
    end)
    TriggerClientEvent('getInventoryNames:client', src, inventory[1]['inventory'])
end)
RegisterNetEvent('getInventoryPrice',function(index)
    local src = source
    local inventory = MySQL.Sync.fetchAll('SELECT price FROM salesman WHERE id = ?',{
        index
    },function()
        print("WORKS")
    end)
    TriggerClientEvent('getInventoryPrice:client', src, inventory[1]['price'])
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