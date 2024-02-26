extends Node2D

#var time : float = 0.0
@onready var fish_template = $"."
@export var debug : bool = false
var original_position = self.position
@onready var player = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed : float = 8.0
@export var amplitude : float = 1.5
@export var frequency : float = 1.5


func _process(delta):
	GlobalVariables.time += delta
	get_hooked()
	fish_movement()
	GlobalVariables.fishPosition = position
	animation()
	#print(time)
	if GlobalVariables.time >= 30:
		GlobalVariables.time = 0
		

func get_sine() -> float:
	return floor(sin((GlobalVariables.time * frequency))*amplitude * 2 )

	
func fish_movement() -> void:
	if !GlobalVariables.fish_is_hooked:
		fish_template.position.x = floor(GlobalVariables.time * speed)  # Adjust the multiplier based on your speed requirement
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
	
