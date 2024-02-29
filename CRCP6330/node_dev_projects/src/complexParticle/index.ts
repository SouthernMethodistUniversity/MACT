import * as p5 from 'p5';
import { ComplexParticle } from './ComplexParticle';
import { StarParticle } from './StarParticle';


export const sketch = (p: p5) => {

    let part1: ComplexParticle;
    let part2: StarParticle;


    p.setup = () => {
        p.createCanvas(400, 400);
        //  part1 = new ComplexParticle(p, p.createVector(45, 45), 40, p.createVector(2.5, 3.5));
        part2 = new StarParticle(p, p.createVector(160, 45), 20, p.createVector(-2.5, 3.5), 11);
    }

    p.draw = () => {
        p.background(220);
        // part1.move();
        // part1.draw();

        part2.move();
        part2.draw();
    }
}

export const myp5 = new p5(sketch, document.body);