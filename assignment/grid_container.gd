extends GridContainer

var timer : Timer
var button_states : Array = []  

func _ready():
	# set up timer
	timer = $LoopTimer 
	timer.wait_time = 1  # set interval for timer (1 second)
	timer.connect("timeout", Callable(self, "_on_timer_timeout")) 
	timer.start()  # start timer to begin loop

	# initialize button states for each row and column
	for row in range(8):
		button_states.append([])
		for column in range(8):
			button_states[row].append(false)  

	# connect button signals
	for row in range(8):
		for column in range(8):
			var button = get_child(row * 8 + column)
			button.connect("pressed", Callable(self, "_on_button_pressed").bind(row, column))  # Corrected signal connection

# signal handler for button press
func _on_button_pressed(row: int, column: int):
	print("Button pressed at Row: ", row, " Column: ", column)

	# toggle button's state when pressed
	button_states[row][column] = !button_states[row][column]

	# play sound for button if active
	if button_states[row][column]:
		play_sound_for_button(row)
		highlight_active_row()  

func _on_timer_timeout():
	# loop through each row and play sound if any button in row is active
	for row in range(8):
		for column in range(8):
			if button_states[row][column]:  # if button is active
				play_sound_for_button(row)
	
	highlight_active_row()  

func highlight_active_row():
	for row in range(8):
		for column in range(8):
			var button = get_child(row * 8 + column)
			if button_states[row][column]:
				button.modulate = Color(1, 0, 0)  # red color for active buttons
			else:
				button.modulate = Color(1, 1, 1)  # reset to default color for inactive buttons

func play_sound_for_button(row: int):
	# sound node is named "Row_X_Audio"
	var audio_player = get_node("Row_" + str(row) + "_Audio")
	if audio_player:
		audio_player.play()  # play sound for specific row
