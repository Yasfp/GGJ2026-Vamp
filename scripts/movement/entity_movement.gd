extends CharacterBody2D
class_name npc_movement

@export var personagem: Node2D
@onready var sprite:= %sprite

func _physics_process(delta: float) -> void:	
	if velocity.length() > 0:
		sprite.play("Walk")
		
		if velocity.x > 0:
			personagem.rotate(0)
		else: 
			personagem.rotate(180)
	else: 
		sprite.play("Idle")
		
	move_and_slide()
