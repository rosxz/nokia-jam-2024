extends Node

@onready var player = $"../Player" as CharacterBody2D

var fish_is_hooked : bool = false 
var player_position: int 



func _ready():
	fish_is_hooked = false 
	
func _process(delta):
	print(player.position)

