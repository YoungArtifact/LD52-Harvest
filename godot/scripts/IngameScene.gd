extends Node2D

@onready var fade_overlay = %FadeOverlay
@onready var pause_overlay = %PauseOverlay
@onready var points_count = %PointsCount

var points : int = 0
var fruit_collected : bool = false
var golden_collected : bool = false
var net_empty : Texture = preload("res://assets/net.png")
var net_with_fruit : Texture = preload("res://assets/net_fruit.png")
var net_with_golden_fruit : Texture = preload("res://assets/net_golden.png")

func _ready() -> void:
	fade_overlay.visible = true
	
	if SaveGame.has_save():
		SaveGame.load_game(get_tree())
	
	pause_overlay.game_exited.connect(_save_game)

func _process(delta):
	points_count.text = str(points)

func _input(event) -> void:
	if event.is_action_pressed("pause") and not pause_overlay.visible:
		get_viewport().set_input_as_handled()
		get_tree().paused = true
		pause_overlay.grab_focus()
		pause_overlay.visible = true

func _save_game() -> void:
	SaveGame.save_game(get_tree())

func _on_area_entered_net(body):
	if not fruit_collected:
		body.set_deferred("monitorable", false)
		body.visible = false
		print(body.name)
		if body.name == "GoldenFruit":
			fruit_collected = true
			golden_collected = true
			get_node("Player/Net/Net").texture = net_with_golden_fruit
		else:
			fruit_collected = true
			get_node("Player/Net/Net").texture = net_with_fruit
		body.get_child(2).start()

func _on_body_entered_box(body):
	get_node("Player/Net/Net").texture = net_empty
	if golden_collected:
		fruit_collected = false
		golden_collected = false
		points += 50
	else:
		fruit_collected = false
		points += 10

func _on_fruit_timer_timeout():
	get_node("Fruit").monitorable = true
	get_node("Fruit").visible = true
	

func _on_fruit_timer_2_timeout():
	get_node("Fruit2").monitorable = true
	get_node("Fruit2").visible = true


func _on_fruit_timer_3_timeout():
	get_node("Fruit3").monitorable = true
	get_node("Fruit3").visible = true


func _on_fruit_timer_4_timeout():
	get_node("Fruit4").monitorable = true
	get_node("Fruit4").visible = true


func _on_golden_fruit_timer_timeout():
	get_node("GoldenFruit").monitorable = true
	get_node("GoldenFruit").visible = true
