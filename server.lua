ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterUsableItem("vehiclekey", function(source, item)
    local xPlayer = ESX.GetPlayerFromId(source)
        for k,v in pairs(xPlayer.getInventory()) do
        if v.name == 'vehiclekey' then
        TriggerClientEvent("wht-vehiclekey:keyOpen", source, v.info.plate)
        end
    end 
end)

RegisterServerEvent("wht-vehiclekey:AddKey")
AddEventHandler("wht-vehiclekey:AddKey",function(item, count, slot, infos)
    local xPlayer = ESX.GetPlayerFromId(source)
    info = {
        plate = infos
    }
    xPlayer.addInventoryItem(item, count, slot, info)
end)