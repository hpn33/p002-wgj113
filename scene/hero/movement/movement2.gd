extends Node

export(bool) var active = true


var velocity := Vector2()

var current_direction := 0 setget , get_current_direction


onready var direction = $direction


export var modes := {
	'normal': {
		'gravity': 250,
		
		'speed': Vector2(5000, 0),
		'max_speed': Vector2(30000, 5000),
		"friction": 12,
		
		'jump': -5000
	},
	'fly': {
		'gravity': 2,
		
		'speed': Vector2(5000, 5000),
		'max_speed': Vector2(60000, 60000),
		"friction": 5,
		
		'jump': 0
	}
}

var g_active = true
var j_active = true
var f_active = true

var mode_name := 'normal'
var cmode := {} setget , cmode

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	set_gravity(delta)
	set_jump(delta)
	set_force(delta)


func set_movement(delta) -> Vector2:
	
	var vel = velocity * delta
	
	var motion = owner.move_and_slide(vel, Vector2.UP)
	
	return motion

func active(g = true, j = true, f = true):
	g_active = g
	j_active = j
	f_active = f


func set_gravity(delta):
	if not g_active:
		return
	
	
	var g = Vector2(0, cmode()['gravity'])
	
	# increase gravity
#	velocity.y += cmode()['gravity']
	velocity.y += g.y
	
#	var g = Vector2()
	g.y = velocity.y
	
	owner.move_and_collide(g * delta)
	

func set_jump(delta):
	if not j_active:
		return
	
	if Input.is_action_just_pressed('ui_up'):
		
		var j = Vector2(0, cmode()['jump'])
		
		velocity.y += j.y
		j.y = velocity.y
		
		owner.move_and_collide(j * delta)

func set_force(delta):
	
	var max_speed= cmode()['max_speed']
	var speed = cmode()['speed']
	var dir = $direction
	
	# X
	velocity.x += speed.x * dir.x
	
	velocity.x = clamp(velocity.x, -max_speed.x, max_speed.x)
	
	if dir.x == 0:
		velocity.x = lerp(velocity.x, 0, cmode()['friction'] * delta)
	
	
	# Y
	velocity.y += speed.y * dir.y
	
	velocity.y = clamp(velocity.y, -max_speed.y, max_speed.y)
	
	if dir.y == 0:
		velocity.y = lerp(velocity.y, 0, cmode()['friction'] * delta)

func get_current_direction():
	return $"../Pivot".scale.x


func cmode() -> Dictionary:
	return modes[mode_name]