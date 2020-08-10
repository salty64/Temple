extends KinematicBody


var dir:Vector3
var SPEED = 10.0
var SENSI = 0.5
var mouse_speed:Vector2
onready var raycast:RayCast = $Camera/RayCast
var ray_coll

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Camera.rotation.x=0

func _input(event):
	if event is InputEventMouseMotion:
		mouse_speed = event.relative

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	dir = Vector3(int(Input.is_action_pressed("ui_left"))-int(Input.is_action_pressed("ui_right")), 0, int(Input.is_action_pressed("ui_up"))-int(Input.is_action_pressed("ui_down")))
	
	$Camera.rotate_x(mouse_speed.y*SENSI*delta)
	$Camera.rotation.x=clamp($Camera.rotation.x,-0.8,0.8)
	
	rotate_y(-(mouse_speed.x*SENSI*delta))
	mouse_speed = Vector2.ZERO
	if Input.is_action_just_pressed("mouse_left"):
		if ray_coll !=null :
			if ray_coll.name=="Pivot_1":
				ray_coll.play()
			 
func _physics_process(delta):
	move_and_slide(dir.rotated(Vector3.UP, rotation.y).normalized()*SPEED)
	if raycast.is_colliding():
		ray_coll = raycast.get_collider()
	



