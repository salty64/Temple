extends StaticBody


var done = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Circle_180/AnimationPlayer.play("Energy_OFF")
	$Circle_180/AnimationPlayer.seek(0,true)
	$Circle_180/AnimationPlayer.stop(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play():
	if !done :
		$Circle_180/AnimationPlayer.play("Energy_Switch")
		
		done=true
	else:
		$Circle_180/AnimationPlayer.play_backwards("Energy_Switch")
		
		done=false

		

func set_outline_true():
	$Circle_180/Meshoutline.visible=true
	
	
func set_outline_false():
	$Circle_180/Meshoutline.visible=false
