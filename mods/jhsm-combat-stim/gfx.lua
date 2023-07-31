nova.require "data/lua/gfx/common"

register_gfx_blueprint "modcst_combatstim_small"
{
	uisprite = {
		icon = "data/texture/ui/icons/ui_consumable_medkit",
		color = vec4( 1.0, 0.2, 0.5, 1.0 ),
	},
	light = {
		position    = vec3(0,0.1,0),
		color       = vec4(1.0,0.2,0.5,1),
	},
}