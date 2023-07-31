nova.require "data/lua/core/common"

register_blueprint "modcst_buff_combatstim"
{
	flags = { EF_NOPICKUP }, 
	text = {
		name = "Combat",
		desc = "pain resistance, {!+33%} action speed, {!+20% damage dealt}",
	},
	ui_buff = {
		color = LIGHTMAGENTA,
		style = 1,
	},
	attributes = {
		pain_max    = -50,
		speed       = 1.5,
        damage_mult = 1.2,
	},
}

register_blueprint "modcst_combatstim_small"
{
	flags = { EF_ITEM, EF_CONSUMABLE }, 
	lists = {
		group    = "item",
		keywords = { "medical", },
		weight   = 200,
		dmin     = 7,
		dmed     = 10,
	},
	text = {
		name = "combat stimpack",
		desc = "Standard military stimpack. Increases speed, grants pain resistance and adds {!20%} damage for a couple seconds. Oh and it doesn't heal...",
	},
	ascii     = {
		glyph     = "+",
		color     = MAGENTA,
	},
	stack = {
		max    = 3,
		amount = 1,
	},
	callbacks = {
		on_use = [=[
		function(self,entity)
			world:play_sound( "medkit_small", entity )
			local epain = entity:child("pain")
			if epain then
				epain.attributes.accuracy = 0
				epain.attributes.value    = 0
			end
			world:add_buff( entity, "modcst_buff_combatstim", 800 )
			ui:spawn_fx( entity, "fx_heal", entity )
			return 100
		end
		]=],
	},
}
