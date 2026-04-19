function shop_start(shopset){
	var inst = instance_create(o_shop,0,0,DEPTH_SHOP.UI)
	inst.shop=shopset
}

function shop_textdata(_type, _name, _selectable, _result, _state) constructor {
    if (_type==SHOP_TEXT_TYPE.MAIN){
        name = _name;
        selectable = _selectable;
        result = _result
        state = _state
    }
}