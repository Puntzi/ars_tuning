lib.locale()

function confirmPayment()
    if not cart[1] then return end

    local modListMsg = ""

    for k, v in ipairs(cart) do
        modListMsg = modListMsg .. "- " .. v.modLabel .. " " .. v.modLevel
    end

    local confirmation = lib.alertDialog({
        header = 'Payment confirmation',
        content = modListMsg,
        centered = false,
        cancel = true
    })

    if confirmation == "confirm" then
        lib.setVehicleProperties(cache.vehicle, currentVehProperties.new)
        TriggerServerEvent("ars_tuning:payMods", currentVehProperties.new)
        cart = {}
        return
    end

    lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
    cart = {}
end
