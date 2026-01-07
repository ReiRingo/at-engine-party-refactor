{
    if (global.facing == 3)
    {
        if (collision_point(bbox_left - 2, bbox_top - 2, o_solidparent, 0, 1) == -4)
        {
            x = xprevious - 3;
            y = yprevious - 3;
        }
        else
        {
            x = xprevious;
        }
    }
    
    if (global.facing == 0)
    {
        if (collision_point(bbox_right + 3, bbox_bottom + 3, o_solidparent, 0, 1) == -4)
        {
            x = xprevious + 3;
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
    
    if (global.facing == 1)
    {
        y = yprevious;
        x = xprevious + 3;
    }
    
    if (InputPressedCheck(INPUT.DOWN) && InputPressedCheck(INPUT.LEFT))
    {
        x = xprevious;
        y = yprevious;
    }
    
    moving = 0;
    
    if ((x % 3) != 0)
        x += 1;
    
    if ((y % 3) != 0)
        y -= 1;
}