class_name PlayerJumpState
extends State

@export var player: Player
@onready var timer = $Timer as Timer

var jump_force
var direction_force
var last_direction

signal player_jump

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	
func _enter_state():
	last_direction = sign(player.visual_node.scale.x)
	player.velocity.x = 0
	jump_force = 0
	direction_force = 0
	timer.start()
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	jump_force = max(jump_force-5, player.JUMP_VELOCITY-10)
	var direction = Input.get_axis("ui_left", "ui_right")
	direction_force += 3 * direction
	if direction:
		direction_force = direction * min(abs(direction_force), player.MAX_DIR_FORCE)
	else:
		direction_force = move_toward(direction_force, 0, 2)
	
	if direction != 0 and direction != last_direction:
		player.visual_node.scale.x = direction
		last_direction = direction

	# Handle Jump.
	if Input.is_action_just_released("mv_up") or Input.is_action_just_released("mv_special"):
		jump()

func _on_timer_timeout():
	jump()
	
func jump():
	timer.stop()
	player.velocity.y = jump_force
	player.velocity.x = direction_force
	player_jump.emit()
