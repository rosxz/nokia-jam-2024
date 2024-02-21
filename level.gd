extends Node2D

@onready var player = $CharacterBody2D as CharacterBody2D
@onready var camera = $Camera2D as Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_point_1_body_entered(body):
	if body is CharacterBody2D:
		# check if should be sent up or down
		player.global_position.y += 12 * (1 if body.velocity.y > 0 else -1)
		camera.global_position.y += 84 * (1 if body.velocity.y > 0 else -1)
			
