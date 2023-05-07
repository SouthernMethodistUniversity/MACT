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
  background(255);
  translate(0, sin(frameCount*PI/5)*30);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(p);
  vertex(v0.x, v0.y, 0, 0);
  vertex(v1.x, v1.y, 3.5, 0);
  vertex(v2.x, v2.y, 3.5, 3.5);
  vertex(v3.x, v3.y, 0, 3.5);
  endShape(CLOSE);
}
