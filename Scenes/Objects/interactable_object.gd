extends Area2D

@export var dialogue_name: String
@export_file() var interact_sound: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func interact():
	show_dialogue()
	play_interact_sound()
		
func show_dialogue():
	if not (dialogue_name == null or dialogue_name == ""):
		GameManager.show_dialogue(dialogue_name)

func play_interact_sound():
	if not (interact_sound == null or interact_sound == ""):
		AudioManager.play(interact_sound)
