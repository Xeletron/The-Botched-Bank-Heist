local function lower_volume()
    SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 50)
    SoundDevice:set_rtpc("ingame_sound", 0.7)
end

local function reset_volume()
    SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 100)
    SoundDevice:set_rtpc("ingame_sound", 1)
end

Hooks:PostHook(DialogManager, "_play_dialog", "jambank_dialog_start", function()
    lower_volume()
end)

Hooks:PostHook(VoiceBriefingManager, "post_event", "jambank_briefing_start", function()
    lower_volume()
end)

Hooks:PostHook(DialogManager, "_stop_dialog", "jambank_dialog_end", function()
    reset_volume()
end)

Hooks:PostHook(VoiceBriefingManager, "_end_of_event", "jambank_briefing_end", function()
    reset_volume()
end)