float x = 0.0;
float y = 0.0;
float spd = 1.0;

float theta = 0.0;
float amp = 100;
float freq = PI/180;

float w = 0;
float h = 0;

void setup() {
  size(600, 600);
  background(255);
}


void draw() {
  background(255);
  //strokeWeight(random(1, 8));
  h = w = abs(sin(theta)*amp);
  rect(width/2-w/2, height/2-h/2, w+50, h+50);
  theta += freq;
}
