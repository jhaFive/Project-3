extends Node2D

# removed  old variables
# useless now that the order variables from the speach script were turned into global variables
# just use the same ones as used in the "res://scripts/RNG/cat speach.gd" script

# sets a a variable for the current order (why do we need this?)
var current_full_order

@onready var cat_speach = $"Cat Speach"
@onready var time_label = $Timer/Time
@onready var timer = $Timer

# calls for the "_update_order_list" function to update the "current_full_order" string into a single string with every ingredient in it
# ingredients are listed in the following order: Boba, Tea and Topping
# why are we doing this?
func _ready():
	timer.start(60)
	cat_speach.drink_order.connect(_update_order_list)

# I would just brute force it with the 3 variables but if you think you can do it with a single string go for it
func _update_order_list(boba: String, tea: String, topping: String): 
	current_full_order = str((Global.boba) + (Global.tea) + (Global.top))

func _process(delta):
	time_label.text = "Time: " + str(int(timer.time_left))
	
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
