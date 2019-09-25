extends Node2D



func _process(delta: float) -> void:
	
	var dir = owner.move.dir
	
	if dir.x != 0:
		scale.x = dir.x