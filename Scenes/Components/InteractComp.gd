extends Node

## The area 2D node for detecting nearby interactable objects.
@export var interaction_area: Area2D
## A Node 2D representing the position of the center of the player.
@export var player_center: Node2D
## True if interaction is enabled, false if interaction is not enabled.
@export var is_interaction_enabled: bool = true

#var is_interactable_within_reach: bool = false

var is_interactable_in_reach:bool = false

signal interactable_in_reach()
signal interactables_out_of_reach()

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(interaction_area != null, "ERROR: No interaction area set.")
	interaction_area.area_entered.connect(interaction_update)
	interaction_area.area_exited.connect(interaction_update)

		
## Takes a list of interactable objects and returns the closest one to the player
func get_closest_interactable() -> Area2D:
	# Array of all areas overlapping with the interaction area (that it masks)
	var interactables = interaction_area.get_overlapping_areas()
	assert(!interactables.is_empty(), "ERROR: Interactables list cannot be empty.")
	if interactables.size() == 1:
		return interactables[0]
	# Iterate through all interactables to find the one that is closest to the player.
	var player_pos = player_center.global_position
	var closest_interactable = interactables[0]
	var smallest_distance = player_pos.distance_to(interactables[0].global_position)
	for interactable in interactables:
		var distance_to_player = player_pos.distance_to(interactable.global_position)
		if distance_to_player <=smallest_distance:
			smallest_distance = distance_to_player
			closest_interactable = interactable
	# Now closest_interactable is the closest interactable to the player.
	return closest_interactable
		
func interaction_update(_area: Area2D):
	if is_interaction_enabled:
		# Array of all areas overlapping with the interaction area (that it masks)
		var interactables_within_reach = interaction_area.get_overlapping_areas()
		if not interactables_within_reach.is_empty():
			interactable_in_reach.emit()
			is_interactable_in_reach = true
		else:
			interactables_out_of_reach.emit()
			is_interactable_in_reach = false
	return false
