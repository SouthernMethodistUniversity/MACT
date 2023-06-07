PImage p;
float landW = 1000;
float landH = 1000;
int cols = 100;
int rows = 100;
// 2-dimensional array structure
PVector[][] vecs = new PVector[cols][rows];

void setup() {
  size(1200, 1000, P3D);
  p = loadImage("oracle.png");
  float colStep = landW/cols;
  float rowStep = landH/rows;
  float s = 0;
  float t = 0;
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      vecs[i][j] = new PVector(-width/2+i*colStep, -height/2+j*rowStep, 40*(noise(s)-noise(t))); // 20, 30
        s+=.004;
        t+=.001;
    }
  }
}

void draw() {
  background(255);
  stroke(0, 20);
  translate(width/2, height/2);
  rotateX(radians(70));
  for (int i=0; i<cols-1; i++) {
    for (int j=0; j<rows-1; j++) {
      beginShape();
      texture(p);
      vertex(vecs[i][j].x, vecs[i][j].y, vecs[i][j].z, width/2+vecs[i][j].x, height/2+vecs[i][j].y);
      vertex(vecs[i+1][j].x, vecs[i+1][j].y, vecs[i+1][j].z, width/2+vecs[i+1][j].x, height/2+vecs[i+1][j].y);
      vertex(vecs[i+1][j+1].x, vecs[i+1][j+1].y, vecs[i+1][j+1].z, width/2+vecs[i+1][j+1].x, height/2+vecs[i+1][j+1].y);
      vertex(vecs[i][j+1].x, vecs[i][j+1].y, vecs[i][j+1].z, width/2+vecs[i][j+1].x, height/2+vecs[i][j+1].y);
      endShape(CLOSE);
    }
  }
}
