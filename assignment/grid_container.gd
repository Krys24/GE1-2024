extends GridContainer  # The script is attached to the GridContainer itself

# Called when the node enters the scene tree for the first time
func _ready():
	# Loop over all buttons in the grid and connect them to the on_button_pressed function
	for row in range(8):  # 8 rows
		for column in range(8):  # 8 columns
			var button_index = row * 8 + column
			# Make sure GridContainer contains enough children (64 buttons)
			if button_index < get_child_count():
				var button = get_child(button_index)  # Access each button by its index
				# Connect the "pressed" signal of the button to the function "_on_button_pressed"
				button.connect("pressed", Callable(self, "_on_button_pressed").bind(row, column))

# Function to handle button press
func _on_button_pressed(row, column):
	print("Button pressed at row:", row, "column:", column)
	play_sound_for_button(row)

# function to play sound for when a button pressed
func play_sound_for_button(row):
	var audio_player_name = "Row_%d_Audio" % row  # create name of AudioStreamPlayer node (e.g. Row_0_Audio)
	var audio_player = get_node(audio_player_name) 
	
	if audio_player:
		print("Playing sound for row:", row)
		audio_player.play()  # play sound for current row
	else:
		print("Error: Audio player not found for row", row)
