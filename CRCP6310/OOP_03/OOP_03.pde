int polyCount = 550;
Poly[] ps = new Poly[polyCount];

void setup() {
  size(800, 800);

  for (int i = 0; i<ps.length; i++) {
    GeomStyle gs = new GeomStyle(color(random(20, 255), 127, 100), color(50, random(20, 255), 100), random(1, 6));
    GeomDynamics gd = new GeomDynamics(random(-.2, .2), random(.65, .95), random(.65, .95));
    ps[i] = new Poly(new PVector(100, 0), new PVector(random(-2.3, 2.3), random(-12, -1.3)), floor(random(3, 12)), random(5, 30), gs, gd);
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  // call any methods on the object
  for (int i = 0; i<ps.length; i++) {
    ps[i].draw();
    ps[i].move();
  }
}
