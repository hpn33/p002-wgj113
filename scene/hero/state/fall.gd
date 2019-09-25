extends Node

var move

func enter(msg: Dictionary = {}) -> void:
	move = owner.move
	pass

func exit() -> void:
	pass

func process(delta) -> void:
	pass

func physics_process(delta: float) -> void:
	pass

func unhandled_input(event: InputEvent) -> void:
	pass
