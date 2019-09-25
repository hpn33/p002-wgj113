extends Node

func _ready() -> void:
	
	set_fps(60)

func _process(delta: float) -> void:
#	print('process')
#	print(Performance.get_monitor(Performance.TIME_FPS))
#	var physics = Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS)
#	var process = Performance.get_monitor(Performance.TIME_PROCESS)
	pass


func _physics_process(delta: float) -> void:
#	print('physics_process')
	pass

func set_fps(fps = 0):
	Engine.target_fps = fps
	ProjectSettings.set_setting('physics/common/physics_fps', fps)
	