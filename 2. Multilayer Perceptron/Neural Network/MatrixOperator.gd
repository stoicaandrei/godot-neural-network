class_name MatrixOperator

var Matrix = preload("res://Neural Network/Matrix.gd")

static func subtract(a: Matrix, b: Matrix) -> Matrix:
	var result = Matrix.new(a.rows, a.cols)
	for i in range(a.rows):
		for j in range(a.cols):
			result.data[i][j] = a.data[i][j] - b.data[i][j]
	return result

static func transpose(a: Matrix) -> Matrix:
	var result = Matrix.new(a.cols, a.rows)
	for i in range(a.rows):
		for j in range(a.cols):
			result.data[j][i] = a.data[i][j]
	return result

static func multiply(a: Matrix, b: Matrix) -> Matrix:
	var result = Matrix.new(a.rows, b.cols)
	for i in range(result.rows):
		for j in range(result.cols):
			var sum = 0
			for k in range(a.cols):
				sum += a.data[i][k] * b.data[k][j]
			result.data[i][j] = sum
	return result

static func map(a: Matrix, func_ref: FuncRef) -> Matrix:
	var result = Matrix.new(a.rows, a.cols)
	for i in range(a.rows):
		for j in range(a.cols):
			var val = a.data[i][j]
			result.data[i][j] = func_ref.call_func(val)
	return result