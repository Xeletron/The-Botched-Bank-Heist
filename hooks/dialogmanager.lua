local function lower_volume()
    if Global.music_manager.current_track and Global.music_manager.current_event then
        SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 0.37 * 100)
    end
end

local function reset_volume()
    SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 100)
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