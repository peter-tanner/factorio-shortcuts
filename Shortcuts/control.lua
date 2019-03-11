local function update_armor(event)
	local player = game.players[event.player_index]
	local power_armor = player.get_inventory(defines.inventory.player_armor)
	if power_armor and power_armor ~= nil and power_armor.valid then
		if power_armor[1].valid_for_read then
			if power_armor[1].grid and power_armor[1].grid.valid and power_armor[1].grid.width > 0 then
				global.shortcuts_armor[player.index] = power_armor[1].grid
			else
				table.remove(global.shortcuts_armor,player.index)
			end
		else
			table.remove(global.shortcuts_armor,player.index)
		end
	end
end

local function update_state(event, equipment_type)
	update_armor(event)
	local grid = global.shortcuts_armor[game.players[event.player_index].index]
	if grid then
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
					game.players[event.player_index].set_shortcut_toggled(equipment_type, false)
				elseif (string.sub(equipment.name,1,9) == "disabled-") then
					grid.take(equipment)
					local new_equipment = grid.put{name=(string.sub(name,10,#name)), position=position}
					if new_equipment and new_equipment.valid then
						new_equipment.energy = energy
					end
					game.players[event.player_index].set_shortcut_toggled(equipment_type, true)
				end
			end
		end
	end
end

local function toggle_light(player)
	if player.character then
		if global.shortcuts_light[player.index] == nil then
			global.shortcuts_light[player.index] = true
		end
		if global.shortcuts_light[player.index] == true then
			player.character.disable_flashlight()
			global.shortcuts_light[player.index] = false
			player.set_shortcut_toggled("flashlight-toggle", false)
		elseif global.shortcuts_light[player.index] == false then
			player.character.enable_flashlight()
			global.shortcuts_light[player.index] = true
			player.set_shortcut_toggled("flashlight-toggle", true)
		end
	else
		player.print({"", {"error.error-message-box-title"}, ": ", {"player-doesnt-exist", {"gui.character"}}, " (", {"controller.god"}, "): ", {"entity-name.small-lamp"}, " ", {"gui-mod-info.status-disabled"}})
	end
end

local function shortcut_type(event)
	local prototype_name = event.prototype_name
	if prototype_name == "night-vision-equipment" then
		update_state(event, "night-vision-equipment")
	elseif prototype_name == "belt-immunity-equipment" then
		update_state(event, "belt-immunity-equipment")
	elseif prototype_name == "flashlight-toggle" then
		toggle_light(game.players[event.player_index])
	elseif prototype_name == "big-zoom" then
		local player = game.players[event.player_index]
		if settings.global["disable-zoom"].value == true then
			player.zoom = settings.get_player_settings(player)["zoom-level"].value
		else
			player.print({"", {"error.error-message-box-title"}, ": ", {"controls.alt-zoom-out"}, " ", {"gui-mod-info.status-disabled"}})
		end
	elseif prototype_name == "signal-flare" then
		local player = game.players[event.player_index]
		if settings.global["disable-zoom"].value == true then
			player.force.print({"", "[img=virtual-signal.signal-danger] [color=1,0.1,0.1]", {"entity-name.player"}, " " ..  player.name .. " [gps=" .. math.floor(player.position.x+0.5) .. "," .. math.floor(player.position.y+0.5) ..  "][/color] [img=virtual-signal.signal-danger]"})
		else
			player.print({"", {"error.error-message-box-title"}, ": ", {"technology-name.military"}, " ", {"entity-name.beacon"}, " ", {"gui-mod-info.status-disabled"}})
		end
	end
end

local function update_inventory(event)
	local inventory = game.players[event.player_index].get_inventory(defines.inventory.player_main)
	if inventory and inventory.valid then
		inventory.remove("artillery-targeting-remote")
	end
end

local function reset_state(event)
	update_armor(event)
	local player = game.players[event.player_index]
	local grid = global.shortcuts_armor[game.players[event.player_index].index]
	if grid then
		for _, equipment in pairs(grid.equipment) do
			if equipment.type == "night-vision-equipment" then
				player.set_shortcut_available("night-vision-equipment", true)
				player.set_shortcut_toggled("night-vision-equipment", true)
			elseif equipment.type == "belt-immunity-equipment" then
				player.set_shortcut_available("belt-immunity-equipment", true)
				player.set_shortcut_toggled("belt-immunity-equipment", true)
			end
			if equipment.valid and equipment.type == "night-vision-equipment" or equipment.type == "belt-immunity-equipment" then
				local name = equipment.name
				local position = equipment.position
				local energy = equipment.energy
				if (string.sub(equipment.name,1,9) == "disabled-") then
					grid.take(equipment)
					local new_equipment = grid.put{name=(string.sub(name,10,#name)), position=position}
					if new_equipment and new_equipment.valid then
						new_equipment.energy = energy
					end								
				end
			end
		end
	else
		player.set_shortcut_available("night-vision-equipment", false)
		player.set_shortcut_available("belt-immunity-equipment", false)
		player.set_shortcut_toggled("night-vision-equipment", false)
		player.set_shortcut_toggled("belt-immunity-equipment", false)
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

script.on_event(defines.events.on_player_armor_inventory_changed, reset_state)
script.on_event(defines.events.on_player_placed_equipment, reset_state)
script.on_event(defines.events.on_player_removed_equipment, reset_state)

script.on_event(defines.events.on_lua_shortcut, shortcut_type)

script.on_event(defines.events.on_player_main_inventory_changed, update_inventory)

script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	player.set_shortcut_toggled("flashlight-toggle", true)
	player.set_shortcut_available("night-vision-equipment", false)
	player.set_shortcut_available("belt-immunity-equipment", false)
end)

script.on_init(initialize)
script.on_configuration_changed(initialize)