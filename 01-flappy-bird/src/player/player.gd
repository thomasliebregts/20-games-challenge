extends CharacterBody2D

const JUMP_VELOCITY = -400.0
signal dead

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	var collision = get_last_slide_collision()
	if collision:
		dead.emit()
		queue_free()
