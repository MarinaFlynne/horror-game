extends "res://Scenes/Objects/interactable_object.gd"

@export var teleport_location: Node2D
@onready var player = %Player

signal teleported_player()

func on_dialogue_end():
	%Player.teleport_to(teleport_location.global_position)
	teleported_player.emit()
