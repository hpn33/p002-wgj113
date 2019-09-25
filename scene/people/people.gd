extends RigidBody2D


func _ready() -> void:
	z_index = index()

func index() -> int:
	var rand = int(rand_range(6, 10))
	if rand in [6, 8]:
		return index()
	
	return rand
	

