extends Node2D

@export var dark_bg_layer: ParallaxLayer
@export var black_overlay: ColorRect
@export var clock: AudioStreamPlayer
@export var bg_music: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.5).timeout
	GameManager.show_dialogue("house_dream_get_away")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dark_bg_layer.motion_offset.x += 20 * delta
	dark_bg_layer.motion_offset.y += 20 * delta


func _on_window_night_interacted():
	black_overlay.show()
	clock.stop()
	bg_music.stop()
	await get_tree().create_timer(0.5).timeout
	AudioManager.play("res://Sounds/windowbreak.wav")
	await get_tree().create_timer(1).timeout
	SceneManager.SwitchScene("blackout")
