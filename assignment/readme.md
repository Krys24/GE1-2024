# Project Title

**Holographic Musical Instrument**

Name: Krystian Pakos

Student Number: C20458512

Class Group: TU858/4

Video:

# Description Of The Project

This project implements a holographic musical instrument using Godot. This instrument is emulated as a 8x8 grid that contains buttons. Each row plays a different sound. You can increase/decrease the tempo of each sound and increase/decrease their volume.

# Instructions For Use

1. Launch the application.
2. Use the **Tempo Slider** to adjust playback speed of all rows.
3. Use the **Volume Sliders** to control the volume of each row individually.
4. Press any button in a row to play the audio.
5. Each row has a different sound, there are 8 in total.v
6. Combine tempo, volume, and button presses to create music dynamically.

# How It Works

- **Button Grid**: An 8x8 grid of buttons is created. Each button corresponds to a row and can trigger the audio player associated with that row.
- **Volume Sliders**: Each row has a volume slider that adjusts the volume of its related audio player.
- **Global Tempo Slider**: This slider controls the pitch scale for all rows, allowing for adjusting the tempo and creating unique sounds.
- **Signal Handling**: The system uses Godot's signal framework to handle button presses and slider changes efficiently.
- **Audio Playback**: Each row is linked to an audio stream player, and pressing a button plays the assigned sound for that row.

# List Of Classes/Assets In Project

1. **grid_container.gd**:
   - Handles the initialisation and management of the grid buttons, volume sliders, and audio players.
   - Connects button presses and slider changes to appropriate handlers.
2. **Audio Assets**:
   - Eight audio files, each corresponding to a row, which are played upon pressing a button.
3. **UI Nodes**:
   - **CheckButton**: 64 buttons labeled sequentially for the 8x8 grid.
   - **Volume Sliders**: Eight HSliders for volume control for each row.
   - **Global Tempo Slider**: A single HSlider for tempo adjustments.
4. **Godot Scene Structure**:
   - Parent Node: `GridContainer`
   - Child Nodes: Buttons, sliders, and audio players organised hierarchically.

# References

1. Godot Engine Documentation: [https://docs.godotengine.org/](https://docs.godotengine.org/)
2. Signal Handling in Godot 4: Callable and bind() methods.
3. Audio Playback in Godot: Setting up AudioStreamPlayer nodes.

# What I Am MOST Proud Of In The Assignment

I am most proud of successfully creating a fully interactive instrument where users can have a bit of fun and mess around with different sounds and use it as a sort of soundboard.

# What I Learned

1. Advanced use of **Godot 4**
2. Effective organisation of nodes in the scene tree to keep the project clean.
3. Handling audio playback dynamically using **AudioStreamPlayer** nodes.
4. Debugging and resolving errors related to node connectivity and signal management using print statements as there were some issues during development.
5. Creating a responsive and user-friendly UI in Godot.
