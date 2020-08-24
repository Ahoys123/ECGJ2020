extends Node2D


export(int) var wanter_range = 32

onready var start_position = global_position #never changes, to ensure the monster never wanders too far from its initial position
onready var target_position = global_position

onready var timer = $Timer

export var timeRemaining = 0

func _ready():
	update_target_position()
	timeRemaining = timer.time_left

func update_target_position():
	var target_vector = Vector2(rand_range(-wanter_range, wanter_range), rand_range(-wanter_range, wanter_range))
	target_position = start_position + target_vector

func get_time_left():
	return timer.time_left
	
func start_wander_timer(duration):
	timer.start(duration)
	
func _on_Timer_timeout():
	print("Timeout")
	update_target_position()
