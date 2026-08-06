function enc_enemy(){
    obj = o_enc_enemy;
    
    spr = {
        normal: spr_default,
        hurt: spr_default,
    };
    
    name = ""
    
    maxhp = 0;
    hp = 0;
    
    att = 0; // attack
    def = 0; // defense
    
    can_mercy = false; // can be spared?
    show_hp = true; // show hp bar?
    
    turn_object = o_enc_turn
    
    acts = [
    ]
    
    dialogue = function(){
        return "";
    }
}

function enc_enemy_test() : enc_enemy() constructor{
    obj = o_enc_testenemy; // working
    
    spr = {
        normal: spr_enc_enemy_test,
        hurt: spr_enc_enemy_test,
    };
    
    name = "TESTENEMY" // working
    
    maxhp = 20;
    hp = 20;
    
    att = 2; // attack
    def = 2; // defense
	
	v_att = att; // visual attack stat
	v_def = def;
    
    can_mercy = true; // can be spared? // working
    
    turn_object = o_enc_turn
    
	var owner = self

	acts = [
		{
			name: "Check",
			exec: method(owner,function(){
				enc_dialogue("* TEST ENEMY ATT "+string(v_att)+" DEF "+string(v_def)+"\n* Just a test...");
			})
		},
		{
			name: "Talk",
			exec: function(){
				enc_dialogue("* You talk to the enemy.");
			}
		},
		{
			name: "Insult",
			exec: method(owner,function(){
				var _c = new cutscene_t()
			
				_c.dialogue(
					[
						"* The enemy felt very insulted.",
						"* TESTENEMY ATK increased by 2!!"
					]
				,false,false)
				_c.run(function(){
					v_att+=2
					o_enc_testenemy.sprite_index=spr_enc_enemy_test_hurt
				})
				_c.play();
			})
		},
	] // working

    dialogue = function(){
        return "test";
    }
}

function enc_enemy_test2() : enc_enemy() constructor{
    obj = o_enc_enemy2;
    
    spr = {
        normal: spr_enc_enemy_test,
        hurt: spr_enc_enemy_test,
    };
    
    name = "TEST2"
    
    maxhp = 40;
    hp = 30;
    
    att = 2; // attack
    def = 2; // defense
    
    can_mercy = false; // can be spared?
    show_hp = false
    turn_object = o_enc_turn
    
    acts = [
        {
            name: "Check",
            exec: function(){
                enc_dialogue("* TEST ENEMY2\n* Really just a test...");
            }
        },
        {
            name: "Ask",
            exec: function(){
                enc_dialogue(
                    [
                        "* You ask what is happening...",
                        "* It didn't understand\nwhat you meant."
                    ]
                );
            }
        },
    ]
    
    dialogue = function(){
        return "test";
    }
}
