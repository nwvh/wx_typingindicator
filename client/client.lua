function DrawText3Ds(x, y, z, text)
  local _, x1, y1 = World3dToScreen2d(x, y, z)
  local fontId = RegisterFontId('BBN')
  SetTextScale(0.55, 0.55)
  SetTextFont(fontId)
  SetTextProportional(1)
  SetTextEntry("STRING")
  SetTextCentre(true)
  SetTextDropshadow(10, 100, 100, 100, 255)
  SetTextColour(255, 255, 255, 215)
  AddTextComponentString(text)
  DrawText(x1, y1)
  local factor = (string.len(text)) / 320
  DrawRect(x1,y1+0.0200, 0.015+ factor, 0.04, 0, 0, 0, 68)
end

local dots = 1
local string = ""

local active = true
Citizen.CreateThread(function ()
  while true do
    Wait(300)
    active = exports["chat"]:isActive()
    TriggerServerEvent("wx_typing:syncPlayer",active)
  end
end)

Citizen.CreateThread(function ()
  while true do
    Wait(1)
    string = "[" .. string.rep(".", dots) .. "]"
    dots = dots % 3 + 1
    Citizen.Wait(600)
end
end)

local coords = {}
CreateThread(function ()
  while true do
    Wait(0)
      for k,v in pairs(coords) do
        if coords[k] then
          local x,y,z = table.unpack(coords[k])
          DrawText3Ds(x, y, z+1, string)
        end
      end
  end
end)


RegisterNetEvent('wx_typing:syncPlayers',function (data)
  for k,v in pairs(data) do
    coords[data.id] = data.coords
  end
end)

RegisterNetEvent('wx_typing:unsyncPlayer',function (id)
  coords[id] = nil
end)