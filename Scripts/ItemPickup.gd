extends Area2D

func _process(delta):
	var overlap = self.get_overlapping_areas() 
	if overlap.size() != 0 && Input.is_action_just_pressed("ui_accept"):
		for i in overlap:
			if i.is_in_group("player"):
				queue_free()
