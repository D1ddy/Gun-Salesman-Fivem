created = nil
interactDistance = 3
closeDialog = true
RegisterNUICallback('closeDialog', function(_, cb)
    closeDialog = false
end)
--[FIXME: Only works with one salesman]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local pedCoords = GetEntityCoords(created)
        local dist = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, true)

        if dist < interactDistance then
            SendNUI('openPopUp', true)
            SetNuiFocus(false, false)
            if IsControlJustPressed(0, 38) then -- 38 is E key
                --[Pan the camera to the ped]
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

-- RegisterCommand('openUI', function()
--     SendNUI('setVisible', true)
--     SetNuiFocus(true, true)
--     print("Svelte showing")
-- end, false)

