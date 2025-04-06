extends Sprite2D

var scene = load("res://scenes/cup.tscn")
var cup = scene.instantiate()










#v.2
#func spawn(pos):
#	cup.position = pos
#	add_child(cup)
#
#func _on_press_detection_pressed() -> void:
#	if has_node("Cup_Obj"):
#		remove_child(cup)
#	else:
#		spawn(Vector2(0,0))

#v.1
#func _on_press_detection_pressed(pos) -> void:
#	cup.position = pos
#	if has_node("Cup_Obj"): # checks if a cup is already on the screen
#		remove_child(cup)
#		print("kys")# debug
#	else:
#		add_child(cup)# spawn a cup
