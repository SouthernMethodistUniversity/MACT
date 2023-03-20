BaseClass b;
DerivedClass01 dc;

void setup(){
  size(800, 800, P3D);
  b = new BaseClass():
  dc = new DerivedClass01();
  
  b = new DerivedClass01();
  dc = new BaseClass();
  
}


void draw(){
}
