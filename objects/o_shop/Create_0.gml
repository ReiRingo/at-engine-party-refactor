audio_stop_all()
enum SHOP_STATES {
	MAINMENU,
    OTHERMENU,
    TALKING,
}
enum STATE_TYPE {
	BUY,
    SELL,
    TALK,
    EXIT,
}
#region initialize
    shop = undefined
    alarm[0]=1
#endregion initialize
#region main variables
    menu = SHOP_STATES.MAINMENU // menu
    state = noone
    mselection = 0 // main menu selection
#endregion main variables
#region customizable
    maintext = undefined
    leavetext = undefined
    mainmenu = undefined
#endregion customizable
#region instance variables
    maintextinst = noone
    leavetextinst = noone
#endregion instance variables
#region "only once" variables
    textcreated = undefined
    textcreated1 = undefined
    unselectioncheck = false
#endregion "only once" variables