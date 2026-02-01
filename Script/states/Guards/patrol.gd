extends state
class_name guardPatrol

@export var group_name: String

var positions: Array
var temp_positions: Array
var current_position: Marker2D

func _ready() -> void:
	positions = get_tree().get_nodes_in_group(group_name)
	_get_positions()
	_get_next_position()

func Physics_Update(_delta: float):
	if entity.global_position.distance_to(current_position.position) < 10:
		_get_next_position()
		
func _get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()
	
func _get_next_position():
	if temp_positions.is_empty():
		_get_positions()
	current_position = temp_positions.pop_front()
	move_direction = entity.to_local(current_position.position).normalized()
