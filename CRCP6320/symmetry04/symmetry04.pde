float w=0;
float h=0;

int rotCount = 190;
float theta = 0;

void setup() {
  size(800, 600);
  w = 300;
  h = 30;
 

  theta = TWO_PI/rotCount;
}

void draw() {
  background(255);
  fill(0);
  translate(width/2, height/2);
  fill(255, 127, 0);
  ellipse(0, 0, 10, 10);

  stroke(0, 127);
  strokeWeight(.5);
  noFill();
  for (int i=0; i<rotCount; i++) {
    rotate(theta);
    rect(0, -h/2, w, h);
  }
}
