extends StaticBody

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_outline_true():
	$Mirror/Meshoutline.visible=true

func set_outline_false():
	$Mirror/Meshoutline.visible=false
