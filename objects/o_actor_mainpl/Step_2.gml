if (!InputPressedCheck(INPUT.LEFT))
if (!InputPressedCheck(INPUT.RIGHT))
if (!InputPressedCheck(INPUT.DOWN))
if (!InputPressedCheck(INPUT.UP))
    moving = 0;

if (abs(xprevious - x) > 0.01 || abs(yprevious - y) > 0.01)
    moving = 1;

if (moving == 0)
{
    image_speed = 0;
    image_index = 0;
}

event_inherited()