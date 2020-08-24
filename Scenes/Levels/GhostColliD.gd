extends InteractableItem

# By default interactable items are only availble to the Player class
func interaction_interact(interactionComponentParent : Sprite) -> void:
	print ("Boo!")
	queue_free()
