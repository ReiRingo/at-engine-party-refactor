text=[
	"* ((What will you say?)"
]

choices = [
	{
		name: "Yes", 
		result: function() {
			Dialogue_Create(["(face,spr_faces_namu,3)* Oh wait, really?"])	
		}
	},
	{
		name: "No", 
		result: function() {
			Dialogue_Create(["(face,spr_faces_namu,3)* Oh wait, really?"])	
		}
	},
]

