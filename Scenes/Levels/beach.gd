extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(3).timeout
	GameManager.show_dialogue("game_end_leah")
	await GameManager.dialogue_ended
	await get_tree().create_timer(1.5).timeout
	SceneManager.SwitchScene("game_end", true)
