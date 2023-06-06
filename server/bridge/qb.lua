local qb = GetResourceState('qb-core'):find("start")
if not qb then return end

local QBCore = exports['qb-core']:GetCoreObject()


--- @param amount number
RegisterNetEvent("ars_tuning:payMods", function(properties)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local properties = properties

    MySQL.update('UPDATE player_vehicles SET mods = ? WHERE plate = ?',
        { json.encode(properties), properties.plate })
end)
