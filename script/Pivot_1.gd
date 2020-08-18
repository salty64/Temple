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
		remove_from_group("outline")
		remove_from_group("action")
		remove_from_group("left")
		set_outline_false()
		

func set_outline_true():
	$Key_1/Meshoutline.visible=true

	
func set_outline_false():
	$Key_1/Meshoutline.visible=false
