extends Spatial

var on = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("OFF")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play():
	if !on :
		$AnimationPlayer.play("ON")
		on=true
	else :
		$AnimationPlayer.play("OFF")
		on=false

func reset():
	if on:
		$AnimationPlayer.play("OFF")
		on=false