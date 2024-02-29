export class BaseParticle {

    // class fields
    p: p5;
    pos: p5.Vector;
    radius: number;
    speed: p5.Vector;

    constructor(p: p5, pos: p5.Vector, radius: number, speed: p5.Vector) {
        this.p = p;
        this.pos = pos;
        this.radius = radius;
        this.speed = speed;
    }

    move(): void {
        this.pos.add(this.speed);
        //console.log("here in move")
    }

    draw(): void {
        this.p.ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    }

}