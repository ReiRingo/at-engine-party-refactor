function loc(english_value,japanese_value) {
	if (global.lang == "en")
		return english_value
	
	if (global.lang == "ja")
		return japanese_value
}

function loc_getfont(font) {
    if (font == font_main) {
        if (global.lang == "ja")
			return font_main_ja
        return font_main
    }
    
    return font
}

function loc_getfontmono(font) {
    if (font == font_main) {
        if (global.lang == "ja")
			return font_main_ja
        return font_main_mono
    }
    return font
}
