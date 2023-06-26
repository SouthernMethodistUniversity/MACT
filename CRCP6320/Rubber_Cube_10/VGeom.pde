class VGeom {

  PVector dim;
  PVector elasticityRange;

  // internals
  Tup2i[] contours;
  PVector[] verts;
  Tup3i[] inds;
  Face3[] faces;
  VBall[] vbs;
  ArrayList<VStick> vss = new ArrayList<VStick>();

  VGeom() {
  }

  VGeom(PVector dim, PVector elasticityRange) {
    this.dim = dim;
    this.elasticityRange = elasticityRange;
  }

  void createVBalls() {
    for (int i=0; i<vbs.length; i++) {
      vbs[i] = new VBall(verts[i], 5);
    }
  }

  void createFaces() {
    for (int i=0; i < inds.length; i++) {
      faces[i] = new Face3(verts[inds[i].i0], verts[inds[i].i1], verts[inds[i].i2]);
    }
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
