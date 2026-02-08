image_alpha=0
var asset = asset_get_index(music)
if !audio_is_playing(asset){
	music_id = audio_play_sound(asset,0,loop,gain)
	audio_sound_pitch(music_id,pitch)
}