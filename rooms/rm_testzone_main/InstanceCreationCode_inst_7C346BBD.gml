text="* ((Take an umbrella?)"
choices=[
	{
		name: "Take one",
		result: [
            "(varset,o_actor_mainpl,dsprite,spr_default)* ((You took an umbrella.)",
        ]
	},
	{
		name: "Do not",
        result: noone
	},
]