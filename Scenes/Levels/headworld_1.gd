extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.current_level = Globals.LEVELS.HEADWORLD_1
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("nightmare_start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
