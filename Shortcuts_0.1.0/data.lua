require("shortcuts")
data.raw["recipe"]["artillery-targeting-remote"].hidden = true
local effect = data.raw["technology"]["artillery"].effects
for i=1,(#effect),1 do
	if effect[i].type == "unlock-recipe" then
		if effect[i].recipe == "artillery-targeting-remote" then
			table.remove(effect, i)
		end
	end
end