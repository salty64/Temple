extends StaticBody

var laser_pos= false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Action")
	$AnimationPlayer.seek(4,true)
	$AnimationPlayer.stop(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play():
	if !laser_pos :
		$AnimationPlayer.play_backwards("Action")
		$AudioStreamPlayer3D.play(0)
		laser_pos=true
	else :
		$AnimationPlayer.play("Switch")
		$AudioStreamPlayer3D.play(0)
		laser_pos=false


func set_outline_true():
	$Inter_levier/Meshoutline.visible=true
	
	
func set_outline_false():
	$Inter_levier/Meshoutline.visible=false
