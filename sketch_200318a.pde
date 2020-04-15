float a1; 
 
void setup() {
  size(1200, 600, P3D);
  background(0);
}
 
void draw() {
 
  background(0);
 
  // everything looks better with lights
  lights(); 
 
 
  fill(0, 255, 0); // green 
  displayBox(width/2, 99, 0, 39);
 
  fill(0, 0, 255); // blue 
  displayBox(width/2, 99, -439, 39); // blue box is same x, same, y, same size 
  // but farer away than the green box (-439 instead of 0)

 
  // same x and y, but more far away
}
 
//---------------------------------------------------------- 
 

 
void displayBox(float x, float y, float z, 
  float r) {
 
  // box 
 
  noStroke();
  pushMatrix();
  translate(x, y, z); // translate and rotate 
  rotateY(a1); 
  box(r);
  popMatrix();
 
  // rotation 
  a1+=.012;
}
 
