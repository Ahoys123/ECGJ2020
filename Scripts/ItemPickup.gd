extends Area2D

var following = false
var followNumb = 0
var offsetMultiplier = 100
var followNode = null
export var hasLightsource = true

func _ready():
	if !hasLightsource:
		remove_child($Light2D)

func _process(delta):
	if !following:
		var overlap = self.get_overlapping_areas() 
		if overlap.size() != 0 && Input.is_action_just_pressed("ui_accept"):
			for i in overlap:
				if i.is_in_group("player"):
					remove_child($CanPickupRange)
					followNode = load("res://Prefabs/Follow.tscn").instance()
					add_child(followNode)
					followNumb = get_node("/root/Level1/Player").get_new_id()
					following = true
					self.add_to_group("follower")
					followNode.offset = Vector2(followNumb * offsetMultiplier, 0)
					
		
func onInvComm(id, action):
	print(id, action, followNumb)
	if action == "add" && followNumb == 0:
		followNumb = id
	elif action == "add":
		pass
	elif action == "sub" && followNumb == id:
		queue_free()
	elif action == "sub" && followNumb > id:
		followNumb -= 1
	elif action == "sub" && followNumb < id:
		pass
	else:
		print("You shouldn't be here, ever.")
	followNode.offset = Vector2(followNumb * offsetMultiplier, 0)
