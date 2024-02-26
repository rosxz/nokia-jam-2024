extends Node2D

@onready var joystick = $Joystick as Sprite2D
@onready var game = $Game as Sprite2D
@onready var timer = $Timer as Timer
@onready var audio_player = $AudioStreamPlayer as AudioStreamPlayer

const game_level_path = {0: "res://go-up/menu.tscn", 1: "res://Fishing Game/menu/Menu.tscn"}
var texture
var game_index = 0
var audio_stream = preload("res://hit2.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# this is kinda shitte but alas
	var direction = int(Input.get_axis("mv_left", "mv_right"))

	if timer.is_stopped() and direction:
		move_joystick(direction)
		move_game(direction)
		timer.start()
	if Input.is_action_pressed("mv_special") or Input.is_action_pressed("act"):
		if game_index == 1:
			get_window().size = Vector2i(504, 288)
		get_tree().change_scene_to_file(game_level_path.get(game_index, "res://go-up/menu.tscn"))

func move_joystick(direction):
	var texture_paths = {
		1: "res://JOYSTICK_RIGHT.png",
	   -1: "res://JOYSTICK_LEFT.png",
		0: "res://JOYSTICK_NEUTRAL.png"
	}

	var texture_path = texture_paths.get(direction, "res://JOYSTICK_NEUTRAL.png")
	var texture = ResourceLoader.load(texture_path)
	joystick.texture = texture
	if direction:
		audio_player.stream = audio_stream
		audio_player.play()
	
func move_game(direction):
	var texture_paths = {0: "res://sploinky.png", 1: "res://luvdisc.png"}
	
	game_index += direction
	if game_index < 0:
		game_index = 1
	elif game_index > 1:
		game_index = 0
	var texture_path = texture_paths.get(game_index, "res://sploinky.png")
	var texture = ResourceLoader.load(texture_path)
	game.texture = texture

func _on_timer_timeout():
	move_joystick(0)
