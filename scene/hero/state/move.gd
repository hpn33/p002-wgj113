extends State

var move

func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	move.ga = false
	move.ja = true
	
	move.set_mode('normal')
	pass

func process(delta: float) -> void:
	move.normal(delta)
	
#	print(owner.floor_detector.is_on_floor())
	
	if int(move.velocity.x) == 0 :
		change_state('idle')
		return
	
	if not owner.is_floor():
		change_state('jump')
		return
	
#	if owner.is_wall():
#		change_state('wall')
#		return
	
	move.set_movement(delta)


