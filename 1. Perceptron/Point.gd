extends Node2D

class_name Point

var x: int
var y: int
var bias := 1
var label: int

onready var color_rect = $ColorRect

var width = ProjectSettings.get_setting("display/window/size/width")
var height = ProjectSettings.get_setting("display/window/size/height")

func _ready():
	x = randi() % (width) - (width / 2)
	y = randi() % (height) - (height / 2)

	var pos = Vector2(x, y)
	
	self.position = pos

func change_color(val: int):
	if val == 1:
		color_rect.color = Color('ffffff')
	if val == -1:
		color_rect.color = Color('000000')
	if val == 0:
		color_rect.color = Color('02ff00')