// Pixel Linear Gradient
// between two secondary colors
PImage img01;
// green
color col1 = color(0, 0, 255);
//purple
color col2 = color(255, 127, 0);

void setup() {
  size(800, 600);
  // linearGradient(color col1, color col2, float x, float y, int w, int h)
  linearGradient(col1, col2, 300, 300, 20, 300);
}

void draw() {
  // background(255);
}
