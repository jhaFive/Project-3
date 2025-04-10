extends Node2D

@onready var scene = preload("res://scenes/cup.tscn")
@onready var main = get_parent()
@onready var spawn_point: Marker2D = $SpawnPoint
var cup_available:bool = true

func spawn_cup():
	var cup = scene.instantiate()
	cup.spawn_location = Vector2(spawn_point.global_position)
	main.add_child.call_deferred(cup)

func _on_press_detection_pressed() -> void:
	var target_destroy_cup = get_parent().find_child("Cup_Obj")
	if not cup_available: # checks if a cup is already on the screen
		pass
	else:
		cup_available = false
		spawn_cup()
