extends KinematicBody2D


onready var move = $movement
onready var floor_detector = $FloorDetector
onready var wall_detector = $wdHolder


func _process(delta: float) -> void:
#	rotation += 1 * delta
	pass

func is_floor():
	return floor_detector.is_on_floor()

func is_wall():
	return wall_detector.is_colliding()

func wall_side():
	return wall_detector.get_side()