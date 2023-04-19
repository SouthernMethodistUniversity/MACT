float w=0;
float h=0;
float xNudge=12.5;

void setup(){
  size(800, 600);
  w = width/2;
  h = height/2;
}


void draw(){
  background(255);
  fill(0);
  
  translate(w, h);
  // x, y, w, h
  
  rotate(.4*PI/180);
  rect(-w/2+xNudge, -h/2, w, h);
}
