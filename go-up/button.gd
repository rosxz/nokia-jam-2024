class_name PlatformButton
extends Area2D

enum state { RELEASED = 0, PRESSED = 1 }
const sprite_offset = 3

signal sound_button

@onready var button_sprite = $Sprite2D as Sprite2D
@onready var platform_sprite = $Platform/Sprite2D as Sprite2D
@onready var platform_collision = $Platform/CollisionShape2D as CollisionShape2D
@onready var timer = $Timer as Timer

var curr_state

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_state = state.RELEASED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	# stop timer, set pressed down, enable platform
	if not body is CharacterBody2D:
		return
	timer.stop()
	if curr_state == state.RELEASED:
		button_sprite.frame += sprite_offset
		for child in self.get_children():
			if child is StaticBody2D:
				child.get_child(0).frame += sprite_offset # platform sprite
				child.get_child(1).set_deferred("disabled", false) # platform collision
				sound_button.emit()
		curr_state = state.PRESSED

func _on_body_exited(body):
	# restart timer
	timer.start()

func _on_timer_timeout():
	# reset sprites, disable platform
	curr_state = state.RELEASED
	platform_collision.set_deferred("disabled", true)
	button_sprite.frame -= sprite_offset
	platform_sprite.frame -= sprite_offset
