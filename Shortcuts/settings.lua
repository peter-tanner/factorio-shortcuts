data:extend({
    {
        type = "double-setting",
        name = "zoom-level",
		localised_name = {"", {"controls.alt-zoom-out"}, " ", {"description.module-bonus-limit"}},
        setting_type = "runtime-per-user",
        default_value = 0.1,
		minimum_value = 0.0,
		maximum_value = 16.0,
    },
	{
        type = "bool-setting",
        name = "disable-zoom",
		localised_name = {"", {"gui-control-behavior-modes.enable-disable"}, " ", {"controls.alt-zoom-out"}},
        setting_type = "runtime-global",
        default_value = true,
    },
	{
        type = "bool-setting",
        name = "disable-flare",
		localised_name = {"", {"gui-control-behavior-modes.enable-disable"}, " ", {"technology-name.military"}, " ", {"entity-name.beacon"}},
        setting_type = "runtime-global",
        default_value = true,
    }
})