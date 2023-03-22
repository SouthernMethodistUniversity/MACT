class DerivedClass01 extends BaseClass {

  float weight;

  DerivedClass01() {
    println("in DerivedClass01");
  }

  // overloaded constructor
  DerivedClass01(String name, float weight) {
    super(name);
    this.weight = weight;
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
