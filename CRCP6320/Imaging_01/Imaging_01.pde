// Manipulating images01
PImage img01;

void setup() {
  size(800, 600);
  img01 = loadImage("wolf.jpg");
  float w = img01.width;
  float ratio = width/w;
  img01.resize(width, height);
  
  image(img01, 0, 0);
}
