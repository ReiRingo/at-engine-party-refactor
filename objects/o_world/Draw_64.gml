{ // resolution fix
	var surf = application_surface
	
	if (!surface_exists(surf))
		exit;
	
	gpu_set_texfilter(false); // remove the blurry text filter
	draw_surface_ext(surf,0, 0,windowsize, windowsize,0,c_white,1);
}