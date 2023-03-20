class GeomDynamics {

  PVector spd;
  float gravity;
  float damping;
  float friction;

  GeomDynamics() {
  }

  GeomDynamics(PVector spd, float gravity, float damping, float friction) {
    this.spd = spd;
    this.gravity = gravity;
    this.damping = damping;
    this.friction = friction;
  }
}
