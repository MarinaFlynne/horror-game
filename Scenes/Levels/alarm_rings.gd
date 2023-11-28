extends Node2D

@export var bed: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	%Player.disable_movement()
	bed.set_collision_layer_value(3, false)
	AudioManager.play("res://Sounds/alarm_clock.wav")
	await get_tree().create_timer(5).timeout
	AudioManager.stop_playing("res://Sounds/alarm_clock.wav")
	AudioManager.play("res://Sounds/alarm_disable.mp3")
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("alarm_rings")
	bed.set_collision_layer_value(3, false)
	await GameManager.dialogue_ended
	%Player.disable_movement()
	bed.set_collision_layer_value(3, false)
	await get_tree().create_timer(1).timeout
	SceneManager.SwitchScene("dream_2", true)
