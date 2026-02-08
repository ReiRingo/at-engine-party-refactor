if (screenshot) {
    var i = 1
    var filename = undefined 
    
    repeat (10000) {  
        filename = "screenshot_"+string(i)+".png" 
        if (!file_exists(filename)) 
            break; 
        i++ 
    } 
    screen_save(filename)
    
    screenshot=false
}