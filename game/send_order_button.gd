extends Control

signal send_order

@onready var workstation = get_parent().get_parent().find_child("WorkStation")

func _on_button_pressed():
	emit_signal("send_order")
