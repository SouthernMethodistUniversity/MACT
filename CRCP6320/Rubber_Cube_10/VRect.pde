class VRect extends VGeom {

  /*
   3------2
   |      |
   |      |
   |      |
   0------1
   */

  VRect() {
  }

  VRect(PVector dim, PVector elasticityRange) {
    //this.dim = dim;
    //this.elasticityRange = elasticityRange;
    // the call to the super class constructor
    // ALWAYS happens 1st!!
    super(dim, elasticityRange);

    contours = new Tup2i[4];
    contours[0] = new Tup2i(0, 1);
    contours[1] = new Tup2i(1, 2);
    contours[2] = new Tup2i(2, 3);
    contours[3] = new Tup2i(3, 0);

    verts = new PVector[4];
    verts[0] = new PVector(-.5*this.dim.x, .5*this.dim.y); //0
    verts[1] = new PVector(.5*this.dim.x, .5*this.dim.y); //1
    verts[2] = new PVector(.5*this.dim.x, -.5*this.dim.y); //2
    verts[3] = new PVector(-.5*this.dim.x, -.5*this.dim.y); //3

    inds = new Tup3i[2];
    inds[0] = new Tup3i(0, 1, 3);
    inds[1] = new Tup3i(1, 2, 3);

    faces = new Face3[2];
    vbs = new VBall[4];

    createVBalls();

    create();
  }

  // convenience cstr
  VRect(float w, float h, PVector elasticityRange) {
    this(new PVector(w, h), elasticityRange);
  }

  void create() {
    createFaces();
    createVSticks();
  }

  void createVSticks() {
    // this is creating the VSticks
    for (int i=0; i<vbs.length; i++) {
      if (i < vbs.length-1) {
        vss.add(new VStick(vbs[i], vbs[i+1], random(elasticityRange.x, elasticityRange.y)));
      } else {
        vss.add(new VStick(vbs[i], vbs[0], random(elasticityRange.x, elasticityRange.y)));
      }
    }
    // manually add VStick cross-supports
    vss.add(new VStick(vbs[0], vbs[2], 1));
    vss.add(new VStick(vbs[1], vbs[3], 1));
  }
}
