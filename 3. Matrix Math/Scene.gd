extends Node2D

var Matrix = preload("res://Matrix.gd")

func _ready():
	var m = Matrix.new(2, 2)
	m.randomize()
	m.print()
	
	var ref = funcref(self, 'f')
	m.map(ref)
	m.print()

func f(n):
	return n + 3