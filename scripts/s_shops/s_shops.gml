function s_shopkeeper(){
    obj = noone; // shopkeeper object
    bgobj = noone; // background object
    
    maintext = "" // main menu text
    
    bgm = -1
}
function s_gerson() : s_shopkeeper() constructor{
    obj = o_sk_gerson;
    bgobj = o_sk_gerson_bg;
    
    maintext = loc("* Woah there!\n* I've got some neat junk for sale.","＊ でも(w,1)…　みんな　こころの\nおくで　しんじてんのさ(w,1)。\n＊ いつかきっと　じゆうになれる\nひがくる　ってね。")
    
    bgm = mus_shop
}