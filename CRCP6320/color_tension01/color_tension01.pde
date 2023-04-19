float w=0;
float h=0;

int bldgCount = 38;
float[] bldgHts = new float[bldgCount];

float[] bldgWDistrortion = new float[bldgCount];
float[] bldgWDistrortion2 = new float[bldgCount];
float distortionFactor = 35;


void setup() {
  size(1900, 600);
  w = width/bldgCount;
  h = 50;
  for (int i=0; i<bldgCount; i++) {
    bldgHts[i] = random(170, height*2);
    bldgWDistrortion[i] = random(-distortionFactor, distortionFactor);
    bldgWDistrortion2[i] = random(-distortionFactor, distortionFactor);
  }
}

void draw() {
  background(255, 127, 0);
  // noFill();
  fill(100, 100, 255);
  noStroke();
  translate(0, height);

  for (int i=0; i<bldgCount; i++) {
    pushMatrix();
    translate(w*i, -bldgHts[i]);
    //rect(0, 0, w, bldgHts[i]);
    beginShape();
    vertex(bldgWDistrortion2[i], 0);
    vertex(w+bldgWDistrortion[i], 0);
    vertex(w+bldgWDistrortion2[i], bldgHts[i]);
    vertex(bldgWDistrortion[i], bldgHts[i]);
    endShape();
    popMatrix();
  }
}
