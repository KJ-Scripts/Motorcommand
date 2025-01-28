local hasUsedMotorCommand = false

RegisterCommand("motor", function(source, args, rawCommand)
    if hasUsedMotorCommand then
        ESX.ShowNotification('error', 'Je hebt dit command al gebruikt. Probeer later opnieuw!')
        return
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    ESX.ShowNotification('success', 'Succesvol een Cliffhanger ingespawned!') 
    local vehicleModel = GetHashKey("cliffhanger")

    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(1)
    end

    local vehicle = CreateVehicle(vehicleModel, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleModel)

    hasUsedMotorCommand = true
end, false)
