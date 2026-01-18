extra_street_markings = {}

local labels = {
	{ "solid_white_center_line_corner", "Solid White Center Line (corner)", "streets_solid_center_line_corner.png", "white", 1, false }, 
}

for _,v in pairs(labels) do
	local nodename = v[1]
	local desc = v[2]
	local texture = v[3]
	local color = v[4]
	local dye_needed = v[5]
	local hide_from_inv = v[6]
	streets.register_label(desc, nodename, texture, color, dye_needed, hide_from_inv)
end

dofile(core.get_modpath("extra_street_markings").."/aliases.lua")