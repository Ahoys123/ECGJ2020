extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 250
#export var ROLL_SPEED = 120 #if we decide to use rolling, this dictates roll speed
export var FRICTION = 500

enum {
	MOVE
	ROLL
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
#var roll_vector=Vector2.DOWN #if we decide to use rolling, this dictates facing


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			pass
		ATTACK:
			pass

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()	
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()	
	
func move():
	velocity = move_and_slide(velocity)
