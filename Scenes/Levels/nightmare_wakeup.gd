extends Node2D

@export var bed: Area2D
@export var out_of_bed_marker: Node2D
@export var thing: Area2D

var is_kitchen_entered := false

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.time["hour"] = "2"
	Globals.time["minute"] = "16"
	Globals.time["ending"] = "am"
#	thing.hide()
#	await get_tree().create_timer(1).timeout
	bed.set_collision_layer_value(3, false)
	%Player.global_position = bed.global_position
	%Player.disable_movement()
	AudioManager.play("res://Sounds/pots_crash.mp3")
	await get_tree().create_timer(2.5).timeout
#	%Player.enable_light()
	GameManager.show_dialogue("nightmare_wakeup_start")
	await GameManager.dialogue_ended
	%Player.global_position = out_of_bed_marker.global_position
	%Player.enable_movement()
	bed.set_collision_layer_value(3, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_kitchen_checker_body_entered(body):
	if not is_kitchen_entered:
		GameManager.show_dialogue("cat")
		is_kitchen_entered = true


func _on_dish_to_clean_interacted():
	if Globals.plates_cleaned >= 4:
		await get_tree().create_timer(0.5).timeout
		GameManager.show_dialogue("dishes_cleaned")
		thing.enable_blinking()
	
		
