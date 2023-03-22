int arrLen = 15;

BaseClass[] bs = new BaseClass[arrLen]; // superclass


void setup() {
  size(800, 800, P3D);
  for (int i=0; i< bs.length; i++) {
    if (i%5==0) {
      bs[i] = new DerivedClass01("Barbara");
    } else if (i%3==0) {
      bs[i] = new DerivedClass02("Charles");
    } else if (i%2==0) {
      bs[i] = new DerivedClass03("Jessica");
    } else {
      bs[i] = new DerivedClass04("Pierre");
    }
  }

  //for (int i=0; i< bs.length; i++) {
  //   println(bs[i].name);
  //}
  
  for (int i=0; i< bs.length; i++) {
     bs[i].move();
  }
}


void draw() {

 
}
