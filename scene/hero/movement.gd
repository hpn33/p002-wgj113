extends Node

export(bool) var active = true

export(float) var speed = 5000
var direction := Vector2()
var velocity := Vector2()

var current_direction := 0 setget , get_current_direction

func _physics_process(delta: float) -> void:
	
	if not active:
		return
	
	set_direction()
	set_force(delta)
	
	set_movement(delta)



func set_direction():
	
	var right = int(Input.is_action_pressed('ui_right'))
	var left = int(Input.is_action_pressed('ui_left'))
	var up = int(Input.is_action_pressed('ui_up'))
	var down = int(Input.is_action_pressed('ui_down'))
	
	
	direction.x = right - left
	direction.y = down - up

func set_force(delta):
	
	velocity.x += speed * direction.x
	
	if direction.x == 0:
		velocity.x = lerp(velocity.x, 0, 10 * delta)
	

func set_movement(delta) -> Vector2:
	
	var vel = velocity * delta
	
	var motion = owner.move_and_slide(vel, Vector2.UP)
	
	return motion
	pass




func get_current_direction():
	return $"../Pivot".scale.x