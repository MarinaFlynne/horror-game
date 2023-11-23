extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(7).timeout
	SceneManager.SwitchScene("start_dream")
