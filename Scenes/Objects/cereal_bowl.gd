extends "res://Scenes/Objects/interactable_object.gd"


func after_interact():
	if Globals.inventory["cereal_bowl"]:
		queue_free()
