// move mouse around to adjust frequency, timbre and volume
// hold 's' to show sonar map and distance to whale
// the closer the mouse is to the middle of the sonar map, the closer you are to the "whale", and the higher the frequency, timbre and volume


import processing.sound.*;

SoundFile whale;
SoundFile sonar;
SoundFile bubbles;

float volume = 0.5;
float frequency = 440;
float timbre = 0.5;
float whaleVolume = 0.5;


float bubblesVolume = 0.2;
float oscillation = 0.1;
float depthChange = 20;

float sonarAngle = 0;
float sonarSpeed = 0.05;
boolean sonarActive = false;

void setup() {
  size(1600, 800, P3D); // Use P3D renderer for 3D graphics
  
  noStroke();

  sphereDetail(60);
  whale = new SoundFile(this, "whale.wav");
  sonar = new SoundFile(this, "sonar.wav");
  bubbles = new SoundFile(this, "bubbles.wav");
  
  whale.amp(volume);
  whale.loop();
  bubbles.loop();
}

void draw() {
  
  drawEnvironment();
  playSound();

  // Draw radar if active and key press 's'
  if (sonarActive) {
    drawSonar();
    sonarAngle += sonarSpeed; // Adjust the speed of the sonar sweep
    if (sonarAngle > TWO_PI) {
      sonarAngle = 0;
    }
  }
}

void playSound(){
  
  // Calculate distance from the mouse to the center
  float distanceToCenter = dist(mouseX, mouseY, width/2, height/2);

  // Update frequency based on distance to center (https://processing.org/reference/map_.html)
  frequency = map(distanceToCenter, 0, width/2, 1000, 100); // Adjust frequency based on distance to center
  frequency = max(frequency, 1); // Sound library rate must always be positive
  timbre = map(distanceToCenter, 0, width/2, 1, 0); // Adjust timbre based on mouse position (inverted mapping)
  timbre = max(timbre, 1);
  
    // Map the distance to a volume range (e.g., from 0.1 to 1.0)
  whaleVolume = map(distanceToCenter, 0, width / 2, 1.0, 0.1);
  whaleVolume = constrain(whaleVolume, 0.1, 1.0); // Ensure the volume stays within the valid range to not break ears
  
  // Update the whale volume
  whale.amp(whaleVolume);
  
  whale.rate(frequency / 440); // Adjust frequency of whale sound
  
  bubblesVolume = map(mouseY, 0, height, 0.5, 0.1);
  bubbles.amp(bubblesVolume);
}

void drawEnvironment(){
  // Got the idea from (https://processing.org/examples/spot.html)
  background(0); 
  
  // Calculate depth based on mouseY
  float depth = map(mouseY, 0, height, 0, 1);

  // Adjust green component based on depth and oscillation
  float green = map(depth, 0, 1, 255, 0) + sin(oscillation) * depthChange; // Adjust amount of depth change when "floating" in water
  
  drawText();
  
  // Set directional light (https://processing.org/examples/directional.html)
  directionalLight(51, green, 126, 0, -1, 0);
  
  // Adjust size of environment
  translate(width/2, height/2, 0);
  noStroke();
  sphere(1600);
  
  // Adjust the speed of color change when "floating" in water
  oscillation += 0.05;
  
}

void drawSonar() {
  pushMatrix();
  drawWhale();
  stroke(0, 255, 0);
  noFill();
  
  // Draw sonar circles loop inspired by(https://editor.p5js.org/khamiltonuk/sketches/HJB-gc5-V)
  for (int i = 30; i <= 300; i += 30) {
    ellipse(0, 0, i * 2, i * 2);
  }
  
  // Draw middle circle
  ellipse(0, 0, 20, 20);
  
  strokeWeight(3); // Adjust the stroke weight as needed
  line(0, 0, cos(sonarAngle) * 300, sin(sonarAngle) * 300); // Draw sonar line
  
  popMatrix();
  
}

void drawWhale(){
  pushMatrix();
  stroke(255, 0, 0);
    
  // Calculate the position of the green circle based on mouse position
  float mouseXRatio = map(mouseX, width, 0, -1, 1); // Map mouseX inversely to a range from -1 to 1
  float mouseYRatio = map(mouseY, height, 0, -1, 1); // Map mouseY inversely to a range from -1 to 1
  float xPos = 200 * mouseXRatio; // Adjust x position based on mouseXRatio
  float yPos = 200 * mouseYRatio; // Adjust y position based on mouseYRatio
  
  // Draw green circle which represents whale at the adjusted position
  fill(0,255,0);
  ellipse(xPos, yPos, 20, 20);
  popMatrix();
}

void drawText() {
  pushMatrix();
  // Draw text to show sound parameters as we get closer to whale
  fill(255);
  textSize(20);
  text("Frequency: " + nf(frequency, 0, 2), 20, 30);
  text("Timbre: " + nf(timbre, 0, 2), 20, 60);
  text("Whale Volume: " + nf(whaleVolume, 0, 2), 20, 90);

  popMatrix();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    sonar.loop(); //play sonar ping
    sonarActive = true; // Activate sonar
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') {
    sonar.stop(); //stop playing sonar ping
    sonarActive = false; // Deactivate sonar
  }
}
