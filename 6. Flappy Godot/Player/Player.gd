extends KinematicBody2D

const GRAVITY = 20
const FORCE = 500

var motion = Vector2()

signal got_hit

func move(delta):
	motion.y += GRAVITY
	var col = move_and_collide(motion * delta)
	
	if col:
		emit_signal("got_hit")

func jump():
	motion.y = -FORCE