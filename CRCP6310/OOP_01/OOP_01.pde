int polyCount = 550;
Poly[] ps = new Poly[polyCount];

void setup() {
  size(800, 800);
  // instantiate the object
  // Poly(PVector trans, PVector spd, int ptCount, float rad, color strokeCol, color fillCol, float strokeWt)
  for (int i = 0; i<ps.length; i++) {
    ps[i] = new Poly(new PVector(0, 0), new PVector(random(-2.3, 2.3), random(-12, -1.3)), floor(random(3, 12)), random(5, 30), color(255, 127, 100), color(50, 25, 100), 2);
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
