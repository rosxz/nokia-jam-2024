extends Node2D

var time : float = 0.0
@onready var fish_template = $"."
@export var debug : bool = false
var original_position = self.position
@onready var player = $".."


func _process(delta):
	time += delta
	get_hooked()
	fish_movement()


func get_sine() -> float:
	if debug:
		return 0.0
	return sin(time)
	
func fish_movement() -> void:
	if (debug) :fish_template.position = Vector2(32,23)

	fish_template.position.x = time * 15.0  # Adjust the multiplier based on your speed requirement
	fish_template.position.y = 23 - get_sine()    # Adjust the y-position based on your needs

	
func get_hooked() -> void:
	
	if GlobalVariables.fish_is_hooked:
		if debug: print(GlobalVariables.fish_is_hooked)
		fish_template.rotation = -190 # pq -190 graus? no idea but it works 
		get.
	
