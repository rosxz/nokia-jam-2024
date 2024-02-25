extends Node2D


@onready var player = $"."

var fish_is_hooked : bool = false 
func _ready():
	pass


func _process(delta):
	handle_input()


func _on_area_2d_body_entered(body):
	fish_is_hooked = true
	print("HOOKED")
	
# nao esquecer no projecto trocar ui up and ui down 

func handle_input():
	if Input.is_action_just_pressed("mv_up"):
		player.position += Vector2(0,-1)
	if Input.is_action_just_pressed("mv_down"):
		player.position += Vector2(0,1)


func _on_area_2d_area_entered(area):
	fish_is_hooked = true
	print("HOOKED")
