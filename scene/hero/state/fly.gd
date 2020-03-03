extends State


var move

func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	
	move.ga = true
	move.ja = false
	move.vel_reset = false
	
	move.set_mode('fly')

func exit() -> void:
	move.vel_reset = false
	move.set_mode('normal')

func process(delta) -> void:
	pass

func physics_process(delta: float) -> void:
	move.fly(delta)
	move.set_movement(delta, false)
	pass

func unhandled_input(event: InputEvent) -> void:
	pass
