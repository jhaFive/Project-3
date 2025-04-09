# makes it possible to drag the cup object
extends Sprite2D
# Start already dragging
var dragging = true 

 # for smooth lock in mouse
@warning_ignore("unused_parameter")
func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()

# When the cup is being pressed
func _on_click_detection_button_down() -> void:
	dragging = true

# When the cup is being NOT pressed
func _on_click_detection_button_up() -> void:
	dragging = false 
