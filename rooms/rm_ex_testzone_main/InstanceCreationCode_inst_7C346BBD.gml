step_event = function(){
    if (o_actor_mainpl.dsprite==spr_actor_mainpl_d){
        text = [
            "* ((Take an umbrella?)"
        ]
        choices = [
            {
                name: "Take one",
                result: [
                    "* ((You took an umbrella.)"
                ],
                action: function() {
                    o_actor_mainpl.dsprite = spr_ex_actor_mainpl_d_umbrella;
                    o_actor_mainpl.rsprite = spr_ex_actor_mainpl_r_umbrella;
                    o_actor_mainpl.usprite = spr_ex_actor_mainpl_u_umbrella;
                    o_actor_mainpl.lsprite = spr_ex_actor_mainpl_l_umbrella;
                }
            },
            {
                name: "Do not",
                result: []
            }
        ]
    }
    else{
        text = [
            "* ((Return the umbrella?)"
        ]
        choices = [
            {
                name: "Return it",
                result: [
                    "* ((You returned the umbrella.)"
                ],
                action: function() {
                    o_actor_mainpl.dsprite = spr_actor_mainpl_d;
                    o_actor_mainpl.rsprite = spr_actor_mainpl_r;
                    o_actor_mainpl.usprite = spr_actor_mainpl_u;
                    o_actor_mainpl.lsprite = spr_actor_mainpl_l;
                }
            },
            {
                name: "Do not",
                result: []
            }
        ]
    }
}