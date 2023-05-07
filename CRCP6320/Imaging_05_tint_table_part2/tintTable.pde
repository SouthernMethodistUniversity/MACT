// varied color tint table
void tintTable(PImage imgSrc, int cols, int rows) {
  imgSrc.loadPixels();

  // create the table
  // distance to step and also new image size, per cell
  float colStep = width/cols;
  float rowStep = height/rows;

  // table structure
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      PImage img = createImage(imgSrc.width, imgSrc.height, ARGB);
      img.loadPixels();
      arrayCopy(imgSrc.pixels, img.pixels);
      float redShift = random(.1, 1.5);
      float greenShift = random(.1, 1.5);
      float blueShift = random(.1, 1.5);
      //pixels per image
      for (int k=0; k<img.pixels.length; k++) {
        float r = red( img.pixels[k]);
        float g = green( img.pixels[k]);
        float b = blue( img.pixels[k]);
        img.pixels[k] = color(r*redShift, g*greenShift, b*blueShift);
      }

      img.resize(int(colStep), int(rowStep));
      img.updatePixels();
      image(img, i*colStep, j*rowStep);
    }
  }
}
