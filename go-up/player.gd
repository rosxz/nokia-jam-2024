class_name Player
extends CharacterBody2D

@export var SPEED = 50.0
@export var JUMP_VELOCITY = -180.0
const MAX_DIR_FORCE = 50

@onready var fsm = $PlayerStateMachine as FiniteStateMachine
@onready var player_free_state = $PlayerStateMachine/PlayerFreeState as PlayerFreeState
@onready var player_jump_state = $PlayerStateMachine/PlayerJumpState as PlayerJumpState
@onready var player_fall_state = $PlayerStateMachine/PlayerFallState as PlayerFallState

@onready var bounce_raycast = $Node2D/RayCast2D
@onready var visual_node = $Node2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_player_jump_state_player_jump():
	fsm.change_state(player_fall_state)


func _on_player_free_state_charge_jump():
	fsm.change_state(player_jump_state)


func _on_player_fall_state_player_recover():
	fsm.change_state(player_free_state)
#
#
#func _on_area_2d_body_entered(body):
#	if body is TileMap:
#		print("before", velocity.x)
#		# Detect if sideways collision, by checking the velocity of the player
#		var velocity_sign = sign(velocity.x)
#		if not is_on_floor() and abs(velocity_sign) > 0:
#			velocity.x = velocity.x * -3/4
#		print("after", velocity.x)
#	elif body is SnowBall:
#		pass
