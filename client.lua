ESX = nil Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end end)

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["T"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

RegisterNetEvent("wht-vehiclekey:keyOpen")
AddEventHandler("wht-vehiclekey:keyOpen", function(gelenplate)
    local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local VehiclesInArea = ESX.Game.GetVehiclesInArea(coords, 40)
    local veh = GetVehiclePedIsIn(ped, false)
    if #VehiclesInArea < 1 then
    ESX.ShowNotification("Yakinlarda Arac Yok !")
    end
    for i=1, #VehiclesInArea do
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(VehiclesInArea[i]))
       if gelenplate == plate then
        local a,b,c = table.unpack(GetEntityCoords(VehiclesInArea[i]))
        local dst = GetDistanceBetweenCoords(coords, a, b, c, true)
        if dst < 10 then
        local animdict = "anim@heists@keycard@"
        RequestAnimDict(animdict)
        while not HasAnimDictLoaded(animdict) do
            Citizen.Wait(1)
        end
        if not IsPedInAnyVehicle(PlayerPedId(), true) then
            TaskPlayAnim(PlayerPedId(), animdict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
        end
        if not IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorLockStatus(VehiclesInArea[i]) == 1 then --*Kilitleme  
                SetVehicleDoorsLocked(VehiclesInArea[i], 2)
                PlayVehicleDoorCloseSound(VehiclesInArea[i], 1)
                SetVehicleDoorShut(VehiclesInArea[i], 0, false)
                SetVehicleDoorShut(VehiclesInArea[i], 1, false)
                SetVehicleDoorShut(VehiclesInArea[i], 2, false)
                SetVehicleDoorShut(VehiclesInArea[i], 3, false)
                ESX.ShowNotification('Arac Kitlendi.')
                SetVehicleLights(VehiclesInArea[i], 2)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 0)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 2)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 0)
            elseif GetVehicleDoorLockStatus(VehiclesInArea[i]) == 2 then --*Acma
                if not IsPedInAnyVehicle(PlayerPedId(), true) then
                    TaskPlayAnim(PlayerPedId(), animdict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
                end
                SetVehicleDoorsLocked(VehiclesInArea[i], 1)
                PlayVehicleDoorOpenSound(VehiclesInArea[i], 0)
                ESX.ShowNotification('Aracin Kiliti Acildi.')
                SetVehicleLights(VehiclesInArea[i], 2)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 0)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 2)
                Citizen.Wait(150)
                SetVehicleLights(VehiclesInArea[i], 0)
            end
        else
             local car = GetVehiclePedIsIn(PlayerPedId(), false)
             local class = GetVehicleClass(car)
             Ap = nil
             if class == 0 then
                Ap = "Compact"
             
            elseif class == 1 then
                Ap = "Sedan"
            elseif class == 2 then
                Ap = "Suv"
            elseif class == 3 then
                Ap = "Coupes"
            elseif class == 4 then
                Ap = "Muscle"
            elseif class == 5 then
                Ap = "Sport Classic"
            elseif class == 6 then
                Ap = "Sport"
            elseif class == 7 then
                Ap = "Super"
            elseif class == 8 then
                Ap = "Motor"
            elseif class == 9 then
                Ap = "Off-Road"
            elseif class == 10 then
                Ap = "Industri"
            elseif class == 11 then
                Ap = "Utility"
            elseif class == 12 then
                Ap = "Van"
            elseif class == 13 then
                Ap = "Bisiklet"
            elseif class == 14 then
                Ap = "Bot"

            elseif class == 15 then
                Ap = "Helikopter"
            elseif class == 16 then
                Ap = "Ucak"
            elseif class == 17 then
                Ap = "Service"
            elseif class == 18 then
                Ap = "Emergency"
            elseif class == 19 then
                Ap = "Askeri"
            elseif class == 20 then
                Ap = "Commercial"
            elseif class == 17 then
                Ap = "Trains"
            end
            SendNUIMessage({
                type = "open",
                fuel = math.floor(car),
                gear = GetVehicleHighGear(car),
                plate = GetVehicleNumberPlateText(car),
                Classic = Ap,
              })
              print(Ap)
            SetNuiFocus(true, true)
        end
    end
end
end
end)

RegisterNUICallback("enginecontrol", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if GetIsVehicleEngineRunning(veh) == false then
        SetNuiFocus(false, false)
        SetVehicleEngineOn(veh, true, false, true)
    else
        SetNuiFocus(false, false)
        SetVehicleEngineOn(veh, false, false, true)
    end
end)

exports("VehicleKey",function(plate)
    TriggerServerEvent('wht-vehiclekey:AddKey',"vehiclekey", 1 , false, plate)
end)