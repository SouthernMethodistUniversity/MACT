class VRect extends VGeom {

  /*
   3------2
   |      |
   |      |
   |      |
   0------1
   */


  //Tup2i[] contours = {
  //  new Tup2i(0, 1),
  //  new Tup2i(1, 2),
  //  new Tup2i(2, 3),
  //  new Tup2i(3, 0),
  //};

  //Tup2i[] contours;


  // the 8 unique vertices in the cube
  PVector[] verts = new PVector[4];

  // defines triangles making up the geometry
  Tup3i[] inds = {
    new Tup3i(0, 1, 3),
    new Tup3i(1, 2, 3),
  };

  Face3[] faces = new Face3[2];
  VBall[] vbs = new VBall[4];

  // all surface sticks
  ArrayList<VStick> vss = new ArrayList<VStick>();

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



    verts[0] = new PVector(-.5*this.dim.x, .5*this.dim.y); //0
    verts[1] = new PVector(.5*this.dim.x, .5*this.dim.y); //1
    verts[2] = new PVector(.5*this.dim.x, -.5*this.dim.y); //2
    verts[3] = new PVector(-.5*this.dim.x, -.5*this.dim.y); //3

    for (int i=0; i<vbs.length; i++) {
      //PVector pos, float radius
      vbs[i] = new VBall(verts[i], 5);
    }

    create();
  }

  // convenience cstr
  VRect(float w, float h, PVector elasticityRange) {
    this(new PVector(w, h), elasticityRange);
  }

  void create() {
    for (int i=0; i < inds.length; i++) {
      faces[i] = new Face3(verts[inds[i].i0], verts[inds[i].i1], verts[inds[i].i2]);
    }

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

  void push(int index, PVector v) {
    vbs[index].push(v);
  }

  void push(int[] indices, PVector v) {
    for (int i=0; i<indices.length; i++) {
      vbs[ indices[i] ].push(v);
    }
  }

  // requires parallel arrays
  void push(int[] indices, PVector[] vs) {
    for (int i=0; i<indices.length; i++) {
      vbs[ indices[i] ].push(vs[i]);
    }
  }


  void move() {
    for (int i=0; i<vbs.length; i++) {
      vbs[i].verlet();
    }

    for (int i=0; i<vss.size(); i++) {
      vss.get(i).constrainLen();
    }
  }


  void draw(color _fill) {
    noStroke();
    fill(_fill);
    for (int i=0; i< faces.length; i++) {
      faces[i].draw();
    }
  }

  void drawContour(color _stroke) {
    noFill();
    stroke(_stroke);
    beginShape(LINES);
    for (int i=0; i<contours.length; i++) {
      vertex(verts[contours[i].i0].x, verts[contours[i].i0].y, verts[contours[i].i0].z);
      vertex(verts[contours[i].i1].x, verts[contours[i].i1].y, verts[contours[i].i1].z);
    }
    endShape();
  }

  void drawVBalls(color _fill) {
    for (int i=0; i < vbs.length; i++) {
      vbs[i].draw(_fill);
    }
  }

  void drawVSticks(color _stroke) {
    noFill();
    for (int i=0; i < vss.size(); i++) {
      vss.get(i).draw(_stroke);
    }
  }

  void constrainBounds(PVector bounds, float offset) {
    for (int i=0; i<verts.length; i++) {
      if (verts[i].x >= bounds.x/2) {
        verts[i].x = bounds.x/2;
        verts[i].x -= offset;
      } else if (verts[i].x <= -bounds.x/2) {
        verts[i].x = -bounds.x/2;
        verts[i].x += offset;
      }

      if (verts[i].y >= bounds.y/2) {
        verts[i].y = bounds.y/2;
        verts[i].y -= offset;
      } else if (verts[i].y <= -bounds.y/2) {
        verts[i].y = -bounds.y/2;
        verts[i].y += offset;
      }

      if (verts[i].z >= bounds.z/2) {
        verts[i].z = bounds.z/2;
        verts[i].z -= offset;
      } else if (verts[i].z <= -bounds.z/2) {
        verts[i].z = -bounds.z/2;
        verts[i].z += offset;
      }
    }
  }
}
