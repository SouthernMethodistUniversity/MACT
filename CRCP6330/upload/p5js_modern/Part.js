/*


let damp;
let frict;
*/
class Part {
    // OPTIONAL data fields declared in the class
    x = 0;
    y = 0;
    diam = 0;
    xSpeed = 0;
    ySpeed = 0;
    fillCol = 0;

    // added
    grav = .25;
    damp = 0;
    frict = 0;

    constructor(x, y, diam, xSpeed, ySpeed, fillCol, damp, frict) {
        this.x = x;
        this.y = y;
        this.diam = diam;
        this.xSpeed = xSpeed;
        this.ySpeed = ySpeed;
        this.fillCol = fillCol;

        this.damp = damp;
        this.frict = frict;
    }

    //methods
    move() {
        this.x += this.xSpeed;
        this.ySpeed += this.grav;
        this.y += this.ySpeed;
    }

    draw() {
        fill(this.fillCol);
        ellipse(this.x, this.y, this.diam, this.diam);
    }

    collide(bounds) {
        //console.log("in collide");
        if (this.x > bounds.x - this.diam / 2) {
            this.xSpeed *= -1;
        } else if (this.x < this.diam / 2) {
            this.xSpeed *= -1;
        }

        if (this.y > bounds.y - this.diam / 2) {
            this.y = bounds.y - this.diam / 2;
            this.ySpeed *= -1;

            this.ySpeed *= this.damp;
            this.xSpeed *= this.frict;

        } else if (this.y < this.diam / 2) {
            this.ySpeed *= -1;
        }
    }

}