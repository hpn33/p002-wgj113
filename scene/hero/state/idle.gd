extends State

var move


func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	move.ga = false
	move.ja = true
	
	move.set_mode('normal')

func process(delta: float) -> void:
	move.normal(delta)
	
	if int(owner.move.velocity.x) != 0:
		change_state('move')
	
	if not owner.is_floor():
		change_state('jump')
	
	move.set_movement(delta)
