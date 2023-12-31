extends Area2D

@export var dialogue_name: String
@export_file() var interact_sound: String

signal interacted()
signal dialogue_ended()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func interact():
	interacted.emit()
	show_dialogue()
	play_interact_sound()
	after_interact()
	await GameManager.dialogue_ended
	dialogue_ended.emit()
	on_dialogue_end()
		
func show_dialogue():
	if not (dialogue_name == null or dialogue_name == ""):
		GameManager.show_dialogue(dialogue_name)

func play_interact_sound():
	if not (interact_sound == null or interact_sound == ""):
		AudioManager.play(interact_sound)

func after_interact():
	pass

func on_dialogue_end():
	pass
