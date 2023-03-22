class DerivedClass02 extends BaseClass {
  DerivedClass02(){
    println("in DerivedClass02");
  }
  
    // overloaded constructor
    DerivedClass02(String name){
       super(name);
  }
}
