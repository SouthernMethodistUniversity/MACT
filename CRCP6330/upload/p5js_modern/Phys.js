// encapsulates basic physics for class
// includes speed, gravity, damping and friction


class Phys {
    spd = createVector(0, 0);
    grav = 0;
    damp = 0;
    frictn = 0;

    constructor(spd, grav, damp, frict) {
        this.spd = spd;
        this.grav = grav;
        this.damp = damp;
        this.frict = frict;

    }

}