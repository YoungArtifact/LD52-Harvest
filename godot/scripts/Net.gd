extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up") and global_position.y > -100:
		position.y -= 1
	if Input.is_action_pressed("move_down") and global_position.y < 6:
		position.y += 1
	
	if Input.is_action_pressed("move_left"):
		get_node("Net").set_flip_h(false)
	
	if Input.is_action_pressed("move_right"):
		get_node("Net").set_flip_h(true)