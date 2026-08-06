if !(unselectioncheck){
    for (var i=0; i<array_length(mainmenu); i++){ 
        if (mainmenu[i].selectable){
            mselection=i
            break; 
        }
    }
    unselectioncheck=true
}
    
if (menu==SHOP_STATES.MAINMENU){ // main menu
    { // text
        if (textcreated!=undefined){
            if (!textcreated){
                maintextinst = instance_create(o_text_typer,20,130,DEPTH_SHOP.TEXT,{
                    on_gui: true,
                    line_length: 190,
                    text: maintext,
                })
                textcreated = true
            }
        }
    }
    { // input
        if (InputPressed(INPUT.DOWN)){
            var new_selection=mselection
            repeat (array_length(mainmenu)){
                new_selection++
                if (new_selection>=array_length(mainmenu))
                    new_selection = 0

                if (mainmenu[new_selection].selectable){
                    mselection=new_selection
                    audio_play_sound(snd_ui_move,1,false)
                    break
                }
            }
        }
        if (InputPressed(INPUT.UP)){
            var new_selection=mselection
            repeat (array_length(mainmenu)){
                new_selection--
                if (new_selection<0)
                    new_selection = array_length(mainmenu)-1

                if (mainmenu[new_selection].selectable){
                    mselection = new_selection
                    audio_play_sound(snd_ui_move,1,false)
                    break
                }
            }
        }
        if (InputPressed(INPUT.CONFIRM)){
            menu=mainmenu[mselection].result
            state=mainmenu[mselection].state
        }
    }
}
else{
    if instance_exists(maintextinst)
        instance_destroy(maintextinst)
    textcreated=false
}
if (menu==SHOP_STATES.TALKING&&state==STATE_TYPE.EXIT){ // main menu
    { // text
        if (textcreated1!=undefined){
            if (!textcreated1){
                leavetextinst = instance_create(o_dialog,20,130,DEPTH_SHOP.TEXT,{
                    width: 310,
                    text: leavetext,
                })
                textcreated1 = true
            }
        }
        if (textcreated1){
            if !instance_exists(leavetextinst){ 
                transitioner = instance_create(o_transition);
                transitioner.switched_event = function(){
                    room_goto(rm_test0)
                }
            }
        }
    }
}
else{
    textcreated1=false
}