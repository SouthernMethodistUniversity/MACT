class CRCPSphere {

  PVector trans;
  float rad;
  GeomDynamics gd;
  GeomStyle gs;


  CRCPSphere() {
  }

  CRCPSphere(PVector trans, float rad, GeomStyle gs, GeomDynamics gd) {
    this.trans = trans;
    this.rad = rad;
    this.gs = gs;
    this.gd = gd;
  }

  void draw() {
    stroke(gs.strokeCol);
    fill(gs.fillCol);
    noFill();
    strokeWeight(gs.strokeWt);
    pushMatrix();
    translate(trans.x, trans.y, trans.z);
    sphereDetail(4);
    sphere(rad); // leveraging  Processing drawing method
    popMatrix();
  }

  void move() {
    trans.x += gd.spd.x;
    gd.spd.y += gd.gravity;
    trans.y += gd.spd.y;
    trans.z += gd.spd.z;
  }

  void collide(Dim3 dim) {
    // to account for width we would use box.x/2, -box.x/2

    // I could declare the box object locally here for collision (not ideal)
    // right edge collision detection
    if (trans.x >= dim.w/2-rad) {
      gd.spd.x *= -1;
    }

    // left edge collision detection
    else if (trans.x <= -dim.w/2+rad) {
      gd.spd.x *= -1;
    }

    if (trans.y >= dim.h/2-rad) {
      trans.y = dim.h/2-rad; // fake perfection
      gd.spd.y *= -1;
      gd.spd.y *= gd.damping;
      gd.spd.x *= gd.friction;
    } else if (trans.y <= -dim.h/2+rad) {
      trans.y = -dim.h/2+rad; // fake perfection
      gd.spd.y *= -1;
      gd.spd.y *= gd.damping;
      gd.spd.x *= gd.friction;
    }

    // z, depth front
    if (trans.z >= dim.d/2-rad) {
      gd.spd.z *= -1;
    }

    // back collision detection
    else if (trans.z <= -dim.d/2+rad) {
      gd.spd.z *= -1;
    }
  }
}
