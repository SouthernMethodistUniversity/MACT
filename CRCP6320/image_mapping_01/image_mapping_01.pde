PImage p;

PVector v0, v1, v2, v3;

void setup() {
  size(1200, 1200, P3D);
  p = loadImage("oracle.png");
  v0 = new PVector(0, 0);
  v1 = new PVector(p.width, 0);
  v2 = new PVector(p.width, p.height);
  v3 = new PVector(0, p.height);
}

void draw() {
  // image(p, 0,0);
  beginShape();
  texture(p);
  vertex(v0.x, v0.y, 0, 0);
  vertex(v1.x, v1.y, p.width, 0);
  vertex(v2.x, v2.y, p.width, p.height);
  vertex(v3.x, v3.y, 0, p.height);
  endShape(CLOSE);
}
