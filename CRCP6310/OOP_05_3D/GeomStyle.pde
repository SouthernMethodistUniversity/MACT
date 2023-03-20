// encapsulates style aspects of custom geometry
class GeomStyle {

  // instance props
  color strokeCol;
  color fillCol;
  float strokeWt;

  // default cstr
  GeomStyle() {
  }
  
  // overloaded cstr
  GeomStyle (color strokeCol, color fillCol, float strokeWt) {
    this.strokeCol = strokeCol;
    this.fillCol = fillCol;
    this.strokeWt = strokeWt;
  }
  
}
