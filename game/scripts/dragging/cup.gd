# makes it possible to drag the cup object
extends CharacterBody2D

signal cup_delivered
# Start already dragging
var draggable = true
var dragging = true 
var in_dropzone: bool = false

var spawn_location: Vector2
@onready var end_location_marker = get_parent().find_child("dropzone")
 # for smooth lock in mouse
@warning_ignore("unused_parameter")
func _ready() -> void:
	global_position = spawn_location
func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()
	if in_dropzone:
		if dragging == false:
			draggable = false
			emit_signal("cup_delivered")
			global_position = end_location_marker.global_position

# When the cup is being pressed
func _on_click_detection_button_down() -> void:
	if draggable:
		dragging = true
		Global.is_dragging = true

# When the cup is being NOT pressed
func _on_click_detection_button_up() -> void:
	if draggable:
		dragging = false 
		Global.is_dragging = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("dropzone"):
		in_dropzone = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("dropzone"):
		in_dropzone = false
