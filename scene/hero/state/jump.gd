extends State

var move
onready var timer = $Timer

func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	
	move.ga = true
	move.ja = false
#	move.set_mode('jump')
	timer.start()
	pass

func exit() -> void:
	
	timer.stop()
	move.set_mode('normal')
	
#	move.gravity = move.normal_gravity
	pass

func process(delta) -> void:
	pass

func physics_process(delta: float) -> void:
	
	move.normal(delta)
#	print(owner.is_floor())
	if owner.is_floor():
		change_state('idle')
		return
	
	if owner.is_wall():
		change_state('wall')
		return
	
	move.set_movement(delta)

func unhandled_input(event: InputEvent) -> void:
	pass


func _on_Timer_timeout() -> void:
	move.set_mode('jump')
