extends Area2D

@export var dialogue_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	if dialogue_name == null or dialogue_name == "":
#		var node_name = str(name.replace("@", "").replace(str(int(name)), ""))
		print("WARNING: empty dialogue name ", self)
