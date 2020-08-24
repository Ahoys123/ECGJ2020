extends Area2D

var following = false
func _process(delta):
	if !following:
		var overlap = self.get_overlapping_areas() 
		if overlap.size() != 0 && Input.is_action_just_pressed("ui_accept"):
			for i in overlap:
				if i.is_in_group("player"):
					remove_child($CanPickupRange)
					add_child(load("res://Prefabs/Follow.tscn").instance())
					following = true
		
