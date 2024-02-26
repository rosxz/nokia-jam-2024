extends Node2D

@onready var snowball = $RigidBody2D as SnowBall
@onready var mafarricu = $Sprite2D as Sprite2D
@onready var anim_player = $AnimationPlayer as AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rigid_body_2d_mafarricu_play():
	anim_player.play("throw")


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"throw":
			snowball.call_deferred("reset_snowball")
			anim_player.play("recover")
