local active = {}

RegisterNetEvent('wx_typing:syncPlayer',function (status)
    active[source] = status
end)

CreateThread(function ()
    while true do
        Wait(500)
        for k,v in pairs(active) do
            if v then
                local coords = GetEntityCoords(GetPlayerPed(k))
                TriggerClientEvent('wx_typing:syncPlayers',-1,{id=k,coords=coords})
            else
                TriggerClientEvent('wx_typing:unsyncPlayer',-1,k)

            end
        end
    end
end)