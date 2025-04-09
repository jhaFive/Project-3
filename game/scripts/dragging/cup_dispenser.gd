extends Sprite2D

var scene = load("res://scenes/draggables/draggable.tscn")
var cup = scene.instantiate()

func spawn_cup():
	cup = scene.instantiate()
	add_child(cup)

func _on_press_detection_pressed() -> void:
	if has_node("draggable"): # checks if a cup is already on the screen
		remove_child(cup)
		print("be gone")# debug
	else:
		spawn_cup()
