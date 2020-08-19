extends StaticBody

var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Circle_90/AnimationPlayer.play("Energy_OFF")
	$Circle_90/AnimationPlayer.seek(0, true)
	$Circle_90/AnimationPlayer.stop(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play():
	if ! done:
		$Circle_90/AnimationPlayer.play("Energy_Switch")
		$"../Circuit_2/AnimationPlayer".play("Energy_OFF")
		$"../Guide_90/AnimationPlayer".play("Energy_Switch")

		done = true
	else:
		$Circle_90/AnimationPlayer.play_backwards("Energy_Switch")
		yield($Circle_90/AnimationPlayer, "animation_finished")
		$"../Circuit_2/AnimationPlayer".play("Energy_ON")
		$"../Guide_90/AnimationPlayer".play("Energy")

		done = false


func set_outline_true():
	$Circle_90/Meshoutline.visible = true


func set_outline_false():
	$Circle_90/Meshoutline.visible = false
