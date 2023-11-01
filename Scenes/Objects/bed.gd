extends "res://Scenes/Objects/interactable_object.gd"

signal interacted_with()

func _ready():
	interacted_with.connect(GameManager._on_bed_interacted_with)
	pass

func interact():
	interacted_with.emit()
