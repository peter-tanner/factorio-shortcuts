local function update_armor(event)
	player = game.players[event.player_index]
	power_armor = player.get_inventory(defines.inventory.player_armor)
	if power_armor and power_armor.valid then
		if power_armor[1].valid_for_read then
			if power_armor[1].grid and power_armor[1].grid.valid then
				global.shortcuts_armor[player.index] = power_armor[1].grid
			end
		end
	end
end

local function update_state(event, equipment_type)
	update_armor(event)
	player = game.players[event.player_index].index
	local grid = global.shortcuts_armor[player]
	for _, equipment in pairs(grid.equipment) do
		if equipment.valid and equipment.type == equipment_type then
			local name = equipment.name
			local position = equipment.position
			local energy = equipment.energy
			if not (string.sub(equipment.name,1,9) == "disabled-") then
				grid.take(equipment)
				local new_equipment = grid.put{name="disabled-" .. name, position=position}
				if new_equipment and new_equipment.valid then
					new_equipment.energy = energy
				end
			elseif (string.sub(equipment.name,1,9) == "disabled-") then
				grid.take(equipment)
				local new_equipment = grid.put{name=(string.sub(name,10,#name)), position=position}
				if new_equipment and new_equipment.valid then
					new_equipment.energy = energy
				end								
			end
		end
	end
end

local function toggle_light(player)
	if global.shortcuts_light[player.index] == nil then
		global.shortcuts_light[player.index] = true
	end
	if global.shortcuts_light[player.index] == true then
		player.character.disable_flashlight()
		global.shortcuts_light[player.index] = false
	elseif global.shortcuts_light[player.index] == false then
		player.character.enable_flashlight()
		global.shortcuts_light[player.index] = true
	end
end

local function toggle_type(event)
	if event.prototype_name == "night-vision-toggle" then
		update_state(event, "night-vision-equipment")
	elseif event.prototype_name == "belt-immunity-toggle" then
		update_state(event, "belt-immunity-equipment")
	elseif event.prototype_name == "flashlight-toggle" then
		toggle_light(game.players[event.player_index])
	end
end

local function initialize()
	if global.shortcuts_light == nil then
		global.shortcuts_light = {}
	end
	if global.shortcuts_armor == nil then
		global.shortcuts_armor = {}
	end
end

script.on_event(defines.events.on_player_armor_inventory_changed, update_armor)
script.on_event(defines.events.on_player_placed_equipment, update_armor)
script.on_event(defines.events.on_player_removed_equipment, update_armor)

script.on_event(defines.events.on_lua_shortcut, toggle_type)

script.on_init(initialize)
script.on_configuration_changed(initialize)