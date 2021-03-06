extends StaticBody

var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Circle_180/AnimationPlayer.play("Energy_OFF")
	$Circle_180/AnimationPlayer.seek(0, true)
	$Circle_180/AnimationPlayer.stop(true)
	$"../Guide_180/AnimationPlayer".play("Energy_OFF")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play():
	if ! done:
		$Circle_180/AnimationPlayer.play("Energy_Switch")
		yield($Circle_180/AnimationPlayer, "animation_finished")
		$"../Circuit_3/AnimationPlayer".play("Energy_ON")
		$"../Guide_180/AnimationPlayer".play("Energy_Switch")
		$"../Door_Large_Exit".play()
		done = true
	else:
		$Circle_180/AnimationPlayer.play_backwards("Energy_Switch")
		$"../Circuit_3/AnimationPlayer".play("Energy_OFF")
		$"../Guide_180/AnimationPlayer".play("Energy_ON")
		$"../Door_Large_Exit".play()

		done = false


func set_outline_true():
	$Circle_180/Meshoutline.visible = true


func set_outline_false():
	$Circle_180/Meshoutline.visible = false
