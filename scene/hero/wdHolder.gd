extends Node2D


func is_colliding():
	for child in get_children():
		if child.is_colliding():
			return true
	return false

func get_side():
	if $right.is_colliding():
		return 1
	
	if $left.is_colliding():
		return -1
	
	return 0