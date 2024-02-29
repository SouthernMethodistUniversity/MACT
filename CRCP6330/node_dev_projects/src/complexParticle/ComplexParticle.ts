import { BaseParticle } from "../libIra/BaseParticle";


export class ComplexParticle extends BaseParticle {

    // polygon implementation
    ptCount: number;
    pts: p5.Vector[] = [];

    constructor(p: p5, pos: p5.Vector, radius: number, speed: p5.Vector, ptCount: number = 6) {
        super(p, pos, radius, speed);
        this.ptCount = ptCount;

        // calculate the polygon and store it
        // to avoid doing this in the draw event loop
        this.init();
    }

    // do calculation and storage for polygon data
    // protected means the you can access
    // from the this class or any derived class
    protected init(): void {
        console.log("in init");
        let theta = 0.0;
        for (let i = 0; i < this.ptCount; i++) {
            const x = this.p.cos(theta) * this.radius;
            const y = this.p.sin(theta) * this.radius;
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