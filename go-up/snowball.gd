class_name SnowBall
extends RigidBody2D

@onready var sprite = $Sprite2D as Sprite2D
@onready var collision = $CollisionShape2D as CollisionShape2D
@onready var despawn_timer = $Despawn as Timer

@export var direction_ray: RayCast2D
@onready var start_position = global_position

var direction_vector
var done = false

signal mafarricu_play

# Called when the node enters the scene tree for the first time.
func _ready():
	direction_vector = Vector2(cos(direction_ray.rotation)*5000, sin(direction_ray.rotation)*5000)
	call_deferred("reset_snowball")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.global_rotation_degrees = -global_rotation

func _on_despawn_timeout():
	mafarricu_play.emit()


func _on_check_point_body_entered(body):
	if body == self:
		set_deferred("global_position", Vector2(-10, 0)) # banish the ball lmao
		mafarricu_play.emit()

	
func reset_snowball():
	despawn_timer.start()
	global_position = start_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	apply_force(direction_vector)

