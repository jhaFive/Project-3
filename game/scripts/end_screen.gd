extends Control

@onready var score_label = $Score
@onready var extra_label = $Extra

func _ready():
	score_label.text = str(Global.score)
	extra_label.text = "   Nice job"
	if (Global.score == 0):
		extra_label.text = "No score D:"
	if (Global.score < 0):
		extra_label.text = "You're fired :/"
	if (Global.score > 900):
		extra_label.text = "   Epic job :0"
	
	
func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# Exit Button
func _on_menu_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
