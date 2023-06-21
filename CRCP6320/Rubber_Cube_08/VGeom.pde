class VGeom {

  PVector dim;
  PVector elasticityRange;
  
  // internals
  Tup2i[] contours;

  VGeom() {
  }

  VGeom(PVector dim, PVector elasticityRange) {
    this.dim = dim;
    this.elasticityRange = elasticityRange;
  }
}
