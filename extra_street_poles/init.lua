extra_street_poles = {
	poles = {
		{
			["name"] = "bigpole_short", 
			["desc"] = "Pole Short", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 }}, 
			["recipes"] = {
				[1] = {
					output = "extra_street_poles:bigpole_short 2",
					recipe = {"streets:bigpole"}
				},
				[2] = {
					output = "streets:bigpole 1", 
					recipe = {"extra_street_poles:bigpole_short", "extra_street_poles:bigpole_short"}
				},
			},
		},
		{
			["name"] = "bigpole_corner", 
			["desc"] = "Pole Corner", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }}, 
			["recipes"] = {
				[1] = {
					output = "extra_street_poles:bigpole_corner",
					recipe = {"streets:bigpole_edge", "extra_street_poles:bigpole_short"}
				},
			},
		},
		{
			["name"] = "bigpole_four_side_junction", 
			["desc"] = "Pole 4-Side-Junction", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }},
			["recipes"] = {
				[1] = {
					output = "extra_street_poles:bigpole_four_side_junction",
					recipe = {"streets:bigpole_short", "streets:bigpole_corner"}
				},
			},
		},
		{
			["name"] = "bigpole_cross", 
			["desc"] = "Pole Cross", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 }},
			["recipes"] = {
				[1] = {
					shaped = true,
					output = "extra_street_poles:bigpole_cross",
					recipe = {{ "", "extra_street_poles:bigpole_short", "" },{ "extra_street_poles:bigpole_short", "", "extra_street_poles:bigpole_short" },{ "", "extra_street_poles:bigpole_short", "" }}
				},
			},
		},
		{
			["name"] = "bigpole_five_side_junction", 
			["desc"] = "Pole 5-Side-Junction", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }},
			["recipes"] = {
				[1] = {
					output = "extra_street_poles:bigpole_five_side_junction",
					recipe = {"extra_street_poles:bigpole_cross","extra_street_poles:bigpole_short"}
				},
			},
		},
		{
			["name"] = "bigpole_all_sides", 
			["desc"] = "Pole All Sides", 
			["nodebox"] = {{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },{ -0.5, -0.15, -0.15, 0.5, 0.15, 0.15 }},
			["recipes"] = {
				[1] = {
					output = "extra_street_poles:bigpole_all_sides",
					recipe = {"extra_street_poles:bigpole_short", "extra_street_poles:bigpole_cross", "extra_street_poles:bigpole_short"}
				},
			},
		},
	},
	
	digi_default_rules = {
		{ x = 0, y = 0, z = -1 },
		{ x = 0, y = 0, z = 1 },
		{ x = 1, y = 0, z = 0 },
		{ x = -1, y = 0, z = 0 },
		{ x = 0, y = -1, z = 0 },
		{ x = 0, y = 1, z = 0 },
	},
}

dofile(core.get_modpath("extra_street_poles").."/nodes.lua")
dofile(core.get_modpath("extra_street_poles").."/crafts.lua")
dofile(core.get_modpath("extra_street_poles").."/aliases.lua")
