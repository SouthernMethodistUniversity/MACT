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

  // used to return a normal to the surface
  // not implemented properly
  // PVector getNormal() {
  //  return new PVector();
  //}
  
  void draw(float scale){
    beginShape();
    vertex(v0.x*scale, v0.y*scale, v0.z*scale);
    vertex(v1.x*scale, v1.y*scale, v1.z*scale);
    vertex(v2.x*scale, v2.y*scale, v2.z*scale);
    endShape(CLOSE);
  }
}
