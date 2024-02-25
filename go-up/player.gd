class_name Player
extends CharacterBody2D

@export var SPEED = 50.0
@export var JUMP_VELOCITY = -180.0
const MAX_DIR_FORCE = 50

@onready var anim_player = $AnimationPlayer as AnimationPlayer
@onready var fsm = $PlayerStateMachine as FiniteStateMachine
@onready var player_free_state = $PlayerStateMachine/PlayerFreeState as PlayerFreeState
@onready var player_jump_state = $PlayerStateMachine/PlayerJumpState as PlayerJumpState
@onready var player_fall_state = $PlayerStateMachine/PlayerFallState as PlayerFallState

@onready var bounce_raycast = $Node2D/RayCast2D
@onready var visual_node = $Node2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_player_jump_state_player_jump():
	anim_player.play("jump")
	fsm.change_state(player_fall_state)


func _on_player_free_state_charge_jump():
	anim_player.play("jump_charge")
	fsm.change_state(player_jump_state)


func _on_player_fall_state_player_recover():
	anim_player.play("recover")
	fsm.change_state(player_free_state)


func _on_player_free_state_state_finished():
	anim_player.play("fall")
	fsm.change_state(player_fall_state)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "walk":
		anim_player.play("RESET")
