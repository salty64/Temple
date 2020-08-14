extends StaticBody


var bas = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Switch")
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play():
	if !bas :
		$AnimationPlayer.play("Switch")
		$AudioStreamPlayer3D.play(0)
		bas=true
	else :
		$AnimationPlayer.play_backwards("Switch")
		$AudioStreamPlayer3D.play(0)
		bas=false

		

func set_outline_true():
	$Inter_levier/Meshoutline.visible=true
	
	
func set_outline_false():
	$Inter_levier/Meshoutline.visible=false
