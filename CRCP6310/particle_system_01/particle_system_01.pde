// CRCP 6310 Introduction to Creative Coding
// Particle System 01
// Ira Greenberg


final int PART_COUNT = 500;

// parallel arrays of dynamics properties
int[] ptCount = new int[PART_COUNT];

float[] tx = new float[PART_COUNT];
float[] ty = new float[PART_COUNT];

float[] spdX = new float[PART_COUNT];
float[] spdY = new float[PART_COUNT];

float gravity = .125;

float[] damping = new float[PART_COUNT];
float[] friction = new float[PART_COUNT];

float[] polyRad = new float[PART_COUNT];

float[] strokeWt = new float[PART_COUNT];

// color arrays
color[] fillCol = new color[PART_COUNT];
color[] strokeCol = new color[PART_COUNT];

void setup() {
  size(800, 800);

  //for(int i = 0; i < tx.length; i++){ //alt way
  for (int i = 0; i < PART_COUNT; i++) {
    ptCount[i] = int( random(3, 14) ); // we need to explicitely cast this to an integer, because it is a narrowing conversion

    tx[i] = 0.0;
    ty[i] = 0.0;

    spdX[i] = random(-2.2, 2.2);
    spdY[i] = random(-15);

    damping[i] = random(.4, .9);
    friction[i] = random(.4, .9);
    polyRad[i] = random(2, 9);

    strokeWt[i] = random(.5, 3);

    fillCol[i] = color(random(255), random(25, 75), 100);
    strokeCol[i] = color(random(100)*1.25, random(255)*1.25, random(25, 75)*1.25);
  }
}


void draw() {
  // background(127);
  fill(127, 45);
  rect(-1, -1, width+2, height+2);

  // global translate
  translate(width/2, height/2);

  // for each particle
  for (int i = 0; i < PART_COUNT; i++) {
    pushMatrix();
    translate(tx[i], ty[i]);
    //printMatrix();
    //void poly(int ptCount, float rad, color strokeCol, color fillCol, float strokeWt){
    poly(ptCount[i], polyRad[i], fillCol[i], strokeCol[i], strokeWt[i]);
    tx[i] += spdX[i];
    spdY[i] += gravity;
    ty[i] += spdY[i];

    // if the polygon hits/reaches/exceeds some boundary, then we need to at least stop it
    // right edge collision detection
    if (tx[i] >= width/2-polyRad[i]) {
      spdX[i] *= -1;
    }

    // left edge collision detection
    else if (tx[i] <= -width/2+polyRad[i]) {
      spdX[i] *= -1;
    }

    if (ty[i] >= height/2-polyRad[i]) {
      ty[i] = height/2-polyRad[i]; // fake perfection
      spdY[i] *= -1;
      spdY[i] *= damping[i];
      spdX[i] *= friction[i];
    } else if (ty[i] <= -height/2+polyRad[i]) {
      //spdY[i] *= -1;
    }
    popMatrix();
  }
}
