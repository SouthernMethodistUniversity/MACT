BaseClass b; // superclass
DerivedClass01 dc; // subclass

void setup(){
  size(800, 800, P3D);
  b = new BaseClass();
  dc = new DerivedClass01();
  
  b = new DerivedClass01(); //legal
  // ok to assign object of a derived class to a variable of its base class
  
  //dc = new BaseClass(); //illegal
   // NOT ok to assign object of a base class to a variable of its derived class
   
  
  
}


void draw(){
}
