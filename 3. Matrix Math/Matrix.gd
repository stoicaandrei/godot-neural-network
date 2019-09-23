class_name Matrix

var rows := 0
var cols := 0
var data := []

# CONSTRUCTORS
func _init(a, b = null):
	if a is Array:
		construct_from_arr(a)
	elif a is int:
		construct_from_size(a, b)
	else:
		construct_from_matrix(a)

func construct_from_size(rows, cols):
	self.rows = rows
	self.cols = cols
	
	for i in range(rows):
		data.append([])
		for j in range(cols):
			data[i].append(0)

func construct_from_arr(arr):
	rows = arr.size()
	if arr[0] is Array:
		cols = arr[0].size()
		data = arr
	else:
		cols = 1
		for i in range(rows):
			data.append([])
			data[i].append(arr[i])

func construct_from_matrix(a):
	rows = a.rows
	cols = a.cols
	data = [] 
	for arr in a.data:
		data.append(arr.duplicate())

# randomize the array with elements from -1 to 1
func randomize():
	randomize() # randomize the seed
	for i in range(rows):
		for j in range(cols):
			data[i][j] = rand_range(-1, 1)

# add a matrix or a scalar to the current matrix
func add(m):
	if m is int or m is float:
		return add_scalar(m)
	
	for i in range(rows):
		for j in range(cols):
			data[i][j] += m.data[i][j]

func add_scalar(n):
	for i in range(rows):
		for j in range(cols):
			data[i][j] += n

# multiply the matrix with a scalar or do a hadamard product
func multiply(m):
	if m is int or m is float:
		return multiply_scalar(m)
		
	for i in range(rows):
		for j in range(cols):
			data[i][j] *= m.data[i][j]

func multiply_scalar(n) -> void:
	for i in range(rows):
		for j in range(cols):
			data[i][j] *= n

# fancy way of printing the matrix
func print(digits = 2):
	var tp = ' %' + str(digits) + 'd'
	var res := ''
	for i in range(rows):
		res += '('
		for j in range(cols):
			res += tp % data[i][j]
		res += ' )\n'
	print(res)

# apply a function to every element of the matrix
func map(fn: FuncRef):
	# maps a funtion to every element
	for i in range(rows):
		for j in range(cols):
			data[i][j] = fn.call_func(data[i][j])

# convert the matrix to a flat array
func to_array() -> Array:
	var res = []
	for i in range(rows):
		for j in range(cols):
			res.append(data[i][j])
	return res

# duplicate the matrix
func duplicate():
	return get_script().new(self)