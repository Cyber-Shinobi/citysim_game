minetest.register_craft({
	output = 'grenade:grenade 4',
	recipe = {
		{'', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'tnt:gunpowder', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'bomb:bomb 3',
	recipe = {
		{'default:steel_ingot', 'tnt:gunpowder', 'farming:cotton'},
		{'default:steel_ingot', 'tnt:gunpowder', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'dynamite:dynamite 2',
	recipe = {
		{'', 'default:paper', 'farming:cotton'},
		{'default:paper', 'tnt:gunpowder', 'default:paper'},
		{'tnt:gunpowder', 'default:paper', ''},
	}
})

minetest.register_craft({
	output = 'explosive:explosive 1',
	recipe = {
		{'farming:cotton', 'farming:cotton', 'farming:cotton'},
		{'dynamite:dynamite', 'dynamite:dynamite', 'dynamite:dynamite'},
	}
})

minetest.register_craft({
	output = 'holyhandgrenade:holyhandgrenade 1',
	recipe = {
		{'', 'default:mese', ''},
		{'default:gold_ingot', 'explosive:explosive', 'default:gold_ingot'},
		{'', 'default:gold_ingot', ''},
	}
})

minetest.register_craft({
	output = 'tacticalnuke:tacticalnuke 1',
	recipe = {
		{'default:steelblock', 'holyhandgrenade:holyhandgrenade', 'default:steelblock'},
		{'default:steelblock', 'holyhandgrenade:holyhandgrenade', 'default:steelblock'},
		{'', 'default:diamondblock', ''},
	}
})