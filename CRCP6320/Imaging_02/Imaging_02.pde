// Manipulating images01
// recoloring 01
PImage img01;

void setup() {
  size(800, 600);
  background(0);
  img01 = loadImage("wolf.jpg");
  float w = img01.width;
  float ratio = width/w;
  // more acccurate scaling based on image aspect ratio
  float htDelta = height-img01.height*ratio;
  img01.resize(int(img01.width*ratio), int(img01.height*ratio));
  //tint(255, 150, 150);
  img01.loadPixels();
  for (int i=0; i<img01.pixels.length; i++) {
    float r = red( img01.pixels[i]);
    float g = green( img01.pixels[i]);
    float b = blue( img01.pixels[i]);
    img01.pixels[i] = color(r+abs(sin(i*PI/180)*50), g*.1, b*.1);
  }
  img01.updatePixels();
  image(img01, 0, htDelta/2);
}
