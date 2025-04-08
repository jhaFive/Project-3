extends Node2D

# Start already dragging
var draggable = true 
var is_inside_droppable = false
var body_ref
var offset: Vector2


func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
# When the cup is being pressed
func _on_click_detection_button_down() -> void:
	draggable = true

# When the cup is being NOT pressed
func _on_click_detection_button_up() -> void:
	draggable = false 


func _on_area_2D_mouse_entered():
	if not Global.is_dragging:
		draggable = true 

func _on_area_2D_mouse_exited():
	if not Global.is_dragging:
		draggable = false 
	
func _on_area_2D_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_droppable = true
		body_ref = body

func _on_area_2D_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_droppable = false
