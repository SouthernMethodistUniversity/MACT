//threeD_grid example

// will be drawin at world origin (0,0,0)
PVector gridDim = new PVector(600, 600, 600);
PVector gridDetail = new PVector(10, 10, 10);

PVector[][][] gridVecs;
color[][][] gridCols;
PVector[][][] gridScales;
PVector[][][] gridRots;
PVector[][][] gridRotThetas;
float gridScaleMin = 10;

void setup() {
  size(800, 800, P3D);
  gridVecs = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  gridCols = new color[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  gridScales = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  gridRots = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];
  gridRotThetas = new PVector[int(gridDetail.x)][int(gridDetail.y)][int(gridDetail.z)];

  PVector dimStep = new PVector(gridDim.x/gridDetail.x, gridDim.y/gridDetail.y, gridDim.z/gridDetail.z);
  // alt long hand way
  //float dimStepX = gridDim.x/gridDetail.x;
  //float dimStepY = gridDim.y/gridDetail.y;
  //float dimStepZ = gridDim.z/gridDetail.z;

  for (int i=0; i<gridDetail.x; i++) {
    for (int j=0; j<gridDetail.y; j++) {
      for (int k=0; k<gridDetail.z; k++) {
        gridVecs[i][j][k] = new PVector(-gridDim.x/2 + dimStep.x*i, -gridDim.y/2 + dimStep.y*j, -gridDim.z/2 + dimStep.z*k);
        gridCols[i][j][k] = color(random(50)+100, random(50)+100, random(50)+100);
        gridScales[i][j][k] = new PVector(random(gridScaleMin, dimStep.x), random(gridScaleMin, dimStep.y), random(gridScaleMin, dimStep.z));
        gridRots[i][j][k] = new PVector(random(TWO_PI), random(TWO_PI), random(TWO_PI));
        // gridRots[i][j][k] = new PVector(0, 0, 0));
        gridRotThetas[i][j][k] = new PVector(random(-PI/180, PI/180), random(-PI/180, PI/180), random(-PI/180, PI/180));
      }
    }
  }
  noStroke();
}

void draw() {
  background(70, 60, 80);
  translate(width/2, height/2, -300);
  rotateY(frameCount*PI/180*.4);
  rotateZ(frameCount*PI/180*.5);

  ambientLight(85, 55, 50);
  lightSpecular(140, 140, 140);
  emissive(1.0);
  specular(125, 100, 255);
  shininess(3.0);
  directionalLight(166, 166, 196, -60, -60, -120);

  //fill(125);
  for (int i=0; i<gridDetail.x; i++) {
    for (int j=0; j<gridDetail.y; j++) {
      for (int k=0; k<gridDetail.z; k++) {
        pushMatrix();
        translate(gridVecs[i][j][k].x, gridVecs[i][j][k].y, gridVecs[i][j][k].z);
        rotateX(gridRots[i][j][k].x);
        rotateY(gridRots[i][j][k].y);
        rotateZ(gridRots[i][j][k].z);
        fill(gridCols[i][j][k]);
        box(gridScales[i][j][k].x, gridScales[i][j][k].y, gridScales[i][j][k].z);
        popMatrix();

        gridRots[i][j][k].x+=gridRotThetas[i][j][k].x;
        gridRots[i][j][k].y+=gridRotThetas[i][j][k].y;
        gridRots[i][j][k].z+=gridRotThetas[i][j][k].z ;
      }
    }
  }
}
