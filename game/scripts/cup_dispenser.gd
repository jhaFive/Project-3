extends Sprite2D

var scene = load("res://scenes/cup.tscn")
var cup = scene.instantiate()

func spawn(pos):
	cup.position = pos
	add_child(cup)

func _on_press_detection_pressed() -> void:
	if has_node("Cup_Obj"): # checks if a cup is already on the screen
		remove_child(cup)
		print("be gone")# debug
	else:
		spawn(Vector2(1000,0))# spawn a cup in the vector position
