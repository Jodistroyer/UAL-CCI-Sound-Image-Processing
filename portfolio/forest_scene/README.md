# Falling Leaves Simulation

## Description
This project simulates falling leaves using the Processing environment. Leaves fall automatically due to gravity, and wind can be added by holding the 'w' key. The simulation can be reset by pressing the 'r' key. Each leaf is rendered with varying shapes and sizes, and its movement is influenced by noise for a more natural appearance.

## Requirements
- Written in Processing 4.3
- No special libraries required.

## Operation/Usage
1. **Open the project in a Processing environment**. Ensure you have Processing installed on your system.
2. **Place an image file named "cherryBlossom.jpg"** in the same directory as the sketch. This image will be used as the background for the simulation.
3. **Run the sketch**. The sketch will launch a window displaying the background image and falling leaves.
4. **Hold the 'w' key** to add wind and increase the rate of falling leaves.
5. **Press the 'r' key** to reset the simulation.

## How It Works

1. **Setup Function:**
    - The `setup()` function initializes the sketch, setting the canvas size and loading the background image.
    - Gravity and wind forces are defined using `PVector`.
    - An array list `particles` is initialized to store the leaves.
    - The initial leaves are created and added to the `particles` array.

2. **Draw Function:**
    - The `draw()` function continuously executes, rendering the background and updating the position of each leaf.
    - A pink rectangle is drawn at the bottom of the screen to match the color of the flowers.
    - New leaves are added at intervals defined by `leafInterval`.
    - Each leaf (particle) is updated with gravity and wind forces, and then displayed.

3. **Key Press Events:**
    - When the 'r' key is pressed, the `setup()` function is called to reset the simulation.
    - Holding the 'w' key decreases the `leafInterval`, increasing the rate of leaf generation.
    - Releasing the 'w' key resets the `leafInterval` to its original value.

4. **Particle Class:**
    - Each leaf is an instance of the `Particle` class, which contains properties for position, velocity, acceleration, lifespan, decay, rotation, color change, and size.
    - The `update()` method updates the leaf's position and handles interactions with the bottom of the screen.
    - The `display()` method renders the leaf using ellipses and rotation to create a flower-like appearance, with noise applied to its position for a natural effect.

## Design Decisions

- **Background Image:** The background image of cherry blossoms sets the scene for the falling leaves.
- **Particle System:** Leaves are represented as particles, each influenced by gravity and wind.
- **Wind Effect:** The wind effect is controlled by the user, providing interactivity.
- **Reset Functionality:** Users can reset the simulation at any time, allowing for repeated observations of the leaf falling pattern.
- **Natural Motion:** Perlin Noise is used to create more natural and varied motion in the falling leaves.

## Process
The most challenging part was likely the implementation of the particle system and the handling of forces acting on each leaf. However, guidance from the Processing documentation and examples helped in solving these challenges.

## Authorship
A code project by Wong Jo-Hann

23/24 Computational Practices: Sound and Image Processing

Creative Computing BSc class

UAL CCI University Of the Arts London