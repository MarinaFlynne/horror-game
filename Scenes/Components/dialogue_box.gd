extends ColorRect

@export var text_speed: float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = text_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
