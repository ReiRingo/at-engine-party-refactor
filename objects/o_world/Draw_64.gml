var surf = application_surface

if (!surface_exists(surf))
    exit;
    
gpu_set_texfilter(false);
draw_rectangle(960/4 - 320, 540/4 - 240, 960/4 + 320 - 1, 540/4 + 240 - 1, false) // the cut-out
draw_surface_ext(surf,0,0,windowsize, windowsize,0,c_white,1);