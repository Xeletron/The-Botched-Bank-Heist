Hooks:PostHook(DialogManager, "_play_dialog", "jambank_dialog_start", function()
    if Global.music_manager.current_track and Global.music_manager.current_event then
        SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 0.37 * 100)
    end
end)

Hooks:PostHook(DialogManager, "_stop_dialog", "jambank_dialog_start", function()
    SoundDevice:set_rtpc("option_music_volume", Global.music_manager.volume * 100)
end)