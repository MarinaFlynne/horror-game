extends Node

const dialogue_balloon = preload("res://Dialogue/Balloons/balloon.tscn")

var new_dialogue_allowed: bool = true
var dialogue_resource = preload("res://Dialogue/main.dialogue")

var player: CharacterBody2D
var house_night_1_scene: Node2D

signal dialogue_started()
signal dialogue_ended()

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

## Show my dialogue balloon
func show_dialogue(title: String = "", extra_game_states: Array = []) -> void:
	if new_dialogue_allowed:
		dialogue_started.emit()
		new_dialogue_allowed = false
		var balloon: Node = dialogue_balloon.instantiate()
		SceneManager.get_current_scene().add_child(balloon)
		balloon.start(dialogue_resource, title, extra_game_states)
	else:
#		print("GameManager: New dialogue disabled. Already in dialogue.")
		pass

func _on_dialogue_ended(_resource):
	dialogue_ended.emit()
	await get_tree().create_timer(1).timeout
	new_dialogue_allowed = true
	
func _on_bed_interacted_with():
	if Globals.plates_cleaned >= 4:
		print("gamemanager: TODO - SWITCH TO NEXT SCENE")
		pass
		
		
func _on_cat_interacted_with():
	if Globals.current_level == Globals.LEVELS.HOUSE_NIGHT_1:
		print("cat interacted with")
		Globals.night_1_sleep_time = true
