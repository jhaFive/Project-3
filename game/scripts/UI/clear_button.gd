extends Control

signal clear_ingredients

@onready var workstation = get_parent().get_parent().find_child("WorkStation")

func _on_button_pressed():
	emit_signal("clear_ingredients")
	$AudioStreamPlayer.play(.15)
