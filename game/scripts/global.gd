extends Node

var is_dragging = false 

# ingredients variables
# These work as variables for the curent order as they (should) get updated everytime a new order is made 
# in the "res://scripts/levels/level1.gd" script there is a string with the 3 values for some reason
var boba = 'bo0' # Replace number to get another ingredient 0 = black, 1 = star, 2 = jelly
var tea = 'te0' # Replace number to get another ingredient 0 = matcha, 1 = strawberry, 2 = brown
var top = 'to0' # Replace number to get another ingredient 0 = cream, 1 = foam, 2 = berries

# ingredients on cup variables
# why strings?
var current_boba: String
var current_tea: String
var current_topping: String

var score = 0
