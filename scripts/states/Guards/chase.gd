extends state
class_name guard_chase

var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("player")
	print("deu chase")
	
func Physics_Update(_delta: float):
	var player_direction = player.global_position - entity.global_position
	
	entity.velocity = player_direction.normalized() * move_speed
	
	if player_direction.length() > 60:
		transition.emit(self, "guardPatrol")
