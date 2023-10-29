extends "res://Scenes/Objects/interactable_object.gd"

@export var clean_pos: Node2D

var is_already_interacted_with: bool = false

func ready():
	if clean_pos == null:
		print("dish_to_clean: WARNING: clean_pos is null")

func interact():
	if not is_already_interacted_with:
		play_interact_sound()
		global_position = clean_pos.global_position
		is_already_interacted_with = true

