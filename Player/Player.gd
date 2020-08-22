extends KinematicBody2D

export var ACCELERATION = 1000
export var MAX_SPEED = 250
#export var ROLL_SPEED = 120 #if we decide to use rolling, this dictates roll speed
export var FRICTION = 1000

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

func move_state(delta, input_vector):
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	
func move():
	velocity = move_and_slide(velocity)
