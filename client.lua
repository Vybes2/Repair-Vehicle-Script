local waitTime = 0

RegisterCommand("repair", function(source, args)
    local ped = GetPlayerPed(-1)
    
    if IsPedInAnyVehicle(ped, false) then
        local currentVehicle = GetVehiclePedIsIn(ped, false)
        local vehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
        local vehicleEngineHealth = GetVehicleEngineHealth(currentVehicle)

        if vehicleBodyHealth <= 500 and vehicleEngineHealth <= 500 then
            waitTime = 10000

            Citizen.Wait(waitTime)

            SetVehicleBodyHealth(currentVehicle, 1000.0)
            SetVehicleEngineHealth(currentVehicle, 1000.0)
            SetVehicleFixed(currentVehicle)
            SetVehicleDeformationFixed(currentVehicle)
        else
            TriggerEvent("chat:addMessage", { args = {"^1Error", "Your vehicle is not damaged enough to be repaired."} })
        end
    else
        TriggerEvent("chat:addMessage", { args = {"^1Error", "You are not in a vehicle."} })
    end
end)

TriggerEvent("chat:addSuggestion", "/repair", "Repairs your vehicle")
TriggerEvent("chat:addMessage", "You must wait " .. waitTime/1000 .. " seconds before your car is repaired.")
