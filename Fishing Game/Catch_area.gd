extends Label 
@onready var fish_template: Node2D = $"../fish_template"

signal catch

var score : int 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score  = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVariables.fish_is_hooked and GlobalVariables.player_position.y <= 11 :
		score += 1
		clear_fish_random_pos()	
		catch.emit()
		
	text = str(score)
func clear_fish_random_pos():
	fish_template.position.y = randf_range(-3.0,22.0)
	fish_template.position.x = -30
	fish_template.rotation = 0
	GlobalVariables.time = 0
	GlobalVariables.fish_is_hooked = false
	
	

		

