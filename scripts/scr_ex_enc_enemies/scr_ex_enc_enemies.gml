function ex_enc_enemy_froggit() : enc_enemy() constructor{
    obj = o_ex_enc_e_froggit; // working
    
    spr = {
        normal: spr_enc_e_test,
        hurt: spr_enc_e_test,
    };
    
    name = "Froggit" // working
    
    maxhp = 30;
    hp = 30;
    
    att = 4; // attack
    def = 5; // defense
	
	v_att = att; // visual attack stat
	v_def = 4;
    
    can_mercy = false; // can be spared? // working
    
    turn_object = o_enc_turn
    
	var owner = self

	acts = [
		{
			name: "Check",
			exec: method(owner,function(){
				enc_dialogue("* Froggit ATT "+string(v_att)+" DEF "+string(v_def)+"\n* Life is difficult for this enemy.");
			})
		},
		{
			name: "Compliment",
			exec: function(){
				enc_dialogue("* Froggit didn't understand what you said, but was flattered anyway.");
			}
		},
		{
			name: "Threaten",
			exec: function(){
				enc_dialogue("* Froggit didn't understand what you said, but was scared anyway.");
			}
		},
	] // working

    dialogue = function(){
        return "test";
    }
}
function ex_enc_enemy_whimsun() : enc_enemy() constructor{
    obj = o_ex_enc_e_whimsun; // working
    
    spr = {
        normal: spr_enc_e_test,
        hurt: spr_enc_e_test,
    };
    
    name = "Whimsun" // working
    
    maxhp = 10;
    hp = 10;
    
    att = 4; // attack
    def = 0; // defense
	
	v_att = 5; // visual attack stat
	v_def = def;
    
    can_mercy = true; // can be spared? // working
    
    turn_object = o_enc_turn
    
	var owner = self

	acts = [
		{
			name: "Check",
			exec: method(owner,function(){
				enc_dialogue("* Whimsun ATT "+string(v_att)+" DEF "+string(v_def)+"\n* This monster is too sensitive to fight...");
			})
		},
		{
			name: "Console",
			exec: function(){
				enc_dialogue("* Halfway through your first word, Whimsun bursts into tears and runs away.");
			}
		},
		{
			name: "Terrorize",
			exec: function(){
				enc_dialogue("* You raise your arms and wiggle your fingers. Whimsun freaks out!");
			}
		},
	] // working

    dialogue = function(){
        return "test";
    }
}