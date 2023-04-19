void setup() {
  size(600, 600);
  background(255);
  //point(300, 300);
  
  int pointCount = 300;
  float gap = width/(pointCount-1);
  for(int i=0; i<pointCount; i++){
    stroke(random(0, 120), 165);
    strokeWeight(random(1, 15));
    point(gap*i + (i*i), height/2 + random(-10, 10) );
  }
}


void draw() {
}
