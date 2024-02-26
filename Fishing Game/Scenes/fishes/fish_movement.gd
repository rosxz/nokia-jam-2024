extends Node2D

var time : float = 0.0
@onready var fish_template = $"."
@export var debug : bool = false
var original_position = self.position
@onready var player = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed : float = 8.0
@export var amplitude : float = 1.5
@export var frequency : float = 1.5
@export animated_sprite_2d.texture

func _process(delta):
	time += delta
	get_hooked()
	fish_movement()
	animation()


func get_sine() -> float:
	return floor(sin((time * frequency))*amplitude * 2 )
#func get_stepped() -> float:
#	# Use the modulo operation to create a stepped function
#	var step_height : float = 0.5 # Adjust the step height based on your preference
#	return step_height * floor(time * 2.0)  # Adjust the multiplier based on your step frequency
	
func fish_movement() -> void:
	if !GlobalVariables.fish_is_hooked:
		fish_template.position.x = floor(time * speed)  # Adjust the multiplier based on your speed requirement
		fish_template.position.y = 23 - get_sine()    # Adjust the y-position based on your needs

	
func get_hooked() -> void:
	if GlobalVariables.fish_is_hooked:
		if debug: print(GlobalVariables.fish_is_hooked)
		fish_template.rotation = -190 # pq -190 graus? no idea but it works 
		position.x = GlobalVariables.player_position.x + 3.5
		position.y = GlobalVariables.player_position.y + 7
		
func animation() -> void:
	if !GlobalVariables.fish_is_hooked:
		animated_sprite_2d.animation = "swimming" 
	else: animated_sprite_2d.animation = "hooked" 
	
