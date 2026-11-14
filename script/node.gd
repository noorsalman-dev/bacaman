extends Node


# Called when the node enters the scene tree for the first time.
@onready var label: Label = $"../player/Label"
var score = 0

func add_point():
	score = score + 1
	label.text  = "kills: " + str(score)
