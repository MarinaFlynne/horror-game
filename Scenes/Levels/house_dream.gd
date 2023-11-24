extends Node2D

@export var dark_bg_layer: ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.5).timeout
	GameManager.show_dialogue("house_dream_get_away")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dark_bg_layer.motion_offset.x += 20 * delta
	dark_bg_layer.motion_offset.y += 20 * delta
