extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%Player.disable_movement()
	AudioManager.play("res://Sounds/alarm_clock.wav")
	await get_tree().create_timer(6).timeout
	AudioManager.stop_playing("res://Sounds/alarm_clock.wav")
	AudioManager.play("res://Sounds/alarm_disable.mp3")
	await get_tree().create_timer(2).timeout
	# SWITCH SCENE
