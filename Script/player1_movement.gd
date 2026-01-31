extends CharacterBody2D

@export var movement_speed : float = 500
var character_diraction : Vector2

func _physics_process(delta):
	character_diraction.x = Input.get_axis("move_left_1","move_right_1")
	character_diraction.y = Input.get_axis("move_up_1","move_down_1")
	
	#flip
	if character_diraction.x > 0: %sprite.flip_h = false
	elif character_diraction.x < 0: %sprite.flip_h = true
	
	if character_diraction:
		velocity = character_diraction * movement_speed
		if %sprite.animation != "Walk":%sprite.animation = "Walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "Idle":%sprite.animation = "Idle"
		
	move_and_slide()
	
