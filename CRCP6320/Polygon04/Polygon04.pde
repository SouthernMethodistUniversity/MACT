void setup() {
  size(800, 600);
  
  
  //translate(width/2, height/2);
  ////polygon(int ptCount, float radius, color fillCol,  color strokeCol, float strokeWt)
  ////polygon(8, 65, color(200, 100, 30), color(40), 1.5);
  ////polygon(5, 35, color(0), color(255), 5);
  ////polygon(12, 135, color(255, 255, 0, 140), color(255, 20), 0);
  
  // int polyCount = 90;
  // for (int i=0; i<polyCount; i++) {
  //    //polygon(int(random(3, 15)), random(20, 400), color(random(255), random(255), random(255), random(20, 120)), color(random(255), color(random(255)), random(.5, 4));
  //    polygon(int(random(3, 30)), random(-500, 500), color(random(255), random(255), random(255), 0), color(random(255), random(255), random(255), random(30, 155)), random(.5, 42));
  // }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  //polygon(int ptCount, float radius, color fillCol,  color strokeCol, float strokeWt)
  //polygon(8, 65, color(200, 100, 30), color(40), 1.5);
  //polygon(5, 35, color(0), color(255), 5);
  //polygon(12, 135, color(255, 255, 0, 140), color(255, 20), 0);
  
   int polyCount = 100;
   for (int i=0; i<polyCount; i++) {
      //polygon(int(random(3, 15)), random(20, 400), color(random(255), random(255), random(255), random(20, 120)), color(random(255), color(random(255)), random(.5, 4));
      polygon(int(random(3, 15)), random(20, 400), color(random(255), random(255), random(255), random(20, 120)), color(random(255), random(255)), random(.5, 4));
   }
}
