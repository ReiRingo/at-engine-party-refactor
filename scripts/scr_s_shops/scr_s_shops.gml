function s_shopkeeper(){
    obj = noone; // shopkeeper object
    bgobj = noone; // background object
    
    maintext = "" // main menu text
    leavetext = "" // leave text
    
    mainmenu = [
        new shop_textdata(SHOP_TEXT_TYPE.MAIN,loc("Buy","かう"), true, SHOP_STATES.OTHERMENU, STATE_TYPE.BUY),
        new shop_textdata(SHOP_TEXT_TYPE.MAIN,loc("Sell","うる"), true, SHOP_STATES.OTHERMENU, STATE_TYPE.SELL),
        new shop_textdata(SHOP_TEXT_TYPE.MAIN,loc("Talk","はなす"), true, SHOP_STATES.OTHERMENU, STATE_TYPE.TALK),
        new shop_textdata(SHOP_TEXT_TYPE.MAIN,loc("Exit","でる"), true, SHOP_STATES.TALKING, STATE_TYPE.EXIT),
    ]
    
    bgm = -1
}