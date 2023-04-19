void polygon(int ptCount, float radius, color fillCol,  color strokeCol, float strokeWt, float randFeature){

  float theta = 0;

  // x, y, w, h
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);

  beginShape();
  for (int i=0; i<ptCount; i++) {
    float x = cos(theta)*(radius+random(-randFeature, randFeature));
    float y = sin(theta)*(radius+random(-randFeature, randFeature));
    vertex(x, y);
    theta += TWO_PI/ptCount;
  }
  endShape(CLOSE);
}
