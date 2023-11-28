extends Node2D

@export var para1: ParallaxLayer
@export var para2: ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	para1.motion_offset.x -= 10 * delta
	para1.motion_offset.y -= 10 * delta


func _on_game_end_area_body_entered(body):
	%Player.disable_movement()
	SceneManager.SwitchScene("blackout_2")
	pass # Replace with function body.
