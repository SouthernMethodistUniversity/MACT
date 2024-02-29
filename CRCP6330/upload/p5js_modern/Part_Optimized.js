// somewhat optimized class
// using compostion
// superclass for PartPoly

class Part {
    // OPTIONAL data fields declared in the class
    pos = createVector(0, 0);
    diam = 0;
    style = new Style(0, 0, 0); //Style class object property
    phys;

    //constructor(pos, diam, spd, style, damp, frict) {
    constructor(pos, diam, phys, style) {
        this.pos = pos
        this.diam = diam;
        this.phys = phys;
        this.style = style;
    }

    //methods
    move() {
        this.pos.x += this.phys.spd.x;
        this.phys.spd.y += this.phys.grav;
        this.pos.y += this.phys.spd.y;
    }

    draw() {
        // using Style object
        strokeWeight(this.style.strokeWt);


        // this uses the getter method to check
        if (this.style.getFillState()) {
            fill(this.style.fillCol);
        } else {
            noFill();
        }

        // this uses direct property access to check
        // generally speaking using the get method is prefered
        if (this.style.isStrokeOn) {
            stroke(this.style.strokeCol);
        } else {
            noStroke();
        }

        ellipse(this.pos.x, this.pos.y, this.diam, this.diam);

    }

    collide(bounds) {
        //console.log("in collide");
        if (this.pos.x > bounds.x - this.diam / 2) {
            this.phys.spd.x *= -1;
        } else if (this.pos.x < this.diam / 2) {
            this.phys.spd.x *= -1;
        }

        if (this.pos.y > bounds.y - this.diam / 2) {
            this.pos.y = bounds.y - this.diam / 2;
            this.phys.spd.y *= -1;

            this.phys.spd.y *= this.phys.damp;
            this.phys.spd.x *= this.phys.frict;

        } else if (this.pos.y < this.diam / 2) {
            this.phys.spd.y *= -1;
        }
    }

}