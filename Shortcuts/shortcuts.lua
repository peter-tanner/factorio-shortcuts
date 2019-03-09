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
		name = "night-vision-toggle",
		order = "a[night-vision-toggle]",
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
		name = "belt-immunity-toggle",
		order = "a[belt-immunity-toggle]",
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
	-- Custom shortcut can be defined as follows:
	-- {
	--	 type = "shortcut",
	--	 name = "shortcut-name",
	--	 action = "lua",
	--	 toggleable = true, -- whether or not the shortcut button is a toggle button or not
	--	 order, localised_name, technology_to_unlock, icon, small_icon, disabled_icon, disabled_small_icon as above
	-- }
})
