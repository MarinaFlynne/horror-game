extends Node2D

@export var music_player: AudioStreamPlayer
@export var darkness: CanvasModulate
@export var jumpscare_animation: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	%Bed.fix_sheet()
	await get_tree().create_timer(2).timeout
	GameManager.show_dialogue("start_dream")
	music_player.play()


func _on_thing_teleported_player():
	if music_player.pitch_scale <= 2:
		music_player.pitch_scale += 0.63
	jumpscare_animation.show()
	music_player.stop()
	AudioManager.play("res://Sounds/foxcry.wav")
	jumpscare_animation.play("default")
	await jumpscare_animation.animation_finished
	jumpscare_animation.hide()
	music_player.play()


func _on_teleporter_to_ocean_body_entered(body):
	music_player.stop()
	darkness.hide()


func _on_leah_dialogue_ended():
	print('leah dialogue ended')
	SceneManager.SwitchScene("nightmare_wakeup")
	pass
