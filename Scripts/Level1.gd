extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setup_tiles():
	var cells = $SceneDressing/Office_Furnture_setTileMap.get_used_cells()
