extra_street_markings = {}

function extra_street_markings.register_label(name, desc, texture)
	local groups = { snappy = 3, attached_node = 1, oddly_breakable_by_hand = 1 }
	core.register_node("extra_street_markings:mark_" .. name, {
		description = "Marking Overlay: " .. desc,
		tiles = { texture, "streets_rw_transparent.png" },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		inventory_image = texture,
		wield_image = texture,
		use_texture_alpha = "clip",
		after_place_node = function(pos)
			local node = core.get_node(pos)
			local lower_pos = { x = pos.x, y = pos.y - 1, z = pos.z }
			local lower_node = core.get_node(lower_pos)
			if lower_node.name == "streets:asphalt" then
				lower_node.name = "extra_street_markings:mark_" .. (node.name:sub(14)) .. "_on_asphalt"
				lower_node.param2 = node.param2
				core.set_node(lower_pos, lower_node)
				core.remove_node(pos)
			end
		end,
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.499, 0.5 },
		},
		selection_box = {
			type = "fixed",
			fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, -1 / 2 + 1 / 16, 1 / 2 },
		},
	})

	core.register_node("extra_street_markings:mark_" .. name .. "_on_asphalt", {
		description = "Asphalt With Marking: " .. desc,
		groups = { cracky = 3 },
		is_ground_content = false,
		tiles = {
			"streets_asphalt.png^" .. texture,
			"streets_asphalt.png",
			"streets_asphalt.png",
			"streets_asphalt.png",
			"streets_asphalt.png^" .. texture .. "^[transformR180",
			"streets_asphalt.png^" .. texture,
		},
		paramtype2 = "facedir",
		sounds = default.node_sound_stone_defaults(),
	})

	core.register_craft({
		output = "extra_street_markings:mark_" .. name .. "_on_asphalt",
		type = "shapeless",
		recipe = { "streets:asphalt", "extra_street_markings:mark_" .. name },
	})

	if core.get_modpath("moreblocks") then
		stairsplus:register_all("extra_street_markings", name, "extra_street_markings:mark_" .. name .. "_on_asphalt", {
			description = "Asphalt with Marking: " .. desc,
			tiles = {
				"streets_asphalt.png^" .. texture,
				"streets_asphalt.png",
				"streets_asphalt.png",
				"streets_asphalt.png",
				"streets_asphalt.png^" .. texture .. "^[transformR180",
				"streets_asphalt.png^" .. texture,
			},
			groups = { cracky = 3 },
			sounds = default.node_sound_stone_defaults(),
		})
	end
end

for _, tex in pairs(core.get_dir_list(core.get_modpath("extra_street_markings") .. "/textures")) do
	local name = tex:match("^streets_(.*)%.png") --trim from texture names
	local desc = ""
	local words = string.split(tex:match("^streets_(.*)%.png"), "_")
	for _, word in ipairs(words) do
		desc = desc
			.. string.upper(string.sub(word, 1, 1))
			.. string.sub(word, 2)
			.. (word ~= words[#words] and " " or "")
	end
	extra_street_markings.register_label(name, desc, tex)
end

dofile(core.get_modpath("extra_street_markings") .. "/aliases.lua")
