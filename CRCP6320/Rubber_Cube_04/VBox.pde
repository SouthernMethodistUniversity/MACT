class VBox {

  /*
     6------7
    /|     /|
   3-|----2 |
   | |    | |
   | 5----|-4
   |/     |/
   0------1
   */

  PVector dim;

  // the 8 unique vertices in the cube
  PVector[] verts = new PVector[8];

  Tupi[] inds = {
    new Tupi(0, 5, 1),
    new Tupi(1, 5, 4),
    new Tupi(4, 2, 1),
    new Tupi(4, 7, 2),
    new Tupi(6, 7, 5),
    new Tupi(7, 4, 5),
    new Tupi(0, 3, 5),
    new Tupi(5, 3, 6),
    new Tupi(0, 2, 3),
    new Tupi(0, 1, 2),
    new Tupi(3, 7, 6),
    new Tupi(3, 2, 7)
  };

  Face3[] faces = new Face3[12];
  
  VBall[] vbs = new VBall[8];


  VBox() {
  }

  VBox(PVector dim) {
    this.dim = dim;
  
    verts[0] = new PVector(-.5*this.dim.x, .5*this.dim.y, .5*this.dim.z); //0
    verts[1] = new PVector(.5*this.dim.x, .5*this.dim.y, .5*this.dim.z); //1
    verts[2] = new PVector(.5*this.dim.x, -.5*this.dim.y, .5*this.dim.z); //2
    verts[3] = new PVector(-.5*this.dim.x, -.5*this.dim.y, .5*this.dim.z); //3
    verts[4] = new PVector(.5*this.dim.x, .5*this.dim.y, -.5*this.dim.z); //4
    verts[5] = new PVector(-.5*this.dim.x, .5*this.dim.y, -.5*this.dim.z); //5
    verts[6] = new PVector(-.5*this.dim.x, -.5*this.dim.y, -.5*this.dim.z); //6
    verts[7] = new PVector(.5*this.dim.x, -.5*this.dim.y, -.5*this.dim.z); //7
    
    for(int i=0; i<vbs.length; i++){
      //PVector pos, float radius
      vbs[i] = new VBall(verts[i], 5);
    }
  
    create();
  }

  // convenience cstr
  VBox(float w, float h, float d) {
    this(new PVector(w, h, d));
  }

  void create() {
    for (int i=0; i< inds.length; i++) {
      faces[i] = new Face3(verts[inds[i].i0], verts[inds[i].i1], verts[inds[i].i2]);
    }
  }
  
  void push(int index, PVector v){
    vbs[index].push(v);
  }


 void move(){
   for(int i=0; i<vbs.length; i++){
      //PVector pos, float radius
      vbs[i].verlet();
    }
 }
 
 
 void draw() {
    for (int i=0; i< faces.length; i++) {
      faces[i].draw();
    }
  }
  
  void drawVBalls() {
    for (int i=0; i< vbs.length; i++) {
      vbs[i].draw();
    }
  }
  
}
