class DerivedClass01 extends BaseClass {

  // no need to add the String name property here
  // because we're using the one in BaseClass

  DerivedClass01() {
    println("in DerivedClass01");
  }

  // overloaded constructor
  DerivedClass01(String name) {
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
    println("Run");
  }
}
