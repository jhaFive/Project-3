extends Node2D

@onready var scene = preload("res://scenes/cup.tscn")
@onready var workstation = get_parent()
@onready var spawn_point: Marker2D = $SpawnPoint
var cup_available: bool = true

func _ready():
	workstation.reset.connect(_clear_drink)
func spawn_cup():
	var cup = scene.instantiate()
	cup.spawn_location = Vector2(spawn_point.global_position)
	workstation.add_child.call_deferred(cup)
	$AudioStreamPlayer.play()

func _on_press_detection_button_down():
	var target_destroy_cup = get_parent().find_child("Cup_Obj")
	if not cup_available: # checks if a cup is already on the screen
		pass
	else:
		cup_available = false
		spawn_cup()

func _clear_drink():
	cup_available = true
