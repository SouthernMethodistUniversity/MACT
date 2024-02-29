// convert to parallel arrays
// let x = 100;
// let y = 100;
// let diam = 50;
// let xSpeed = 5.3;
// let ySpeed = 3.2;
// let fillCol = 0;

const partCount = 100;
let x = [];
let y = [];
let diam = [];
let xSpeed = [];
let ySpeed = [];
let fillCol = [];
let grav = .25;
let damp = [];
let frict = [];

function setup() {
    createCanvas(600, 600);
    fillCol = color(255);
    noStroke();

    for (let i = 0; i < partCount; i++) {
        x[i] = width / 2;
        y[i] = height / 2;
        diam[i] = random(3, 10);
        xSpeed[i] = random(-2.2, 2.2);
        ySpeed[i] = random(-12.2, -8.5);
        fillCol[i] = color(random(150, 200), random(75, 150), random(25));

        damp[i] = random(.575, .92);
        frict[i] = random(.75, .95);
    }
}

function draw() {
    background(165, 115, 145);
    for (let i = 0; i < partCount; i++) {
        fill(fillCol[i]);
        ellipse(x[i], y[i], diam[i], diam[i]);
        x[i] += xSpeed[i];
        ySpeed[i] += grav;
        y[i] += ySpeed[i];

        collide(i);
    }
}


// our custom funcs
function collide(i) {
    //console.log("in collide");
    if (x[i] > width - diam[i] / 2) {
        // console.log("collided");
        xSpeed[i] *= -1;
    } else if (x[i] < diam[i] / 2) {
        // console.log("collided");
        xSpeed[i] *= -1;
    }

    if (y[i] > height - diam[i] / 2) {
        y[i] = height - diam[i] / 2;
        // console.log("collided");
        ySpeed[i] *= -1;

        ySpeed[i] *= damp[i];
        xSpeed[i] *= frict[i];

    } else if (y[i] < diam[i] / 2) { // Note FIX
        // console.log("collided");
        ySpeed[i] *= -1;
    }
}