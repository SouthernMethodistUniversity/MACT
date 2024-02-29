import { ComplexParticle } from "./ComplexParticle";



export class StarParticle extends ComplexParticle {

    // polygon implementation
    ptCount: number;
    pts: p5.Vector[] = [];

    constructor(p: p5, pos: p5.Vector, radius: number, speed: p5.Vector, ptCount: number = 6) {
        // uses ternary operator to ensure even argument is set for ptCount
        super(p, pos, radius, speed, (ptCount % 2 == 0) ? ptCount : ++ptCount);

        this.init();
    }

    // do calculation and storage for star data
    protected init(): void {
        console.log("in init");
        let theta = 0.0;
        for (let i = 0; i < this.ptCount; i++) {
            let x = 0;
            let y = 0;

            if (i % 2 == 0) {
                x = this.p.cos(theta) * this.radius;
                y = this.p.sin(theta) * this.radius;
            } else {
                x = this.p.cos(theta) * this.radius * .35;
                y = this.p.sin(theta) * this.radius * .35;
            }

            this.pts.push(this.p.createVector(x, y));
            theta += this.p.TWO_PI / this.ptCount;
            //  this.pts[i] = this.p.createVector(x, y); // alt approach for filling an array
        }

    }

    //overrides same method in the BaseParticle class
    draw(): void {
        this.p.push();
        this.p.translate(this.pos.x, this.pos.y);
        this.p.beginShape();
        for (let i = 0; i < this.pts.length; i++) {
            this.p.vertex(this.pts[i].x, this.pts[i].y);
        }
        this.p.endShape(this.p.CLOSE);
        this.p.pop();
    }

}