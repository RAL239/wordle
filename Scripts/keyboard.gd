extends VBoxContainer

class_name Keyboard

signal letter_pressed(letter: String)
signal backspace_pressed
signal enter_pressed


func _on_keyboard_button_pressed(letter: String):
	letter_pressed.emit(letter)


func _on_backspace_button_pressed():
	backspace_pressed.emit()


func _on_enter_pressed():
	enter_pressed.emit()
