// Rubber_Cube_05

VBox box;

void setup() {
  size(800, 600, P3D);
  box = new VBox(200, 200, 200);
  
 // box.push(0, new PVector(.1, .1, .1));
  
//int[] inds = {0, 6};
  box.push(new int[]{0, 6}, new PVector(.8, .8, .8));
 // box.push(inds, new PVector(.8, .8, .8));
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
  box.drawVBalls();
}
