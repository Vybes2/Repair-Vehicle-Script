RegisterCommand("repair", function(source, args)

local ped = GetPlayerPed(-1)
local currentVehicle = GetVehiclePedIsIn(ped, false)
local vehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
local vehicleEngineHealth = GetVehicleEngineHealth(currentVehicle)

if IsPedInAnyVehicle(ped) then
    SetVehicleBodyHealth(currentVehicle, 1000.0)
    SetVehicleEngineHealth(currentVehicle, 1000.0)
    SetVehicleFixed(currentVehicle)
    SetVehicleDeformationFixed(currentVehicle)

end
end, false
)

TriggerEvent("chat:addSuggestion", "/repair", "Repairs your vehicle")