extends Area2D

func onInteracted(successful):
	var overlap = self.get_overlapping_areas() 
	if overlap.size() != 0 && Input.is_action_just_pressed("ui_accept"):
		for i in overlap:
			if i.is_in_group("player"):
				whenInteracted(successful)

func whenInteracted(success):
	print("hi")
