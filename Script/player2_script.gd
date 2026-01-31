extends CharacterBody2D

@export var movement_speed : float = 150
var character_diraction : Vector2
@onready var sprint_bar = $sprite/ProgressBar
@export var initial_sprint_speed : float = 300
var sprint_speed = initial_sprint_speed
var sprint = false

var can_regen = false
var time_to_wait = 1.5
var start_timer = 0
var can_start_timer = true

func _ready() -> void:
	sprint_bar.value = sprint_bar.max_value
	sprint_bar.value = sprint_bar.max_value

func _physics_process(delta):
	#pega inout da direção
	character_diraction.x = Input.get_axis("move_left_2","move_right_2")
	character_diraction.y = Input.get_axis("move_up_2","move_down_2")
	
	#flip sprite personagem
	if character_diraction.x > 0: %sprite.flip_h = false
	elif character_diraction.x < 0: %sprite.flip_h = true
		
		#regenerar
	if !can_regen and !sprint and sprint_bar.value != 5.0: 
		can_start_timer = true
		if can_start_timer:
			start_timer += delta
			if start_timer >= time_to_wait:
				can_regen = true
				can_start_timer = false
				start_timer = 0
				
	if sprint_bar.value == 5.0:
		can_regen = false
		
	if can_regen == true:
		sprint_bar.value += 0.5
		can_start_timer = false
		start_timer = 0
	
	if Input.is_action_pressed("sprint"):
		if sprint_bar.value > 0:
			sprint_speed = initial_sprint_speed
			
			sprint = true
			sprint_bar.value -= 0.1
		else:
			sprint_speed = movement_speed
	
	if Input.is_action_just_released("sprint"):
		sprint = false
		
	
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
	
