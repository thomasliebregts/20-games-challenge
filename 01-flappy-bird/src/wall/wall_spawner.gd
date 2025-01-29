extends Node2D

const HOLE_SIZE = 250
const WALL = preload("res://wall/wall.tscn")

var screen_size: Vector2i

func _ready() -> void:
	screen_size = get_viewport().size
	
func _on_timer_timeout() -> void:
	var top_wall = WALL.instantiate()
	var bottom_wall = WALL.instantiate()
	
	var top = randi_range(screen_size.y * 0.15, screen_size.y * 0.85)
	add_child(top_wall)
	add_child(bottom_wall)
	
	top_wall.set_side(Wall.Side.TOP)
	bottom_wall.set_side(Wall.Side.BOTTOM)
	
	var height = top_wall.get_height() / 2
	top_wall.position.y = top - position.y - height - HOLE_SIZE / 2
	bottom_wall.position.y = top + HOLE_SIZE / 2 - position.y+ height
