if (other.phase == 0)
{
    x = xprevious;
    y = yprevious;
    
    {
        if (InputPressedCheck(INPUT.UP))
        {
            if (collision_rectangle(x + 2, y + 15, x + 18, y + 19, o_solidparent, 0, 1) > 0)
            {
                if (InputPressedCheck(INPUT.LEFT) && collision_line(bbox_left - 3, bbox_top, bbox_left, bbox_top, o_solidparent, false, true) < 0)
                {
                    x -= 3;
                    global.facing = 3;
                }
                
                if (InputPressedCheck(INPUT.RIGHT) && collision_line(bbox_right + 3, bbox_top, bbox_right, bbox_top, o_solidparent, false, true) < 0)
                {
                    x += 3;
                    global.facing = 1;
                }
            }
            else
            {
                y -= 3;
                global.facing = 2;
            }
        }
        
        if (InputPressedCheck(INPUT.DOWN))
        {
            if (collision_rectangle(x + 2, y + 30, x + 18, y + 33, o_solidparent, 0, 1) > 0)
            {
                if (InputPressedCheck(INPUT.LEFT) && collision_line(bbox_left - 3, bbox_bottom, bbox_left, bbox_bottom, o_solidparent, false, true) < 0)
                {
                    x -= 3;
                    global.facing = 3;
                }
                
                if (InputPressedCheck(INPUT.RIGHT) && collision_line(bbox_right + 3, bbox_bottom, bbox_right, bbox_bottom, o_solidparent, false, true) < 0)
                {
                    x += 3;
                    global.facing = 1;
                }
            }
            else
            {
                y += 3;
                global.facing = 0;
            }
        }
    }
    
    moving = 0;
}