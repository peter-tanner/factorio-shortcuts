require("util")

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

local function update_state(event, equipment_type) -- toggles the armor
	update_armor(event)
	local grid = global.shortcuts_armor[game.players[event.player_index].index]
	if grid then
		for _, equipment in pairs(grid.equipment) do
			if equipment.valid and equipment.type == equipment_type then
				local name = equipment.name
				local position = equipment.position
				local energy = equipment.energy
				if not (string.sub(equipment.name,1,9) == "disabled-") then
					if equipment_type ~= "active-defense-equipment" or (equipment_type == "active-defense-equipment" and game.equipment_prototypes["disabled-" .. equipment.name]) then
						grid.take(equipment)
						local new_equipment = grid.put{name="disabled-" .. name, position=position}
						if new_equipment and new_equipment.valid then
							new_equipment.energy = energy
						end
						game.players[event.player_index].set_shortcut_toggled(equipment_type, false)
					end
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
	if not game.active_mods["Nanobots"] then
		if prototype_name == "night-vision-equipment" then
			update_state(event, "night-vision-equipment")
			return
		elseif prototype_name == "belt-immunity-equipment" then
			update_state(event, "belt-immunity-equipment")
			return
		elseif prototype_name == "active-defense-equipment" then
			update_state(event, "active-defense-equipment")
			return
		end
	end
	if prototype_name == "flashlight-toggle" then
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

local function update_inventory(event) -- removes spare remotes
	local item_prototypes = game.item_prototypes
	local inventory = game.players[event.player_index].get_inventory(defines.inventory.player_main)
	if inventory and inventory.valid then
		inventory.remove("artillery-targeting-remote")
		inventory.remove("discharge-defense-remote")
		if item_prototypes["resource-monitor"] then
			inventory.remove("resource-monitor")
		end
		if item_prototypes["outpost-builder"] then
			inventory.remove("outpost-builder")
		end
		if item_prototypes["ion-cannon-targeter"] then
			inventory.remove("ion-cannon-targeter")
		end
		if item_prototypes["max-rate-calculator"] then
			inventory.remove("max-rate-calculator")
		end
	end
end

local function false_shortcuts(player) -- disables things
	player.set_shortcut_available("night-vision-equipment", false)
	player.set_shortcut_toggled("night-vision-equipment", false)
	player.set_shortcut_available("belt-immunity-equipment", false)
	player.set_shortcut_toggled("belt-immunity-equipment", false)
	player.set_shortcut_available("active-defense-equipment", false)
	player.set_shortcut_toggled("active-defense-equipment", false)
end

local function enable_it(player, equipment, grid, type) -- enables things
	if grid.valid and equipment.valid then
		local name = equipment.name
		local position = equipment.position
		local energy = equipment.energy
		player.set_shortcut_available(type, true)
		player.set_shortcut_toggled(type, true)
		if (string.sub(equipment.name,1,9) == "disabled-") then
			grid.take(equipment)
			local new_equipment = grid.put{name=(string.sub(name,10,#name)), position=position}
			if new_equipment and new_equipment.valid then
				new_equipment.energy = energy
			end								
		end
	end
end
local function reset_state(event, toggle) -- verifies placement of equipment and armor switching
	update_armor(event)
	local player = game.players[event.player_index]
	local grid = global.shortcuts_armor[game.players[event.player_index].index]
	if grid then
		local equipment = event.equipment
		if equipment and toggle == 1 then --place
			local type = equipment.type
			if type == "night-vision-equipment" or type == "belt-immunity-equipment" or (type == "active-defense-equipment" and game.equipment_prototypes["disabledinactive-" .. equipment.name] == nil) then
				for _, equipment in pairs(grid.equipment) do
					if equipment.valid and equipment.type == type then
						enable_it(player, equipment, grid, type)
					end
				end
			end
		elseif equipment and toggle == 2 then --take
			local type = game.equipment_prototypes[equipment].type
			local name = game.equipment_prototypes[equipment].name
			if type == "night-vision-equipment" or type == "belt-immunity-equipment" or type == "active-defense-equipment" then
				local value = false
				for _, equipment in pairs(grid.equipment) do
					if equipment.type == type and equipment.valid then
						if type ~= "active-defense-equipment" then
							value = true
							break
						elseif type == "active-defense-equipment" and game.equipment_prototypes["disabledinactive-" .. equipment.name] == nil then
							value = true
							break
						end
					end
				end
				if value == false then
					player.set_shortcut_available(type, false)
					player.set_shortcut_toggled(type, false)
				end
			end
		elseif toggle == 0 then --armor place
			false_shortcuts(player)
			for _, equipment in pairs(grid.equipment) do
				local type = equipment.type
				if equipment.valid and type == "night-vision-equipment" or type == "belt-immunity-equipment" or (type == "active-defense-equipment" and game.equipment_prototypes["disabledinactive-" .. equipment.name] == nil) then
					enable_it(player, equipment, grid, equipment.type)
				end
			end
		end
	else
		false_shortcuts(player)
	end
end

local function artillery_swap(wagon,new_name)
	local shellname = {}
	local shellcount = {}
	local inventory = table.deepcopy(wagon.get_inventory(defines.inventory.artillery_wagon_ammo))
	for i=1,(#inventory) do
		if inventory[i].valid_for_read then
			shellname[#shellname+1] = inventory[i].name
			shellcount[#shellcount+1] = inventory[i].count
		end
	end
	
	local name = wagon.name
	local surface = wagon.surface.name
	local position = wagon.position
	local direction = wagon.direction
	local force = wagon.force
	local kills = wagon.kills
	local damage = wagon.damage_dealt
	local health = wagon.health
	wagon.destroy()
	local new_wagon = game.surfaces[surface].create_entity{name=new_name, position=position, direction=direction, force=force, kills=kills, damage=damage, create_build_effect_smoke=false}
	if new_wagon then
		new_wagon.health = health
		for i=1,(#shellcount) do
			if new_wagon.can_insert({name=shellname[i],count=shellcount[i]}) == true then
				new_wagon.insert({name=shellname[i],count=shellcount[i]})
			end
		end
	end
	return new_wagon
end

local function jam_artillery(event)
	if event.item == "artillery-jammer-tool" and event.entities ~= nil then
		for _, wagon in pairs(event.entities) do
			local name = wagon.name
			if wagon.valid and wagon.type == "artillery-wagon" and not (string.sub(name,1,9) == "disabled-") then
				local new_name = ("disabled-" .. name)
				local new_wagon = artillery_swap(wagon,new_name)
				rendering.draw_sprite{sprite="virtual-signal.signal-disabled", x_scale=1.5, y_scale=1.5, target_offset={0.0,-0.5}, render_layer="entity-info-icon", target=new_wagon, surface=new_wagon.surface, forces={new_wagon.force}}
			elseif wagon.valid and wagon.type == "artillery-wagon" and (string.sub(name,1,9) == "disabled-") then
				local new_name = (string.sub(name,10,#name))
				artillery_swap(wagon,new_name)
			end
		end
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

script.on_event(defines.events.on_player_armor_inventory_changed, function(event)
	if not game.active_mods["Nanobots"] then
		reset_state(event,0)
	end
end)
script.on_event(defines.events.on_player_placed_equipment, function(event)
	if not game.active_mods["Nanobots"] then
		reset_state(event,1)
	end
end)
script.on_event(defines.events.on_player_removed_equipment, function(event)
	if not game.active_mods["Nanobots"] then
		reset_state(event,2)
	end
end)

script.on_event(defines.events.on_lua_shortcut, shortcut_type)

script.on_event(defines.events.on_player_main_inventory_changed, update_inventory)

script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	if not game.active_mods["Nanobots"] then
		player.set_shortcut_toggled("flashlight-toggle", true)
		player.set_shortcut_available("night-vision-equipment", false)
		player.set_shortcut_available("belt-immunity-equipment", false)
		player.set_shortcut_available("active-defense-equipment", false)
	else
		player.print("WARNING: Shortcuts for modular equipment disabled as Nanobots is installed")
		player.print("> Use the Nanobots hotkeys instead: \"Ctrl F1 - F7 Will toggle specific modular armor equipment on or off\"")
	end
end)

script.on_event(defines.events.on_player_selected_area, jam_artillery)

script.on_init(initialize)
script.on_configuration_changed(initialize)