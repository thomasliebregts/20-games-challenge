extends Node2D

var score = 0
@onready var timer: Timer = %Timer
@onready var distance_label: RichTextLabel = %DistanceLabel

func _on_timer_timeout() -> void:
	score += timer.wait_time
	distance_label.text = "[center]Distance: " + str(score) + "m[/center]"

func _on_player_dead() -> void:
	var tree = get_tree()
	tree.paused = true
	distance_label.text = "[center]You have flown " + str(score) + " meter![center]"
	await tree.create_timer(5).timeout
	tree.reload_current_scene()
	tree.paused = false
