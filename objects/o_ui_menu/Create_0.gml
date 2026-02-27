state=0
prev_state=state
sub_state=0
item_selection=0
item_action_selection=0
dialogmade=0
top=is_top()

options = [
	{
		name: "ITEM",
		selectable: array_length(global.items) > 0,
		state: 1,
	},
	{
		name: "STAT",
		selectable: true,
		state: 2,
	},
	{
		name: "CELL",
		selectable: true,
		state: 3,
	},
]

item_actions = [
	{
		name: "USE",
		selectable: true
	},
	{
		name: "INFO",
		selectable: true
	},
	{
		name: "DROP",
		selectable: true
	},
]

cell_selection = 0;

call_dialogue = function(dial_text,text, end_text) {
	var t = []
	if (is_array(text)) {
		array_copy(t,0,text,0,array_length(text))
	} else {t = [text]}

	array_insert(t,0,dial_text)
	array_insert(t,array_length(t),end_text)
	return t
}

cells = [
	{
		name: "Toriel",
		result: [
            "(sound,snd_ring)* (Ring... ring...)",
            "(sound,snd_ui_deny,0,0,1,.5)* No response...",
            "* ((Click...)",
        ]
	},
	{
		name: "---",
		result: [
			"(sound,snd_ring)* (Ring... ring...)",
            "* Hello(w,1)!\n* Can I speak to G...",
			"* ...\n* Wait a second.",
			"* Is this the wrong number?",
			"(sound,mus_wrongnumber,0,1)* Oh it's the wrong number(w,1)!\n* The wrong number song!",
			"* We're very very sorry that\nwe got it wrong!",
            "* Oh it's the wrong number(w,1)!\n* The wrong number song!",
            "* We're very very sorry that\nwe got it wrong!",
            "(esound,mus_wrongnumber)* ((Click...)",
		]
	},
]

selection = 0
depth=DEPTH_UI.MENU_UI
