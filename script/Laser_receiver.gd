# Called when the node enters the scene tree for the first time.
extends StaticBody

signal laserTouch(touch)

var done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Laser_receiver/AnimationPlayer.play("OFF")
	# $Laser_receiver/AnimationPlayer.seek(0,true)
	$Laser_receiver/AnimationPlayer.stop(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_laser_touch():
	emit_signal("laserTouch", true)
	
	if ! done:
		$Laser_receiver/AnimationPlayer.play("ON")
		done = true


func on_laser_untouch():
	emit_signal("laserTouch", false)
	
	if done:
		$Laser_receiver/AnimationPlayer.play("OFF")
		done = false
