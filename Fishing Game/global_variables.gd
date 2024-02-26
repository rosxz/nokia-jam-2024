extends Node2D

@onready var audio_player = $AudioStreamPlayer as AudioStreamPlayer

var fish_is_hooked : bool = false 
var player_position
var fishPosition
var time : float



func _ready():
	fish_is_hooked = false 
func _process(delta: float) -> void:
	#print(player_position)
	pass



func _on_player_bite():
	audio_player.play()


func _on_label_catch():
	audio_player.play()
