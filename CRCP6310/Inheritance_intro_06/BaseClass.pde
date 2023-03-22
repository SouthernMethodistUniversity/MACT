// this is the base class for our inheritance chain
class BaseClass {

  //instance property
  String name;

  // default constructor
  BaseClass() {
    println("In the baseclass constructor");
  }

  // overloaded constructor
  BaseClass(String name) {
    this.name = name;
  }

  // common behavior
  void live() {
    println("Breath now");
  }

  // common interface
  // unquie implementation
  void move() {
    println("Walk");
  }
}
