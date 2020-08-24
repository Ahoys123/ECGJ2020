extends Sprite


export var isOn = true


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if !isOn:
		remove_child($Light)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
