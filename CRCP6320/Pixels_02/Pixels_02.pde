// gradient example
// between two secondary colors
PImage img01;
// green
 color col1 = color(127, 185, 150);
//purple
color col2 = color(50, 15, 65);

// psuedo code
// colDelta = col2-col1
// amount to shift the pixel = colDelta/pixelCount

void setup() {
  size(800, 600);
  img01 = createImage(600, 400, RGB);
  img01.loadPixels();
  
  for (int i = 0; i < img01.pixels.length; i++) {
    img01.pixels[i] = color(random(255), random(255), random(255));
  }
  img01.updatePixels();
  image(img01, 100, 100);
}

void draw() {
 // background(255);
}
