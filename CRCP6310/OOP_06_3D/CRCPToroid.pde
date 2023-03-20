class CRCPToroid {

  //properties of the toroid
  PVector trans;
  float toroidRad;
  float tubeRad;
  GeomDynamics gd;
  GeomStyle gs;

  // possible storage structures for the
  // vertices that make up the Toroid
  PVector[] vertices;
  PVector[][] vertices2D;
  ArrayList <PVector> verticesAL;

  // convenience variable;
  float rad;
  int toroidDetail = 16;
  int tubeDetail = 12;


  CRCPToroid() {
  }

  CRCPToroid(PVector trans, float toroidRad, float tubeRad, GeomDynamics gd, GeomStyle gs) {
    this.trans = trans;
    this.toroidRad = toroidRad;
    rad = toroidRad;
    this.tubeRad = tubeRad;
    this.gd = gd;
    this.gs = gs;

    // initialize our collections
    // arrays are structurally immutable, stay the smae size after init
    PVector[] vertices = new PVector[toroidDetail * tubeDetail];
    PVector[][] vertices2D = new PVector[toroidDetail][tubeDetail];

    // ArrayLists are structurally mutable; they can grow and shrink
    ArrayList <PVector> verticesAL = new ArrayList <PVector>();

    initGeom();
  }

  // helper method. We woudn't want a user of the class
  // to explicitly call this.
  void initGeom() {

    // z-axis rotation expressions
    //x' = x*cos q - y*sin q
    //y' = x*sin q + y*cos q
    //z' = z

    float theta = 0.0;
    for (int i=0; i<tubeDetail; i ++) {
      float x = cos(theta) - sin(theta);
      float y = x*sin(theta) + y*cos(theta);
      float z = 0.0;
    }

    // y-axis rotation expressions
    //z' = z*cos q - x*sin q
    //x' = z*sin q + x*cos q
    //y' = y
  }

  void draw() {
    stroke(gs.strokeCol);
    fill(gs.fillCol);
    noFill();
    strokeWeight(gs.strokeWt);
    pushMatrix();
    translate(trans.x, trans.y, trans.z);
    // missing the drawing geometry

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
