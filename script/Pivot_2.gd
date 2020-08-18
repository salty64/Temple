extends StaticBody

var done = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Switch")
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)
	

func play():
	
	if !done :
		$AnimationPlayer.play("Switch")
		$AudioStreamPlayer3D.play(0)
		done=true
	else :
		$AnimationPlayer.play_backwards("Switch")
		$AudioStreamPlayer3D.play(0)
		done=false	
		

func set_outline_true():
	$Mirror/Meshoutline.visible=true

func set_outline_false():
	$Mirror/Meshoutline.visible=false
