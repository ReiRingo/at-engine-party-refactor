audio_play_sound(mus_story,1,false)
audio_sound_pitch(mus_story,0.91)
timer=0
alpha=1

fadeout = function(_speed){
	if (alpha>0)
		alpha-=_speed
}
fadein = function(_speed){
	if (alpha<1)
		alpha+=_speed
}