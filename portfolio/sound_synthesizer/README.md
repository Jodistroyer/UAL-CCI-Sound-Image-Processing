# Whale Sound and Sonar Simulation
Note: Best with earphones and a dimly lit room!

## Description
This project simulates a whale's sound environment and includes an interactive sonar map. Users can move their mouse around to adjust the frequency, timbre, and volume of whale sounds. Holding the 's' key displays a sonar map and shows the distance to a "whale".

## Requirements
- Processing 4.3 or later.
- Processing Sound library.

## Operation/Usage
1. **Open the project in a Processing environment**. Ensure you have Processing and the Sound library installed on your system.
2. **Place the sound files ("whale.wav", "sonar.wav", "bubbles.wav")** in the same directory as the sketch. These sounds are essential for the simulation.
3. **Run the sketch**. The sketch will launch a window displaying the environment.
4. **Move the mouse around** to adjust the frequency, timbre, and volume of the whale sounds. The closer the mouse is to the center of the screen, the higher the frequency, timbre, and volume.
5. **Hold the 's' key** to display the sonar map and show the distance to the "whale". The closer the mouse is to the center of the sonar map, the closer you are to the "whale".

## How It Works

1. **Sound and Environment Setup**:
   - The `setup()` function initializes the environment, loads sound files, and starts looping the whale and bubbles sounds.
   
2. **Drawing the Environment**:
   - The `draw()` function continuously runs, drawing the environment and updating sound based on mouse position.
   - If the sonar is active (`'s'` key is held), it also draws the sonar map and updates the sonar angle for the sweeping effect.

3. **Sound Manipulation**:
   - The `playSound()` function calculates the distance from the mouse to the center of the window, mapping this distance to sound parameters (frequency, timbre, and volume) and updating the sound playback accordingly.

4. **Drawing Functions**:
   - `drawEnvironment()`: Sets the background and lighting, and draws the environment.
   - `drawSonar()`: Draws the sonar map with circles and a sweeping line.
   - `drawWhale()`: Calculates and draws the position of the "whale" based on the mouse position.
   - `drawText()`: Displays the current sound parameters on the screen.

5. **Interaction**:
   - `keyPressed()` and `keyReleased()` functions handle the activation and deactivation of the sonar when the 's' key is pressed or released.

## Design Decisions
- **Interactive Sound Control**: The position of the mouse controls the frequency, timbre, and volume of the whale sounds, providing an intuitive way to explore different sound characteristics.
- **Sonar Map Visualization**: Holding the 's' key activates a sonar map that visually represents the distance to the "whale", enhancing the interactive experience.
- **Environmental Effects**: Using 3D graphics and lighting, the environment simulates being underwater with changing light and colors based on depth, providing a more immersive experience.

## Process
The hardest part was implementing the sonar map and synchronizing the sound parameters with the mouse position. Understanding how to manipulate sound properties in Processing was crucial. Most solutions were derived from Processing documentation and online resources.

## Authorship
A code project by Wong Jo-Hann

23/24 Computational Practices: Sound and Image Processing

Creative Computing BSc class

UAL CCI University Of the Arts London
