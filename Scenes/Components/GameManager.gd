extends Node

const dialogue_balloon = preload("res://Dialogue/Balloons/balloon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## Show my dialogue balloon
#func show_dialogue(resource: DialogueResource, title: String = "", extra_game_states: Array = []) -> void:
#	var dialogue_balloon = load("res://Dialogue/Balloons/balloon.tscn")
#
#	var balloon: Node = dialogue_balloon.instantiate()
#	get_current_scene.call().add_child(balloon)
#	balloon.start(resource, title, extra_game_states)
