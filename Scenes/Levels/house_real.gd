extends Node2D

@export var bed: Area2D
@export var out_of_bed_marker: Node2D
@export var darkness: CanvasModulate
@export var chair_back: Sprite2D
@export var dinner_chair_interactable: Area2D
@export var chair: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1)
	Globals.time["hour"] = "7"
	Globals.time["minute"] = "36"
	Globals.time["ending"] = "pm"
	%Player.global_position = bed.global_position
	%Player.disable_movement()
	bed.set_collision_layer_value(3, false)
	GameManager.show_dialogue("dinner_time")
	await GameManager.dialogue_ended
	await get_tree().create_timer(1)
	%Player.global_position = out_of_bed_marker.global_position
	%Player.enable_movement()
	bed.set_collision_layer_value(3, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_light_on_area_body_entered(body):
	darkness.hide()


func _on_dinner_chair_interactable_interacted():
	chair_back.show()
	chair.set_collision_layer_value(3,false)
	%Player.global_position = dinner_chair_interactable.global_position
	%Player.change_direction(%Player.DIRECTIONS.UP)
	%Player.disable_movement()
	GameManager.show_dialogue("dinner")
	
