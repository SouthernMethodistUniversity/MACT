class DerivedClass02 extends BaseClass {
  
 int age; 
  
  DerivedClass02() {
    println("in DerivedClass02");
  }

  // overloaded constructor
  DerivedClass02(String name, int age) {
    super(name);
    this.age = age;
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
    println("Jump");
  }
}
