extends Node2D

@onready var player = $CharacterBody2D as CharacterBody2D
@onready var camera = $Camera2D as Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func checkpoint(sender, body):
	if body is CharacterBody2D:
		# check if should be sent up or down
		var direction = 1 if player.global_position.y > sender.global_position.y else -1
		player.global_position.y += 1 * direction
		if direction != sign(camera.global_position.y - sender.global_position.y):
			camera.global_position.y += 84 * direction


func _on_node_check_point_1_checkpoint_exit(sender, body):
	checkpoint(sender, body)


func _on_node_check_point_2_checkpoint_exit(sender, body):
	checkpoint(sender, body)


func _on_node_check_point_3_checkpoint_exit(sender, body):
	checkpoint(sender, body)
