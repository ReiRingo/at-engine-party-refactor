// at the instance creation code of the trigger

event = function()
{
    var _c = new cutscene_t();
    
    _c.moveable(false)
    _c.dialogue("* Haha...")
    _c.wait(30)
    _c.dialogue(
        [
            "* It's funny how good this works\nisn't it?",
            "* Like, You can't move now but\nuhh,",
            "* I can make you move lol,\nlook at this!",
        ]
    )
    _c.moveto(10,10,3,true)
    _c.wait(90)
    _c.moveable(true)
    _c.play();
};