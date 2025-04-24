extends Node

signal reset
signal newOrder

@onready var clear_button = get_parent().find_child("ClearButton")
@onready var send_order_button = get_parent().find_child("SendOrderButton")
@onready var dropzone = $dropzone

# These variables keep track of what can be dragged in the cup
@onready var new_pearl = $NewPearl
@onready var star = $Star
@onready var jelly = $Jelly
@onready var matcha = $Matcha
@onready var strawberry = $Strawberry
@onready var brownSugar = $BrownSugar
@onready var whipCream = $WhipCream
@onready var cheeseFoam = $CheeseFoam
@onready var strawberries = $Strawberries

# For scoring
@onready var score_label = $Score
var score = 0

var correct_order: bool = false
var has_cup: bool = false

# variables deleted as they have been converted to global
# we will need them in global to be able to change their values between all scripts at the same time

var boba_available: bool = true
var tea_available: bool = true
var topping_available: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear_button.clear_ingredients.connect(_clear_drink)
	send_order_button.send_order.connect(_send_order)
	
	# These update the graphics and keeps track of what is dragged to the cup
	# This section handles the boba ingredients
	new_pearl.pearl_delivered.connect(_update_drink)
	star.star_delivered.connect(_update_drink)
	jelly.jelly_delivered.connect(_update_drink)
	
	# This section handles the tea ingredients
	matcha.matcha_delivered.connect(_update_drink)
	strawberry.strawberry_delivered.connect(_update_drink)
	brownSugar.brownSugar_delivered.connect(_update_drink)
	
	# This section handles the topping ingredients
	whipCream.whipCream_delivered.connect(_update_drink)
	cheeseFoam.cheeseFoam_delivered.connect(_update_drink)
	strawberries.strawberries_delivered.connect(_update_drink)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_drink(type: String, ingredient: String):
	if type == "boba":
		Global.current_boba = ingredient
		boba_available = false
	if type == "tea":
		Global.current_tea = ingredient
		tea_available = false
	if type == "topping":
		Global.current_topping = ingredient
		topping_available = false
	
	# debugg
	print(ingredient)

func _clear_drink():
	# where tf is this signal being recived?
	# This signal is being recieved by the ingredients and cups to reset their positions back to their original places
	emit_signal("reset")
	
	# Why are we using strings for a variable that will only hold 1 value at a time again?
	# I believe strings are being used here to be more understandable that there is nothing in the cup. Using strings, I more easily understand what is the current item
	Global.current_boba = str("NOTHING")
	Global.current_tea = str("NOTHING")
	Global.current_topping = str("NOTHING")
	
	boba_available = true
	tea_available = true
	topping_available = true

# Checks if current drink matches the current order, resets the station, and creates a new order	
func _send_order():
	var correct_boba: bool = false
	var correct_tea: bool = false
	var correct_topping: bool = false
	
	# Matches drink variables to order variables
	if ((Global.current_boba == "pearl") && (Global.boba == 'bo0')) || ((Global.current_boba == "star") && (Global.boba == 'bo1')) || ((Global.current_boba == "jelly") && (Global.boba == 'bo2')):
		correct_boba = true

	if ((Global.current_tea == "matcha") && (Global.tea == 'te0')) || ((Global.current_tea == "strawberry") && (Global.tea == 'te1')) || ((Global.current_tea == "brownSugar") && (Global.tea == 'te2')):
		correct_tea = true

	if ((Global.current_topping == "whipCream") && (Global.top == 'to0')) || ((Global.current_topping == "cheeseFoam") && (Global.top == 'to1')) || ((Global.current_topping == "strawberries") && (Global.top == 'to2')):
		correct_topping = true
	
	# Checks for correct order	
	if correct_boba && correct_tea && correct_topping:
		correct_order = true
	else:
		correct_order = false
		
	$"../BG/Customers/Customer"._random_cat()
	_update_point(correct_order)
	
	# testing
	print("\nboba " + str(correct_boba))
	print("tea " + str(correct_tea))
	print("topping " + str(correct_topping))
	print("order " + str(correct_order))
	
	# Generates a new order
	emit_signal("newOrder")

	# Resets station	
	emit_signal("reset")
	
	Global.current_boba = str("NOTHING")
	Global.current_tea = str("NOTHING")
	Global.current_topping = str("NOTHING")
	
	boba_available = true
	tea_available = true
	topping_available = true
	
func _update_point(correct: bool):
	if correct:
		score += 100
		score_label.text = "Score: " + str(score) + "\nCorrect :D"
	else:
		score -= 100
		score_label.text = "Score: " + str(score) + "\nWrong D:"
