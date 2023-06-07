//threeD_grid example

// will be drawin at world origin (0,0,0)
PVector gridDim = new PVector(600, 600, 600);
PVector gridDetail = new PVector(10, 10, 10);

PVector[][][] gridVecs;

void setup() {
  size(800, 800, P3D);
  gridVecs = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  PVector dimStep = new PVector(gridDim.x/gridDetail.x, gridDim.y/gridDetail.y, gridDim.z/gridDetail.z);
  // alt long hand way
  //float dimStepX = gridDim.x/gridDetail.x;
  //float dimStepY = gridDim.y/gridDetail.y;
  //float dimStepZ = gridDim.z/gridDetail.z;

  for (int i=0; i<gridDetail.x; i++) {
    for (int j=0; j<gridDetail.y; j++) {
      for (int k=0; k<gridDetail.z; k++) {
        gridVecs[i][j][k] = new PVector(-gridDim.x/2 + dimStep.x*i, -gridDim.y/2 + dimStep.y*j, -gridDim.z/2 + dimStep.z*k);
      }
    }
  }
  noStroke();
}

void draw() {
  background(70, 60, 80);
  translate(width/2, height/2, -300);
  // rotateY(frameCount*PI/180*.1);

  lights();
  fill(125);
  for (int i=0; i<gridDetail.x; i++) {
    for (int j=0; j<gridDetail.y; j++) {
      for (int k=0; k<gridDetail.z; k++) {
        pushMatrix();

        translate(gridVecs[i][j][k].x, gridVecs[i][j][k].y, gridVecs[i][j][k].z);
        if (j==0) {
          rotateX(-frameCount*PI/180*.8);
        } else if (j%3==0){
          rotateX(frameCount*PI/180*.8);
        }
        box(30);
        popMatrix();
      }
    }
  }
}
