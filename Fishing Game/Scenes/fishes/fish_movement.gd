extends Node2D

var time : float = 0.0
@onready var fish_template = $"."
var original_position = self.position

func _process(delta):
	time += delta
	#print(time)
	# Assuming the fish_template has been set in the editor or instantiated
	
	
	fish_template.position = Vector2(32,23)
#	print(fish_template.position)
	fish_template.position.x = time * 15.0  # Adjust the multiplier based on your speed requirement
	fish_template.position.y = 23 - get_sine()    # Adjust the y-position based on your needs
#	print(fish_template.position)

func get_sine() -> float:
	# Your sine function implementation goes here
	# Example: return sin(time)
	return 0.0  # Replace with your sine function
