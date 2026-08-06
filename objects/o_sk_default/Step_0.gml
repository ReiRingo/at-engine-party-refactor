if (instance_exists(o_text_typer)&&!o_text_typer.finished){
    is_talking = (o_world.frames div talk_speed) mod 2==0
}
else{
    is_talking = false
}