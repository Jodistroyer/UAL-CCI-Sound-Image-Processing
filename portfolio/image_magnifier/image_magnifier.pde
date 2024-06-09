PImage img;
PGraphics mask;
PGraphics magnifierRing;

int magnifySize = 80; // Size of the magnifier area
float scaleFactor = 2; // Scale factor for magnification

// Define minimum and maximum scale factors for zooming in and out
float minScaleFactor = 2;
float maxScaleFactor = 4;


void setup() {
  size(800, 800, P2D);
  img = loadImage("image.jpg");
  imageMode(CENTER);
  
  // Initialize masks
  mask = createGraphics(img.width, img.height, P2D);
  magnifierRing = createGraphics(width, height, P2D); 
  
}

void draw() {
  background(img);
  magnifier();
    
  // Calculate the zoom level as a percentage out of 100
  int zoomLevel = int(map(scaleFactor, minScaleFactor, maxScaleFactor, 0, 100));
  fill(0);
  textSize(16);
  text("Zoom Level: " + zoomLevel + "%", 10, 20);
  
}

void magnifier(){
  
  //Divide magnifySize by scaleFactor to maintain size of magnifier when zooming in and out
  float scaledCircleSize = magnifySize / scaleFactor;
  
  // Apply circular mask
  // From Tom Armitage's Week 4 - Filtering Images [4 March] Lecture (Timestamp= 53:26)(https://ual.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=78ae5bad-9508-4b48-84d2-b12801071743&start=3206.13)
  mask.beginDraw();
  mask.background(img);
  mask.noFill();
  mask.circle(mouseX, mouseY, scaledCircleSize + 10); // https://processing.org/reference/circle_.html
  mask.endDraw();
  
  // pushMatrix() saves the current drawing state (https://processing.org/reference/pushMatrix_.html)
  pushMatrix();
   
  // Ensures that magnifier follows mouse (https://processing.org/reference/translate_.html)
  translate(mouseX, mouseY);
  
  // Scale the image to the desired magnification size (https://processing.org/reference/scale_.html)
  scale(scaleFactor);
  
  // Go through all pixels of x and y of magnified area and draw them as enlarged rect pixels like Tom's example
  for (int i = -magnifySize; i < magnifySize; i++) {
    for (int j = -magnifySize; j < magnifySize; j++) {
      float distance = dist(0, 0, i, j);
      if (distance < magnifySize / scaleFactor ) {
        int x = mouseX + i;
        int y = mouseY + j;
        color c = img.get(x, y);
        fill(c);
        noStroke();
        rect(i, j, scaleFactor, scaleFactor);
      }
    }
  }
  
  popMatrix();
  displayMagnificationRing();
  
}

void displayMagnificationRing() {
  magnifierRing.beginDraw();
  magnifierRing.clear();
  magnifierRing.noFill();
  magnifierRing.stroke(0);
  magnifierRing.strokeWeight(20);
  magnifierRing.circle(width/2, height/2, magnifySize * 2.2);
  magnifierRing.endDraw();
  image(magnifierRing, mouseX, mouseY);
}

void zoomIn() {
  scaleFactor *= 1.1;
  scaleFactor = constrain(scaleFactor, minScaleFactor, maxScaleFactor);
}

void zoomOut() {
  scaleFactor *= 0.9;
  scaleFactor = constrain(scaleFactor, minScaleFactor, maxScaleFactor);
}

void mouseWheel(MouseEvent event) {
  if (event.getCount() > 0) {
    zoomIn(); // Zoom in when scrolling up
  } else {
    zoomOut(); // Zoom out when scrolling down
  }
}
