extends Control

@onready var drink_mix_label: Label = $CanvasLayer/DrinkMix_Label
var drink_list: Array = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_drink_stack():
	drink_mix_label.text = str("INGREDIENTS")
