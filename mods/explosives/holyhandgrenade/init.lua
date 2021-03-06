local def = {
	name = "holyhandgrenade:explosion",
	description = "holyhandgrenade Explosion (you hacker you!)",
	radius = 10,
	tiles = {
		side = "holyhandgrenade_pow.png",
		top = "holyhandgrenade_pow.png",
		bottom = "holyhandgrenade_pow.png",
		burning = "holyhandgrenade_pow.png"
	},
}

tnt.register_tnt(def)


minetest.register_craftitem("holyhandgrenade:holyhandgrenade", {
	description = "holy hand grenade(the power of gods, is at you'r hand! [careful with it!])",
	range = 0,
	stack_max= 5,
	inventory_image = "holyhandgrenade_holyhandgrenade.png",
	on_use = function(itemstack, user, pointed_thing)
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointed_thing.type ~= "nothing" then
			local pointed = minetest.get_pointed_thing_position(pointed_thing)
			if vector.distance(user:getpos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = minetest.add_entity(pos, "holyhandgrenade:holyhandgrenade")
			if obj then
				minetest.sound_play("hallelujah", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:setacceleration({x=dir.x * -3, y=-10, z=dir.z * -3})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
})


minetest.register_entity("holyhandgrenade:holyhandgrenade", {
	physical = true,
	collide_with_objects = true,
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	weight = 0,
	textures = {"holyhandgrenade_holyhandgrenade.png"},
	on_activate = function(self, staticdata)
		self.timer = 0
	end,
	on_step = function(self, dtime)
		local acc = self.object:getacceleration()
		self.object:setacceleration({x = acc.x * 1 / 1, y = acc.y, z = acc.z * 1 / 1})

		self.timer = self.timer + dtime
		if self.timer > 6 then
			tnt.boom(self.object:getpos(), def)
		end
	end,
})
