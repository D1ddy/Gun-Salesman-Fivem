QBCore = exports['qb-core']:GetCoreObject()
created = nil
interactDistance = 3
closeDialog = true
arrayOfSalesman = {}
RegisterNetEvent('SpawnExistingSalesman:client',function(x,y,z)
    local ped = 'a_m_m_hillbilly_01'
    RequestModel(ped)
    repeat Wait(0) until HasModelLoaded(ped)
    --FIXME: Other peds can move only the last one cant
    created = CreatePed(4, ped, x, y , z, 180, true, true)
    table.insert(arrayOfSalesman,created)
    Wait(500)
    FreezeEntityPosition(created,true)
    SetPedConfigFlag(created, 0, true)
    SetEntityInvincible(created, true)
end)
RegisterNUICallback('closeDialog', function(_, cb)
    closeDialog = false
end)
function findClosestPed() 
    local playerCoords = GetEntityCoords(PlayerPedId())
    local indexOfClosestPed = 1
    local closestPed = 100
    for i = 1, #arrayOfSalesman, 1 do
        local pedCoords = GetEntityCoords(arrayOfSalesman[i])
        local dist = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, true)
        if dist < closestPed then
            closestPed = dist
            indexOfClosestPed = i
        end
    end
    return indexOfClosestPed
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local closestPedIndex = findClosestPed()
        local pedCoords = GetEntityCoords(arrayOfSalesman[closestPedIndex])
        local dist = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, true)
        if dist < interactDistance then
            SendNUI('openPopUp', true)
            SetNuiFocus(false, false)
            if IsControlJustPressed(0, 38) then -- 38 is E key
                --[Pan the camera to the ped]
                --FIXME: Camera now isn't working how it should the rotations fucked BUG is after added the option for more peds
                SendNUI('close',false) --Closes press E to interact
                local cam = CreateCamera("DEFAULT_SCRIPTED_CAMERA", true)
                local rotationOrder = 2
                local pedRotation = GetEntityRotation(created, rotationOrder)
                SetCamCoord(cam, pedCoords.x - 0.1, pedCoords.y + 0.5, pedCoords.z + 0.7)
                SetCamRot(cam, pedRotation.x, pedRotation.y, 180 - pedRotation.z, rotationOrder)
                RenderScriptCams(true, true, 2000, false, true)
                Wait(2000)
                DestroyCam(cam) 
                ClearFocus()
                --[OpenDialogBox]
                SendNUI('openDialog', true)
                SetNuiFocus(true, true)
                repeat
                    Citizen.Wait(0)
                until closeDialog == false
                --[Close DialogBox and pan back to player]
                closeDialog = true
                RenderScriptCams(false, true, 2000, false, false)
                
            end
        else
            SendNUI('close',false)
            SetNuiFocus(false,false)
        end
    end
end)
RegisterNetEvent('salesman:client', function()
        local player = PlayerPedId()
        local ped = 'a_m_m_hillbilly_01'
        local playerCoords = GetEntityCoords(PlayerPedId())
        RequestModel(ped)
        repeat Wait(0) until HasModelLoaded(ped)
        local playerCoords = GetEntityCoords(PlayerPedId())
        created = CreatePed(CIVMALE, ped, playerCoords.x, playerCoords.y + 1, playerCoords.z, 180, true, true)
        table.insert(arrayOfSalesman,created)
        Wait(500)
        TriggerServerEvent('createSalesman:server',player, ped, playerCoords.x, playerCoords.y + 1, playerCoords.z)
        FreezeEntityPosition(created,true)
        SetPedConfigFlag(created, 0, true)
        SetEntityInvincible(created, true)
end)
RegisterNUICallback('addGunToInventory',function(data,cb)
    local gunName = data[1]
    local price = data[2]
    local indexOfClosestPed = findClosestPed()
    TriggerServerEvent('addWeaponToSalsemanInventory:server',indexOfClosestPed,gunName,price)
end)
RegisterNUICallback('getGun',function(data,cb)
    local gunName = data[1]
    local price = data[2]
    local player = GetPlayerServerId(PlayerId())
    local playerMoney = GetPedMoney(player)
    TriggerServerEvent('buyWeapon:server', player,gunName,price)
end)
RegisterNUICallback('loadInventoryNames',function(_,cb)
    local index = findClosestPed()
    TriggerServerEvent('getInventoryNames',index)
    RegisterNetEvent('getInventoryNames:client',function(inventory)
        cb(inventory)
    end)
end)
RegisterNUICallback('loadInventoryPrice',function(_,cb)
    local index = findClosestPed()
    TriggerServerEvent('getInventoryPrice',index)
    RegisterNetEvent('getInventoryPrice:client',function(prices)
        cb(prices)
    end)
end)
RegisterNUICallback('checkprivileges',function(_,cb)
    local isAdmin = false
    TriggerServerEvent('checkprivileges:server')
    RegisterNetEvent('playerIsAdmin',function()
        isAdmin = true
        cb(isAdmin)
    end)
    RegisterNetEvent('playerIsNotAdmin',function()
        isAdmin = false
        cb(isAdmin)
    end)
end)
