// Rubber_Cube_04

VBox box;

void setup() {
  size(800, 600, P3D);
  box = new VBox(200, 200, 200);
  
  // void push(int index, PVector v)
  box.push(0, new PVector(.1, .1, .1));
}

void draw() {
  background(125);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/360);
  rotateZ(frameCount*PI/360);
  fill(200);
  //noStroke();
  box.move();
  
  
  box.draw();
 // box.drawVBalls();
}
