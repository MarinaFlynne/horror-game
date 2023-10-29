extends Node2D

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.time["hour"] = "2"
	Globals.time["minute"] = "19"
	Globals.time["ending"] = "am"
	player.disable_movement()
	await get_tree().create_timer(1).timeout
	AudioManager.play("res://Sounds/pots_crash.mp3")
	await get_tree().create_timer(2).timeout
	player.enable_light()
	player.enable_movement()
	await get_tree().create_timer(1).timeout
	GameManager.show_dialogue("aza_bed_day1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
