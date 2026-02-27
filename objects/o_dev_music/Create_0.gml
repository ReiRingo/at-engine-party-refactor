image_alpha = 0
var asset = asset_get_index(music)
if (asset!=-1){
    if (!audio_is_playing(asset)){
        audio_play_sound(asset,0,loop,gain,0,pitch)
    }

}