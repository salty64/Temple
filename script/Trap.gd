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
		$"../Door_laser".translate(Vector3(0, 10, 0))
		is_trap = true


func untrap():
	if is_trap:
		$"../Door_laser".translate(Vector3(0, -10, 0))


func _on_Trap_body_entered():
	print("pass")
