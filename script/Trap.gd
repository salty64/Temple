extends Area
var is_trap = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass


func trap():
	if ! is_trap:
		play()
		$"../Door_laser".translate(Vector3(0, 10, 0))
		is_trap = true


func untrap():
	if is_trap:
		play()
		$"../Door_laser".translate(Vector3(0, -10, 0))


func _on_Trap_body_entered(body):
	print("notrap")
	# if $"../Trap".is_in_group("trap"):
	# 	print("trap")
	# 	trap()


func play():
	$AnimationPlayer.play("Animation_trap")
	$AudioStreamPlayer3D.play(0)
