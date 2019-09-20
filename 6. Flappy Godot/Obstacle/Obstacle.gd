extends Node2D

const SPEED = 200
	
func move(delta):
	position += Vector2.LEFT * SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
