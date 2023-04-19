// Create a polygon table of examples
int cols = 20;
int rows = 20;

void setup() {
  size(1900, 1080);
   background(random(255), random(255), random(255));
  float colGap = width/(cols-1);
  float rowGap = height/(rows-1);
 
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      pushMatrix();
      translate(colGap*i, rowGap*j);
      polygon(int(random(3, 30)), random(50, 125), color(random(255), random(255), random(255), random(10, 45)), color(random(255), random(255), random(255), random(30, 155)), random(.5, 2), random(1, 3));
      popMatrix();
    }
  }
}

void draw() {
  //background(255);
}
