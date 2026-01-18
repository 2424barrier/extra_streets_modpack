for _,v in pairs(extra_street_poles.poles) do
	core.register_alias("streets:" .. v.name, "extra_street_poles:" .. v.name)
end