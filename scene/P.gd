extends KinematicBody2D

export (int) var speed = 800
export (float) var rotation_speed = 3

var dir := Vector2()
var velocity = Vector2()
var rot := 0.0

func get_input():
	var right = int(Input.is_action_pressed('ui_right'))
	var left = int(Input.is_action_pressed('ui_left'))
	var up = int(Input.is_action_pressed('ui_up'))
	var down = int(Input.is_action_pressed('ui_down'))
	
	
	dir.x = right - left
	dir.y = down - up
	
	velocity = Vector2()
	
	velocity = Vector2(0, speed * dir.y).rotated(rot)

func _physics_process(delta):
	get_input()
	rot += dir.x * rotation_speed * delta
	rotation = rot
	velocity = move_and_slide(velocity)