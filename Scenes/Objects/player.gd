extends CharacterBody2D

@export_group("Components")
## The move_comp scene that handles movement.
@export var move_component: Node
@export var flashlight_component: Node2D
@export var camera_component: Camera2D

@export_group("Movement")
@export var speed_states: Dictionary = {"walk": 200, "run": 500, "sneak": 50}
@export var default_speed = "walk"

@export_group("Light")
@export var light_enabled: bool = false

func _ready():
	change_speed(default_speed)
	
func _process(_delta):
	rotate_flashlight_to_mouse()
	if light_enabled == true:
		flashlight_component.enable_light()
	elif light_enabled == false:
		flashlight_component.disable_light()

func _physics_process(_delta):
	var direction = get_input_direction()
	move_component.move(self, direction)

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
	var original_smoothing_val: bool = camera_component.position_smoothing_enabled
	camera_component.position_smoothing_enabled = false 
	move_component.teleport_to(self, teleport_position)
	# Wait until the object has fully teleported to reset camera smoothing.
	await move_component.teleported
	camera_component.position_smoothing_enabled = original_smoothing_val
