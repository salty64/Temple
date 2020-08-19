extends StaticBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var raycast:RayCast

var beam:MeshInstance

var rot := false #setFromColumn

var ray_coll:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	raycast = $Plan_miroir/RayCast
	
	beam = $Plan_miroir/beam
	
	pass # Replace with function body.

func on_laser_touch():
	beam.visible = true
	
	if raycast.is_colliding():
		var length = raycast.global_transform.origin.distance_to(
			raycast.get_collision_point()
		)
		
		if rot:
			beam.global_transform.origin.x = raycast.global_transform.origin.x - length / 2
		else:
			beam.global_transform.origin.x = raycast.global_transform.origin.x + length / 2
		
		beam.mesh.set_height(length)
		
		var ray_coll1 = raycast.get_collider()
		
		if ray_coll != null and ray_coll != ray_coll1:
			ray_coll.on_laser_untouch()
			ray_coll = null
		
		if ray_coll1.is_in_group("energy"):
			ray_coll1.on_laser_touch()
			ray_coll = ray_coll1
			
	elif ray_coll != null:
		ray_coll.on_laser_untouch()
		ray_coll = null
	
func on_laser_untouch():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
