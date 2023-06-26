// Rubber_Cube_10

VBox box;
VRect rect;

void setup() {
  size(1000, 800, P3D);
  box = new VBox(200, 200, 200, new PVector(.001, .008));
  rect = new VRect(200, 200, new PVector(.01, .08));

  int[] inds = {0, 1, 2, 3};
  float vecsMax = 10;
  PVector[] vecs = {
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax)),
    new PVector(random(-vecsMax, vecsMax), random(-vecsMax, vecsMax), random(-vecsMax, vecsMax))
  };
  //box.push(new int[]{0}, new PVector(4.8, 4.8, 4.8));
  //box.push(inds, new PVector(2.8, 2.8, 2.8));
  box.push(inds, vecs);
  rect.push(inds, vecs);
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
  //box.draw(color(200, 80, 135, 200));
  box.drawContour(color(255, 0, 0));
  //box.drawVBalls(color(50, 125, 175));
  //box.drawVSticks(color(255, 255, 0));
  box.constrainBounds(new PVector(600, 600, 600), 7);
  
  
  rect.move();
  //rect.draw(color(125, 200, 75, 100));
  rect.drawContour(color(0, 0, 255));
  //rect.drawVBalls(color(50, 125, 175));
  //rect.drawVSticks(color(255, 255, 0));
  rect.constrainBounds(new PVector(600, 600, 600), 7);
}
