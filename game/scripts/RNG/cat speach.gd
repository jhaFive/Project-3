extends Node

var lboba = ['bo0','bo1','bo2'] #0 = black, 1 = star, 2 = jelly
var ltea = ['te0','te1','te2'] #0 = matcha, 1 = strawberry, 2 = brown
var ltop = ['to0','to1','to2'] #0 = cream, 1 = foam, 2 = berries

func _ready() -> void:
	randomize()
	
	# selects the item
	var boba = lboba[randi() % 3]
	var tea = ltea[randi() % 3]
	var top = ltop[randi() % 3]
	
	#debug
	print(boba)
	print(tea)
	print(top)
	
	# changes the placeholder texture to the correct boba
	if boba == 'bo0':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://assets/place holders/black_boba.png")
	elif boba == 'bo1':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://assets/place holders/star_boba.png")
	elif boba == 'bo2':
		$Sprite2D/Boba.texture=ResourceLoader.load("res://assets/place holders/jelly_boba.png")
	
	# changes the placeholder texture to the correct tea
	if tea == 'te0':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://assets/place holders/te0.png")
	elif tea == 'te1':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://assets/place holders/te1.png")
	elif tea == 'te2':
		$Sprite2D/Tea.texture=ResourceLoader.load("res://assets/place holders/te2.png")
	
	# changes the placeholder texture to the correct top
	if top == 'to0':
		$Sprite2D/Top.texture=ResourceLoader.load("res://assets/place holders/to0.png")
	elif top == 'to1':
		$Sprite2D/Top.texture=ResourceLoader.load("res://assets/place holders/to1.png")
	elif top == 'to2':
		$Sprite2D/Top.texture=ResourceLoader.load("res://assets/place holders/to2.png")
