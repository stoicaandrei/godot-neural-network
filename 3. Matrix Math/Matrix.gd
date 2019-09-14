class_name Matrix

var rows := 0
var cols := 0
var data := []

func _init(rows, cols):
	self.rows = rows
	self.cols = cols
	
	for i in range(rows):
		data.append([])
		for j in range(cols):
			data[i].append(0)

func randomize():
	for i in range(rows):
		for j in range(cols):
			data[i][j] = randi() % 30

func add(m):
	if m is int or m is float:
		return add_scalar(m)
	
	for i in range(rows):
		for j in range(cols):
			data[i][j] += m.data[i][j]

func add_scalar(n: int):
	for i in range(rows):
		for j in range(cols):
			data[i][j] += n

func dot(m):
	if m is int or m is float:
		return dot_scalar(m)
	
	if self.cols != m.rows:
		printerr('incompatible')
		return
	
	var result = get_script().new(self.rows, m.cols)
	for i in range(result.rows):
		for j in range(result.cols):
			for p in range(self.cols):
				result.data[i][j] += self.data[i][p] * m.data[p][j]
	
	self.rows = result.rows
	self.cols = result.cols
	self.data = result.data

func dot_scalar(n: int) -> void:
	for i in range(rows):
		for j in range(cols):
			data[i][j] *= n

func transpose() -> void:
	var result = get_script().new(cols, rows)
	
	for i in range(rows):
		for j in range(cols):
			result.data[j][i] = data[i][j]
	
	self.rows = result.rows
	self.cols = result.cols
	self.data = result.data

func print(digits = 2):
	var tp = ' %' + str(digits) + 'd'
	var res := ''
	for i in range(rows):
		res += '('
		for j in range(cols):
			res += tp % data[i][j]
		res += ' )\n'
	print(res)

func map(fn):
	# maps a funtion to every element
	for i in range(rows):
		for j in range(cols):
			data[i][j] = fn.call_func(data[i][j])