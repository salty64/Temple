extends Spatial


var suite_1 = [1,3,0,2,4]
var index:int=0
var sequence_1=false
var sequence_2=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset_all():
	
	for node in get_children():
		node.reset()
	index=0


func check(id):
	if !sequence_1:
		if id == suite_1[index] :
			get_child(index+5).play()
			index+=1
			if index==5:
				sequence_1 = true

		else:
			reset_all()	





