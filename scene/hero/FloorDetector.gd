extends RayCast2D

var floo

func _physics_process(delta: float) -> void:
	
	
	if is_colliding():
		floo = get_collision_normal().y == -1
		print(get_collision_normal().y)
#		print(get_collision_normal())
#		print(get_collision_point())
	else :
		floo = false