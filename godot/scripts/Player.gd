extends CharacterBody2D

class_name PlatformerController2D

@onready var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var walk_force = 600
@export var walk_max_speed = 100
@export var stop_force = 1300
@export var jump_force = 400
@export var max_jump_amount = 1

func _physics_process(delta):
	var walk = walk_force * (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
	if abs(walk) < walk_force * 0.2:
		velocity.x = move_toward(velocity.x, 0, stop_force * delta)
	else:
		velocity.x += walk * delta
	velocity.x = clamp(velocity.x, -walk_max_speed, walk_max_speed)

	velocity.y += gravity * delta

	move_and_slide()
	
	if Input.is_action_pressed("move_left"):
		get_node("Sprite").set_flip_h(false)
	
	if Input.is_action_pressed("move_right"):
		get_node("Sprite").set_flip_h(true)
