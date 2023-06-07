void toroid(float sizeX, float sizeY) {

  float ellipseRadius = sizeY*.2;
  float toroidRadius = sizeX*.2;
  float ang = 0, ang2 = 0, ang3 = 0;
  float ellipseDetail = 10;
  float toroidDetail = 20;
  float initCoords[][] = new float[3][int(ellipseDetail)+1];
  float[]px = new float[int(ellipseDetail)+1];
  float[]py = new float[int(ellipseDetail)+1];

  // fill array with inital ellipse data
  for (int i=0; i<=ellipseDetail; i++) {
    initCoords[0][i] = toroidRadius+sin(radians(ang))*ellipseRadius + toroidRadius+cos(radians(ang))*ellipseRadius;
    initCoords[1][i] = 0;
    initCoords[2][i] =  cos(radians(ang))*ellipseRadius - sin(radians(ang))*ellipseRadius;
    ang+=360.0/ellipseDetail;
  }

  //lathe ellipse around origin
  //patching with quads
  for (int j=0; j<=toroidDetail; j++) {
    beginShape(QUAD_STRIP);
    for (int i=0; i<=ellipseDetail; i++) {
      if (j>0) {
        vertex(px[i], py[i], initCoords[2][i]);
      }
      px[i] = cos(radians(ang2))*initCoords[0][i];
      py[i] = sin(radians(ang2))*initCoords[0][i];
      vertex(px[i], py[i], initCoords[2][i]);
    }
    ang2+=360.0/toroidDetail;
    endShape();
  }
  ang3+=PI/60; //for ratation
}
