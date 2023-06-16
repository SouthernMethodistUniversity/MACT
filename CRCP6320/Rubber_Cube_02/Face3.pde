class Face3 {

  PVector v0;
  PVector v1;
  PVector v2;

  Face3() {
  }

  Face3(PVector v0, PVector v1, PVector v2) {
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;
  }

  void draw(){
    beginShape();
    vertex(v0.x, v0.y, v0.z);
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
    endShape(CLOSE);
  }
}
