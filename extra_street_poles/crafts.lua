for _,v in pairs(extra_street_poles.poles) do
	core.register_craft({
		type = (v.recipes[1].shaped and "shaped" or "shapeless"),
		output = v.recipes[1].output,
		recipe = v.recipes[1].recipe,
	})
	if v.recipes[2] then
		core.register_craft({
			type = (v.recipes[2].shaped and "shaped" or "shapeless"),
			output = v.recipes[2].output,
			recipe = v.recipes[2].recipe,
		})
	end
end