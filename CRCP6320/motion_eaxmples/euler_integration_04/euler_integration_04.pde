/**
 * Euler Integration (v04)
 * Pos  +=  spd 
 */

int ballCount = 300;
//create the memory for the entire array structure
EulerBall[] balls = new EulerBall[ballCount];

void setup() {
  size(400, 400);
  for (int i=0; i<ballCount; i++) {
    // instantiate the individual ball objects
    balls[i] = new EulerBall(new PVector(random(width), random(20)), new PVector(random(-3, 3), random(-3, 3)), random(2, 10), color(random(255), random(255), random(255)));
    balls[i].setAccel(random(.001, .8));
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
