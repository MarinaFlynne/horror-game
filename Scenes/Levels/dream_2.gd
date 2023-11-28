extends Node2D

@export var bg_layer: ParallaxLayer
@export var sprite: Sprite2D
@export var leah: Area2D
@export var tilemap: TileMap

var bg_x_speed = 40
var bg_y_speed = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bg_layer.motion_offset.x += bg_x_speed * delta
	bg_layer.motion_offset.y += bg_y_speed * delta


func _on_npc_interacted():
	pass


func _on_npc_dialogue_ended():
	leah.hide()
	tilemap.hide()
	$AudioStreamPlayer.pitch_scale = 0.8
	sprite.texture = load("res://Sprites/Backgrounds/crazybgred.png")
	bg_x_speed *= 2
	bg_y_speed *= 2
	await get_tree().create_timer(7).timeout
	SceneManager.SwitchScene("house_real", true)


func _on_pitch_change_timer_timeout():
	$AudioStreamPlayer.pitch_scale = 0.8
	await get_tree().create_timer(0.5).timeout
	$AudioStreamPlayer.pitch_scale = randf_range(1,1.5)
	$PitchChangeTimer.start()
