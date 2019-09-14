class_name Matrix

var rows := 0
var cols := 0
var matrix := []

func _init(rows, cols):
	self.rows = rows
	self.cols = cols
	
	for i in range(rows):
		matrix.append([])
		for j in range(cols):
			matrix[i].append(0)

func add(m):
	if m is int or m is float:
		return add_scalar(m)
	
	for i in range(rows):
		for j in range(cols):
			matrix[i][j] += m.matrix[i][j]

func add_scalar(n: int) -> void:
	for i in range(rows):
		for j in range(cols):
			matrix[i][j] += n

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
				result.matrix[i][j] += self.matrix[i][p] * m.matrix[p][j]
	
	self.rows = result.rows
	self.cols = result.cols
	self.matrix = result.matrix

func dot_scalar(n: int) -> void:
	for i in range(rows):
		for j in range(cols):
			matrix[i][j] *= n

func transpose() -> void:
	var result = get_script().new(cols, rows)
	
	for i in range(rows):
		for j in range(cols):
			result.matrix[j][i] = matrix[i][j]
	
	self.rows = result.rows
	self.cols = result.cols
	self.matrix = result.matrix