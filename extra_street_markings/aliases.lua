local aliases = {
	["streets:slope_mark_solid_line_solid_white_side_line_on_asphalt_half_raised"] = "streets:slope_solid_white_side_line_on_asphalt_half_raised",
	["streets:slope_mark_solid_line_solid_white_side_line_on_asphalt_half"] = "streets:slope_solid_white_side_line_on_asphalt_half",
	["streets:slope_mark_solid_line_solid_white_side_line_R180_on_asphalt_half_raised"] = "streets:slope_solid_white_side_line_rotated_on_asphalt_half_raised",
	["streets:slope_mark_solid_line_solid_white_side_line_R180_on_asphalt_half"] = "streets:slope_solid_white_side_line_rotated_on_asphalt_half",

}

for k,v in pairs(aliases) do
	core.register_alias(k, v)
end