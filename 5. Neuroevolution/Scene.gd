extends Node2D

var NeuralNetwork = preload("res://Neural Network/Brain.gd")
var Matrix = preload("res://Neural Network/Matrix.gd")

func _ready():
	var a = NeuralNetwork.new(3, 2, 1)
	var b = a.duplicate()
	
	a.mutation_rate = .5
	a.mutate()
	
	print(a.bias_o.data, b.bias_o.data)
