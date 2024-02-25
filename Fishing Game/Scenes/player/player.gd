extends Node2D

@onready var sprite_2d = $Sprite2D

var fish_is_hooked : bool = false 
func _ready():
	pass


func _process(delta):
	handle_input()


func _on_area_2d_body_entered(body):
	fish_is_hooked = true
	
# nao esquecer no projecto trocar ui up and ui down 

func handle_input():
	if Input.is_action_just_pressed("mv_up"):
		sprite_2d.position += Vector2(0,-1)
	if Input.is_action_just_pressed("mv_down"):
		sprite_2d.position += Vector2(0,1)
