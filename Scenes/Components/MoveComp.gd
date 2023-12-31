extends Node
## A movement component that keeps track of movement variables and moving.
##
## Keeps track of speed, friction, and acceleration for the movement of a CharacterBody2D. 
## It can enable and disable movement and move the body.

## The maximum speed of the body.
@export var default_speed: float = 200
## The friction coefficient for slowing down.
@export var friction: float = 0.01
## The acceleration coefficient.
@export var acceleration: float = 0.5

var speed: float
## This is true if movement is allowed, false if not.
## Use enable_movement() or disable_movement() to set this.
var is_movement_enabled: bool = true

var is_moving: bool = false

## Emits when movement gets enabled.
signal movement_enabled()
## Emits when movement gets disabled.
signal movement_disabled()
## Emits when a body has finished teleporting
signal teleported()

signal movement_started()
signal idle_started()


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = default_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

## Move the body according to the speed, acceleration, and friction values. [br]
## Params:[br]
## body - the body to move. [br] 
## direction - the direction to move in.
func move(body: CharacterBody2D, direction: Vector2):
	# Accelerate or deccelerate the player
	if is_movement_enabled:
		if direction.length() > 0:
			if not is_moving:
				movement_started.emit()
				is_moving = true
			body.velocity = body.velocity.lerp(direction.normalized() * speed, acceleration)
		else:
			body.velocity = body.velocity.lerp(Vector2.ZERO, friction)
			if is_moving:
				is_moving = false
				idle_started.emit()
		body.move_and_slide()

func enable_movement():
	is_movement_enabled = true
	movement_enabled.emit()

func disable_movement():
	is_movement_enabled = false
	movement_disabled.emit()
	is_moving = false
	
func teleport_to(body: CharacterBody2D, teleport_position: Vector2):
	body.global_position = teleport_position
	teleported.emit()
	
