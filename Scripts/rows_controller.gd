extends VBoxContainer

class_name RowsController

@onready var word_pool = %WordPool
@onready var keyboard = %Keyboard
@onready var validation_alert = %ValidationAlert


@onready var rows: Array[HBoxContainer] = [
	$Row,
	$Row2,
	$Row3,
	$Row4,
	$Row5
]

var active_row_index = 0
var active_letter_index = -1
var is_row_filled = false
var letters
var letter_tiles


var word_to_guess = ""

func _ready():
	word_to_guess = word_pool.get_random_word()



func _on_keyboard_backspace_pressed():
	if active_letter_index >= 0:
		rows[active_row_index].get_child(active_letter_index).letter= ''
		active_letter_index -= 1

func _on_keyboard_enter_pressed():
	var is_length_valid = validate_length()
	if !is_length_valid:
		return
		
	letter_tiles = rows[active_row_index].get_children()
	letters = letter_tiles.map(func (c): return c.letter)
	var word_to_check = "".join(letters)
	
	
	
	
	
	

func on_word_valid(word_to_check: String, letters):
	var validation_result = validate_word(word_to_guess, letters)
	print_debug(validation_result)
	
func validate_word(word_to_check: String, letters) -> Array[Enums.State]:
	
	var validation_results: Array[Enums.State] = []
	for i in letters.size(): 
		var current_letter = letters[i]
		if word_to_check.to_upper().contains(current_letter.to_upper()):
			var letter_index_in_word = word_to_check.findn(current_letter)
			if letter_index_in_word == i:
				validation_results.append(Enums.State.CorrectRightPlacement)
			else:
				validation_results.append(Enums.State.CorrectWrongPlacement)
		else:
			validation_results.append(Enums.State.Incorrect)
	return validation_results


func _on_keyboard_letter_pressed(letter: String):
	if active_letter_index < 4:
		active_letter_index += 1
	if active_letter_index <= 4:
		rows[active_row_index].get_child (active_letter_index).letter = letter



func validate_length ():
	if active_letter_index == 4:
		return true
		
	validation_alert.show_with_text("Not enough letters")
	return false
