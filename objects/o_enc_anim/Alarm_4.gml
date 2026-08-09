if (on == 0)
{
    if (heartdraw == 1)
    {
        heartdraw = 0;
        on = 1;
        clap += 1;
    }
}

if (on == 0)
{
    if (heartdraw == 0)
    {
        audio_play_sound(snd_noise,1,false);
        on = 1;
        heartdraw = 1;
    }
}

on = 0;

if (clap > 2)
{
    if instance_exists(o_actor_mainpl)
        instance_create(o_enc_animsoul,o_actor_mainpl.x - 5, o_actor_mainpl.y - 13);
	else
		instance_create(o_enc_animsoul,0,0);
    heartdraw = 0;
    //o_enc_animsoul.depth = 100;
}
else
{
    alarm[4] = claptimer;
}