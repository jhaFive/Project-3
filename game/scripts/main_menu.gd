# Script to make the buttons of the Main Menu work 

extends Control

# Play Button 
func _on_start_game_pressed() -> void:
	print("start") #debug
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Changes curent scene to the one saved as "game"

# Exit Button
func _on_exit_pressed() -> void:
	print("exit") #debug
	get_tree().quit() # Quits the aplication
