class CRCPToroid {

  //properties of the toroid
  PVector trans;
  float toroidRad;
  float tubeRad;
  ToroidDetail detail;
  GeomDynamics gd;
  GeomStyle gs;

  // possible storage structures for the
  // vertices that make up the Toroid
  PVector[] vertices;
  PVector[][] vertices2D;
  ArrayList <PVector> verticesAL;

  // convenience variable;
  float rad;
  //int toroidDetail = 40;
  //int tubeDetail = 4;


  CRCPToroid() {
  }

  CRCPToroid(PVector trans, float toroidRad, float tubeRad, ToroidDetail detail) {
    this.trans = trans;
    this.toroidRad = toroidRad;
    rad = toroidRad;
    this.tubeRad = tubeRad;
    this.detail = detail;

    // initialize our collections
    // arrays are structurally immutable, stay the smae size after init
    vertices = new PVector[this.detail.tubeDetail * this.detail.detail];
    vertices2D = new PVector[this.detail.tubeDetail][this.detail.detail];

    // ArrayLists are structurally mutable; they can grow and shrink
    verticesAL = new ArrayList <PVector>();

    initGeom();
  }


  //CRCPToroid(PVector trans, float toroidRad, float tubeRad, GeomDynamics gd, GeomStyle gs) {
  //  this.trans = trans;
  //  this.toroidRad = toroidRad;
  //  rad = toroidRad;
  //  this.tubeRad = tubeRad;
  //  this.gd = gd;
  //  this.gs = gs;

  //  // initialize our collections
  //  // arrays are structurally immutable, stay the smae size after init
  //  vertices = new PVector[tubeDetail * toroidDetail];
  //  vertices2D = new PVector[tubeDetail][toroidDetail];

  //  // ArrayLists are structurally mutable; they can grow and shrink
  //  verticesAL = new ArrayList <PVector>();

  //  initGeom();
  //}

  // helper method. We woudn't want a user of the class
  // to explicitly call this.
  void initGeom() {

    // z-axis rotation expressions
    //x' = x*cos q - y*sin q
    //y' = x*sin q + y*cos q
    //z' = z

    float theta = PI/4.0;

    for (int i=0; i<this.detail.tubeDetail; i ++) {
      float x = rad + cos(theta)*tubeRad;
      float y = sin(theta)*tubeRad;
      float z = 0.0;

      // y-axis rotation expressions
      //z' = z*cos q - x*sin q
      //x' = z*sin q + x*cos q
      //y' = y

      float phi = 0.0;

      for (int j=0; j<this.detail.detail; j ++) {
        float _z = z*cos(phi) - x*sin(phi);
        float _x = z*sin(phi) + x*cos(phi);
        float _y = y;
        // store the points
        int ind = i*this.detail.detail + j;
        PVector v = new PVector(_x, _y, _z);
        vertices[ind] = v;
        vertices2D[i][j] = v;
        verticesAL.add(v);
        phi += TWO_PI/this.detail.detail;
      }
      theta += TWO_PI/this.detail.tubeDetail;
    }
  }

  void draw() {
    //stroke(gs.strokeCol);
    //fill(gs.fillCol);
    noFill();
    stroke(255);
    //strokeWeight(gs.strokeWt);
    pushMatrix();
    translate(trans.x, trans.y, trans.z);
    // missing the drawing geometry
    for (int i=0; i<vertices.length; i++) {
      point(vertices[i].x, vertices[i].y, vertices[i].z);
    }
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
