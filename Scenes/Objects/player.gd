extends CharacterBody2D

@export_group("Components")
## The move_comp scene that handles movement.
@export var move_component: Node
@export var flashlight_component: Node2D

@export_group("Movement")
@export var speed_states: Dictionary = {"walk": 200, "run": 500, "sneak": 50}
@export var default_speed = "walk"

func _ready():
	change_speed(default_speed)
	
func _process(delta):
	rotate_flashlight_to_mouse()

func _physics_process(delta):
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
	
func change_speed(state: String):
	var speed = speed_states[state]
	move_component.speed = speed
	
## TEMPORARY FUNCTION. FIX AND IMPROVE THIS
func rotate_flashlight_to_mouse():
	flashlight_component.look_at(get_global_mouse_position())
