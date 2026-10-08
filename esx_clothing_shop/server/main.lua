ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_clothing_shop:buyOutfit', function(outfitId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then
        return
    end

    local outfit = nil

    for _, item in ipairs(Config.Clothes) do
        if item.id == outfitId then
            outfit = item
            break
        end
    end

    if not outfit then
        TriggerClientEvent('esx:showNotification', src, 'This outfit does not exist.')
        return
    end

    if xPlayer.getMoney() < outfit.price then
        TriggerClientEvent('esx:showNotification', src, 'You do not have enough cash.')
        return
    end

    xPlayer.removeMoney(outfit.price)

    TriggerClientEvent('esx_clothing_shop:applyOutfit', src, outfit.outfit)
    TriggerClientEvent('esx:showNotification', src, 'You bought ' .. outfit.label .. ' for $' .. outfit.price .. '.')
end)
