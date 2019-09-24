**Godot** is an open source game engine. In this repository I made an artificial intelligence library and implemented some use cases.

Just copy the folder from `lib` and you're good to go.

For simple case AI use
```
var NeuralNetwork = preload("./Neural Network/Brain.gd")
var neural_network = NeuralNetwork.new(input_nodes: int, 
                                       hidden_nodes: int, 
                                       output_nodes: int)

neural_network.predict(inputs: Array)
neural_network.train(inptuts: Array, targets: Array)
```

For neuroevolution algorithms use
```
var NeuralNetwork = preload("./Neural Network/Brain.gd")
var neural_network = NeuralNetwork.new(input_nodes: int, 
                                       hidden_nodes: int, 
                                       output_nodes: int)

neural_network.predict(inputs: Array)
neural_network.duplicate()
neural_network.mutation_rate = mutation_rate
neural_network.mutate()
```

# 1. Simple perceptron
Here I implemented a simple perceptron, that has the role of doing linear separation of points based on a given function `y=mx+b`.

<img src="1.%20Perceptron/preview.gif" width="200" height="200" />

# 2. Multilayer perceptron
The first project scaled to n perceptrons, and now is a fully funcional neutral network with 3 layers, that can be trained and used for predictions.
In this project I aproximated the XOR operator.

# 3. Matrix math
This is the barebone library of matrix operations. It contains a `Matrix class` with all the basic operations (both scalar and matrix wise) and a `MatrixOperator class` that contains static function for the matrices.

# 4. Color predictor
This is a program that predicts weather a color should be white or black, given the background color.

<img src="4.%20Color%20Predictor/preview.gif" width="200" height="200" />

# 5. Neuroevolution
In this project I added more functionalities to the neural network, respectively mutate and duplicate

# 6. Flappy godot
In this project I implemented a flappy bird clone, and trained the neuroevolution algorithm to learn how to play

<img src="6.%20Flappy%20Godot/preview.gif" width="200" height="200" />

This project was inspired by [Daniel Shiffman](https://www.youtube.com/user/shiffman/playlists)
