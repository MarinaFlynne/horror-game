extends Node2D

@export var leah: Sprite2D
@export var aza: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(4).timeout
	leah.show()
	await get_tree().create_timer(1).timeout
	leah.hide()
	await get_tree().create_timer(0.3).timeout
	leah.show()
	await get_tree().create_timer(0.2).timeout
	leah.hide()
	await get_tree().create_timer(0.3).timeout
	leah.show()
	await get_tree().create_timer(0.2).timeout
	leah.hide()
	SceneManager.SwitchScene("final_escape")
