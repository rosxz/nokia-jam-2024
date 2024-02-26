class_name PlayerFreeState
extends State

@export var player: Player
var last_direction

signal charge_jump

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)

func _enter_state():
	player.velocity = Vector2.ZERO
	set_physics_process(true)
	if (player.visual_node):
		last_direction = player.visual_node.scale.x
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	# Add the gravity.
	if not player.is_on_floor():
		state_finished.emit()

	# Handle Jump.
	if (Input.is_action_just_pressed("mv_up") or Input.is_action_just_pressed("mv_special")) \
	  and player.is_on_floor():
		player.anim_player.stop()
		charge_jump.emit()
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("mv_left", "mv_right")
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	direction = last_direction if direction == 0 else direction
	if direction != 0 and direction != last_direction:
		player.visual_node.scale.x = direction
		last_direction = direction
		
	if player.velocity.x != 0:
		player.anim_player.play("walk")
		player.anim_player.get_animation("walk").set_loop_mode(1)
	else:
		player.anim_player.get_animation("walk").set_loop_mode(0)

	player.move_and_slide()
