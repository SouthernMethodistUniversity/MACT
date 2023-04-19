void polygon() {
  // properties of a polygon
  int ptCount = 6;
  float radius = 200;
  color fillCol = color(100, 80, 80);
  color strokeCol = color(80, 100, 80);
  float strokeWt = 15.5;
  
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
  float x = cos(theta)*radius;
  float y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/ptCount;
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/ptCount;
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/ptCount;
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/ptCount;
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  theta += TWO_PI/ptCount;
  x = cos(theta)*radius;
  y = sin(theta)*radius;
  vertex(x, y);
  
  // stops recording and draw data to the screen
  endShape(CLOSE);
}
