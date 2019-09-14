class_name NeuralNetwork

var Matrix = preload("res://Matrix.gd")

var input_nodes := 0
var hidden_nodes := 0
var output_nodes := 0
 
var weights_ih: Matrix # input -> hidden
var weights_ho: Matrix # hidden -> output
var bias_h: Matrix
var bias_o: Matrix

var sigmoid_ref: FuncRef

func _init(input_nodes_, hidden_nodes_, output_nodes_):
	sigmoid_ref = funcref(self, 'sigmoid')
	input_nodes = input_nodes_
	hidden_nodes = hidden_nodes_
	output_nodes = output_nodes_
	
	weights_ih = Matrix.new(hidden_nodes, input_nodes)
	weights_ho = Matrix.new(output_nodes, hidden_nodes)
	
	weights_ih.randomize()
	weights_ho.randomize()
	
	bias_h = Matrix.new(hidden_nodes, 1)
	bias_o = Matrix.new(output_nodes, 1)
	
	bias_h.randomize()
	bias_o.randomize()

func feed_forward(input_arr: Array):
	var inputs = Matrix.new(input_arr)
	
	var hidden = weights_ih.dot(inputs)
	hidden.add(bias_h)
	
	hidden.map(sigmoid_ref)
	
	var output = weights_ho.dot(hidden)
	output.add(bias_o)
	output.map(sigmoid_ref)
	
	output.print()
	return output.to_array()

func train(inputs, answer):
	pass

func sigmoid(x):
	return 1 / (1 + exp(-x))