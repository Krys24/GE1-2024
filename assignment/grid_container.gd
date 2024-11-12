extends GridContainer

var button_states = Array()  # stores true/false for each button's state
var current_column = 0

func _ready():
	# initialize an 8x8 grid of false (inactive) buttons
	for i in range(8):
		button_states.append([false, false, false, false, false, false, false, false])


func _on_Button_pressed(button):
	var row = int(button.get_position().y / button.rect_min_size.y)
	var column = int(button.get_position().x / button.rect_min_size.x)
	
	# toggle state
	button_states[row][column] = !button_states[row][column]
	button.pressed = button_states[row][column]
	
	# visual feedback for toggling
	if button.pressed:
		button.modulate = Color(1, 0, 0)  # active color
	else:
		button.modulate = Color(1, 1, 1)  # inactive color



func _on_check_button_1_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_3_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_4_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_5_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_6_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_7_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_8_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_9_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_10_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_11_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_12_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_13_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_14_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_15_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_16_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_17_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_18_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_19_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_20_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_21_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_22_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_23_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_24_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_25_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_26_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_27_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_28_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_29_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_30_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_31_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_32_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_33_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_34_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_35_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_36_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_37_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_38_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_39_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_40_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_41_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_42_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_43_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_44_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_45_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_46_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_47_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_48_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_49_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_50_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_51_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_52_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_53_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_54_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_55_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_56_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_57_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_58_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_59_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_60_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_61_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_62_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_63_pressed() -> void:
	pass # Replace with function body.


func _on_check_button_64_pressed() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	for row in range(8):
		if button_states[row][current_column]:
			play_sound_for_button(row, current_column)
	
	# move to next column, loop back to start if needed
	current_column = (current_column + 1) % 8

# function to trigger the sound
func play_sound_for_button(row, column):
	print("Playing sound for button at row:", row, "column:", column)
