extends StaticBody

signal canRotate

signal cantRotate

var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Switch")
	$AnimationPlayer.seek(0, true)
	$AnimationPlayer.stop(true)


func play():
	if ! done:
		$AnimationPlayer.play("Switch")
		$AudioStreamPlayer3D.play(0)
		done = true
	else:
		emit_signal("cantRotate")
		$AnimationPlayer.play_backwards("Switch")
		$AudioStreamPlayer3D.play(0)
		done = false


func set_outline_true():
	$Mirror/Meshoutline.visible = true


func set_outline_false():
	$Mirror/Meshoutline.visible = false


func set_rotation90():
	var rot_value = PI / 2

	rotate_y(rot_value)

	var beam = $Reflector/Plan_miroir/beam

	beam.translation = Vector3.ZERO
	beam.global_rotate(Vector3.UP, rot_value)

	var raycast = $Reflector/Plan_miroir/RayCast

	raycast.global_rotate(Vector3.UP, rot_value)

	$Reflector.rot = true


func unset_rotation90():
	var rot_value = -PI / 2

	rotate_y(rot_value)

	var beam = $Reflector/Plan_miroir/beam

	beam.translation = Vector3.ZERO
	beam.global_rotate(Vector3.UP, rot_value)

	var raycast = $Reflector/Plan_miroir/RayCast

	raycast.global_rotate(Vector3.UP, rot_value)

	$Reflector.rot = false


func _on_AnimationPlayer_animation_finished(_anim_name):
	if done:
		emit_signal("canRotate")
	pass  # Replace with function body.
