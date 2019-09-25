extends State



var move


func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	
	move.ga = true
	move.ja = true
	
	move.set_mode('wall')
	pass

func exit() -> void:
	move.set_mode('normal')
	pass

func process(delta) -> void:
	pass

func physics_process(delta: float) -> void:
	move.normal(delta)
	
	if owner.is_floor() or not owner.is_wall() :
		change_state('idle')
		return
	
	move.set_movement(delta)

func unhandled_input(event: InputEvent) -> void:
	pass
