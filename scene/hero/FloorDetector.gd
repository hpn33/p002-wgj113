extends RayCast2D



func _physics_process(delta: float) -> void:
	
	
	if is_colliding():
#		floo = get_collision_normal().y == -1
#		print(get_collision_normal().y)
#		print(get_collision_normal())
#		print(get_collision_point())
		pass
	else :
		pass

func is_on_floor():
	if is_colliding():
		return get_collision_normal().y == -1
	return false