Dim3 dim = new Dim3(600, 100, 600);
CRCPToroid toroid1;

void setup() {
  size(800, 800, P3D);

  // CRCPToroid(PVector trans, float toroidRad, float tubeRad)CRCPToroid toroid1;
  toroid1 = new CRCPToroid(new PVector(0,0,0), 200, 25, new ToroidDetail(90, 24));
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  rotateY(frameCount*PI/720);
  rotateX(frameCount*PI/1420);
  noFill();
  toroid1.draw(); 
}
