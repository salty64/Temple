extends StaticBody

var done = false
var mirror = false

var column:Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	column = $"../Column"
	pass # Replace with function body.

func play():
	if !done :
		column.set_rotation90()
		$Rotate_90.rotate_y(PI/2)
		done=true
	else :
		column.unset_rotation90()
		$Rotate_90.rotate_y(-PI/2)
		done=false
	
	$AudioStreamPlayer3D.play(0)
	pass

func set_outline_true():
	$Rotate_90/Meshoutline.visible=true
	
func set_outline_false():
	$Rotate_90/Meshoutline.visible=false

func _on_Column_canRotate():
	add_to_group("outline")
	add_to_group("action")
	add_to_group("right")
	pass # Replace with function body.


func _on_Column_cantRotate():
	set_outline_false()
	remove_from_group("outline")
	remove_from_group("action")
	remove_from_group("right")
	pass # Replace with function body.
