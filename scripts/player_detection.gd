extends CollisionObject2D
class_name guard_vision

@onready var view_area:= $"."
@export var entity_with_vision: CharacterBody2D
@export var state_machine_ref: state_machine
var target

func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		target = body
		state_machine_ref.current_state.transition.emit(target, "guardChase")
		print(state_machine_ref.current_state)
		
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		state_machine_ref.current_state.transition.emit(target, "guardPatrol")
		target = null
		print(state_machine_ref.current_state)
