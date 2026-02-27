if (live_call()) return live_result;
if !(songplayed){
    audio_play_sound(song,0,true)
    songplayed = true
}
if !(unselectioncheck){
    for (var i=0; i<array_length(mainmenu); i++){ 
        if (mainmenu[i].selectable){
            mselection=i
            break; 
        }
    }
    unselectioncheck=true
}
    
if (menu==0){ // main menu
    { // text
        if (!textcreated){
            maintextinst = instance_create(o_text_typer,20,130,DEPTH_UI.MENU_UI,{
                on_gui: true,
                line_length: 190,
                text: maintext,
            })
            textcreated = true
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
        }
    }
}
else{
    if instance_exists(maintextinst)
        instance_destroy(maintextinst)
    textcreated=false
}