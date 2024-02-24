class_name PlayerFallState
extends State

@export var player: Player
@onready var raycast_timer = $RayCastTimer as Timer

signal player_recover

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	
func _enter_state():
	set_physics_process(true)
	
func _exit_state():
	set_physics_process(false)

func _physics_process(delta):
	# gravity?
	# bounce
	if player.bounce_raycast.is_colliding() and player.velocity.x != 0:
		player.velocity.x += player.velocity.x * -2
		player.visual_node.scale.x = player.visual_node.scale.x * -1
#		player.bounce_raycast.set_enabled(false)
#		raycast_timer.start()
	
	player.velocity.x = move_toward(player.velocity.x, sign(player.velocity.x), 0.5)
	if not player.is_on_floor():
		player.velocity.y += player.gravity * delta
	else:
		if player.velocity.y == 0:
			player_recover.emit()
	player.move_and_slide()


func _on_ray_cast_timer_timeout():
	player.bounce_raycast.set_enabled(true)
