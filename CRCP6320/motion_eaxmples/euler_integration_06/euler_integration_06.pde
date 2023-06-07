/**
 * Euler Integration (v06)
 * Simulating materials
 */

int ballCount = 300;
//create the memory for the entire array structure
EulerBall[] balls = new EulerBall[ballCount];

void setup() {
  size(800, 600);
  for (int i=0; i<ballCount; i++) {
    balls[i] = new EulerBall(new PVector(random(width), random(20)), random(2, 10), color(random(255), random(255), random(255)), new PhysObj(new PVector(random(-3, 3), 0), random(.08, .4), .75, .85));
  }
}

void draw() {
  //background(255);
  fill(255, 100);
  rect(-1, -1, width+2, height+2);
  for (int i=0; i<ballCount; i++) {
    balls[i].move();
    balls[i].render();
    balls[i].boundsCollision();
  }
}
