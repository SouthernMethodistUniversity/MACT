// Rubber_Cube_01

// faces = 12
// begin as a unit cube

/* 6------7
  /|     /|
 3-|----2 |
 | |    | |
 | 5----|-4
 |/     |/
 0------1
 */

// the 8 unique vertices in the cube
PVector[] verts = {
  new PVector(-.5, .5, .5), //0
  new PVector(.5, .5, .5), //1
  new PVector(.5, -.5, .5), //2
  new PVector(-.5, -.5, .5), //3
  new PVector(.5, .5, -.5), //4
  new PVector(-.5, .5, -.5), //5
  new PVector(-.5, -.5, -.5), //6
  new PVector(.5, -.5, -.5), //7
};

int[][] inds = {
  {0, 5, 1},
  {1, 5, 4},
  {4, 2, 1},
  {4, 7, 2},
  {6, 7, 5},
  {7, 4, 5},
  {0, 3, 5},
  {5, 3, 6},
  {0, 2, 3},
  {0, 1, 2},
  {3, 7, 6},
  {3, 2, 7}
};

Face3[] faces = new Face3[12];

void setup() {
  size(800, 600, P3D);
  for (int i=0; i< inds.length; i++) {
    faces[i] = new Face3(verts[inds[i][0]], verts[inds[i][1]], verts[inds[i][2]]);
  }
}

void draw() {
  background(125);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/360);
  rotateZ(frameCount*PI/360);
  fill(200);
  noStroke();
  for (int i=0; i< faces.length; i++) {
    faces[i].draw(150);
  }
}
