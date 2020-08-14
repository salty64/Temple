extends StaticBody

var done = false
var mirror = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play():
	if !done :
		if mirror:
			$"../Pivot_2/Mirror".rotate_y(PI/2)
		$Rotate_90.rotate_y(PI/2)	
		done=true
	else :
		if mirror:
			$"../Pivot_2/Mirror".rotate_y(-PI/2)
		$Rotate_90.rotate_y(-PI/2)
		done=false
	$AudioStreamPlayer3D.play(0)	 

func set_outline_true():
	$Rotate_90/Meshoutline.visible=true

	
func set_outline_false():
	$Rotate_90/Meshoutline.visible=false

func _on_AnimationPlayer_animation_finished(_toto):
	mirror=!mirror
