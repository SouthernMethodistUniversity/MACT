// Rubber_Cube_02

VBox vb0;

void setup() {
  size(800, 600, P3D);
  vb0 = new VBox(200, 200, 200);
}

void draw() {
  background(125);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/360);
  rotateZ(frameCount*PI/360);
  fill(200);
  //noStroke();
  
  vb0.draw();
}
