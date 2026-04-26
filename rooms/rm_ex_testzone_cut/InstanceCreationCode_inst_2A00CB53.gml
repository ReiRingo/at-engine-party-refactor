event = function()
{
    var _c = new cutscene_t();
    
    _c.moveable(false)
    _c.run(function(){
        o_cam.target=noone
        im_tween_begin(o_cam.y, function(n) { o_cam.y=n; });
        im_tween_add(o_cam.y+60, 60, e_tween.LINEAR);
        im_tween_start();
    })
    _c.wait(60)
    _c.dialogue(
        [
            "* Is that...",
            "* (shake)NOTHING!?!?!?"
        ]
    ,true)
    // cutscene stuff
    _c.run(function(){
        im_tween_begin(o_cam.y, function(n) { o_cam.y=n; });
        im_tween_add(o_cam.y-60, 60, e_tween.LINEAR);
        im_tween_start();
    })
    _c.wait(30)
    _c.run(function(){
        global.facing=FACES.LEFT
    })
    _c.wait(30)
    _c.run(function(){
        global.facing=FACES.UP
    })
    _c.wait(30)
    _c.dialogue(
        [
            "* here's a text\nbefore the hug."
        ]
    )
    _c.wait(15)
    _c.run(function(){
        o_actor_mainpl.s_override=true
        o_actor_mainpl.sprite_index=spr_ex_actor_toriel_hugstart
        o_actor_mainpl.image_speed=1
    })
    _c.wait(7)
    _c.run(function(){
        o_actor_mainpl.sprite_index=spr_ex_actor_toriel_hug
        o_actor_mainpl.image_speed=1
    })
    _c.wait(90)
    _c.run(function(){
        o_actor_mainpl.sprite_index=spr_ex_actor_toriel_hugend
        o_actor_mainpl.image_speed=1
    })
    _c.wait(7)
    _c.run(function(){
        o_actor_mainpl.s_override=false
    })
    _c.wait(90)
    _c.run(function(){
        o_cam.target=o_actor_mainpl
    })
    _c.wait(15)
    _c.moveable(true)
	
    _c.play();
};