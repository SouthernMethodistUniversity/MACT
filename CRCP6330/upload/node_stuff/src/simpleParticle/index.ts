import * as p5 from 'p5';

import { SimpleParticle } from './SimpleParticle';

export const sketch = (p: p5) => {
    // let x: number = 45;
    // let y: number = 45;
    // const speedX: number = 1.5;
    // const speedY: number = 2.5;

    let part1: SimpleParticle;


    p.setup = () => {
        p.createCanvas(400, 400);
        // constructor(pos: p5.Vector, radius: number, speed: p5.Vector) {
        part1 = new SimpleParticle(p, p.createVector(45, 45), 125, p.createVector(2.5, 3.5));
    }

    p.draw = () => {
        p.background(220);
        // p.ellipse(x, y, 80, 80);
        // x += speedX;
        // y += speedY;
        part1.run();
        part1.draw();
    }
}

export const myp5 = new p5(sketch, document.body);