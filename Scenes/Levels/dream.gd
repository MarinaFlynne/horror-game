extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(5).timeout
	GameManager.show_dialogue("dream_panic1")
	await GameManager.dialogue_ended
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("dream_panic2")
	await GameManager.dialogue_ended
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("dream_panic3")
	await GameManager.dialogue_ended


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
