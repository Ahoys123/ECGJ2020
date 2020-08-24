extends KinematicBody2D


export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
export var WANDER_TARGET_RANGE = 4

enum {
	IDLE,
	WANDER
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var idleCount = 10
var wanderCount = 10
	
export var state = IDLE
	
onready var sprite = $Ghost_Collidable/AnimatedSprite
onready var playerDetectionZone = $PlayerDetectionZone
onready var wanderController = $WanderController

func _ready():
	state = pick_random_state([IDLE, WANDER])

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			#seek_player()
			if(wanderController.get_time_left() == 0):
				update_wander()
			
		WANDER:
			#seek_player()
			if(wanderController.get_time_left() == 0):
				update_wander()
			accelerate_towards_point(wanderController.target_position, delta)
			if global_position.distance_to(wanderController.target_position) <= WANDER_TARGET_RANGE:
				update_wander()
			
				
	#if(softCollision.is_colliding()):
	#	velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)
	
func update_wander():
	state = pick_random_state([IDLE, WANDER])
	print(rand_range(2,5))
	wanderController.start_wander_timer(rand_range(2, 5))

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point) #(player.global_position - global_position).normalized()
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0
	
func pick_random_state(state_list):
	if(idleCount > 0):
		idleCount -=1
	else:
		if(wanderCount > 0):
			return WANDER
		else:
			wanderCount = rand_range(2,8)
			idleCount = rand_range(2,8)
			return IDLE
	return IDLE
