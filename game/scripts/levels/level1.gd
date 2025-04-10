extends Node2D

var current_order_boba: String
var current_order_tea: String
var current_order_topping: String

@onready var cat_speach = $"Cat Speach"
var current_full_order
func _ready():
	cat_speach.drink_order.connect(_update_order_list)
	

func _update_order_list(boba: String, tea: String, topping: String):
	current_order_boba = boba
	current_order_tea = tea
	current_order_topping = topping
	current_full_order = str((current_order_boba) + (current_order_tea) + (current_order_topping))
