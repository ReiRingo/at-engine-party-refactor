width  = 577/2;
height = 151/2;
xx=0
yy=0
top=is_top()
camerachangex=o_cam.x-320/2
camerachangey=o_cam.y-240/2
face = undefined;
faceid = 0;
voice = snd_text
save = false
text = "* It is known.";
line = 0;
skip_enabled = true;
t = undefined
choices = []
ch_index = 0;
on_choice = false;
player_free = true;
if (top){
	xx = 32/2;
	yy = 6;
}
else{
	xx = 32/2;
	yy = 320/2;
}
// print("c")
ready = false;