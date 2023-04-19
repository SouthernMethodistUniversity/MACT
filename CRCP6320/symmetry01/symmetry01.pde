float w=0;
float h=0;

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
  rect(-w/2, -h/2, w, h);
}
