extends ColorRect

@export_file() var dialog_path
@export var text_speed: float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = textSpeed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
