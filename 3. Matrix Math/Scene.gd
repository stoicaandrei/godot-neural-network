extends Node2D

var Matrix = preload("res://Matrix.gd")

func _ready():
	var m1 = Matrix.new(1, 3)
	m1.add(3)
	print(m1.matrix)
	m1.transpose()
	print(m1.matrix)