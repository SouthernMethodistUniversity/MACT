// create a custom polygon
// will draw to screen
// return type is void

// x, y
// stroke, fill, strokeWeight
void poly(int ptCount, float rad, color strokeCol, color fillCol, float strokeWt) {
  stroke(strokeCol);
  fill(fillCol);
  strokeWeight(strokeWt);

  float theta = 0.0;
  beginShape(); // begin recording point data
  for (int i=0; i<ptCount; i++) {
    float x = cos(theta)*rad;
    float y = sin(theta)*rad;
    vertex(x, y); // input and store the point data
    theta += TWO_PI/ptCount;
  }

  endShape(CLOSE); // stop reccording and draw to the screen
}
