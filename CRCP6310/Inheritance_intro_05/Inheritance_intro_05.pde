int arrLen = 15;
BaseClass[] bs = new BaseClass[arrLen]; // superclass

void setup() {
  size(800, 800, P3D);
  for (int i=0; i< bs.length; i++) {
    if (i%5==0) {
      bs[i] = new DerivedClass01("Barbara", 142.5);
    } else if (i%3==0) {
      bs[i] = new DerivedClass02("Charles", 37);
    } else if (i%2==0) {
      bs[i] = new DerivedClass03("Jessica", "Feline");
    } else {
      bs[i] = new DerivedClass04("Pierre", true);
    }
  }

  //for (int i=0; i< bs.length; i++) {
  //   println(bs[i].name);
  //}

  int x = 4;
  float y = 2.3;

  // polymorphic
  // explicit conversion of the BaseClass variable to the
  // DerivedClass type.
  println(  ((DerivedClass01)bs[5]).weight   );
}

void draw() {
}
