# grenade

WTFPL

minetest.register_craftitem("bomb:bomb", {
	description = "bomb (explosion damages a small area)",
	inventory_image = "bomb_bomb.png",
	on_use = function(itemstack, user, pointed_thing)
		local v = user:get_look_dir()
		local pos = user:getpos()
		pos.y = pos.y + 1.2

		local obj = minetest.add_entity(pos, "bomb:bomb")
		obj:setvelocity({x = v.x * 15, y = v.y * 2 + 10, z = v.z * 15})
		obj:setacceleration({x = v.x / 10, y = v.y / 2 - 5, z = v.z / 10})

		itemstack:take_item()
		return itemstack
	end,
})