menu = 0
// 0 = main
// 1 = info
// 2 = stats
// 3 = console

selection = 0
stats_selection = 0
soul_y = 0

stats_options = [
	{
		name: "LV",
		get: function(){return global.lv},
		set: function(v){global.lv = clamp(v,1,20)},
		min: function(){return 1},
		max: function(){return 20},
	},
	{
		name: "HP",
		get: function(){return global.hp},
		set: function(v){global.hp = clamp(v,0,global.maxhp)},
		min: function(){return 0},
		max: function() {return global.maxhp},
	},
	{
		name: "Max HP",
		get: function(){return global.maxhp},
		set: function(v){
			global.maxhp = clamp(v,1,999)
			global.hp    = clamp(global.hp,0,global.maxhp)
		},
		min: function(){return 1},
		max: function(){return 999},
	},
	{
		name: "ATT",
		get: function(){return global.att},
		set: function(v){global.att = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "Attack",
		get: function(){return global.attack},
		set: function(v){global.attack = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "DEF",
		get: function(){return global.def},
		set: function(v){global.def = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "Defense",
		get: function(){return global.defense},
		set: function(v){global.defense = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "EXP",
		get: function(){return global.exp},
		set: function(v){global.exp = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "GOLD",
		get: function(){return global.gold},
		set: function(v){global.gold = clamp(v,0,999999)},
		min: function(){return 0},
		max: function(){return 999999},
	},
	{
		name: "FUN Value",
		get: function(){return global.fun_value},
		set: function(v){global.fun_value = clamp(v,1,99)},
		min: function(){return 1},
		max: function(){return 99},
	},
]