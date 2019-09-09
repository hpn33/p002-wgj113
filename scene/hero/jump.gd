extends Node

export(bool) var active = true

export(Vector2) var jump := Vector2(0, -5000)


func _physics_process(delta: float) -> void:
	
	if not active:
		return
	
	if Input.is_action_just_pressed('ui_up'):
		owner.move_and_collide(jump * delta)