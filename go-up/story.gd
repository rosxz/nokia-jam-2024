extends Node2D

@onready var anim_player = $AnimationPlayer as AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.play("story")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://go-up/lvl1.tscn")
