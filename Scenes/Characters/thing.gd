extends "res://Scenes/Objects/interactable_object.gd"

@export var teleport_location: Node2D
@export var player: CharacterBody2D
@onready var timer: Timer = $BlinkTimer

var blinking_enabled

signal teleported_player()

func _process(delta):
	pass

func on_dialogue_end():
	if teleport_location != null && player != null:
		player.teleport_to(teleport_location.global_position)
		teleported_player.emit()
	
func enable_blinking():
	print("blinking enabled")
	blinking_enabled = true
	$EndBlink.start()
	timer.start()
	
func disable_blinking():
	blinking_enabled = false
	hide()
	timer.stop()

func _on_blink_timer_timeout():
	if blinking_enabled:
		print("blink")
		hide()
		await get_tree().create_timer(0.1).timeout
		show()
		var new_wait_time = randf_range(0.2, 3)
		timer.wait_time = new_wait_time
		timer.start()
	
