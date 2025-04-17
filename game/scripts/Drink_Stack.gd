extends Node

signal reset

@onready var clear_button = get_parent().find_child("ClearButton")
@onready var dropzone = $dropzone
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

var current_boba: String
var current_tea: String
var current_topping: String

var boba_available: bool = true
var tea_available: bool = true
var topping_available: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear_button.clear_ingredients.connect(_clear_drink)
	
	# boba
	new_pearl.pearl_delivered.connect(_update_drink)
	star.star_delivered.connect(_update_drink)
	jelly.jelly_delivered.connect(_update_drink)
	
	# tea
	matcha.matcha_delivered.connect(_update_drink)
	strawberry.strawberry_delivered.connect(_update_drink)
	brownSugar.brownSugar_delivered.connect(_update_drink)
	
	# topping
	whipCream.whipCream_delivered.connect(_update_drink)
	cheeseFoam.cheeseFoam_delivered.connect(_update_drink)
	strawberries.strawberries_delivered.connect(_update_drink)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_drink(type: String, ingredient: String):
	if type == "boba":
		current_boba = ingredient
		boba_available = false
	if type == "tea":
		current_tea = ingredient
		tea_available = false
	if type == "topping":
		current_topping = ingredient
		topping_available = false
	
	print(ingredient)

func _clear_drink():
	emit_signal("reset")
	current_boba = str("NOTHING")
	current_tea = str("NOTHING")
	current_topping = str("NOTHING")
	boba_available = true
	tea_available = true
	topping_available = true
