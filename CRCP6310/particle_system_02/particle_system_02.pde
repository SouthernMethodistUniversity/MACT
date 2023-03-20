// CRCP 6310 Introduction to Creative Coding
// Particle System 02
// Ira Greenberg

int columns = 10;
int rows = 10;
final int PART_COUNT = columns*rows;


// controls number polygon points/sides
int[] ptCount = new int[PART_COUNT];
float[][] tx = new float[columns][rows];
float[][] ty = new float[columns][rows];

float[][] spdX = new float[columns][rows];
float[][] spdY = new float[columns][rows];

float gravity = .125;

float[][] damping = new float[columns][rows];
float[][] friction = new float[columns][rows];

float[][] polyRad = new float[columns][rows];

float[][] strokeWt = new float[columns][rows];

// color arrays
color[][] fillCol = new color[columns][rows];
color[][] strokeCol = new color[columns][rows];

float tableW = 400.0;
float tableH = 400.0;
// add gaps sizes between columns and rows
float columnW = tableW / (columns-1);
float rowH = tableH / (rows-1);

void setup() {
  size(800, 800);
  // table particle count  = columns * rows
  //for(int i = 0; i < tx.length; i++){ //alt way
  for (int i = 0, k = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {

      ptCount[k++] = int( random(3, 14) ); // we need to explicitely cast this to an integer, because it is a narrowing conversion

      tx[i][j] = -tableW/2 + columnW*i;
      ty[i][j] = -tableH/2 + rowH*j; // typo

      spdX[i][j] = random(-1.2, 1.2);
      spdY[i][j] = random(-4);

      damping[i][j] = random(.5, .8);
      friction[i][j] = random(.7, .8);
      polyRad[i][j] = random(2, 9);

      strokeWt[i][j] = random(.5, 3);

      fillCol[i][j] = color(random(255), random(25, 75), 100);
      strokeCol[i][j] = color(random(100)*1.25, random(255)*1.25, random(25, 75)*1.25);
    }
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i = 0, k = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      pushMatrix();
      translate(tx[i][j], ty[i][j]);
      //poly(int ptCount, float rad, color strokeCol, color fillCol, float strokeWt)
      poly(ptCount[k++], polyRad[i][j], strokeCol[i][j], fillCol[i][j], strokeWt[i][j]);
      tx[i][j] += spdX[i][j];
      spdY[i][j] += gravity;
      ty[i][j] += spdY[i][j];
     

      // if the polygon hits/reaches/exceeds some boundary, then we need to at least stop it
      // right edge collision detection
      if (tx[i][j] >= width/2-polyRad[i][j]) {
        spdX[i][j] *= -1;
      }

      // left edge collision detection
      else if (tx[i][j] <= -width/2+polyRad[i][j]) {
        spdX[i][j] *= -1;
      }

      if (ty[i][j] >= height/2-polyRad[i][j]) {
        ty[i][j] = height/2-polyRad[i][j]; // fake perfection
        spdY[i][j] *= -1;
        spdY[i][j] *= damping[i][j];
        spdX[i][j] *= friction[i][j];
      } else if (ty[i][j] <= -height/2+polyRad[i][j]) {
        //spdY[i] *= -1;
      }

      popMatrix();
    }
  }
}
