extends Node2D


signal checkpoint_exit(sender, body)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_point_body_exited(body):
	checkpoint_exit.emit(self, body)
