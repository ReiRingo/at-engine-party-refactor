if (array_length(enemies) <= 0) {
	turn = BATTLE_TURN.RESULT	
}

if (!instance_exists(flavorinst)){
	flavorinst = instance_create(o_text_typer,txt.x,txt.y,depth-1,{ 
        on_gui: true,
        text: "(voice,snd_text2)"+flavort,
    })
}

switch(turn) {
	case BATTLE_TURN.PLAYER:
		switch(menu.current) {
			case BATTLE_MENU.MAIN:
				set_controls(InputPressed(INPUT.RIGHT)-InputPressed(INPUT.LEFT),array_length(buttons)-1)
				if (InputPressed(INPUT.CONFIRM)) {
					buttons[index.current].press();
				}
			break;
	
			case BATTLE_MENU.CHOOSE_ENEMY: 
                set_controls(InputPressed(INPUT.DOWN)-InputPressed(INPUT.UP),array_length(enemies)-1) 
                if (InputPressed(INPUT.CONFIRM)) { 
                    if (menu.subcurrent==BATTLE_MENU.ACT) { 
                        act_enemy_index = index.current 
                        act_index = 0 
                        set_menu(BATTLE_MENU.ACT,0) 
                    } 
                } 
            break;
			
			case BATTLE_MENU.ACT: 
                var acts = enemies[act_enemy_index].acts 
                set_controls_grid(array_length(acts)) 
                act_index = index.current

                if (InputPressed(INPUT.CONFIRM)) { 
                    turn = BATTLE_TURN.CUTSCENE;
                    textinst = false 
                } 
            break;

        
			case BATTLE_MENU.ITEM:
				set_controls_grid(array_length(global.items))
				if (InputPressed(INPUT.CONFIRM)) {
					turn=BATTLE_TURN.CUTSCENE;
				}
			break;
	
			default:
				set_controls(0,0)
			break;
		}
		if (InputPressed(INPUT.CANCEL)) {previous_state()}
	break;
	case BATTLE_TURN.CUTSCENE:
		switch (menu.current) {
            case BATTLE_MENU.ACT:
                if (!instance_exists(o_dialog)&&!textinst){
                    textinst = true;
                    enemies[act_enemy_index].acts[act_index].exec()
                }
                else if (!instance_exists(o_dialog)&&textinst){
                    turn=BATTLE_TURN.ENEMY
                }
            break;
			case BATTLE_MENU.ITEM:
				if (!instance_exists(o_dialog)&&!textinst){
                    textinst=true
                    var equip_item = function(ITEM) {
                        if (ITEM.type == ITEMTYPES.ARMOR) {global.armor = ITEM;} 
                        if (ITEM.type == ITEMTYPES.WEAPON) {global.weapon = ITEM;} 
                    }
                    var ITEM = global.items[index.current] 
                    switch(ITEM.type) {
                        case ITEMTYPES.ARMOR: case ITEMTYPES.WEAPON: 
                            if (ITEM.type == ITEMTYPES.ARMOR && is_struct(global.armor))  {array_insert(global.items,index.current,global.armor)} 
                                if (ITEM.type == ITEMTYPES.WEAPON && is_struct(global.weapon)) {array_insert(global.items,index.current,global.weapon)} 
                                    equip_item(ITEM) 
                            enc_dialogue($"(voice,snd_text2)* You equipped the {ItemGetName(ITEM)}.")
                            array_delete(global.items,index.current,1) 
                            break;
					
                        case ITEMTYPES.CONSUMEABLE: 
                            audio_play_sound(snd_heal,0,0) 
                            global.hp = min(global.hp+ITEM.amount,global.maxhp) 
                            var t = global.hp >= global.maxhp ? "(voice,snd_text2)* Your HP was maxed out." : "" 
                            enc_dialogue($"(voice,snd_text2)* You ate the {ItemGetName(ITEM)}.\n{t}")
						
                            array_delete(global.items,index.current,1) 
                            break;
					
                        case ITEMTYPES.SPECIAL: 
                            ITEM.execute();	
                            if (ITEM.removeable) { 
                                array_delete(global.items,index.current,1)	
                            } 
                            break; 
                    }
				}
                else if (!instance_exists(o_dialog)&&textinst){
                    turn=BATTLE_TURN.ENEMY
                }
			break;
		}
	break;
}

if (menu.current != BATTLE_MENU.MAIN)
	instance_destroy(flavorinst)

if (menu.current==BATTLE_MENU.MAIN)
	button_selection=index.current

if (turn==BATTLE_TURN.ENEMY){
    if !(turncreated){
        instance_create(enemies[irandom_range(0,array_length(enemies)-1)].turn_object)
        turncreated=true
    }
}
