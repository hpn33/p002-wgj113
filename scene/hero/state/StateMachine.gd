extends StateMachine

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_focus_next'):
		if _state_name == 'fly':
			transition_to('idle')
		else:
			transition_to('fly')