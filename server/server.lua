lib.versionCheck('Arius-Development/ars_tuning')

lib.callback.register('ars_tuning:isAdmin', function(source, serverId)
    if not type(serverId) == 'number' then return end
    local Player = QBCore.Functions.GetPlayer(serverId)

    if not Player then return end

    local playerGroup = QBCore.Functions.GetPermission(Player.PlayerData.source)
    for group, value in pairs(playerGroup) do
        if value then
            for k,v in ipairs(Config.Staff) do
                if group == v then
                    return true
                end
            end
        end
    end

    return false
end)