// 1 idea/construct
// classes are black boxes
// OOP should make things easier
// variables in procedural programming become properties (aka fields) in OOP
// functions in PP become methods in OOP
// classes and objects
// classes often referred to as blueprints or types
// objects are instances of the class
// we create objects/instances based on classes

// create Poly class

class Poly {

  // global properties hard-coded in the class
  float gravity = .03;
  float damping = .75;
  float friction = .8;


  // variables, aka instance propertes
  PVector trans;
  PVector spd;
  int ptCount;
  float rad;
  GeomStyle gs;


  // not critical
  color strokeCol;
  color fillCol;
  float strokeWt;


  // default constructor
  // every class by default has the defualt constructor IF you don't include one.
  // If you included one, the automatic default is hidden.
  // Good pro tip: ALWAYS include the default constructor
  Poly() {
  }

  // overloaded constructors
  // as long as the signatures are unique
  Poly(PVector trans, PVector spd, int ptCount, float rad, GeomStyle gs) {
    this.trans = trans;
    this.spd = spd;
    this.ptCount = ptCount;
    this.rad = rad;
    this.gs = gs;
  }
    
  Poly(PVector trans, PVector spd, int ptCount, float rad, color strokeCol, color fillCol, float strokeWt) {
    this.trans = trans;
    this.spd = spd;
    this.ptCount = ptCount;
    this.rad = rad;
    this.strokeCol = strokeCol;
    this.fillCol = fillCol;
    this.strokeWt = strokeWt;
  }


  void draw(){
    stroke(strokeCol);
    fill(fillCol);
    strokeWeight(strokeWt);

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

    trans.x += spd.x;
    spd.y += gravity;
    trans.y += spd.y;

    // if the polygon hits/reaches/exceeds some boundary, then we need to at least stop it
    // right edge collision detection
    if (trans.x >= width/2-rad) {
      spd.x *= -1;
    }

    // left edge collision detection
    else if (trans.x <= -width/2+rad) {
      spd.x *= -1;
    }

    if (trans.y >= height/2-rad) {
      trans.y = height/2-rad; // fake perfection
      spd.y *= -1;
      spd.y *= damping;
      spd.x *= friction;
    } else if (trans.y <= -height/2+rad) {
      spd.y *= -1;
    }
  }

  // special getters and setters
} // closes the class
