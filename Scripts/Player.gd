extends KinematicBody2D

export var ACCELERATION = 1000
export var MAX_SPEED = 150
#export var ROLL_SPEED = 120 #if we decide to use rolling, this dictates roll speed
export var FRICTION = 1000

var inventory = []
var item = null


enum {
	MOVE
	ROLL
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
#var roll_vector=Vector2.DOWN #if we decide to use rolling, this dictates facing

func handle_input():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	return input_vector

func _physics_process(delta):
	var input_vector = handle_input()
	match state:
		MOVE:
			move_state(delta, input_vector)
		ROLL:
			pass
		ATTACK:
			pass

func _process(delta):
	var overlap = $ItemDetectArea.get_overlapping_areas() 
	if overlap.size() != 0 && Input.is_action_just_pressed("ui_accept"):
		for i in overlap:
			if i.is_in_group("item"):
				var x = i.get_groups()
				x.erase("item")
				inventory.append(x[0])
				print("added" + x[0])
			elif i.is_in_group("interact"):
				var x = i.get_groups()
				x.erase("interact")
				if x[0] in inventory:
					inventory.erase(x[0])
					print("removed " + x[0])
				else:
					print("cannot remove; not in inventory!")
	elif overlap.size() == 0 && Input.is_action_just_pressed("ui_accept"):
		print("nothing to interact with!")
		# do something here if you want something to happen when button pressed but no action can be performed


func move_state(delta, input_vector):
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	
func move():
	velocity = move_and_slide(velocity)


func _on_Hurtbox_area_entered(area):
	print("Ouch!")
