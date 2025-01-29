@tool
extends Sprite2D

@export var cloud_textures: Array[Texture2D]
const MIN_SPEED = 25
const MAX_SPEED = 85
const MIN_SCALE = 0.5
const MAX_SCALE = 2

var speed: float
var image_scale: float = 1

func _ready() -> void:
	var cloud_index = randi_range(0, cloud_textures.size() - 1)
	self.texture = cloud_textures[cloud_index]
	speed = randf_range(MIN_SPEED, MAX_SPEED)
	
	var new_scale = ((speed - MIN_SPEED) * MIN_SCALE) / (MAX_SPEED - MIN_SPEED) + MIN_SCALE
	scale = Vector2(new_scale, new_scale)
	z_index = new_scale * 100

func _process(delta: float) -> void:	
	if Engine.is_editor_hint():
		return
		
	position.x -= speed * delta

func _on_visibility_checker_screen_exited() -> void:
	queue_free()
