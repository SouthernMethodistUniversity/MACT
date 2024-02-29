let x = 100;
let y = 100;
let diam = 50;
let xSpeed = 5.3;
let ySpeed = 3.2;

function setup() {
    createCanvas(600, 600);
}

function draw() {
    background(125, 115, 145);
    fill(255);
    ellipse(x, y, diam, diam);
    x += xSpeed;
    y += ySpeed;

    collide();
}


// our custom funcs
function collide() {
    //console.log("in collide");
    if (x > width - diam / 2) {
        // console.log("collided");
        xSpeed *= -1;
    } else if (x < diam / 2) {
        // console.log("collided");
        xSpeed *= -1;
    }

    if (y > height - diam / 2) {
        // console.log("collided");
        ySpeed *= -1;
    } else if (y < diam / 2) {
        // console.log("collided");
        ySpeed *= -1;
    }
}