//threeD_grid example

// will be drawin at world origin (0,0,0)
PVector gridDim = new PVector(200, 200, 200);
PVector gridDetail = new PVector(10, 10, 10);

PVector[][][] gridVecs;

void setup() {
  size(400, 400, P3D);
  gridVecs = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  PVector dimStep = new PVector(gridDim.x/gridDetail.x, gridDim.y/gridDetail.y, gridDim.z/gridDetail.z);
  // alt long hand way
  //float dimStepX = gridDim.x/gridDetail.x;
  //float dimStepY = gridDim.y/gridDetail.y;
  //float dimStepZ = gridDim.z/gridDetail.z;

  for (int i=0; i<gridDetail.x; i++) {
    for (int j=0; j<gridDetail.y; j++) {
      for (int k=0; k<gridDetail.z; k++) {
        gridVecs[i][j][k] = new PVector(dimStep.x*i, dimStep.y*j, dimStep.z*k);
      }
    }
  }
}

void draw() {
  background(70, 60, 80);
  translate(width/2, height/2, -300);
}
