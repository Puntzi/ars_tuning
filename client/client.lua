local QBCore = exports['qb-core']:GetCoreObject()


RegisterCommand(Config.Command, function()
    local playerPed = cache.ped
    local isAdmin = lib.callback.await('ars_tuning:isAdmin', false, GetPlayerServerId(PlayerId()))

    if not cache.vehicle then
        QBCore.Functions.Notify("No estás en ningun vehículo", "error", 5000)
        return 
    end

    if not isAdmin then
        QBCore.Functions.Notify("No eres admin", "error", 5000)
        return 
    end

    openTuningMenu()
    currentVehProperties.old = getVehicleProperties(cache.vehicle)
end)
