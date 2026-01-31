extends CharacterBody2D

@export var movement_speed : float = 500
var character_diraction : Vector2
@onready var sprint_bar = $sprite/ProgressBar
var sprint_speed : float = 300
var sprint = false

func _ready() -> void:
	sprint_bar.value = sprint_bar.max_value


func _physics_process(delta):
	#pega inout da direção
	character_diraction.x = Input.get_axis("move_left_1","move_right_1")
	character_diraction.y = Input.get_axis("move_up_1","move_down_1")
	
	#flip sprite personagem
	if character_diraction.x > 0: %sprite.flip_h = false
	elif character_diraction.x < 0: %sprite.flip_h = true
		
		#correr
	if Input.is_action_pressed("sprint") and sprint_bar.value > 0:	
		sprint_bar.value -= sprint_bar.step
		sprint = true
		print(sprint_bar.value)
	else:
		sprint_bar.value += sprint_bar.step
		sprint = false
		print(sprint_bar.value)
	

	
	if character_diraction:
		#verifica se jogador está correndo 
		if sprint:
			velocity = character_diraction * sprint_speed
		else:
			velocity = character_diraction * movement_speed
		if %sprite.animation != "Walk":%sprite.animation = "Walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "Idle":%sprite.animation = "Idle"
		
	move_and_slide()
	
