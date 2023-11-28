extends Control

@export var p_layer: ParallaxLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	p_layer.motion_offset.x -=17 * delta
	p_layer.motion_offset.y -= 14 * delta
	if Input.is_action_just_pressed("space"):
		SceneManager.SwitchScene("why", true)
