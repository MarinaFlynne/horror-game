extends Node

@export_file() var default_balloon_path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_dialogue(resource: DialogueResource, title: String = "", extra_game_states: Array = []) -> void:
	var BalloonScene = load(default_balloon_path)
#	var SmallExampleBalloonScene = load("res://addons/dialogue_manager/example_balloon/small_example_balloon.tscn")

#	var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
	var balloon: Node = BalloonScene.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(resource, title, extra_game_states)
