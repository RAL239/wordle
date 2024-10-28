extends Button

class_name KeyboardButton

@export var letter: String

@export var State: Enums.State = Enums.State.Empty

const state_to_theme_variation = ["letter_available", "used", "correct_wrong_placement", "correct_right_placement"]

func _ready():
	name = letter
	theme_type_variation = state_to_theme_variation[State]
	text = letter
	
func set_state(new_state: Enums.State):
	if new_state == Enums.State.Incorrect:
		disabled = true
	if State != Enums.State.CorrectRightPlacement:
		State = new_state
		theme_type_variation = state_to_theme_variation[State]
