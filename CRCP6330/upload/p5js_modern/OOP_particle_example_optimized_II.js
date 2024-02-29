
// array of Part objects
const partCount = 50;
let parts = [];
let bounds = 0; // p5 Vector type

const polyCount = 50;
let polyParts = [];

function setup() {
    createCanvas(600, 600);
    bounds = createVector(width, height);

    for (let i = 0; i < partCount; i++) {

        let pos = createVector(width / 2, height / 2);
        // let spd = createVector(random(-2.2, 2.2), random(-12.2, -8.5));

        // constructor(speed, gravity, damping, friction)
        let phys = new Phys(
            createVector(random(-2.2, 2.2), random(-12.2, -8.5)),
            random(.15, .45),
            random(.25, .95),
            random(.72, .85),
        );

        let style = new Style(
            color(random(150, 200), random(75, 150), random(25), 20), //fill
            color(random(15, 100), random(175, 255), random(125)), //stroke
            random(1, 2)); // strokeWt
        style.setFillState(true);
        style.setStrokeState(false);

        ////constructor(pos, diam, spd, style, damp, frict)
        //constructor(pos, diam, phys, style)
        parts[i] = new Part(
            pos,
            random(3, 10),
            phys,
            style
        );
    }

    for (let i = 0; i < polyCount; i++) {

        let pos = createVector(width / 2, height / 2);

        // constructor(speed, gravity, damping, friction)
        // let phys = new Phys(
        //     createVector(random(-1.1, 1.1), random(-6.2, -4.5)),
        //     random(.15, .45),
        //     random(.75, .95),
        //     random(.72, .85),
        // );

        let phys = new Phys(
            createVector(random(-2.2, 2.2), random(-12.2, -8.5)),
            random(.15, .45),
            random(.25, .95),
            random(.72, .85),
        );

        let style = new Style(
            color(random(50, 100), random(75, 150), random(150, 200), 20), //fill
            color(random(15, 100), random(175, 255), random(125)), //stroke
            random(1, 2)); // strokeWt
        style.setFillState(true);
        style.setStrokeState(true);

        //constructor(pos, diam, phys, style, points)
        polyParts[i] = new PartPoly(
            pos,
            random(11, 20),
            phys,
            style,
            int(random(3, 10))
        );
    }
}

function draw() {
    //background(165, 115, 145);
    fill(255, 10);
    rect(-1, -1, width, height);
    for (let i = 0; i < partCount; i++) {
        parts[i].move();
        parts[i].draw();
        parts[i].collide(bounds);
    }

    for (let i = 0; i < polyCount; i++) {
        polyParts[i].move();
        polyParts[i].draw();
        polyParts[i].collide(bounds);
    }
}