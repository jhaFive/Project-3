extends Node2D

var customerType = [1, 2, 3, 4, 5, 6]
var cat = 1

func _ready() -> void:
	_random_cat()
			
func _random_cat():
	cat = customerType[randi() % 6] + 1
	match cat:
		1:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/strawberry_cat.png")
		2:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/bucket_cat.png")
		3:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/black_cat.png")
		4:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/orange_cat.png")	
		5:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/deeby_cat.png")	
		6:
			$Sprite2D/cat.texture=ResourceLoader.load("res://art/sprites/white_cat.png")	
