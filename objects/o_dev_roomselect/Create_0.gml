
rooms = []
room_names = []

var current = room_first
while (current != -1)
{
    if (room_exists(current))
    {
        array_push(rooms, current)
        array_push(room_names, string_lower(room_get_name(current)))
    }
    current = room_next(current)
}

search = ""
filtered = []
selection = 0
blink_timer = 0
blink_state = true
blink_speed = 30
backspace_hold = 0
backspace_delay=15
backspace_rate =3

function update_filter()
{
    filtered = []
    var count = array_length(room_names)
    for (var i = 0; i < count; i++)
    {
        if (search == "" || string_pos(search, room_names[i]) == 1)
        {
            array_push(filtered, i);
        }
    }
    selection = clamp(selection, 0, array_length(filtered) - 1)
}

update_filter();
depth = DEPTH_UI.MENU_UI
keyboard_string = "";
if instance_exists(o_actor_mainpl)
    o_actor_mainpl.moveable = false