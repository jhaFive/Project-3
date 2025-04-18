extends Control

@onready var drink_mix_label: Label = $CanvasLayer/DrinkMix_Label
var drink_list: Array = []

func _update_drink_stack():
	drink_mix_label.text = str("INGREDIENTS")
