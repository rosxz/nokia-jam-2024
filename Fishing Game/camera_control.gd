extends Camera2D

@onready var camera_2d: Camera2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	camera_position()
	
func camera_position() -> void:
	if GlobalVariables.player_position.y >= 48:
		print("CHRISTMASSSS")
		camera_2d.position = Vector2(84, 48)
