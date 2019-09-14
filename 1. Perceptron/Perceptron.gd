class_name Perceptron

var n
var weights := []
var lr := 0.0001 # learning rate

# Constructor
func _init(n):
	for i in range(n):
		weights.append(0.0)
	randomize()
	initialize_weights_randomly()

func guess(inputs: Array) -> int:
	var sum = 0.0
	for i in range(weights.size()):
		sum += inputs[i] * weights[i]
	
	var output = sign(sum)
	return output

func train(inputs: Array, target: int) -> void:
	var guess = guess(inputs)
	var error = target - guess
	
	# Tune all the weights
	for i in range(weights.size()):
		weights[i] += error * inputs[i] * lr

func initialize_weights_randomly() -> void:
	for i in range(weights.size()):
		if randf() < 0.5:
			weights[i] = 1
		else:
			weights[i] = -1

func guess_y(x: int) -> int:
	var m = weights[0] / weights[1]
	var b = weights[2] / weights[1]
	
	return -m * x - b