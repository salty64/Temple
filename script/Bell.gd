extends StaticBody



func _ready():
	pass
		


func play():
	$AudioStreamPlayer3D.play(0)


func set_outline_true():
	$Bell/Meshoutline.visible=true

	
func set_outline_false():
	$Bell/Meshoutline.visible=false
