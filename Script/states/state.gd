extends Node
class_name state

@export var entity: CharacterBody2D
@export var move_speed:= 50.0

var move_direction : Vector2
var wander_time : float

signal transition
# Called when the node enters the scene tree for the first time.
func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass
	
