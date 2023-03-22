class DerivedClass03 extends BaseClass {
  DerivedClass03() {
    println("in DerivedClass03");
  }

  // overloaded constructor
  DerivedClass03(String name) {
    super(name);
  }

  // general method
  // implemented in BaseClass
  //void live() {
  //  println("Breath now");
  //}

  // common interface
  // unique implementation
  // this move method is overriding the 
  // one in BaseClass
  void move() {
    println("Skip");
  }
}
