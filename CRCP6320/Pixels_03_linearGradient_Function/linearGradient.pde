void linearGradient(color col1, color col2, float x, float y, int w, int h) {
  img01 = createImage(w, h, RGB);
  img01.loadPixels();

  float r1 = red(col1);
  float r2 = red(col2);

  float g1 = green(col1);
  float g2 = green(col2);

  float b1 = blue(col1);
  float b2 = blue(col2);

  float redDelta = r2-r1;
  float greenDelta = g2-g1;
  float blueDelta = b2-b1;

  float redStep = redDelta/img01.pixels.length;
  float greenStep = greenDelta/img01.pixels.length;
  float blueStep = blueDelta/img01.pixels.length;

  for (int i = 0; i < img01.pixels.length; i++) {
    img01.pixels[i] = color(r1+redStep*i, g1+greenStep*i, b1+blueStep*i);
  }
  img01.updatePixels();

  image(img01, x, y);
}
