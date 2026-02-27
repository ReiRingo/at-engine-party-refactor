if (live_call()) return live_result;
#region initialize
    shop = new s_gerson()
    if (asset_get_index(shop.obj)!=noone)
        instance_create(shop.obj,320/2,120,depth+1)
    if (asset_get_index(shop.bgobj)!=noone)
        instance_create(shop.bgobj,320/2,120,depth+2)
#endregion initialize
#region main variables
    song = shop.bgm // song
    menu = 0 // menu
    mselection = 0 // main menu selection
#endregion main variables
#region functions
    function MainMData(_name, _selectable, _result) constructor {
        name = _name;
        selectable = _selectable;
        result = _result
    }
#endregion functions
#region customizable
    maintext = shop.maintext
    mainmenu = [
        new MainMData(loc("Buy","かう"), true, 1),
        new MainMData(loc("Sell","うる"), true, 2),
        new MainMData(loc("Talk","はなす"), true, 3),
        new MainMData(loc("Exit","でる"), true, 4),
    ]
#endregion customizable
#region instance variables
    maintextinst = noone
#endregion instance variables
#region "only once" variables
        songplayed = false
        textcreated = false
        unselectioncheck = false
#endregion "only once" variables