/**
 * Euler Integration (v05)
 * simulating materials
 */

int ballCount = 300;
//create the memory for the entire array structure
EulerBall[] balls = new EulerBall[ballCount];

void setup() {
  size(800, 600);
  for (int i=0; i<ballCount; i++) {
    // instantiate the individual ball objects
    balls[i] = new EulerBall(new PVector(random(width), random(20)), new PVector(random(-3, 3), random(-3, 3)), random(2, 10), color(random(255), random(255), random(255)));
    balls[i].setAccel(random(.001, .8));
    balls[i].setDamping(random(.5, .8)); // simulating material properties
    balls[i].setFriction(random(.5, .8)); // simulates ground friction, ground/obj texture
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
