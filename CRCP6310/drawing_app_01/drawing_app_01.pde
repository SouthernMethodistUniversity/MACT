boolean isDrawable = false;
float brushSize = 8;
color col = color(200, 100, 25);

void setup(){
  size(800, 600);
}

void draw(){
  if (isDrawable){
    noStroke();
    fill(col);
    ellipse(mouseX, mouseY, brushSize, brushSize);
  }
}

void mousePressed(){
  isDrawable = true;
}

void mouseReleased(){
   isDrawable = false;
}
