extends StaticBody2D

@onready var light: PointLight2D = $PointLight2D
@onready var timer: Timer = $Timer
@export var flickering_enabled = false

func _ready():
	if not flickering_enabled:
		timer.stop()
	else:
		timer.start()

func _on_timer_timeout():
	light.enabled = false
	var wait_time = randf_range(0.1, 0.4)
	await get_tree().create_timer(wait_time).timeout
	light.enabled = true
	timer.wait_time = randi_range(1,10)
	timer.start()
