// Rubber_Cube_06

VBox box;

void setup() {
  size(1000, 800, P3D);
  box = new VBox(200, 200, 200, new PVector(.01, .08));

  int[] inds = {0, 2, 4, 6};
  float vecsMax = 5;
  PVector[] vecs = {
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax))
  };
  //box.push(new int[]{0}, new PVector(4.8, 4.8, 4.8));
  //box.push(inds, new PVector(2.8, 2.8, 2.8));
  box.push(inds, vecs);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2, -150);
  rotateY(frameCount*PI/1360);
  rotateZ(frameCount*PI/1360);
  noFill();
  stroke(255, 75);
  box(600);

  box.move();
 // box.draw(color(100, 80, 135, 100));
  box.drawContour(color(255, 0, 0));
  box.drawVBalls(color(50, 125, 175));
 // box.drawVSticks(color(255, 255, 0));
  box.constrainBounds(new PVector(600, 600, 600), 7);
}
