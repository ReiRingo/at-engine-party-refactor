draw_self()
if (global.debug){
    draw_set_color(c_red)

    if (InputPressed(INPUT.CONFIRM)){ 
        if (moveable){ 
            switch (global.facing){ 
                case 1: 
                    draw_rectangle(x + (sprite_width / 2) - sprite_width+10, y + (sprite_height / 2) - sprite_height, x + sprite_width + 15 - sprite_width+10, y + sprite_height - sprite_height,true) 
                    break 
                case 3: 
                    draw_rectangle(x + (sprite_width / 2) - sprite_width+10, y + 3 + (sprite_height / 2) - sprite_height, x - 15 - sprite_width+10, y + sprite_height + 3 - sprite_height,true) 
                    break 
                case 0: 
                    draw_rectangle(x + 4 - sprite_width+10, y + 20 - sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + sprite_height + 15 - sprite_height,true) 
                    break 
                case 2: 
                    draw_rectangle(x + 4 - sprite_width+10, (y + sprite_height) - 5 -sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + 8 - sprite_height,true) 
                    break 
            } 
        }
    }
    draw_set_alpha(1)
    draw_set_color(c_white) 
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
