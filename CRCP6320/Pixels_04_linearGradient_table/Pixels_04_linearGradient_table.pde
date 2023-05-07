// Pixel Linear Gradient
// between two secondary colors
PImage img01;
// green
//color col1 = color(0, 0, 255);
////purple
//color col2 = color(255, 127, 0);

//table data
float tableX = 20;
float tableY = 50;
float tableW = 500;
float tableH = 500;
int tableCols = 10;
int tableRows = 10;


void setup() {
  size(800, 600);

  float colStep = tableW/tableCols;
  float rowStep = tableH/tableRows;
  for (int i=0; i<tableCols; i++) {
    for (int j=0; j<tableRows; j++) {
      color col1 = color(random(255), random(255), random(255));
      color col2 = color(random(255), random(255), random(255));
      float x = colStep*i;
      float y = rowStep*j;
      int w = int(colStep);
      int h = int(rowStep);
      linearGradient(col1, col2, tableX+x, tableY+ y, w, h);
    }
  }
}

void draw() {
  // background(255);
}
