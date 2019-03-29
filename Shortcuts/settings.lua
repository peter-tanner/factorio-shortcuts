data:extend({
	--	player
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
        type = "double-setting",
        name = "grid-chunk-line-width",
		localised_name = {"", {"gui.grid"}, " Chunk ", {"gui-map-editor-tool.line-selection"}, " ", {"gui-map-generator.map-width"}},
        setting_type = "runtime-per-user",
        default_value = 5,
		minimum_value = 0.0
    },
	{
        type = "double-setting",
        name = "grid-line-width",
		localised_name = {"", {"gui.grid"}, " ", {"gui-map-editor-tool.line-selection"}, " ", {"gui-map-generator.map-width"}},
        setting_type = "runtime-per-user",
        default_value = 0.25,
		minimum_value = 0.0
    },
	{
        type = "bool-setting",
        name = "grid-chunk-align",
		localised_name = {"", {"gui.grid"}, " ", {"gui-map-editor-clone-editor.snap-to-chunk"}},
        setting_type = "runtime-per-user",
        default_value = true
    },
	{
        type = "bool-setting",
        name = "grid-ground",
		localised_name = {"", {"gui-graphics-settings.graphics-quality-low"}, " ", {"gui.grid"}},
        setting_type = "runtime-per-user",
        default_value = true
    },
	{
        type = "int-setting",
        name = "grid-radius",
		localised_name = {"", {"gui.grid"}, " ", {"description.range"}},
        setting_type = "runtime-per-user",
        default_value = 128,
		minimum_value = 0
    },
	{
        type = "int-setting",
        name = "grid-step",
		localised_name = {"", {"gui.grid"}, " ", {"gui-map-generator.scale"}},
        setting_type = "runtime-per-user",
        default_value = 1,
		minimum_value = 0
    },
	
	--	server
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
    },
	
	--startup
	{
        type = "string-setting",
        name = "artillery-toggle",
		localised_name = {"", {"item-name.artillery-wagon-cannon"}, " ", {"gui-mod-info.toggle"}, " ", {"description.decorative-type"}},
        setting_type = "startup",
		allowed_values = {"both", "artillery-wagon", "artillery-turret"},
        default_value = "both"
    }
})