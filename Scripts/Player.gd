extends KinematicBody2D

export var ACCELERATION = 1000
export var MAX_SPEED = 150
#export var ROLL_SPEED = 120 #if we decide to use rolling, this dictates roll speed
export var FRICTION = 1000

var inventory = []
var item = null
signal interaction (success)
signal invComm (id, action)

var assigned = 0

var validItems = ["book", "torch", "heirloom", "key"]


enum {
	MOVE
	ROLL
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
#var roll_vector=Vector2.DOWN #if we decide to use rolling, this dictates facing

func _ready():
	animationTree.active = true

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
				for j in x:
					if j in validItems:
						inventory.append(j)
						emit_signal("invComm", inventory.size(), "add")
						print("added " + j)
			elif i.is_in_group("interact"):
				var x = i.get_groups()
				for j in x:
					if j in validItems:
						if j in inventory:
							print("removed " + j)
							var y = inventory.find(j)
							inventory.remove(y)
					
							assigned -= 1
							emit_signal("invComm", y + 1, "sub")
					
							emit_signal("interaction", true)
						else:
							print("cannot remove; not in inventory!")
					emit_signal("interaction", false)
			print(inventory)
	elif overlap.size() == 0 && Input.is_action_just_pressed("ui_accept"):
		print("nothing to interact with!")
		# do something here if you want something to happen when button pressed but no action can be performed


func move_state(delta, input_vector):
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		animationTree.set("parameters/Move/blend_position", input_vector)
		animationState.travel("Move")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animationState.travel("IdleDown")
	move()
	
func move():
	velocity = move_and_slide(velocity)


func _on_Hurtbox_area_entered(area):
	print("Ouch!")

func get_new_id():
	print(inventory.size())
	print("hi" + str(inventory))
	assigned += 1
	return assigned
