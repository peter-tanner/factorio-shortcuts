require("shortcuts")

local function hide_the_remote(recipe, technology)
	data.raw["recipe"][recipe].hidden = true
	data.raw["recipe"][recipe].ingredients ={{"iron-plate", 1}}
	if technology ~= nil then
		local effect = data.raw["technology"][technology].effects
		for i=1,(#effect) do
			if effect[i].type == "unlock-recipe" then
				if effect[i].recipe == recipe then
					table.remove(effect, i)
				end
			end
		end
	end
end

hide_the_remote("artillery-targeting-remote", "artillery")
hide_the_remote("discharge-defense-remote", "discharge-defense-equipment")
if mods["YARM"] and data.raw["item"]["resource-monitor"] and data.raw["technology"]["resource-monitoring"] then
	hide_the_remote("resource-monitor", "resource-monitoring")
end
if mods["OutpostPlanner"] and mods["PlannerCore"] and data.raw["selection-tool"]["outpost-builder"] then
	hide_the_remote("outpost-builder", nil)
end
if mods["Orbital Ion Cannon"] and data.raw["item"]["ion-cannon-targeter"] and data.raw["technology"]["orbital-ion-cannon"] then
	hide_the_remote("ion-cannon-targeter", "orbital-ion-cannon")
end

local disabled_equipment = {}
local disabled_equipment_item = {}
local equipment_list = {
	"night-vision-equipment",
	"belt-immunity-equipment",
	"active-defense-equipment",
}
for i=1,(#equipment_list) do
	for _, equipment in pairs(data.raw[equipment_list[i]]) do
		local i = #disabled_equipment+1
		disabled_equipment[i] = util.table.deepcopy(equipment)
		local name = disabled_equipment[i].name
		if (equipment.type == "active-defense-equipment" and equipment.automatic == true) or equipment.type ~= "active-defense-equipment" then
			disabled_equipment[i].name = "disabled-" .. name
			disabled_equipment[i].localised_name = {"", {"equipment-name." .. name}, " (", {"gui-constant.off"}, ")"}
		elseif (equipment.type == "active-defense-equipment" and equipment.automatic == false) then
			disabled_equipment[i].name = "disabledinactive-" .. name
			disabled_equipment[i].localised_name = {"equipment-name." .. name}
		end
		disabled_equipment[i].energy_input = "0kW"
		disabled_equipment[i].take_result = name
		if equipment_list[i] == "belt-immunity-equipment" or (equipment.type == "active-defense-equipment" and equipment.automatic == true) then
			disabled_equipment[i].energy_source.input_flow_limit = "0kW"
			disabled_equipment[i].energy_source.buffer_capacity = "0kJ"
			disabled_equipment[i].energy_source.drain = "1kW"
		end
		
		if not data.raw["item"][equipment_list[i]] then --for mods which have a different item name compared to equipment name
			disabled_equipment_item[i] = util.table.deepcopy(data.raw["item"]["night-vision-equipment"])
			disabled_equipment_item[i].name = "disabled-" .. name
			disabled_equipment_item[i].hidden = true
			disabled_equipment_item[i].placed_as_equipment_result = name
		end
		
		disabled_equipment_item[i] = util.table.deepcopy(data.raw["item"][equipment_list[i]]) -- LEGACY ITEM (Disable for release)
		if not disabled_equipment_item[i] then
			disabled_equipment_item[i] = util.table.deepcopy(data.raw["item"]["night-vision-equipment"])
		end

		disabled_equipment_item[i].name = "disabled-" .. name
		disabled_equipment_item[i].hidden = true
		-- disabled_equipment_item[i].localised_name = {"", {"equipment-name." .. name}, " (", {"gui-constant.off"}, ")"}
		disabled_equipment_item[i].localised_description = {"item-description." .. name}
		disabled_equipment_item[i].placed_as_equipment_result = name
	end
end

for i=1,(#disabled_equipment),1 do
	data:extend({disabled_equipment[i]})
	if disabled_equipment_item[i] then
		data:extend({disabled_equipment_item[i]})
	end
end

local warning = {
		type = "virtual-signal", -- TODO: placeholder, when removing, remember to remove localised name too!
		name = "signal-danger",
		localised_name = {"gui-alert-tooltip.title"},
		icon = "__core__/graphics/danger-icon.png",
		icon_size = 64,
		subgroup = "virtual-signal-color",
		order = "d[colors]-[9danger]",
		hidden = true,
}

data:extend{(warning)}