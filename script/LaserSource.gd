extends Spatial

var raycast: RayCast

var beam: MeshInstance

var ray_coll: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	raycast = $RayCast_Laser

	beam = $beam
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(_delta):
	if raycast.is_colliding():
		var length = raycast.global_transform.origin.distance_to(raycast.get_collision_point()) + 0.1

		beam.translation.z = raycast.global_transform.origin.z + length / 2
		# beam.scale.y = length
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
