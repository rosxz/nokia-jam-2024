extends Label 
@onready var fish_template: Node2D = $"../fish_template"

var score : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(score)


func _on_catch_area_body_entered(body: Node2D) -> void:
	if fish_template.is_in_group("fixe"):
		score = 0
		
