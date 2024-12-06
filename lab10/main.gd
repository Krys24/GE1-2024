extends Node

@onready var generate_button = $GenerateButton
@onready var status_label = $StatusLabel
@onready var audio_player = $AudioStreamPlayer

func _ready():
	# connect button to generate music
	generate_button.pressed.connect(_generate_music)
	status_label.text = "Ready to generate music."

func _generate_music():
	status_label.text = "Generating music..."
	var audio = generate_procedural_music()
	if audio:
		status_label.text = "Playing generated music!"
	else:
		status_label.text = "Failed to generate music."

func generate_procedural_music() -> AudioStreamGenerator:
	# create new audio generator
	var generator = AudioStreamGenerator.new()
	generator.mix_rate = 44100  # audio sample rate

	# assign generator to AudioStreamPlayer
	audio_player.stream = generator

	# start player to activate playback
	audio_player.play()

	# get playback object
	var playback = audio_player.get_stream_playback() as AudioStreamGeneratorPlayback
	if playback == null:
		return null

	# generate tones 
	var length = 2.0  # Music duration in seconds
	var sample_rate = generator.mix_rate
	var samples = int(length * sample_rate)
	var frequency = 440.0  # A4 note frequency 

	# create buffer to hold generated samples
	var buffer = PackedVector2Array()

	for i in range(samples):
		# generate sine wave 
		var sample = sin(2.0 * PI * frequency * (i / sample_rate))
		buffer.append(Vector2(sample, sample))  # append stereo to buffer

		# push buffer in chunks 
		if buffer.size() >= 512:  # push every 512 samples
			playback.push_buffer(buffer)
			buffer.clear()

	# push any remaining samples
	if buffer.size() > 0:
		playback.push_buffer(buffer)

	return generator
