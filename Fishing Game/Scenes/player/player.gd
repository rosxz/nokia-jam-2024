extends Node2D

@onready var player = $"."

@onready var fish_template: Node2D = $"../fish_template"
@export var debug: bool = false


func _process(delta):
	handle_input()
	GlobalVariables.player_position = self.position


func handle_input():
	if Input.is_action_just_pressed("mv_up"):
		player.position += Vector2(0,-1)
	if Input.is_action_just_pressed("mv_down"):
		player.position += Vector2(0,1)

# importante ter o check com o peixe em si para evitar bug de farm do score com a catchable area
func _on_area_2d_area_entered(area):
	if fish_template.is_in_group("fixe"):
		if debug: print("something entered the player")
		GlobalVariables.fish_is_hooked = true
