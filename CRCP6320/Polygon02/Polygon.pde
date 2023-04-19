void polygon() {
  // properties of a polygon
  int ptCount = 4;
  float radius = 200;
  color fillCol = color(100, 80, 80);
  color strokeCol= color(80, 100, 80);
  float strokeWt= 15.5;
  
  //println("ptCount = " + ptCount);
  //println("radius = " + radius);
  //println("fillCol-red = " + red(fillCol));
  //println("strokeCol = " + strokeCol);
  //println("strokeWt = " + strokeWt);
  
  // x, y, w, h
  fill(fillCol);
  stroke(strokeCol);
  strokeWeight(strokeWt);
  rect(-radius*2/2, -radius*2/2, radius*2, radius*2);
  
}
