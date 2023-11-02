extends Node2D

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.current_level = Globals.LEVELS.HOUSE_DAY_1
	Globals.time["hour"] = "8"
	Globals.time["minute"] = "00"
	Globals.time["ending"] = "am"
	# play alarm beep noise
	player.disable_movement()
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("day_1_awaken")

