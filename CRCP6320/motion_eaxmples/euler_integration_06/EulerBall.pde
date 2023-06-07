class EulerBall {

  PVector pos;
  float radius;
  color col;
  PhysObj physObj;

  /// PhysObj(PVector spd, float accel, float damping, float friction)

  EulerBall() {
  }

  EulerBall(PVector pos, float radius, color col, PhysObj physObj) {
    this.pos = pos;
    this.radius = radius;
    this.col = col;
    this.physObj = physObj;
  }

  void move() {
    physObj.spd.y+=physObj.accel;
    pos.add(physObj.spd);
  }

  void render() {
    noStroke();
    fill(this.col);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void boundsCollision() {
    if (pos.x>width-radius) {
      pos.x = width-radius;
      physObj.spd.x *=-1;
    } else if (pos.x<radius) {
      pos.x = radius;
      physObj.spd.x *=-1;
    }

    if (pos.y<radius) {
      pos.y = radius;
      physObj.spd.y *=-1;
    }

    if (pos.y>height-radius) {
      pos.y = height-radius;
      physObj.spd.y *=-1;
      physObj.spd.y*=  physObj.damping;
      physObj.spd.x*=  physObj.friction;
    }
  }

  //void setAccel(float accel) {
  //   physObj.accel = accel;
  //}

  //void setDamping(float damp) {
  //   physObj.damping = damp;
  //}

  //void setFriction(float fric) {
  //  physObj.friction = fric;
  //}
}
