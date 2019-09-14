extends Node2D

var Perceptron = preload("res://Perceptron.gd")
var Point = preload("res://Point.tscn")

onready var point_keeper = $"Point keeper"
onready var correct_line = $"Correct line"
onready var percepted_line = $"Percepted line"

export (int) var points = 1000

export (int) var m = 5
export (int) var b = 3

func f(x):
	return m*x + b

var p = Perceptron.new(3)
var trainIndex := 0

func _ready():
	# Draw line
	correct_line.points[0].x = -300
	correct_line.points[0].y = f(-300)
	correct_line.points[1].x = 300
	correct_line.points[1].y = f(300)
	spawn_points()

func spawn_points():
	for i in range(points):
		var point = Point.instance()
		point_keeper.add_child(point)
	set_labels()

func _process(delta):
	#if Input.is_action_just_pressed("ui_up"):
	test_perceptron()
	train_perceptron()

func train_perceptron():
	var point = point_keeper.get_children()[trainIndex]
	var inputs = [point.x, point.y, point.bias]
	var target = point.label
	p.train(inputs, target)
	
	trainIndex += 1
	trainIndex = trainIndex % points

func test_perceptron():
	# color every point that is chosen right
	for point in point_keeper.get_children():
		var inputs = [point.x, point.y, point.bias]
		var target = point.label
		#p.train(inputs, target)
		
		var guess = p.guess(inputs)
		if guess == target:
			point.change_color(0)
		else:
			point.change_color(target)
	
	# adgjust the guessed line
	percepted_line.points[0].x = -300
	percepted_line.points[0].y = p.guess_y(-300)
	percepted_line.points[1].x = 300
	percepted_line.points[1].y = p.guess_y(300)

# set the label for each point based on the line
func set_labels():
	for point in point_keeper.get_children():
		var line_y = f(point.x)
		
		if line_y < point.y:
			point.label = 1
			point.change_color(1)
		else:
			point.label = -1
			point.change_color(-1)
