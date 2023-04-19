void polygon(int ptCount, float radius, color fillCol,  color strokeCol, float strokeWt){
  // properties of a polygon
  //int ptCount = 36;
  //float radius = 200;
  //color fillCol = color(100, 80, 80);
  //color strokeCol = color(80, 100, 80);
  //float strokeWt = 15.5;

  float theta = 0;

  //println("ptCount = " + ptCount);
  //println("radius = " + radius);
  //println("fillCol-red = " + red(fillCol));
  //println("strokeCol = " + strokeCol);
  //println("strokeWt = " + strokeWt);

  // x, y, w, h
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);
  // rect(-radius*2/2, -radius*2/2, radius*2, radius*2);

  // begins recording
  beginShape();
  // data to record
  for (int i=0; i<ptCount; i++) {
    float x = cos(theta)*(radius+random(-50, 50));
    float y = sin(theta)*(radius+random(-50, 50));
    vertex(x, y);
    theta += TWO_PI/ptCount;
  }
  // stops recording and draw data to the screen
  endShape(CLOSE);
}
