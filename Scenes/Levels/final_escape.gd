extends Node2D

@export var para1: ParallaxLayer
@export var para2: ParallaxLayer

var first_dialogue_interacted := false
var second_dialogue_interacted := false
var third_dialogue_interacted := false
var fourth_dialogue_interacted := false


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


func _on_d_1_body_entered(body):
	if !first_dialogue_interacted:
		first_dialogue_interacted = true
		GameManager.show_dialogue("escape_d1")
		%Player.disable_movement()
		await GameManager.dialogue_ended
		%Player.enable_movement()


func _on_d_2_body_entered(body):
	if !second_dialogue_interacted:
		second_dialogue_interacted = true
		GameManager.show_dialogue("escape_d2")
		%Player.disable_movement()
		await GameManager.dialogue_ended
		%Player.enable_movement()


func _on_d_3_body_entered(body):
	if !third_dialogue_interacted:
		third_dialogue_interacted = true
		GameManager.show_dialogue("escape_d3")
		%Player.disable_movement()
		await GameManager.dialogue_ended
		%Player.enable_movement()


func _on_d_4_body_entered(body):
	if !fourth_dialogue_interacted:
		fourth_dialogue_interacted = true
		GameManager.show_dialogue("escape_d4")
		%Player.disable_movement()
		await GameManager.dialogue_ended
		%Player.enable_movement()
