moving = (x != xprevious || y != yprevious) 
if (!moving) {
    image_speed = 0;
    image_index = 0;
} else {image_speed = 1}

event_inherited()