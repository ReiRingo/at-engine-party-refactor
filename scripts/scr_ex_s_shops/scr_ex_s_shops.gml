function ex_s_gerson() : s_shopkeeper() constructor{
    obj = o_ex_sk_gerson;
    bgobj = o_ex_sk_gerson_bg;
    
    maintext = "* Woah there!\n* I've got some neat junk for sale."
    leavetext = [
        "(varset,o_sk_gerson,emotion,3)* Already leavin will ya?",
        "(varset,o_sk_gerson,emotion,4)* If you say so!\n* See ya!"
    ] // placeholder text because i don't want to search gerson leave text
    
    bgm = mus_shop
}