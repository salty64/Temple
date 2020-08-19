extends StaticBody

var laser_pos = false
var is_charged = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Action")
	$AnimationPlayer.seek(4, true)
	$AnimationPlayer.stop(true)
	charge()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play():
	if ! laser_pos:
		$AnimationPlayer.play_backwards("Action")
		# $AudioStreamPlayer3D.play(0)
		laser_pos = true
	else:
		$AnimationPlayer.play("Action")
		yield($AnimationPlayer, "animation_finished")
		# $AudioStreamPlayer3D.play(0)
		# laser_pos = false
		$"../Circuit_1/AnimationPlayer".play("Energy")
		$"../Circuit_2/AnimationPlayer".play("Energy_ON")
		$"../Guide_90/AnimationPlayer".play("Energy_ON")
		$"../Pivot_90/Circle_90/AnimationPlayer".play("Energy_ON")

		$"../Pivot_180".add_to_group("outline")
		$"../Pivot_90".add_to_group("outline")
		$"../Pivot_180".add_to_group("right")
		$"../Pivot_90".add_to_group("right")
		$"../Pivot_180".add_to_group("action")
		$"../Pivot_90".add_to_group("action")


func set_outline_true():
	$Batterry/Meshoutline.visible = true


func set_outline_false():
	$Batterry/Meshoutline.visible = false


func charge():
	add_to_group("action")
	add_to_group("left")
	add_to_group("outline")
	$"../Pivot_battery/Batterry/AnimationPlayer".play("Energy")
	is_charged = true
