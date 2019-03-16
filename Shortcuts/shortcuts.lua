data:extend(
{
	{
		type = "shortcut",
		name = "artillery-targeting-remote",
		order = "a[artillery-targeting-remote]",
		action = "create-blueprint-item",
		localised_name = {"item-name.artillery-targeting-remote"},
		technology_to_unlock = "artillery",
		item_to_create = "artillery-targeting-remote",
		style = "red",
		icon =
		{
			filename = "__Shortcuts__/graphics/artillery-targeting-remote-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/artillery-targeting-remote-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/artillery-targeting-remote-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "night-vision-equipment",
		order = "a[night-vision-equipment]",
		action = "lua",
		localised_name = {"equipment-name.night-vision-equipment"},
		technology_to_unlock = "night-vision-equipment",
		toggleable = true,
		icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x32.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "discharge-defense-remote",
		order = "a[discharge-defense-remote]",
		action = "create-blueprint-item",
		localised_name = {"item-name.discharge-defense-remote"},
		technology_to_unlock = "discharge-defense-equipment",
		item_to_create = "discharge-defense-remote",
		style = "red",
		icon =
		{
			filename = "__Shortcuts__/graphics/discharge-defense-remote-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/discharge-defense-remote-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/discharge-defense-remote-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "night-vision-equipment",
		order = "a[night-vision-equipment]",
		action = "lua",
		localised_name = {"equipment-name.night-vision-equipment"},
		technology_to_unlock = "night-vision-equipment",
		toggleable = true,
		icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x32.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/night-vision-toggle-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},	
	{
		type = "shortcut",
		name = "active-defense-equipment",
		order = "a[active-defense-equipment]",
		action = "lua",
		localised_name = {"equipment-name.personal-laser-defense-equipment"},
		technology_to_unlock = "personal-laser-defense-equipment",
		toggleable = true,
		icon =
		{
			filename = "__Shortcuts__/graphics/active-defense-equipment-x32.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/active-defense-equipment-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/active-defense-equipment-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "belt-immunity-equipment",
		order = "a[belt-immunity-equipment]",
		action = "lua",
		localised_name = {"item-name.belt-immunity-equipment"},
		technology_to_unlock = "belt-immunity-equipment",
		toggleable = true,
		icon =
		{
			filename = "__Shortcuts__/graphics/belt-immunity-toggle-x32.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/belt-immunity-toggle-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/belt-immunity-toggle-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},	
	{
		type = "shortcut",
		name = "flashlight-toggle",
		order = "a[flashlight-toggle]",
		technology_to_unlock = "electronics",
		action = "lua",
		localised_name = {"entity-name.small-lamp"},
		toggleable = true,
		icon =
		{
			filename = "__Shortcuts__/graphics/flashlight-toggle-x32.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/flashlight-toggle-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/flashlight-toggle-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "big-zoom",
		order = "a[big-zoom]",
		technology_to_unlock = "optics",
		action = "lua",
		localised_name = {"controls.alt-zoom-out"},
		toggleable = true,
		style = "blue",
		icon =
		{
			filename = "__Shortcuts__/graphics/big-zoom-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/big-zoom-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/big-zoom-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	{
		type = "shortcut",
		name = "signal-flare",
		order = "a[signal-flare]",
		technology_to_unlock = "electronics",
		action = "lua",
		localised_name = {"", {"technology-name.military"}, " ", {"entity-name.beacon"}, " (", {"description.force"}, " ", {"deconstruction-tile-mode.only"}, ")"},
		toggleable = true,
		style = "red",
		icon =
		{
			filename = "__Shortcuts__/graphics/signal-flare-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/signal-flare-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/signal-flare-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	},
	-- Custom shortcut can be defined as follows:
	-- {
	--	 type = "shortcut",
	--	 name = "shortcut-name",
	--	 action = "lua",
	--	 toggleable = true, -- whether or not the shortcut button is a toggle button or not
	--	 order, localised_name, technology_to_unlock, icon, small_icon, disabled_icon, disabled_small_icon as above
	-- }
})

if mods["YARM"] and data.raw["item"]["resource-monitor"] and data.raw["technology"]["resource-monitoring"] then
data:extend(
{
	{
		type = "shortcut",
		name = "resource-monitor",
		order = "a[resource-monitor]",
		action = "create-blueprint-item",
		localised_name = {"item-name.resource-monitor"},
		technology_to_unlock = "resource-monitoring",
		item_to_create = "resource-monitor",
		style = "green",
		icon =
		{
			filename = "__Shortcuts__/graphics/resource-monitor-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/resource-monitor-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/resource-monitor-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	}
})
end

if mods["OutpostPlanner"] and mods["PlannerCore"] and data.raw["selection-tool"]["outpost-builder"] then
data:extend(
{
	{
		type = "shortcut",
		name = "outpost-builder",
		order = "a[outpost-builder]",
		action = "create-blueprint-item",
		localised_name = {"item-name.outpost-builder"},
		-- technology_to_unlock = "resource-monitor",
		item_to_create = "outpost-builder",
		style = "green",
		icon =
		{
			filename = "__Shortcuts__/graphics/outpost-builder-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/outpost-builder-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/outpost-builder-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	}
})
end

if mods["Orbital Ion Cannon"] and data.raw["item"]["ion-cannon-targeter"] and data.raw["technology"]["orbital-ion-cannon"] then
data:extend(
{
	{
		type = "shortcut",
		name = "ion-cannon-targeter",
		order = "a[ion-cannon-targeter]",
		action = "create-blueprint-item",
		localised_name = {"item-name.ion-cannon-targeter"},
		technology_to_unlock = "orbital-ion-cannon",
		item_to_create = "ion-cannon-targeter",
		style = "red",
		icon =
		{
			filename = "__Shortcuts__/graphics/ion-cannon-targeter-x32-white.png",
			priority = "extra-high-no-scale",
			size = 32,
			scale = 1,
			flags = {"icon"}
		},
		small_icon =
		{
			filename = "__Shortcuts__/graphics/ion-cannon-targeter-x24.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
		disabled_small_icon =
		{
			filename = "__Shortcuts__/graphics/ion-cannon-targeter-x24-white.png",
			priority = "extra-high-no-scale",
			size = 24,
			scale = 1,
			flags = {"icon"}
		},
	}
})
end