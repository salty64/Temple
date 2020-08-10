extends StaticBody



var done = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Animation_pivot")
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play():
	if !done :
		$AnimationPlayer.play("Animation_pivot")
		$AudioStreamPlayer3D.play(0)
		done=true
		
		
