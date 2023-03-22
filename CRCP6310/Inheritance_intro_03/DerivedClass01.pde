class DerivedClass01 extends BaseClass {
  
  // no need to add the String name property here
  // because we're using the one in BaseClass
  
  DerivedClass01(){
     println("in DerivedClass01");
  }
  
   // overloaded constructor
   DerivedClass01(String name){
      super(name);
  }
}
