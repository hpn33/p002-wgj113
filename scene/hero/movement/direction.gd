extends Node

var direction := Vector2()

var x = 0 setget , get_x
var y = 0 setget , get_y

func _process(delta: float) -> void:

	
	set_direction()


func set_direction():
	
	var right = int(Input.is_action_pressed('ui_right'))
	var left = int(Input.is_action_pressed('ui_left'))
	var up = int(Input.is_action_pressed('ui_up'))
	var down = int(Input.is_action_pressed('ui_down'))
	
	
	direction.x = right - left
	direction.y = down - up


func get_x():
	return direction.x

func get_y():
	return direction.y
