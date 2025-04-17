extends Node

signal reset

@onready var clear_button = get_parent().find_child("ClearButton")
@onready var dropzone = $dropzone
@onready var new_pearl = $NewPearl
@onready var star = $Star
@onready var jelly = $Jelly

var has_cup: bool = false

# variables deleted as they have been converted to global
# we will need them in global to be able to change their values between all scripts at the same time

var boba_available: bool = true
var tea_available: bool = true
var topping_available: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear_button.clear_ingredients.connect(_clear_drink)
	new_pearl.pearl_delivered.connect(_update_drink)
	star.star_delivered.connect(_update_drink)
	jelly.jelly_delivered.connect(_update_drink)

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
	emit_signal("reset")
	
	# Why are we using strings for a variable that will only hold 1 value at a time again?
	Global.current_boba = str("NOTHING")
	Global.current_tea = str("NOTHING")
	Global.current_topping = str("NOTHING")
	
	boba_available = true
	tea_available = true
	topping_available = true
