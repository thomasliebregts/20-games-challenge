class_name Wall
extends Node2D

enum Side { TOP, BOTTOM }

@onready var body: StaticBody2D = %Body
@onready var sprite: Sprite2D = %Sprite

func _physics_process(delta: float) -> void:
	body.position.x -= delta * 100

func set_side(side: Side) -> void:
	if side == Side.TOP:
		body.rotation_degrees = 180
	else:
		sprite.scale.x = -sprite.scale.x
		
func get_height() -> int:
	return sprite.texture.get_height() * sprite.scale.y

func _on_visibility_checker_screen_exited() -> void:	
	queue_free()
	
