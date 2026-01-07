{
    {
        if (global.facing == 1)
        {
            if (collision_point(bbox_right + 2, bbox_top - 2, o_solidparent, 0, 1) == -4)
            {
                x = xprevious + 3;
                y = yprevious - 3;
            }
            else
            {
                x = xprevious;
            }
        }
        
        if (global.facing == 0)
        {
            if (collision_point(bbox_left - 3, bbox_bottom + 3, o_solidparent, 0, 1) == -4)
            {
                x = xprevious - 3;
                y = yprevious + 3;
            }
            else
            {
                y = yprevious;
            }
        }
        
        if (global.facing == 2)
        {
            x = xprevious;
            y = yprevious - 3;
        }
        
        if (global.facing == 3)
        {
            y = yprevious;
            x = xprevious - 3;
        }
        
        if (InputPressedCheck(INPUT.DOWN) && InputPressedCheck(INPUT.RIGHT))
        {
            x = xprevious;
            y = yprevious;
        }
        
        if ((x % 3) != 0)
            x -= 1;
        
        if ((y % 3) != 0)
            y -= 1;
        
        moving = 0;
    }
}