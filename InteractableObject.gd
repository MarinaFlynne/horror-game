extends "res://Scenes/Objects/interactable_object.gd"

@export var scene_to_switch_to: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	SceneManager.SwitchScene(scene_to_switch_to)
	pass
