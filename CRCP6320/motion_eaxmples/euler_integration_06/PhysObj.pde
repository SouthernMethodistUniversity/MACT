class PhysObj{
  // properties
  PVector spd;
  float accel;
  float damping;
  float friction;
  
  PhysObj(){
  }
  
  // overloaded cstr
  PhysObj(PVector spd, float accel, float damping, float friction){
    this.spd = spd;
    this.accel = accel;
    this.damping = damping;
    this.friction = friction;
  }
  
}
