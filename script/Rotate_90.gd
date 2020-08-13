extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_outline_true():
	$Rotate_90/Meshoutline.visible=true

	
func set_outline_false():
	$Rotate_90/Meshoutline.visible=false
