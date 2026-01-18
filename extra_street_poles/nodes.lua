for _,v in pairs(extra_street_poles.poles) do
	core.register_node("extra_street_poles:" .. v.name, {
		description = v.desc,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		drawtype = "nodebox",
		tiles = { "streets_pole.png" },
		sunlight_propagates = true,
		groups = { cracky = 1, level = 2, bigpole = 1 },
		node_box = {
			type = "fixed",
			fixed = v.nodebox
		},
		on_place = core.rotate_node,
		digiline = {
			wire = {
				rules = extra_street_poles.digi_default_rules,
			}
		},
	})
end
