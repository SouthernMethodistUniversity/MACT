// General Polygon class

class Poly {

  // handles dynamics
  GeomDynamics gd;

  // instance propertes
  PVector trans;
  int ptCount;
  float rad;
  GeomStyle gs;

  // default constructor
  Poly() {
  }

  // overloaded constructor
  Poly(PVector trans, int ptCount, float rad, GeomStyle gs, GeomDynamics gd) {
    this.trans = trans;
    this.ptCount = ptCount;
    this.rad = rad;
    this.gs = gs;
    this.gd = gd;
  }

  // overloaded constructor
  Poly(PVector trans, int ptCount, float rad, color strokeCol, color fillCol, float strokeWt, GeomDynamics gd) {
    this.trans = trans;
    this.ptCount = ptCount;
    this.rad = rad;
    gs = new GeomStyle(strokeCol, fillCol, strokeWt);
    this.gd = gd;
  }


  void draw() {
    stroke(gs.strokeCol);
    fill(gs.fillCol);
    strokeWeight(gs.strokeWt);

    float theta = 0.0;
    pushMatrix();
    translate(trans.x, trans.y);
    beginShape(); // begin recording point data
    for (int i=0; i<ptCount; i++) {
      float x = cos(theta)*rad;
      float y = sin(theta)*rad;
      vertex(x, y); // input and store the point data
      theta += TWO_PI/ptCount;
    }
    endShape(CLOSE); // stop reccording and draw to the screen
    popMatrix();
  }

  // functions aka methods in the classs
  void move() {
    trans.x += gd.spd.x;
    gd.spd.y += gd.gravity;
    trans.y += gd.spd.y;
  }
  
  void collide(Dim3 dim){
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

  // special getters and setters
} // closes the class
