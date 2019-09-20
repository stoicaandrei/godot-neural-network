extends Node2D

onready var player = $Player
onready var obstable_spawner = $"Obstacle spawner"

var Obstacle = preload("../Obstacle/Obstacle.tscn")

var pause = false

func _ready():
	randomize()
	_on_Spawn_timer_timeout()

func _physics_process(delta):
	if Input.is_action_just_pressed('ui_up'):
		player.jump()
	
	if pause == true:
		pass
	
	for obstacle in obstable_spawner.get_children():
		obstacle.move(delta)
	player.move(delta)

func _on_Player_got_hit():
	pause = true

func _on_Spawn_timer_timeout():
	var obstacle = Obstacle.instance()
	obstacle.position.x = 870
	obstacle.position.y += randi() % 200 - 100
	obstable_spawner.add_child(obstacle)
