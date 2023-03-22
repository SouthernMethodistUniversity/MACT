class DerivedClass04 extends BaseClass {
  
  boolean isMagical;
  
  DerivedClass04() {
    println("in DerivedClass03");
  }

  // overloaded constructor
  DerivedClass04(String name, boolean isMagical) {
    super(name);
    this.isMagical = isMagical;
  }

// uses default move method
}
