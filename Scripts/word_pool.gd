extends Node

class_name WordPool

var words = ["FIRST"]

func get_random_word():
	return words.pick_random()
