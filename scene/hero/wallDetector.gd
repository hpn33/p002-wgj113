extends Node2D



func is_colliding() -> bool:
	
	for child in get_children():
		child = child as RayCast2D
		if child.is_colliding():
			var dot = acos(Vector2.UP.dot(child.get_collision_normal()))
			if dot > PI*0.35 and dot < PI * 0.55:
				return true
	
	return false
