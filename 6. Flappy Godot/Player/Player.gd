extends KinematicBody2D

const GRAVITY = 20
const FORCE = 500

var NeuralNetwork = preload("../Neural Network/Brain.gd")

var height = ProjectSettings.get_setting("display/window/size/height")
var width = ProjectSettings.get_setting("display/window/size/width")

var motion = Vector2()
var brain = NeuralNetwork.new(4, 10, 1)

var score = 0.0
var fitness = 0.0

signal got_hit

# use the neural network to predict the next move
func think(pipe_pos):
	var inputs = []
	inputs.append(global_position.y / height)
	inputs.append(motion.y / 1000)
	inputs.append(pipe_pos.x / width)
	inputs.append(pipe_pos.y / height)
	
	var outputs = brain.predict(inputs)
	if outputs[0] > 0.5:
		jump()

# apply motion
func move(delta):
	score += 1
	motion.y += GRAVITY
	var col = move_and_collide(motion * delta)
	
	if col:
		emit_signal("got_hit", self)
		queue_free()

func jump():
	motion.y = -FORCE

func mutate():
	brain.mutate()