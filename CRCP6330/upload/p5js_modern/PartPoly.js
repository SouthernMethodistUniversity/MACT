// subclass of Part

class PartPoly extends Part {
    // new fields specific to the polygon subclass
    points = 3;

    // declared in the Part superclass
    // pos = createVector(0, 0);
    // diam = 0;
    // style = new Style(0, 0, 0); //Style class object property
    // phys;


    constructor(pos, diam, phys, style, points) {
        super(pos, diam, phys, style);
        this.points = points;
    }

    // overrides draw() method in Part superclass
    // replace default ellipse with polygon implementation
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

        // add Polygon implementation
        let theta = 0.0;
        beginShape();
        for (let i = 0; i < this.points; i++) {
            const x = this.pos.x + cos(theta) * this.diam * .5;
            const y = this.pos.y + sin(theta) * this.diam * .5;
            vertex(x, y);
            theta += TWO_PI / this.points;
        }
        endShape(CLOSE);

    }
}