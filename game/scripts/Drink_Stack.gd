extends Node

signal reset

@onready var clear_button = get_parent().find_child("ClearButton")
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

var has_cup: bool = false

# variables deleted as they have been converted to global
# we will need them in global to be able to change their values between all scripts at the same time

var boba_available: bool = true
var tea_available: bool = true
var topping_available: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear_button.clear_ingredients.connect(_clear_drink)
	
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
	# I'm not entirely sure, I'll be sure to ask about this part
	emit_signal("reset")
	
	# Why are we using strings for a variable that will only hold 1 value at a time again?
	# I believe strings are being used here to be more understandable that there is nothing in the cup. Using strings, I more easily understand what is the current item
	Global.current_boba = str("NOTHING")
	Global.current_tea = str("NOTHING")
	Global.current_topping = str("NOTHING")
	
	boba_available = true
	tea_available = true
	topping_available = true
