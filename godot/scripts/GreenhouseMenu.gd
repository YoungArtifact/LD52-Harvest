extends Container

var at_greenhouse : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if at_greenhouse && Input.is_action_just_pressed("ui_accept"):
		visible = true
	if visible && Input.is_action_just_pressed("ui_cancel"):
		visible = false
	pass


func _on_Greenhousedoor_body_entered(body):
	at_greenhouse = true
	pass # Replace with function body.


func _on_Greenhousedoor_body_exited(body):
	at_greenhouse = false
	pass # Replace with function body.
