class VStick {

  VBall b0, b1;
  float tension;

  PVector vecOrig;
  float len;

  VStick() {
  }

  VStick(VBall b0, VBall b1, float tension) {
    this.b0 = b0;
    this.b1 = b1;
    this.tension = tension;
    vecOrig  = new PVector(b1.pos.x-b0.pos.x, b1.pos.y-b0.pos.y, b1.pos.z-b0.pos.z);
    len = dist(b0.pos.x, b0.pos.y, b0.pos.z, b1.pos.x, b1.pos.y, b1.pos.z);
  }

  void draw(color _stroke) {
    noFill();
    stroke(_stroke);
    // line(b0.pos.x, b0.pos.y, b0.pos.z, b1.pos.x, b1.pos.y, b1.pos.z);
    beginShape(LINES);
    vertex(b0.pos.x, b0.pos.y, b0.pos.z);
    vertex(b1.pos.x, b1.pos.y, b1.pos.z);
    endShape();
  }

  void constrainLen() {
    PVector delta = new PVector(b1.pos.x-b0.pos.x, b1.pos.y-b0.pos.y, b1.pos.z-b0.pos.z);
    float deltaLength = delta.mag();
    float difference = ((deltaLength - len) / deltaLength);
    b0.pos.x += delta.x * (0.5f * tension * difference);
    b0.pos.y += delta.y * (0.5f * tension * difference);
    b0.pos.z += delta.z * (0.5f * tension * difference);
    b1.pos.x -= delta.x * (0.5f * tension * difference);
    b1.pos.y -= delta.y * (0.5f * tension * difference);
    b1.pos.z -= delta.z * (0.5f * tension * difference);
  }
}
