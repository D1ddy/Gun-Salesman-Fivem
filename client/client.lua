created = nil
interactDistance = 3
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local pedCoords = GetEntityCoords(created)
        local dist = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, true)

        if dist < interactDistance then
            --[TODO: display press E to interact]

            if IsControlJustPressed(0, 38) then -- 38 is E key
                print('Works') --[TODO: display UI]
            end
        end
    end
end)
RegisterCommand('salesman', function()
    local player = PlayerPedId()
    local ped = 'a_m_m_hillbilly_01'
    RequestModel(ped)
    repeat Wait(0) until HasModelLoaded(ped)
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    created = CreatePed(CIVMALE, ped, playerCoords.x, playerCoords.y + 1, playerCoords.z, 180, true, true)
    Wait(500)
    FreezeEntityPosition(created,true)
    SetPedConfigFlag(created, 0, true)
    SetEntityInvincible(created, true)
    


end)

RegisterCommand('svelte:show', function()
    SendNUI('setVisible', true)
    SetNuiFocus(true, true)
    print("Svelte showing")
end, false)


RegisterNUICallback('hideUI', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)
