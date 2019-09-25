extends Sprite

onready var colli = $area2d/CollisionShape2D

export(Vector2) var force := Vector2(600, 0)


func _ready() -> void:
	visible = false
	colli.disabled = true

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept") and not visible:
		$Timer.start()
		visible = true
		colli.disabled = false

func _on_Timer_timeout() -> void:
	visible = false
	colli.disabled = true


func _on_area2d_body_entered(body: PhysicsBody2D) -> void:
	
	if body.is_in_group('touch'):
		body.linear_velocity = force * owner.move.current_direction
