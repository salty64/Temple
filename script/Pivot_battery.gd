extends StaticBody

var laser_pos = false
var is_charged = false

onready var raycast: RayCast = $"../Column/Reflector/Plan_miroir/RayCast"
var ray_coll: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Action")
	$AnimationPlayer.seek(4, true)
	$AnimationPlayer.stop(true)


func _physics_process(_delta):
	if raycast.is_colliding():
		ray_coll = raycast.get_collider()
		if ray_coll.is_in_group("cristal") and laser_pos and ! is_charged:
			charge()


func play():
	if ! laser_pos:
		$AnimationPlayer.play_backwards("Action")
		# $AudioStreamPlayer3D.play(0)
		laser_pos = true
	else:
		if is_charged:
			$AnimationPlayer.play("Action")

			yield($AnimationPlayer, "animation_finished")
			# $AudioStreamPlayer3D.play(0)
			# laser_pos = false
			$"../Circuit_1/AnimationPlayer".play("Energy")
			$"../Circuit_2/AnimationPlayer".play("Energy_ON")
			$"../Guide_90/AnimationPlayer".play("Energy_ON")
			$"../Pivot_90/Circle_90/AnimationPlayer".play("Energy_ON")
			$"../Guide_180/AnimationPlayer".play("Energy_ON")

			$"../Pivot_180".add_to_group("outline")
			$"../Pivot_90".add_to_group("outline")
			$"../Pivot_180".add_to_group("right")
			$"../Pivot_90".add_to_group("right")
			$"../Pivot_180".add_to_group("action")
			$"../Pivot_90".add_to_group("action")
			$"../Trap".add_to_group("trap")


func set_outline_true():
	$Batterry/Meshoutline.visible = true


func set_outline_false():
	$Batterry/Meshoutline.visible = false


func charge():
	add_to_group("action")
	add_to_group("left")
	add_to_group("outline")
	$Particles.emitting = true
	$"../Pivot_battery/Magic".play(0)
	$"../Pivot_battery/Batterry/AnimationPlayer".play("Energy")
	is_charged = true
