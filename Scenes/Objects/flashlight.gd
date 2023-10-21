extends Node2D

var light_enabled
signal light_was_enabled()
signal light_was_disabled()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func disable_light():
	light_enabled = false
	light_was_disabled.emit()
	hide()

func enable_light():
	light_enabled = true
	light_was_enabled.emit()
	show()
