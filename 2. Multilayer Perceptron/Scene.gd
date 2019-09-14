extends Node2D

var NeuralNetwork = preload("res://NeuralNetwork.gd")
var Matrix = preload("res://Matrix.gd")

func _ready():
	var neural_network = NeuralNetwork.new(2, 2, 1)
	
	var input = [1, 2]
	var output = neural_network.feed_forward(input)
	
	print(output)