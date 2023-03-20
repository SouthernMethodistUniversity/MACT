// I could declare the box object globally here for collision (not ideal)
int sphereCount = 200;
CRCPSphere[] ss = new CRCPSphere[sphereCount];
Dim3 dim = new Dim3(600, 100, 600);
float detectionDist = 60;

void setup() {
  size(800, 800, P3D);

  for (int i = 0; i<ss.length; i++) {
    GeomStyle gs = new GeomStyle(color(random(20, 255), 127, 100), color(50, random(20, 255), 100), random(1, 6));
    GeomDynamics gd = new GeomDynamics(new PVector(random(-2.3, 2.3), random(-12, -1.3), random(-3, 3)), random(-.2, .2), random(.85, .95), random(.85, .95));
    ss[i] = new CRCPSphere(new PVector(0, 0, 0), random(2, 6), gs, gd);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, -100);
  rotateY(frameCount*PI/720);
  rotateX(frameCount*PI/1420);
  noFill();
  box(dim.w, dim.h, dim.d);
  // call any methods on the object
  for (int i = 0; i<ss.length; i++) {
    ss[i].draw();
    ss[i].move();
    ss[i].collide(dim);
    
    stroke(255);
    strokeWeight(.25);
    for (int j = 0; j<ss.length; j++) {
      if(i != j){
        if(dist(ss[i].trans.x, ss[i].trans.y, ss[i].trans.z, ss[j].trans.x, ss[j].trans.y, ss[j].trans.z) < detectionDist){
          line(ss[i].trans.x, ss[i].trans.y, ss[i].trans.z, ss[j].trans.x, ss[j].trans.y, ss[j].trans.z);
        }
      }
    }
    
    
  }
  
  
  
}
