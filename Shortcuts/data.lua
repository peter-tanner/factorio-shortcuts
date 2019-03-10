require("shortcuts")

data.raw["recipe"]["artillery-targeting-remote"].hidden = true
local effect = data.raw["technology"]["artillery"].effects
for i=1,(#effect) do
	if effect[i].type == "unlock-recipe" then
		if effect[i].recipe == "artillery-targeting-remote" then
			table.remove(effect, i)
		end
	end
end

local disabled_equipment = {}
local disabled_equipment_item = {}
local equipment_list = {
	"night-vision-equipment",
	"belt-immunity-equipment",
}
for i=1,(#equipment_list) do
	for _, equipment in pairs(data.raw[equipment_list[i]]) do
		local i = #disabled_equipment+1
		disabled_equipment[i] = util.table.deepcopy(equipment)
		disabled_equipment_item[i] = util.table.deepcopy(data.raw["item"][equipment_list[i]])
		local name = disabled_equipment[i].name
		local newname = "disabled-" .. name
		disabled_equipment[i].name = newname
		disabled_equipment[i].localised_name = {"", {"equipment-name." .. name}, " (", {"gui-constant.off"}, ")"}
		disabled_equipment[i].energy_input = "0kW"
		if equipment_list[i] == "belt-immunity-equipment" then
			disabled_equipment[i].energy_source.input_flow_limit = "0kW"
			disabled_equipment[i].energy_source.buffer_capacity = "0kJ"
			disabled_equipment[i].energy_source.drain = "1kW"
		end
		if not disabled_equipment_item[i] then
			disabled_equipment_item[i] = util.table.deepcopy(data.raw["item"]["night-vision-equipment"])
		end
		disabled_equipment_item[i].name = newname
		disabled_equipment_item[i].hidden = true
		disabled_equipment_item[i].localised_name = {"", {"equipment-name." .. name}, " (", {"gui-constant.off"}, ")"}
		disabled_equipment_item[i].localised_description = {"item-description." .. name}
		disabled_equipment_item[i].placed_as_equipment_result = newname
	end
end

for i=1,(#disabled_equipment),1 do
	data:extend({disabled_equipment_item[i]})
	data:extend({disabled_equipment[i]})
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