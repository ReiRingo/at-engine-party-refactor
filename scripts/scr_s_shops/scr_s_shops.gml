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
function s_gerson() : s_shopkeeper() constructor{
    obj = o_sk_gerson;
    bgobj = o_sk_gerson_bg;
    
    maintext = loc("* Woah there!\n* I've got some neat junk for sale.","＊ でも(w,1)…　みんな　こころの\nおくで　しんじてんのさ(w,1)。\n＊ いつかきっと　じゆうになれる\nひがくる　ってね。")
    leavetext = [
        "(varset,o_sk_gerson,emotion,3)* Already leavin will ya?",
        "(varset,o_sk_gerson,emotion,4)* If you say so!\n* See ya!"
    ] // placeholder text because i don't want to search gerson leave text
    
    bgm = mus_shop
}