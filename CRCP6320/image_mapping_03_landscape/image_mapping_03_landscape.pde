PImage p;
float landW = 1000;
float landH = 1000;
int cols = 60;
int rows = 60;
// 2-dimensional array structure
PVector[][] vecs = new PVector[cols][rows];

void setup() {
  size(1200, 1200, P3D);
  p = loadImage("oracle.png");
  float colStep = landW/cols;
  float rowStep = landH/rows;
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      vecs[i][j] = new PVector(-width/2+i*colStep, -height/2+j*rowStep, random(10, 30));
    }
  }
}

void draw() {
  background(255);

  //texture(p);
  translate(width/2, height/2);
  rotateX(70*PI/180);
  for (int i=0; i<cols-1; i++) {
    for (int j=0; j<rows-1; j++) {
      beginShape();
      vertex(vecs[i][j].x, vecs[i][j].y, vecs[i][j].z);
      vertex(vecs[i+1][j].x, vecs[i+1][j].y, vecs[i+1][j].z);
      vertex(vecs[i+1][j+1].x, vecs[i+1][j+1].y, vecs[i+1][j+1].z);
      vertex(vecs[i][j+1].x, vecs[i][j+1].y, vecs[i][j+1].z);
      endShape(CLOSE);
    }
  }
}
