class VTetrahedron extends VGeom {

  /*
     6------7
    /|     /|
   3-|----2 |
   | |    | |
   | 5----|-4
   |/     |/
   0------1
   */

  // all surface sticks
  //ArrayList<VStick> vss = new ArrayList<VStick>();

  VTetrahedron() {
  }

  VTetrahedron(PVector dim, PVector elasticityRange) {
    //this.dim = dim;
    //this.elasticityRange = elasticityRange;
    super(dim, elasticityRange);

    contours = new Tup2i[12];
    contours[0] = new Tup2i(0, 1);
    contours[1] = new Tup2i(1, 2);
    contours[2] = new Tup2i(2, 3);
    contours[3] = new Tup2i(3, 0);
    contours[4] = new Tup2i(6, 7);
    contours[5] = new Tup2i(7, 4);
    contours[6] = new Tup2i(4, 5);
    contours[7] = new Tup2i(5, 6);
    contours[8] = new Tup2i(0, 5);
    contours[9] = new Tup2i(1, 4);
    contours[10] = new Tup2i(2, 7);
    contours[11] = new Tup2i(3, 6);


    verts = new PVector[8];
    verts[0] = new PVector(-.5*this.dim.x, .5*this.dim.y, .5*this.dim.z); //0
    verts[1] = new PVector(.5*this.dim.x, .5*this.dim.y, .5*this.dim.z); //1
    verts[2] = new PVector(.5*this.dim.x, -.5*this.dim.y, .5*this.dim.z); //2
    verts[3] = new PVector(-.5*this.dim.x, -.5*this.dim.y, .5*this.dim.z); //3
    verts[4] = new PVector(.5*this.dim.x, .5*this.dim.y, -.5*this.dim.z); //4
    verts[5] = new PVector(-.5*this.dim.x, .5*this.dim.y, -.5*this.dim.z); //5
    verts[6] = new PVector(-.5*this.dim.x, -.5*this.dim.y, -.5*this.dim.z); //6
    verts[7] = new PVector(.5*this.dim.x, -.5*this.dim.y, -.5*this.dim.z); //7

    inds = new  Tup3i[12];
    inds[0] = new Tup3i(0, 5, 1);
    inds[1] = new Tup3i(1, 5, 4);
    inds[2] = new Tup3i(4, 2, 1);
    inds[3] = new Tup3i(4, 7, 2);
    inds[4] = new Tup3i(6, 7, 5);
    inds[5] = new Tup3i(7, 4, 5);
    inds[6] = new Tup3i(0, 3, 5);
    inds[7] = new Tup3i(5, 3, 6);
    inds[8] = new Tup3i(0, 2, 3);
    inds[9] = new Tup3i(0, 1, 2);
    inds[10] = new Tup3i(3, 7, 6);
    inds[11] = new Tup3i(3, 2, 7);

    faces = new Face3[12];
    vbs = new VBall[8];

    createVBalls();

    create();
  }

  // convenience cstr
  VTetrahedron(float w, float h, float d, PVector elasticityRange) {
    this(new PVector(w, h, d), elasticityRange);
  }

  void create() {
    createFaces();
    createVSticks();
  }

  void createVSticks() {
    for (int i=0; i<vbs.length; i++) {
      for (int j=i; j<vbs.length-1; j++) {
        vss.add(new VStick(vbs[i], vbs[j+1], random(elasticityRange.x, elasticityRange.y)));
      }
    }
  }
}
