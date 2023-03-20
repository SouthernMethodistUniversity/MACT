float tx = 0.0;
float ty = 0.0;
float spdX = 2.2;
float spdY = -5;
float gravity = .125;
float damping = .75;
float friction = .75;

float polyRad = 25;
void setup(){
  size(800, 600);

}

void draw(){
  background(127);
  translate(width/2, height/2);
  translate(tx, ty);
  
  //void poly(int ptCount, float rad, color strokeCol, color fillCol, float strokeWt){
  poly(7, polyRad, color(255, 127, 100), color(50, 25, 100), 2);
  tx += spdX;
  spdY += gravity;
  ty += spdY;
  
  // if the polygon hits/reaches/exceeds some boundary, then we need to at least stop it
  // right edge collision detection
  if(tx >= width/2-polyRad){
    spdX *= -1;
  }
  
  // left edge collision detection
   else if(tx <= -width/2+polyRad){
    spdX *= -1;
  }
  
  if(ty >= height/2-polyRad){
    ty = height/2-polyRad; // fake perfection
    spdY *= -1;
    spdY *= damping;
    spdX *= friction;
  }
  
  else if(ty <= -height/2+polyRad){
    spdY *= -1;
  }
}
