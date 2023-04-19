void setup() {
  size(600, 600);
  background(255);
  //point(300, 300);

  int pointCount = 300;
  float gap = width/(pointCount-1);

  float theta = 0.0;

  for (int i=0; i<pointCount; i++) {
    stroke(random(0, 120), 165);
    strokeWeight(random(1, 15));
    point(gap*i, height/2 + sin(theta)*i*2);
    point(gap*i, height/2 + cos(theta)*i);
    theta += PI/180*10;
  }
}


void draw() {
  
}
