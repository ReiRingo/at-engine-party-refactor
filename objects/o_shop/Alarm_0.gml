if (shop!=undefined){
    if (asset_get_index(shop.bgobj)!=noone)
        instance_create(shop.bgobj,320/2,120,DEPTH_SHOP.BACKGROUND)
    if (asset_get_index(shop.obj)!=noone)
        instance_create(shop.obj,320/2,120,DEPTH_SHOP.SHOPKEEPER)
    maintext = shop.maintext
    leavetext = shop.leavetext
    mainmenu = shop.mainmenu
    textcreated = false
    textcreated1 = false
    audio_play_sound(shop.bgm,0,true)
}