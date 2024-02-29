
// array of Part objects
const partCount = 500;
let parts = [];
let bounds = 0; // p5 Vector type

function setup() {
    createCanvas(600, 600);
    bounds = createVector(width, height);

    for (let i = 0; i < partCount; i++) {

        parts[i] = new Part(width / 2, height / 2, random(3, 10),
            random(-2.2, 2.2), random(-12.2, -8.5), color(random(150, 200), random(75, 150), random(25)), random(.575, .92), random(.75, .95));
    }
}

function draw() {
    background(165, 115, 145);
    for (let i = 0; i < partCount; i++) {
        parts[i].move();
        parts[i].draw();
        parts[i].collide(bounds);
    }
}