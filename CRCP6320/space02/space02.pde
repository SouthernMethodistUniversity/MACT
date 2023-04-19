float w=0;
float h=0;

int bldgCount = 20;
float[] bldgHts = new float[bldgCount];


void setup() {
  size(800, 600);
  w = width/bldgCount;
  h = 50;
  for (int i=0; i<bldgCount; i++) {
    bldgHts[i] = random(10, 150);
  }
}

void draw() {
  background(255);
  // noFill();
  fill(0);
  stroke(100);
  translate(0, height);

  for (int i=0; i<bldgCount; i++) {
    pushMatrix();
    translate(w*i, -h);
    rect(0, 0, w, h);
    popMatrix();
  }
}
