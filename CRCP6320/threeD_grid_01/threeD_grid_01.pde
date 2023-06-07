/*
Toroid
Ira Greenberg, November 27, 2005
*/


float ellipseRadius = 50;
float toroidRadius = 100;
float ang = 0, ang2 = 0, ang3 = 0;
float ellipseDetail = 60;
float toroidDetail = 80;
float initCoords[][] = new float[3][int(ellipseDetail)+1];
float[]px = new float[int(ellipseDetail)+1];
float[]py = new float[int(ellipseDetail)+1];

void setup(){
size(400, 400, P3D);
 background(100);
 fill(150); // color generated with lights below
 smooth();  // comment out with P3D renderer
 noStroke();
 
  // fill array with inital ellipse data
 for (int i=0; i<=ellipseDetail; i++){
   initCoords[0][i] = toroidRadius+sin(radians(ang))*ellipseRadius + toroidRadius+cos(radians(ang))*ellipseRadius;
   initCoords[1][i] = 0;
   initCoords[2][i] =  cos(radians(ang))*ellipseRadius - sin(radians(ang))*ellipseRadius;
   ang+=360.0/ellipseDetail;
 }
}

void draw(){
 background(70, 60, 80);
 translate(width/2, height/2, -300);

 ambientLight(85, 55, 50);
 lightSpecular(140, 140, 140);
 emissive(1.0);
 specular(125, 100, 255);
 shininess(3.0);
 directionalLight(166, 166, 196, -60, -60, -120);
 
 rotateY(ang3);
 rotateX(ang3*2);
 rotateZ(ang3);

//lathe ellipse around origin
//patching with quads
 for (int j=0; j<=toroidDetail; j++){
   beginShape(QUAD_STRIP);
   for (int i=0; i<=ellipseDetail; i++){
     if (j>0){
       vertex(px[i], py[i], initCoords[2][i]);
     }
     px[i] = cos(radians(ang2))*initCoords[0][i];
     py[i] = sin(radians(ang2))*initCoords[0][i];
     vertex(px[i], py[i], initCoords[2][i]);
   }
   ang2+=360.0/toroidDetail;
   endShape();
 }
 ang3+=PI/60; //for ratation
} 
