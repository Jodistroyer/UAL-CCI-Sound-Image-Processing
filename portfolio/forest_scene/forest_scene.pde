// Leaves fall automatically
// hold w to add wind
// press r to reset sketch

PImage bg;
PVector gravity, wind, strongWind;

ArrayList<Particle> particles;
int lastLeafTime;
int leafInterval = 100; // Interval of leaves falling in milliseconds

void setup() {
  size(626, 417);
  bg = loadImage("cherryBlossom.jpg");

  gravity = new PVector(0, 0.02);
  wind = new PVector(random(-0.002, 0.02), 0);
  strongWind = new PVector(0.1, 0);
  particles = new ArrayList<Particle>();

  // Initialize particles
  for (int i = 0; i < 100; i++) { // Adjust the number of particles as needed
    float randomX = random(width);
    particles.add(new Particle(randomX, random(-10, -30)));
  }
  lastLeafTime = millis();
}

void draw() {
  background(bg);
  
  // draw pink rectangle at the bottom to match flowers
  fill(189, 73, 120);
  rect(0, height - 10, width, 10); 

  // Check if it's time to add a new leaf
  if (millis() - lastLeafTime >= leafInterval) {
    float randomX = random(width);
    particles.add(new Particle(randomX, 10));
    lastLeafTime = millis();
  }

  // Perform operations on particles
  for (Particle p : particles) {
    p.addForce(gravity);
    p.addForce(wind);
    p.update();
    p.display();
  }
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
  if (key == 'w') {
    for (Particle p : particles) {
      p.addForce(strongWind);
    }
    // Decrease leafInterval
    leafInterval -= 200; // Decrease by 100 milliseconds

  }
}

void keyReleased() {
  if (key == 'w') {
    // Reset leafInterval to 300 milliseconds
    leafInterval = 300;
  }
}
