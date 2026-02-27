if (live_call()) return live_result;
event_inherited()
talky = 0
talk_dir = 1 // 1 up, -1 down
s_drawer = function(sprite_index,image_index,x,y,xscale,yscale,angle,colour,alpha){
    if (is_talking) {
        if (o_world.frames%4==0){
            talky+=talk_dir
            if (talky>=2){
                talky = 2;
                talk_dir = -1
            }
            if (talky<=0) {
                talky = 0
                talk_dir = 1
            }
        }
    }
    else{
        talky = 0
        talk_dir = 1
    }
    draw_sprite(spr_sk_gerson_hand, 0, x - 35 + talky, y + talky);
    draw_sprite(spr_sk_gerson_body, 0, x + 16, y);
    draw_sprite(spr_sk_gerson_mouth, 0, x-3, y-14);
    draw_sprite(spr_sk_gerson_head, 0, x-7, y-34+talky);
    draw_sprite(spr_sk_gerson_face, 0, x-17, y - 47+talky);
}