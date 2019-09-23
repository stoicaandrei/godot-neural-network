extends Node2D

var NeuralNetwork = preload("res://Neural Network/Brain.gd")

var training_data = [
	{
		"inputs": [0,0],
		"targets": [0]
	},
	{
		"inputs": [0,1],
		"targets": [1]
	},
	{
		"inputs": [1,0],
		"targets": [1]
	},
	{
		"inputs": [1,1],
		"targets": [0]
	},
]

func _ready():
	var neural_network = NeuralNetwork.new(2, 2, 1)
	
	for i in range(10000):
		var data = training_data[randi() % 4]
		neural_network.train(data.inputs, data.targets)
		
	print(neural_network.predict([1,1]))
	print(neural_network.predict([0,0]))
	print(neural_network.predict([0,1]))
	print(neural_network.predict([1,0]))