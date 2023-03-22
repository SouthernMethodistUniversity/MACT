int arrLen = 10;

BaseClass[] bs = new BaseClass[arrLen]; // superclass


void setup(){
  size(800, 800, P3D);
 for(int i=0; i< bs.length; i++){
    if(i%3==0){
       bs[i] = new DerivedClass01("Charles");
    } else if(i%2==0){
       bs[i] = new DerivedClass02("Jessica");
    } else {
        bs[i] = new DerivedClass03("Pierre");
    }
 }
 
 //bs[0].name = "Kevin";
 //bs[1].name = "Susan";
}


void draw(){
  for(int i=0; i< bs.length; i++){
    println(bs[i].name);
  }
}
