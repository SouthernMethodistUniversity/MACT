float w=0;
float h=0;

int bldgCount = 38;
float[] bldgHts = new float[bldgCount];

float[] bldgWDistrortion = new float[bldgCount];


void setup() {
  size(1900, 600);
  w = width/bldgCount;
  h = 50;
  for (int i=0; i<bldgCount; i++) {
    bldgHts[i] = random(170, height/1.5);
    bldgWDistrortion[i] = random(-10, 10);
  }
}

void draw() {
  background(255);
  // noFill();
  fill(0);
  //stroke(100);
  translate(0, height);

  for (int i=0; i<bldgCount; i++) {
    pushMatrix();
    translate(w*i, -bldgHts[i]);
    //rect(0, 0, w, bldgHts[i]);
    beginShape();
    vertex(0, 0);
    vertex(w+bldgWDistrortion[i], 0);
    vertex(w+bldgWDistrortion[i], bldgHts[i]);
    vertex(0, bldgHts[i]);
    endShape();
    popMatrix();
  }
}
