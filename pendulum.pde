 float a = 0; //variables
float b = 0;
float r = 60;
float t = 0;
float d = 10;

void setup(){
  
  size(800,800);
  background(0);
  
}

void draw(){
  
  
  
  fill(255,100,255,40);// color de relleno del circulo + transparencia
  stroke(255,100,255);// color de la linea
  strokeWeight(1);// tamaño de la linea
  
  a = mouseX;//movimiento del mouse derecha izquierda
  b = mouseY;//movimiento mouse arriba abajo
  
  d = dist(pmouseX, pmouseY, mouseX, mouseY)/1.5; //Distancia a la que se genera la linea del puntero del mouse
  
  ellipse(a + r*sin(t), b + r*cos(t), d, d); // creacion de la elipse que esta en la parte externa de la linea
  //line(a, b, a + r*sin(t), b + r*cos(t));//linea generada en el puntero
  t = t + 0.4;//velocidad y espacio entre lineas 
  

  
}

void mousePressed(){
  background(0);// limpieza del fondo 
}
