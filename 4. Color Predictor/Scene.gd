extends Control

var NeuralNetwork = preload("res://Neural Network/Brain.gd")

onready var guess_right = $UI/Right/Top/Guess
onready var guess_left = $UI/Left/Top/Guess

onready var rect_right = $UI/Right/Bottom/RightButton/ColorRect
onready var rect_left = $UI/Left/Bottom/LeftButton/ColorRect

var r: float
var g: float
var b: float

var brain: NeuralNetwork

func _ready():
	randomize()
	brain = NeuralNetwork.new(3, 10, 2)
	
	for i in range(1000):
		pick_color()
		train_color()
	
	reset()

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		pick_color()
		change_background()

func pick_color():
	r = randf()
	g = randf()
	b = randf()

func change_background():
	rect_right.color = Color(r, g, b)
	rect_left.color = Color(r, g, b)

func hide_quess():
	guess_right.hide()
	guess_left.hide()

func guess_color():
	var guesses = brain.predict([r, g, b])
	print(guesses)
	if guesses[0] > guesses[1]:
		guess_left.show()
	else:
		guess_right.show()

func reset():
	hide_quess()
	pick_color()
	change_background()
	guess_color()

func train_color():
	if (r + g + b > 1.5):
		brain.train([r, g, b], [0, 1])
	else:
		brain.train([r, g, b], [1, 0])

func _on_LeftButton_pressed():
	brain.train([r, g, b], [1, 0])
	reset()

func _on_RightButton_pressed():
	brain.train([r, g, b], [0, 1])
	reset()
