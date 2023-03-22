void setup() {
  size(600, 600);
  background(255);
  //point(300, 300);
  strokeWeight(4);
  //point(100, height/2);
  //point(200, height/2);
  //point(300, height/2);
  //point(400, height/2);
  //point(500, height/2);
  int pointCount = 20;
  float gap = width/pointCount;
  for(int i=0; i<pointCount; i++){
    point(gap*i, height/2);
  }
}


void draw() {
}
