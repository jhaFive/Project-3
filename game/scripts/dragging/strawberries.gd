extends CharacterBody2D

signal strawberries_delivered

var dragging = false
var in_dropzone: bool = false
var past_location: Vector2

var spawn_location: Vector2
@onready var dropzone = get_parent().find_child("dropzone")
@onready var end_location_marker = get_parent().find_child("dropzone")
@onready var workstation = get_parent()

 # for smooth lock in mouse
@warning_ignore("unused_parameter")
func _ready() -> void:
	workstation.reset.connect(_clear_drink)
	past_location = Vector2(self.position)

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()

# When the cup is being pressed
func _on_click_detection_button_down() -> void:
	$Pickup.play()
	dragging = true
	Global.is_dragging = true

# When the cup is being NOT pressed
func _on_click_detection_button_up() -> void:
	if not in_dropzone:
		global_position = past_location
	dragging = false 
	Global.is_dragging = false
	if in_dropzone and not dragging:
		if dropzone.has_cup and workstation.topping_available:
			$Putdown.play()
			emit_signal("strawberries_delivered", "topping", "strawberries")
			global_position = end_location_marker.global_position
			visible = false
		else:
			global_position = past_location

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("dropzone"):
		in_dropzone = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("dropzone"):
		in_dropzone = false

func _clear_drink():
	visible = true
	var tween
	tween = create_tween()
	tween.tween_property(self, "global_position", past_location,0.5)
