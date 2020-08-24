extends Control

signal init_game_start

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$"ColorRect/Controls Text".visible = false
	$"ColorRect/Credits Text".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	print("Play game button pressed")
	emit_signal("init_game_start")

	

func _on_Controls_pressed():
	$"ColorRect/Controls".visible = false 
	$"ColorRect/Credits".visible = true 
	
	$"ColorRect/Controls Text".visible = true
	$"ColorRect/Credits Text".visible = false
	


func _on_Credits_pressed():
	$"ColorRect/Controls".visible = true 
	$"ColorRect/Credits".visible = false 
	
	$"ColorRect/Controls Text".visible = false
	$"ColorRect/Credits Text".visible = true
