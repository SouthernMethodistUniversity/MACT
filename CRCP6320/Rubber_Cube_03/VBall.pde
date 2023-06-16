class VBall {

  PVector pos, posOld;
  float radius;

  VBall(){
  }

  VBall(PVector pos, float radius){
    this.pos = pos;
    this.radius = radius;
    this.posOld  = new PVector(pos.x, pos.y);
  }

  void push(PVector push_vec){
    this.pos.add(push_vec);
  }
  
  
  void verlet(){
    PVector posTemp = new PVector(pos.x, pos.y);
    pos.x += (pos.x-posOld.x);
    pos.y += (pos.y-posOld.y);
    posOld.set(posTemp);
  }

  void draw(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(radius*2);
    popMatrix();
  }

  void boundsCollision(PVector push){
    if (pos.x>width-radius){
      pos.x = width-radius;
      posOld.x = pos.x;
      pos.x -= push.x;
    } 
    else if(pos.x<radius){
      pos.x = radius;
      posOld.x = pos.x;
      pos.x += push.x;
    }

    if (pos.y<radius){
      pos.y = radius;
      posOld.y = pos.y;
      pos.y += push.y;
    } 
    
    if (pos.y>height-radius){
      pos.y = height-radius;
      posOld.y = pos.y;
      pos.y -= push.y;
    } 
  }



}
