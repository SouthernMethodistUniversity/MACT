float x = 0.0;
float spd = 1.0;

float theta = 0.0;
float amp = 50;
float freq = PI/180 * 15;

void setup() {
  size(600, 600);
  background(255);
}


void draw() {
  //background(255);
  strokeWeight(random(1, 8));
  point(x, height/2 + sin(theta)*amp);
  spd *= 1.01;
  x += spd;
  theta += freq;
}
