local character_map_orig = Hooks:GetFunction(CharacterTweakData, "character_map")
Hooks:OverrideFunction(CharacterTweakData, "character_map", function(self, ...)

	local char_map = character_map_orig(self, ...)
	char_map.jambank = {
		path = "units/pd2_mod_jam/characters/",
		list = {
			"civ_male_tonis_manager"
		}
	}

	return char_map
end)