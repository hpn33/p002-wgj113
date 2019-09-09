extends Node

export(bool) var active = true

export(Vector2) var gravity := Vector2(0, 250)


func _physics_process(delta: float) -> void:
	if not active:
		return
	
	if owner.floor_detector.floo:
		print('floor')
	
	
	var v :KinematicCollision2D= owner.move_and_collide(gravity * delta)
	
	if v:
		print(v.normal)
	