boolean isDrawable = false;
float brushSize = 15;
color col = color(200, 100, 25);

void setup(){
  size(800, 600);
}

void draw(){
  if (isDrawable){
    noFill();
    stroke(col);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed(){
  isDrawable = true;
}

void mouseReleased(){
   isDrawable = false;
}
