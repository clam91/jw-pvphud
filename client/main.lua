    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Wait(100)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local health = IsEntityDead(ped) and 0 or GetEntityHealth(ped) - 100
            
            SendNUIMessage({
                action = 'updateStatus',
                health = health,
                armor = GetPedArmour(ped)
            })
            
            Wait(200)
        end
    end)


