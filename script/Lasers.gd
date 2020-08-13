extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func calc_laser():
	var from: Vector3
	var to: Vector3
	var normal: Vector3
	var reflect: Vector3
	var intersect: Dictionary
	
	$laser_line.begin(Mesh.PRIMITIVE_LINES)
#	for i in num_of_reflects:
#		if from == Vector3.ZERO && to == Vector3.ZERO && normal == Vector3.ZERO:
#			from = turret.translation
#			to = turret.to_global(Vector3(0,0,-100))
#
#			intersect = space.intersect_ray(from, to)
#			if(intersect.empty()): break
#
#			to = intersect["position"]
#			normal = intersect["normal"]
#			reflect = (from-to).reflect(normal) * 10
#		else:
#			intersect = space.intersect_ray(to, to+reflect)
#			if(intersect.empty()): break
#			if(intersect["collider"] == turret): break
#
#			from = to
#			to = intersect["position"]
#			normal = intersect["normal"]
#			reflect = (from-to).reflect(normal) * 10
	$laser_line.set_color(Color.red) #rendering normal with ImmediateGeometry
	$laser_line.add_vertex(to)
	$laser_line.add_vertex(to+normal)
	$laser_line.set_color(Color.blueviolet) #rendering laser with ImmediateGeometry
	$laser_line.add_vertex(from)
	$laser_line.add_vertex(to)
		
	$laser_line.end()
