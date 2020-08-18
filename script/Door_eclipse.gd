extends StaticBody


var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	# $AnimationPlayer.play("Animation_door")
	$AnimationPlayer.seek(0,true)
	$AnimationPlayer.stop(true)
	$AudioStreamPlayer3D.stream.loop=false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play(state:bool):

	if state and !done:

		$AudioStreamPlayer3D.stop()
		$AnimationPlayer.play("Animation_door")
		$AudioStreamPlayer3D.play(0)
		done=true

	elif !state and done:

		$AudioStreamPlayer3D.stop()
		$AnimationPlayer.play_backwards("Animation_door")
		$AudioStreamPlayer3D.play(0)
		done=false

		