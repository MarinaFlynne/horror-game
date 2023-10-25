extends CharacterBody2D

@export_group("Components")
## The move_comp scene that handles movement.
@export var move_component: Node
@export var direction_component: Node2D
@export var interact_component: Node
@export var camera_component: Camera2D
@export var flashlight_component: Node2D

@export_group("Movement")
@export var speed_states: Dictionary = {"walk": 200, "run": 500, "sneak": 50}
@export var default_speed = "walk"

@export_group("Light")
@export var light_enabled: bool = false

@export var dialogue_resource = preload("res://Dialogue/main_dialogue.dialogue")

func _ready():
	GameManager.dialogue_started.connect(disable_movement)
	GameManager.dialogue_ended.connect(enable_movement)
	change_speed(default_speed)
	initialize_teleporters()
	initialize_light()
	
func _process(_delta):
	if light_enabled:
		rotate_flashlight_to_mouse()
	process_input()

func _physics_process(_delta):
	var direction = get_input_direction()
	# If the direction vector is not zero, change the direction our character is facing
	if direction != Vector2.ZERO:
		direction_component.change_direction_cardinal(direction)
	# Move the character
	move_component.move(self, direction)

func initialize_light():
	if light_enabled:
		flashlight_component.enable_light()
	else:
		flashlight_component.disable_light()

func process_input():
	if Input.is_action_just_pressed("interact") and interact_component.is_interactable_in_reach:
		var closest_interactable = interact_component.get_closest_interactable()
		GameManager.show_dialogue(dialogue_resource, closest_interactable.dialogue_name)

func initialize_teleporters():
	# Get all teleporters in scene
	var teleporters = get_tree().get_nodes_in_group('teleporters')
	# Connect the teleporter entered signal to the function _on_teleporter_entered
	for teleporter in teleporters:
		teleporter.entered_teleporter.connect(_on_teleporter_entered)

## Returns a Vector2 representing the direction the user is pressing.
func get_input_direction() -> Vector2:
	var input_direction = Vector2()
	if Input.is_action_pressed("move_left"):
		input_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		input_direction.x += 1
	if Input.is_action_pressed("move_up"):
		input_direction.y -= 1
	if Input.is_action_pressed("move_down"):
		input_direction.y += 1
	return input_direction

## Change the speed state of the player. Takes the state to change to as a String
func change_speed(state: String):
	var speed = speed_states[state]
	move_component.speed = speed
	

## TEMPORARY FUNCTION. FIX AND IMPROVE THIS
func rotate_flashlight_to_mouse():
	flashlight_component.look_at(get_global_mouse_position())

## Teleports the player to the specified global position
func teleport_to(teleport_position):
	# Disable camera smoothing, so that the camera teleports instead of panning over.
	# Store the original smoothing val so that we can reset it to its 
	# original value afterwards (just in case smoothing was disabled for some reason).
	var original_cam_pos = camera_component.position
	var original_smoothing_val: bool = camera_component.position_smoothing_enabled
	camera_component.position_smoothing_enabled = false 
	move_component.teleport_to(self, teleport_position)
	# Wait until the object has fully teleported to reset camera smoothing.
	await get_tree().create_timer(0.001).timeout
	camera_component.position_smoothing_enabled = original_smoothing_val
	camera_component.position = original_cam_pos

func _on_teleporter_entered(body, teleport_pos):
	if body == self:
		teleport_to(teleport_pos)

func _on_interact_comp_interactable_in_reach():
#	print("INTERACTABLE IN REACH")
	pass

func _on_interact_comp_interactables_out_of_reach():
#	print("INTERACTABLE OUT OF REACH")
	pass
	
func enable_movement():
	move_component.enable_movement()

func disable_movement():
	move_component.disable_movement()

