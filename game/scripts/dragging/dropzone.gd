extends StaticBody2D

@onready var cup = get_parent().find_child("Cup_Obj")

var has_cup: bool = false

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false

func _cup():
	has_cup = true
	
func _no_cup():
	has_cup = true

func _on_area_2d_body_entered(body) -> void:
	_check_cup(body)

func _check_cup(body):
	if body.is_in_group("Cup"):
		body.cup_delivered.connect(_cup)
	else:
		has_cup = false
