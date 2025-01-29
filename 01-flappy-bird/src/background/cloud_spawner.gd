extends Node2D

const CLOUD = preload("res://background/cloud.tscn")
const MIN_TIMEOUT = 0.25
const MAX_TIMEOUT = 2

@onready var timer: Timer = %Timer
var screen_size: Vector2i

func _ready() -> void:
	screen_size = get_viewport().size

func _on_timer_timeout() -> void:
	timer.stop()
	var new_cloud = CLOUD.instantiate()
	var random_y = randf_range(0, screen_size.y) - position.y
	new_cloud.position.y = random_y
	add_child(new_cloud)
	timer.wait_time = randf_range(MIN_TIMEOUT, MAX_TIMEOUT)
	timer.start()
