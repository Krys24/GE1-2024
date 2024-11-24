extends Node

# declare variables for tempo slider, volume sliders, audio players and buttons
var global_tempo_slider : HSlider
var row_volume_sliders : Array
var row_audio_players : Array
var buttons : Array

func _ready():
	# initialize arrays for row sliders, audio players, and buttons
	row_volume_sliders = []
	row_audio_players = []
	buttons = []

	# access tempo slider
	global_tempo_slider = $GlobalTempoSlider

	# initialize rows of volume sliders and audio players
	for i in range(8):
		# get volume sliders for each row
		row_volume_sliders.append(get_node("Row_" + str(i) + "_Volume"))
		# get audio players for each row
		row_audio_players.append(get_node("Row_" + str(i) + "_Audio"))

		# get buttons for each row (8 buttons per row)
		var row_buttons = []
		for j in range(8):
			var button_index = i * 8 + (j + 1)  
			var button_name = "CheckButton" + str(button_index)  
			row_buttons.append(get_node(button_name))  # access button by name
		buttons.append(row_buttons)

		# set initial volume and pitch for each row's audio player and volume slider
		row_audio_players[i].volume_db = row_volume_sliders[i].value
		row_audio_players[i].pitch_scale = global_tempo_slider.value / 100.0

		# connect signals for each button in the row
		for button in row_buttons:
			button.connect("pressed", Callable(self, "_on_button_pressed").bind(i))  
	# connect tempo slider to update pitch for all audio players
	global_tempo_slider.connect("value_changed", Callable(self, "_on_tempo_changed"))

	# check if all audio players are loaded correctly
	for i in range(8):
		if row_audio_players[i].stream == null:
			print("Error: No audio file assigned to Row_" + str(i) + "_Audio.")
		else:
			print("Audio file loaded for Row_" + str(i) + "_Audio.")

# called when a button is pressed
func _on_button_pressed(row_index : int) -> void:
	# get audio player for the corresponding row
	var audio_player = row_audio_players[row_index]
	if audio_player.stream == null:
		print("Error: No audio file assigned to Row_" + str(row_index) + "_Audio.")
		return
	# play audio for corresponding row's audio player
	audio_player.play()
	print("Playing audio for Row_" + str(row_index) + "_Audio...")

# called when tempo slider value changes
func _on_tempo_changed(value : float) -> void:
	# update pitch for all audio players based on tempo slider
	for i in range(8):
		row_audio_players[i].pitch_scale = global_tempo_slider.value / 100.0
