extends Area2D

## The marker that represents the point the player will teleport to.
@export var teleport_marker: Marker2D
## For enabling or disabling the teleporter.
@export var enabled: bool = true

var teleport_to_marker: Marker2D 

signal entered_teleporter(body, teleport_point)

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(teleport_marker != null, "ERROR: You must connect a teleport marker.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _on_body_entered(body):
	# Teleport the body, if teleportation is enabled
	if enabled:
		var teleport_point = teleport_marker.global_position
		AudioManager.play("res://Sounds/door_enter.wav", -14)
#		body.teleport_to(teleport_point)
		entered_teleporter.emit(body,teleport_point)
