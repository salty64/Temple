extends KinematicBody
class_name Player

var dir: Vector3

var SPEED = 10.0
var SENSI = 0.5
var mouse_speed: Vector2
onready var raycast: RayCast = $Camera/RayCast

var ray_coll: Node
var ray_coll_old: Node = null
var ray_have_collision := false

var ray_coll_reflection: Node
var ray_coll_reflection_old: Node = null
var ray_reflection_have_collision := false

var can_move = true
var step = false

var pos: Vector3
var old_pos = Vector3(0, 0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Camera.rotation = Vector3.ZERO


func _input(event):
	if event is InputEventMouseMotion:
		mouse_speed = event.relative


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		dir = Vector3(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")), 0, int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))

		pos = self.translation

		if pos != old_pos:
			if ! $Foot_step.is_playing():
				$Foot_step.play()
			else:
				if step:
					step = false
			old_pos = pos

		$Camera.rotate_x(-mouse_speed.y * SENSI * delta)
		$Camera.rotation.x = clamp($Camera.rotation.x, -0.8, 0.8)

		rotate_y(-(mouse_speed.x * SENSI * delta))
		mouse_speed = Vector2.ZERO

		if ray_coll != null:
			if ray_have_collision:
				if ray_coll_old != ray_coll and ray_coll_old != null:
					$Camera/UI_helper/Left.visible = false
					$Camera/UI_helper/Right.visible = false
					if ray_coll_old.is_in_group("outline"):
						ray_coll_old.set_outline_false()

				if ray_coll.is_in_group("outline"):
					ray_coll.set_outline_true()
					gui_pos(raycast.get_collision_point())

				if ray_coll.is_in_group("left"):
					$Camera/UI_helper/Left.visible = true
					if Input.is_action_just_pressed("mouse_left"):
						if ray_coll.is_in_group("action"):
							ray_coll.play()

				if ray_coll.is_in_group("right"):
					$Camera/UI_helper/Right.visible = true
					if Input.is_action_just_pressed("mouse_right"):
						if ray_coll.is_in_group("action"):
							ray_coll.play()

				ray_coll_old = ray_coll

			else:
				if ray_coll.is_in_group("outline"):
					ray_coll.set_outline_false()

					ray_coll = null

				$Camera/UI_helper/Left.visible = false
				$Camera/UI_helper/Right.visible = false

		if ray_coll_reflection != null:
			if ray_reflection_have_collision:
				if ray_coll_reflection.is_in_group("energy"):
					ray_coll_reflection.On()
					$"../Door_eclipse".play(true)
					ray_coll_reflection_old = ray_coll_reflection

				if ray_coll_reflection_old != null and ray_coll_reflection_old.is_in_group("energy") and ray_coll_reflection.is_in_group("player"):
					ray_coll_reflection_old.Off()
					$"../Door_eclipse".play(false)
			else:
				if ray_coll_reflection.is_in_group("energy"):
					ray_coll_reflection.Off()
					$"../Door_eclipse".play(false)
					pass


func _physics_process(_delta):
	if can_move:
		if ! is_on_floor():
			dir.y -= 1

		move_and_slide(dir.rotated(Vector3.UP, rotation.y).normalized() * SPEED, Vector3.UP, true)

		if raycast.is_colliding():
			ray_coll = raycast.get_collider()
			ray_have_collision = true
		else:
			ray_have_collision = false


func _on_End_body_entered(body):
	can_move = false

	var tween: Tween = $Camera/Tween
	tween.interpolate_property($"Camera/ColorRect", "color:a", null, 1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($"../Ambiance", "unit_db", null, -80, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_all_completed")
	get_tree().quit()


func gui_pos(pos):
	var ecart: float
	ecart = $Camera.translation.distance_to(pos)
	$Camera/UI_helper.translation.z = -ecart / 9


func _on_Foot_step_finished():
	step = true
