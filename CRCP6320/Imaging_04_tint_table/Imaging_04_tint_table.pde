// Tint Table example
// creating a table of tinted images
// similar to PhotoShop's variations function
PImage img01;

void setup() {
  size(800, 600);
  background(0);
  img01 = loadImage("wolf.jpg");
  img01.resize(width, height);
  tintTable(img01, 10, 10);
}
