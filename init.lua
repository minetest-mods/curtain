local S = core.get_translator("curtain")
local color_table = {
	{"white", "White"},
	{"grey", "Grey"},
	{"black", "Black"},
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"orange", "Orange"},
	{"violet", "Violet"},
	{"brown", "Brown"},
	{"pink", "Pink"},
	{"dark_grey", "Dark Grey"},
	{"dark_green", "Dark Green"}
}

for _,v in ipairs(color_table) do
	core.register_node("curtain:"..v[1].."_curtain_closed", {
		description = S(v[2].." Curtain"),
		tiles = {"wool_"..v[1]..".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
		},
		sounds = default.node_sound_defaults(),
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
		on_rightclick = function(pos, node, puncher)
			core.swap_node(pos, {name = "curtain:"..v[1].."_curtain_open", param2 = node.param2})
		end,
	})

	core.register_node("curtain:"..v[1].."_curtain_open", {
		description = S(v[2].." Curtain open"),
		tiles = {"wool_"..v[1]..".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
		},
		sounds = default.node_sound_defaults(),
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,not_in_creative_inventory=1},
		on_rightclick = function(pos, node, puncher)
			core.swap_node(pos, {name = "curtain:"..v[1].."_curtain_closed", param2 = node.param2})
		end,
		drop = "curtain:"..v[1].."_curtain_closed",
	})

	core.register_node("curtain:large_"..v[1].."_curtain_closed", {
		description = S("Large "..v[2].." Curtain"),
		tiles = {"wool_"..v[1]..".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -1.5, 0.4375, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -1.5, 0.3125, 0.5, 0.5, 0.5},
		},
		sounds = default.node_sound_defaults(),
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
		on_rightclick = function(pos, node, puncher)
			core.swap_node(pos, {name = "curtain:large_"..v[1].."_curtain_open", param2 = node.param2})
		end,
	})

	core.register_node("curtain:large_"..v[1].."_curtain_open", {
		description = S("Large "..v[2].." Curtain open"),
		tiles = {"wool_"..v[1]..".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -1.5, 0.3125, 0.5, 0.5, 0.5},
		},
		sounds = default.node_sound_defaults(),
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,not_in_creative_inventory=1},
		on_rightclick = function(pos, node, puncher)
			core.swap_node(pos, {name = "curtain:large_"..v[1].."_curtain_closed", param2 = node.param2})
		end,
		drop = "curtain:large_"..v[1].."_curtain_closed",
	})

	if core.registered_nodes["default:wool_"..v[1]] then
		core.register_craft({
			output = "curtain:"..v[1].."_curtain_closed",
			recipe = {
				{"group:stick"},
				{"default:carpet_"..v[1]},
			}
		})
	elseif (core.get_modpath("carpet_api")) then
		core.register_craft({
			output = "curtain:"..v[1].."_curtain_closed",
			recipe = {
				{"group:stick"},
				{"carpet:wool_"..v[1]},
			}
		})
	else
		core.register_craft({
			output = "curtain:"..v[1].."_curtain_closed 12",
			recipe = {
				{"group:stick", "group:stick", "group:stick"},
				{"wool:"..v[1], "wool:"..v[1], "wool:"..v[1]},
				{"wool:"..v[1], "wool:"..v[1], "wool:"..v[1]},
			}
		})
	end

	core.register_craft({
		output = "curtain:large_"..v[1].."_curtain_closed",
		recipe = {
			{"curtain:"..v[1].."_curtain_closed"},
			{"curtain:"..v[1].."_curtain_closed"},
		}
	})

	core.register_craft({
		output = "curtain:"..v[1].."_curtain_closed 2",
		recipe = {
			{"curtain:large_"..v[1].."_curtain_closed"},
		}
	})
end


-- Dummy S() calls for translation scripts.
--[[ To update run:
for _, v in ipairs(color_table) do print(("S(%q)"):format(v[2].." Curtain")) end
for _, v in ipairs(color_table) do print(("S(%q)"):format(v[2].." Curtain open")) end
for _, v in ipairs(color_table) do print(("S(%q)"):format("Large "..v[2].." Curtain")) end
for _, v in ipairs(color_table) do print(("S(%q)"):format("Large "..v[2].." Curtain open")) end
]]--

--[[
S("White Curtain")
S("Grey Curtain")
S("Black Curtain")
S("Red Curtain")
S("Yellow Curtain")
S("Green Curtain")
S("Cyan Curtain")
S("Blue Curtain")
S("Magenta Curtain")
S("Orange Curtain")
S("Violet Curtain")
S("Brown Curtain")
S("Pink Curtain")
S("Dark Grey Curtain")
S("Dark Green Curtain")
S("White Curtain open")
S("Grey Curtain open")
S("Black Curtain open")
S("Red Curtain open")
S("Yellow Curtain open")
S("Green Curtain open")
S("Cyan Curtain open")
S("Blue Curtain open")
S("Magenta Curtain open")
S("Orange Curtain open")
S("Violet Curtain open")
S("Brown Curtain open")
S("Pink Curtain open")
S("Dark Grey Curtain open")
S("Dark Green Curtain open")
S("Large White Curtain")
S("Large Grey Curtain")
S("Large Black Curtain")
S("Large Red Curtain")
S("Large Yellow Curtain")
S("Large Green Curtain")
S("Large Cyan Curtain")
S("Large Blue Curtain")
S("Large Magenta Curtain")
S("Large Orange Curtain")
S("Large Violet Curtain")
S("Large Brown Curtain")
S("Large Pink Curtain")
S("Large Dark Grey Curtain")
S("Large Dark Green Curtain")
S("Large White Curtain open")
S("Large Grey Curtain open")
S("Large Black Curtain open")
S("Large Red Curtain open")
S("Large Yellow Curtain open")
S("Large Green Curtain open")
S("Large Cyan Curtain open")
S("Large Blue Curtain open")
S("Large Magenta Curtain open")
S("Large Orange Curtain open")
S("Large Violet Curtain open")
S("Large Brown Curtain open")
S("Large Pink Curtain open")
S("Large Dark Grey Curtain open")
S("Large Dark Green Curtain open")
]]--
