extends Node2D

@export var music_player: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("start_dream")
	music_player.play()


func _on_thing_teleported_player():
	music_player.pitch_scale = 1.63
