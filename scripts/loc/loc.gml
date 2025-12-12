function loc(argument0,argument1) {
	if (global.lang == "en")
		return argument0
	
	if (global.lang == "ja")
		return argument1
}

function loc_getfont(argument0) {
    if (argument0 == font_main) {
        if (global.lang == "ja")
			return font_main_ja
        return font_main
    }
    
    return argument0
}

function loc_getfontmono(argument0) {
    if (argument0 == font_main) {
        if (global.lang == "ja")
			return font_main_ja
        return font_main_mono
    }
    return argument0
}