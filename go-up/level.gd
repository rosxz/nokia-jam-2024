extends Node2D

@onready var player = $CharacterBody2D as CharacterBody2D
@onready var camera = $Camera2D as Camera2D
@onready var audio_player = $AudioStreamPlayer as AudioStreamPlayer
@onready var jumps = $jumps as Label

var total_jumps = 0

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


func _on_character_body_2d_sound_player(track):
	var audio_stream
	match track:
		"jump":
			audio_stream = preload("res://go-up/blip14.wav")
		"bounce":
			audio_stream = preload("res://go-up/blip8.wav")
		"recover":
			if not audio_player.playing:
				audio_stream = preload("res://go-up/blip8.wav")
	audio_player.stream = audio_stream
	audio_player.play()


func _on_button_sound_button():
	var audio_stream = preload("res://go-up/odd4.wav")
	audio_player.stream = audio_stream
	audio_player.play()


func _on_node_check_point_4_checkpoint_exit(sender, body):
	checkpoint(sender, body)


func _on_node_check_point_5_checkpoint_exit(sender, body):
	checkpoint(sender, body)


func _on_node_check_point_6_checkpoint_exit(sender, body):
	checkpoint(sender, body)


func _on_character_body_2d_count_jump():
	total_jumps += 1
	jumps.text = str(total_jumps) + " JMPS"
