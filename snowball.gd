class_name SnowBall
extends RigidBody2D

@onready var sprite = $Sprite2D as Sprite2D
@onready var collision = $CollisionShape2D as CollisionShape2D
@onready var despawn_timer = $Despawn as Timer
@onready var spawn_timer = $Timer as Timer
@export var direction_ray: RayCast2D
@onready var start_position = global_position
var direction_vector
var done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	direction_vector = Vector2(cos(direction_ray.rotation)*5000, sin(direction_ray.rotation)*5000)
	apply_force(direction_vector)
	despawn_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.global_rotation_degrees = -global_rotation

func _on_despawn_timeout():
	global_position = start_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	apply_force(direction_vector)
	despawn_timer.start()
