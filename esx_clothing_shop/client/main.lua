ESX = exports['es_extended']:getSharedObject()

local inZone = false

local function closeShop()
    SendNUIMessage({
        action = 'close'
    })
    SetNuiFocus(false, false)
end

local function openShop()
    local elements = {}

    for _, outfit in ipairs(Config.Clothes) do
        table.insert(elements, {
            id = outfit.id,
            label = outfit.label,
            price = outfit.price
        })
    end

    SendNUIMessage({
        action = 'open',
        shopName = Config.Shop.name,
        outfits = elements
    })

    SetNuiFocus(true, true)
end

local function applyOutfit(outfit)
    local ped = PlayerPedId()

    for componentId, value in pairs(outfit) do
        SetPedComponentVariation(ped, tonumber(componentId), tonumber(value), 0, 0)
    end
end

RegisterNUICallback('buyOutfit', function(data, cb)
    if not data or not data.outfit then
        cb('ok')
        return
    end

    TriggerServerEvent('esx_clothing_shop:buyOutfit', data.outfit)
    closeShop()
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(_, cb)
    closeShop()
    cb('ok')
end)

RegisterNetEvent('esx_clothing_shop:applyOutfit', function(outfit)
    applyOutfit(outfit)
end)

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - Config.Shop.coords)

        if dist < Config.Shop.radius then
            if not inZone then
                inZone = true
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to open the clothing shop')
            end

            if IsControlJustReleased(0, 38) then
                openShop()
            end
        else
            if inZone then
                inZone = false
            end
        end

        Wait(250)
    end
end)
