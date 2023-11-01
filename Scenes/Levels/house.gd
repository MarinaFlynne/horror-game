extends Node2D

@export var player: CharacterBody2D
@export var bed: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.time["hour"] = "2"
	Globals.time["minute"] = "19"
	Globals.time["ending"] = "am"
	Globals.current_level = Globals.LEVELS.HOUSE_NIGHT_1
	player.disable_movement()
	await get_tree().create_timer(1).timeout
	AudioManager.play("res://Sounds/pots_crash.mp3")
	await get_tree().create_timer(2).timeout
	player.enable_light()
	player.enable_movement()
	await get_tree().create_timer(1).timeout
	GameManager.show_dialogue("aza_bed_day1")

# Called by game_manager
func enter_bed():
	player.disable_movement()
	player.global_position = bed.global_position
	await get_tree().create_timer(1).timeout
	player.disable_light()
	# play snore noise
	await get_tree().create_timer(5).timeout
	# stop snore noise
	# Play scary scene
	# transition to morning
	
	
