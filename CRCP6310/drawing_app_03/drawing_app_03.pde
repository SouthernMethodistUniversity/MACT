import controlP5.*;

boolean isDrawable = false;
float brushSize = 2;
color col = color(200, 100, 25);

ControlP5 cp5;
int myColor = color(0, 0, 0);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

color[] colors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(0, 85, 0),
  color(255, 127, 0),
  color(255, 255, 0),
  color(255, 0, 255),
  color(255, 0, 127),
  color(127, 0, 255),
  color(127, 0, 127),
  color(0),
  color(75),
  color(145),
  color(75, 93, 125),
  color(127, 200, 1170),
};

String[] colorNames = new String[colors.length];

// grouping of controlP5 buttons
// as color palette selector
PVector colorBox = new PVector(60, 100);

void setup() {
  size(800, 600);
  background(200);

  cp5 = new ControlP5(this);

  // brush size slider
  cp5.addSlider("brushSize")
    .setPosition(width-60, 40)
    .setSize(20, 100)
    .setRange(1, 20)
    .showTickMarks(false)
    .setValue(5)
    ;

  for (int i=0; i<colors.length; i++) {
    colorNames[i] = new String("c"+i);
  }

  int buttonW = 35;
  int buttonH = 35;
  for (int i=0; i<3; i++) {
    for (int j=0; j<5; j++) {
      int k = i*5 +j;
      cp5.addButton(colorNames[k])
        .setPosition(width-100+buttonW*i, 200+buttonH*j)
        .setSize(buttonW, buttonH)
        .setColorBackground(colors[k])
        .setColorLabel(colors[k])
        .setValue(k)
        .updateSize()
        .activateBy(ControlP5.RELEASE);
      k++;
    }
  }
  // color buttons
}

void draw() {
  //background(127);
  fill(50);
  noStroke();
  rect(width-100, 0, 100, height);
  if (isDrawable) {
    stroke(col);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

public void controlEvent(ControlEvent theEvent) {
  col = colors[int(theEvent.getValue())];
}

void mousePressed() {
  isDrawable = true;
}

void mouseReleased() {
  isDrawable = false;
}
