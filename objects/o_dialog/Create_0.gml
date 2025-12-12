width  = 577/2;
height = 151/2;
xx = 32/2;
yy = 320/2;
face = undefined;
faceid = -1;
voice = snd_text

if global.lang="en"{
	text = [
		"{wavy(true)}* (Knowing the mouse{wavy(false)} might one{nl}day {shaky(true)}extract the cheese from{nl}the mys{shaky(false)}tical crystal...)",
		"* It fills you with{nl}determination.)",
	];
}else{
	text = [
		"＊ タリラリラ～♪",
	];
}

line = 0;
skip_enabled = true;
t = noone;
depth=DEPTH_UI.DIALOGUE_UI
global.console = true;