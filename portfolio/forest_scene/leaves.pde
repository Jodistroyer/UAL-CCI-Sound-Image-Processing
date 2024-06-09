class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float decay;
  float rotationAmount;
  float colorChange;
  float leafSize;
  float noiseOffsetX;
  float noiseOffsetY;
  float noiseDecayRate;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector();
    lifespan = 255;
    decay = 0.5;
    rotationAmount = random(-50, 50);
    colorChange = random(-50, 50);
    leafSize = random(1, 10);
    noiseOffsetX = random(1000);
    noiseOffsetY = random(1000);
    noiseDecayRate = 0.99; // Initialize decay rate
  }

  void addForce(PVector f) {
    acceleration.add(f);
  }

  boolean expired() {
    return lifespan < 0;
  }

  void update() {
    lifespan -= decay;

    velocity.add(acceleration);
    position.add(velocity);

    if (position.y >= height - 10) { // If the particle hits the bottom
      position.y = height - 10; // Reset particle position to be on the bottom
      velocity.x = 0; // Set the vertical velocity to zero to stop sliding
      noiseOffsetX = 0.01; // Set rotation to almost zero to shop rotating
      noiseOffsetY = 0.01;
    }

    acceleration.mult(0); // Set the acceleration to zero to stop sliding

    // Update noise offsets
    noiseOffsetX += 0.01;
    noiseOffsetY += 0.01;
  }

  void display() {
    pushMatrix();

    translate(position.x + noise(noiseOffsetX) * 10, position.y + noise(noiseOffsetY) * 10);
    noStroke();

    // Make different flower shapes and sizes inspired by (https://p5js.org/examples/hello-p5-simple-shapes.html)
    for (int i = 0; i < 10; i++) {
      fill(200 + colorChange, 10, 168 + colorChange, lifespan);
      ellipse(0, 3 + leafSize, 2 + leafSize, 8 + leafSize);
      rotate(PI/5 + rotationAmount + noise(noiseOffsetX));
    }

    popMatrix();
  }
}
