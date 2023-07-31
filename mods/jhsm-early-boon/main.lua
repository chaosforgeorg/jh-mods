nova.require "data/lua/core/common"
nova.require "data/lua/core/world"
nova.require "data/lua/jh/data/generator"

register_blueprint "jhsm_eb_runtime"
{
    flags = { EF_NOPICKUP },
    callbacks = {
        on_enter_level = [=[
            function ( self, entity, reenter )
                if reenter then return end
                local level = world:get_level()
                if world:get_id( level ) == "level_callisto_intro" then
                    local box = generator.find_lootbox( level )
                    if box then
                        local item = core.lists.item.special:roll( 3 + DIFFICULTY, { mod = 0 } )
                        box:attach( item )
                    end
                end
            end
        ]=],
    }
}

jhsm_eb = {}
function jhsm_eb.on_entity( entity )
    if entity.data and entity.data.ai and entity.data.ai.group == "player" then
        entity:attach( "jhsm_eb_runtime" )
    end 
end

world.register_on_entity( jhsm_eb.on_entity )
