extends Node2D

export(NodePath) var node_to_follow
export(Vector2) var offset
const speed = 100
onready var follow_node = get_node("/root/Level1/Player")
onready var parent = self.get_parent()

func _physics_process(delta):
	parent.position = parent.position + offset + (follow_node.position - parent.position).normalized() * delta * speed
