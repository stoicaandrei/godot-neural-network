extends Node2D

const TOTAL = 50

onready var obstable_spawner = $"Obstacle spawner"
onready var player_spawner = $"Player spawner"
onready var timer = $"Spawn timer"

var Obstacle = preload("../Obstacle/Obstacle.tscn")
var Player = preload("../Player/Player.tscn")

var pause = false
var next_pipe_pos = Vector2(2000, 2000)

var players = []

func _ready():
	randomize()
	for i in range(TOTAL):
		var player = Player.instance()
		player_spawner.add_child(player)
		player.connect("got_hit", self, "on_Player_got_hit")
	_on_Spawn_timer_timeout()


func _physics_process(delta):
	if pause == true:
		return
	
	# move the pipes and calculate the closest one to the player
	next_pipe_pos = Vector2(2000, 2000)
	for obstacle in obstable_spawner.get_children():
		obstacle.move(delta)
		var obs_pos = obstacle.global_position
		if player_spawner.get_child_count() == 0:
			continue
			 
		if next_pipe_pos.x > obs_pos.x and obs_pos.x >= player_spawner.get_children()[0].global_position.x:
			next_pipe_pos = obs_pos
	
	for player in player_spawner.get_children():
		player.move(delta)
		player.think(next_pipe_pos)
	
	if player_spawner.get_child_count() == 0:
		next_generation()

# spawn obstacles every 2 seconds
func _on_Spawn_timer_timeout():
	if pause == true:
		return
	
	var obstacle = Obstacle.instance()
	obstacle.position.x = 870
	obstacle.position.y += randi() % 200 - 100
	obstable_spawner.add_child(obstacle)

# do a weighted selection of player in order to mutate the fittest
func pick_one():
	var index = 0
	var r = randf()
	
	while r > 0:
		r = r - players[index].fitness
		index += 1
	index -= 1
	
	var player = players[index]
	player.mutate()
	return player.duplicate()

func calculate_fitness():
	var sum = 0
	for player in players:
		sum += player.score
	
	for player in players:
		player.fitness = player.score / sum

func next_generation():
	calculate_fitness()
	for i in range(TOTAL):
		var player = pick_one()
		player_spawner.add_child(player)
		player.connect("got_hit", self, "on_Player_got_hit")
		player.position.y = 300
	players = []
	
	for obst in obstable_spawner.get_children():
		obst.queue_free()
	var obstacle = Obstacle.instance()
	obstacle.position.x = 870
	obstacle.position.y += randi() % 200 - 100
	obstable_spawner.add_child(obstacle)
	timer.stop()
	timer.start()

func on_Player_got_hit(player):
	var pl = player.duplicate()
	pl.score = player.score
	players.append(pl)