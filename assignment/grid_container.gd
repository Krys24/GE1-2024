extends GridContainer

var button_states: Array = []

func _ready():
	# initialise button states (8x8 grid)
	button_states = []
	for row in range(8):
		var column_states: Array = []
		for column in range(8):
			column_states.append(false)
		button_states.append(column_states)

	# connect buttons to signal
	for i in range(get_child_count()):
		var button = get_child(i)
		
		# ensure it's a Button node before connecting signal
		if button is Button:
			var row = int(i / 8)
			var column = i % 8
			
			button.pressed.connect(Callable(self, "_on_button_pressed").bind(row, column))

func _on_button_pressed(row: int, column: int):
	var button = get_child(row * 8 + column)  # access correct button by row and column
	button_states[row][column] = !button_states[row][column]

	# change the button color based on its state
	if button_states[row][column]:
		button.modulate = Color(0, 1, 0)  # green when active
		play_sound_for_button(row)
	else:
		button.modulate = Color(1, 1, 1)  # white when inactive

# play sound function
func play_sound_for_button(row: int):
	var audio_player = get_node("Row_" + str(row) + "_Audio")

	# print if audio player is found or not
	if audio_player:
		print("Playing sound for row", row)
		audio_player.play()
	else:
		print("Audio player not found for row", row)
