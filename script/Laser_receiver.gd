# Called when the node enters the scene tree for the first time.
extends StaticBody

var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Laser_receiver/AnimationPlayer.play("OFF")
	# $Laser_receiver/AnimationPlayer.seek(0,true)
	$Laser_receiver/AnimationPlayer.stop(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func On():
	if ! done:
		$Laser_receiver/AnimationPlayer.play("ON")
		done = true


func Off():
	if done:
		$Laser_receiver/AnimationPlayer.play("OFF")
		done = false
