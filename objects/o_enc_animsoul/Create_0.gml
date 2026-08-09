xx = o_cam.x-320/2;
yy = o_cam.y-240/2;
mode = 0;
mychoicex = xx + 19;
mychoicey = yy + 216+7;

spdr = distance_to_point(mychoicex,mychoicey)/17;
move_towards_point(mychoicex,mychoicey,spdr);
audio_play_sound(snd_battlefall,1,false);