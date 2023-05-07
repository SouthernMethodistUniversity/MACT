// varied color tint table
void tintTable(PImage img, int cols, int rows) {
 img01.loadPixels();

  // create the table
  float colStep = width/cols;
  float rowStep = height/rows;
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
     
      
      for (int k=0; k<img01.pixels.length; k++) {
        float r = red( img01.pixels[k]);
        float g = green( img01.pixels[k]);
        float b = blue( img01.pixels[k]);
        img01.pixels[k] = color(r+abs(sin(k*PI/180)*50), g*.1, b*.1);
      }
      
      img01.updatePixels();
      image(img01, 0, htDelta/2);
    }
  }
}
