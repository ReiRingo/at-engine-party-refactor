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
    
    can_mercy = true; // can be spared? // working
    
    turn_object = o_enc_turn
    
    acts = [
        {
            name: "Check",
            exec: function(){
                enc_dialogue("* TEST ENEMY\n* Just a test...");
            }
        },
        {
            name: "Talk",
            exec: function(){
                enc_dialogue("* You talk to the enemy.");
            }
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
    
    maxhp = 20;
    hp = 20;
    
    att = 2; // attack
    def = 2; // defense
    
    can_mercy = false; // can be spared?
    
    turn_object = o_enc_turn
    
    acts = [
        {
            name: "Check",
            exec: function(){
                enc_dialogue("* TEST ENEMY\n* Just a test...");
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