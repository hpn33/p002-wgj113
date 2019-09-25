extends Node

export(bool) var active = true


var velocity := Vector2()

var current_direction := 0 setget , get_current_direction

onready var dir = $direction

var max_speed := Vector2()
var gravity := Vector2()
var speed := Vector2()
var jump := Vector2()
var friction := Vector2()
var rotation_speed := 0.0

var rotation := 0.0

var modes := {
	'normal': {
		'gravity': Vector2(0, 300),
		'speed': Vector2(5000, 0),
		'jump': Vector2(0, -3000),
		'max_speed': Vector2(30000, 30000),
		'friction': Vector2(10, 1),
		'rotation_speed': 0.0
	},
	'wall': {
		'gravity': Vector2(0, 100),
		'jump': Vector2(5000, -10000)
	},
	'jump': {
		'gravity': Vector2(0, 1000)
	},
	'fly': {
		'gravity': Vector2(0, 100),
		'friction': Vector2(1, 1),
		'jump': Vector2(0, 0),
		'max_speed': Vector2(1500, 1500),
		'speed': Vector2(0, 3000),
		'rotation_speed': 3.0
	}
}

func set_mode(mode_name: String):
	var cmode :Dictionary = modes[mode_name]
	
	for key in cmode:
		self.set(key, cmode[key])

func _ready() -> void:
	set_mode('normal')

var ga = true
var ja = true
var vel_reset = true

func _physics_process(delta: float) -> void:
	
	pass


func normal(delta):
	
	
	if ga:
		owner.move_and_collide(gravity * delta)
	
	
	if Input.is_action_just_pressed('ui_up') and ja:
		
		var j = jump
		j.x *= -owner.wall_side()
		
		velocity = j
		
		owner.move_and_collide(j * delta)
	
	
	# X
	velocity.x += speed.x * dir.x
	
#	if dir.x:
	
	velocity.x = clamp(velocity.x, -max_speed.x, max_speed.x)
#	else:
	velocity.x = lerp(velocity.x, 0, friction.x * delta)
	
	velocity.x = near(velocity.x, 0, 500)
	
	
	# Y
	
	if dir.y:
		velocity.y += speed.y * dir.y
	
		velocity.y = clamp(velocity.y, -max_speed.y, max_speed.y)
	
	else:
		velocity.y = lerp(velocity.y, 0, friction.y * delta)
		
		velocity.y = near(velocity.y, 0, 500)


func fly(delta):
	
	# apply gravity
	owner.move_and_collide(gravity * delta)
	
	
	# rotation
	if dir.x:
		rotation += (rotation_speed * delta) * dir.x
		rotation = fix_rad(rotation)
	
	if dir.y:
		var y = speed.y * dir.y * delta
		print(y)
		velocity += Vector2(0, y).rotated(rotation)
		
	
		velocity.x = clamp(velocity.x, -max_speed.x, max_speed.x)
		velocity.y = clamp(velocity.y, -max_speed.y, max_speed.y)
	
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction.y * delta)
		
#		velocity.x = near(velocity.x, 0, 500)
#		velocity.y = near(velocity.y, 0, 500)
	


func fix_rad(value)-> float:
	
	var mx = 6.283185
	
	if value > mx:
		return value - mx
	
	if value < 0:
		return mx - value
	
	return value


func set_movement(delta, del = true) -> Vector2:
	
	owner.rotation = rotation
	
	var vel := velocity
	
	if del:
		 vel *= delta
	
	var motion = owner.move_and_slide(vel, Vector2.UP)
	
	if del:
		velocity = motion / delta
	
	return motion


func near(value, target, offset) -> float:
	var mi = target - offset
	var mx = target + offset
	
	if value < mx and value > mi:
		return target
	return value


func get_current_direction():
	return $"../Pivot".scale.x