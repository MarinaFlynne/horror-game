extends "res://Scenes/Objects/interactable_object.gd"

signal interacted_with()

func _ready():
	interacted_with.connect(GameManager._on_cat_interacted_with)

func after_interact():
	interacted_with.emit()
