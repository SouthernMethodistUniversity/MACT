// this is the base class for our inheritance chain
class BaseClass {

  //instance property
  String name;

  // default constructor
  BaseClass() {
  }

  // overloaded constructor
  BaseClass(String name) {
    this.name = name;
  }

  // common behavior
  void live() {
    println("Breath now");
  }

  void move() {
    println("Walk");
  }
}
