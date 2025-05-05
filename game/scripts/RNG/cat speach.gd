extends Node

@warning_ignore("unused_signal")
signal drink_order 

var lboba = ['bo0','bo1','bo2'] #0 = black, 1 = star, 2 = jelly
var ltea = ['te0','te1','te2'] #0 = matcha, 1 = strawberry, 2 = brown
var ltop = ['to0','to1','to2'] #0 = cream, 1 = foam, 2 = berries

@onready var workstation = get_parent().find_child("WorkStation")

# Moved order picker to separate function
func _ready() -> void:
	workstation.newOrder.connect(_new_order)
	_new_order()

func _new_order():
	randomize()
	
	# selects the item
	Global.boba = lboba[randi() % 3]
	Global.tea = ltea[randi() % 3]
	Global.top = ltop[randi() % 3]
	
	#debug
	print(Global.boba)
	print(Global.tea)
	print(Global.top)
	
	# changes the placeholder texture to the correct boba
	if Global.boba == 'bo0':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://art/sprites/NewPearl.png")
	elif Global.boba == 'bo1':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://art/sprites/StarBoba.png")
	elif Global.boba == 'bo2':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://art/sprites/JellyBoba.png")
	
	# changes the placeholder texture to the correct tea
	if Global.tea == 'te0':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://art/sprites/MatchaIcon.png")
	elif Global.tea == 'te1':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://art/sprites/StrawberryIcon.png")
	elif Global.tea == 'te2':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://art/sprites/BrownSugarIcon.png")
	
	# changes the placeholder texture to the correct top
	if Global.top == 'to0':
		$Sprite2D/Top.texture=ResourceLoader.load("res://art/sprites/WhipCreamIcon.png")
	elif Global.top == 'to1':
		$Sprite2D/Top.texture=ResourceLoader.load("res://art/sprites/CheeseFoamIcon.png")
	elif Global.top == 'to2':
		$Sprite2D/Top.texture=ResourceLoader.load("res://art/sprites/FruitIcon.png")
	
