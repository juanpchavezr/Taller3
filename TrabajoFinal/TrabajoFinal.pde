//libreria del slider
import controlP5.*;
PImage img;
ControlP5 cp5;

//el valor en donde se encuentra el slider
//int valSlider;
//el valor en donde se encuentra el slider
int valorSlider;

//numero de filas en el archivo
int rowCount;

//variable que guarda toda la información de la columna del tiempo
String [] tiempo; 


//se crea la tabla que guarda la ifnormación del .csv
Table table;

//arreglo que guarda todos los datos de la columna 2gSuscripcion
int [] movil2G;

//variable que guarda el numero de suscriptores 2G, respecto a la fecha elegida con el slider
int dato2G;


//2G
//cantidad de cubos pequeños
int cubies2G;

//posición de los cubos pequeños
float[]x2G;
float[]y2G;
float[]z2G;

//velocidad de movimiento de los cubos pequeños
float[]xSpeed2G;
float[]ySpeed2G;
float[]zSpeed2G;

//rotación de los cubos pequeños
float[]xRot2G;
float[]yRot2G;
float[]zRot2G;

//dimensiones del cubo blanco 
float sizeCube = 100;

//variable para que salgan del centro los cubos pequeños, cada que se mueve el slider
boolean unaVez2G = false;


void setup() 
{
  size(1280,680, P3D);
  img = loadImage("loc12.jpeg");//Carga la imagen
  table = loadTable("datosInternetCompleto1.csv", "header");
  img = loadImage("loc12.png");//Carga la imagen
  
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");
  
  tiempo = new String [rowCount];
  
  movil2G = new int [rowCount];
  
  for(int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);
    
    tiempo[i] = row.getString("tiempo");
    
    movil2G[i]= row.getInt("2gSuscripcion");
  }
    
 
  cp5 = new ControlP5(this);  

  gui();
  
  
}

void gui()
{ 
     cp5.addSlider("valSlider")
     .setPosition(650,10)
     .setWidth(600)
     .setRange(0,7)
     .setValue(5)
     .setNumberOfTickMarks(8)
     .setSliderMode(Slider.FLEXIBLE)
     ;       
}


//función que se ejecuta cuando el slider se mueve 
void valSlider(int valor ) 
{ 
  //el valor en donde se encuentra el slider
  valorSlider = valor;
  println(valorSlider + "    " + dato2G);
    
  //variable para que salgan del centro los cubos pequeños, cada que se mueve el slider
  unaVez2G=false;
}


void draw()
{
  background(50);
  lights();
  pushMatrix();
  
  
    image(img, 0, 0);//Dibuja una imagen en la ventana
    img.resize(800,600);
    popMatrix();
  color posColor = img.get(mouseX, mouseY);//Datos del color de la imagen
  fill(posColor);//Llenar con posColor
  ellipse(mouseX, mouseY, 50, 50);//el circulo es el nuevo puntero

  
   if (posColor<= #08155F ){
      text("El promedio esta por debajo de "+ dato2G,300,780);
      
      }
      if (dato2G<=70){
      text("nada"+dato2G,300,780);
      }
  
  
  fill(255);
  //colocar el texto del slider verticalmente
  for(int i = 0; i < rowCount; i++)
  { 
    float x = map(i, 0, rowCount-1, 650, 1240);
    //text(tiempo[i], x, 35);
    
    pushMatrix();
    translate(x,35);
    rotate(PI/2);
    //se coloca el texto en cada linea
    text(tiempo[i], 0, 0);
    popMatrix();      
  }
      
  pushMatrix(); 
    //dibuja los cubos
    drawCubes2G();  
  popMatrix();
   
  
}



void drawCubes2G()
{ 
  
  //variable que guarda el numero de suscriptores 2G, respecto a la fecha elegida con el slider
  dato2G= movil2G[valorSlider];
  
  
  //ubica el cubo blanco en el centro    
  translate(1000,500, 1);
  //genera la rotación del cubo blanco
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount * 0.001);
   
   
  noFill(); 
  stroke(#FFADAD);
  //dimensiones del cubo blanco (200)
  box(sizeCube);
  
  
  if(unaVez2G==false)
  {
    //determina el número de cubos pequeños
    cubies2G = dato2G;
    
    //se inicialian el arreglo de la posición de los cubos pequeños
    x2G = new float[cubies2G];
    y2G = new float[cubies2G];
    z2G = new float[cubies2G];
    
    //se inicialian el arreglo de la velocidad de los cubos pequeños
    xSpeed2G = new float[cubies2G];
    ySpeed2G = new float[cubies2G];
    zSpeed2G = new float[cubies2G];
    
    //se inicialian el arreglo de la rotación de los cubos pequeños
    xRot2G = new float[cubies2G];
    yRot2G = new float[cubies2G];
    zRot2G = new float[cubies2G];
  
    //se llenan los arreglos
    for (int i = 0; i < cubies2G; i++)
    {
      //los cubos empiezan desde el punto (0,0,0) es decir desde el centro
      x2G[i] = 0;
      y2G[i] = 0; 
      z2G[i] = 0;
      
      //a cada cubo pequeño se le asigna una velocidad aleatoria 
      xSpeed2G[i] = random(-1, 1);
      ySpeed2G[i] = random(-1, 1); 
      zSpeed2G[i] = random(-1, 1); 
  
      //a cada cubo pequeño se le asigna una rotación
      xRot2G[i] = random(40, 100);
      yRot2G[i] = random(40, 100);
      zRot2G[i] = random(40, 100);
    }
 
     //despues de inicializar y llenar los arreglos, se sale del condicional para que lo vuelva a crear mácubos pequeños, hasta que se vuelva a mover el slider
     unaVez2G=true;
  }
  
  
  for (int i = 0; i < cubies2G; i++)
  {
    pushMatrix();
      //ubica los cubos pequeños en el centro
      translate(x2G[i], y2G[i], z2G[i]);
      
      //genera la rotación a cada cubo pequeño
      rotateX(frameCount*PI/xRot2G[i]);
      rotateY(frameCount*PI/yRot2G[i]);
      rotateX(frameCount*PI/zRot2G[i]);
      
      //dibuja los cubos de color rojo y de tamaño de 10
      pushMatrix();
      color posColor = img.get(mouseX, mouseY);//Datos del color de la imagen
      fill(posColor);
      
     
      noStroke();
      box(10);
        popMatrix();
      //genera el movimiento de loscubos con su respectiva velocidad  
      x2G[i] += xSpeed2G[i];
      y2G[i] += ySpeed2G[i];
      z2G[i] += zSpeed2G[i];
    popMatrix();

    
    //si la posción del cubo pequeño en X es mayor o menor al tamaño del cubo grande
    if (x2G[i] > sizeCube/2 || x2G[i] < -sizeCube/2)
    {
      //entonces cambie de dirección
      xSpeed2G[i]*=-1;
    }
    
    //si la posción del cubo pequeño en Y es mayor o menor al tamaño del cubo grande
    if (y2G[i] > sizeCube/2 || y2G[i] < -sizeCube/2)
    {
      //entonces cambie de dirección
      ySpeed2G[i]*=-1;
    }
    
    //si la posción del cubo pequeño en Z es mayor o menor al tamaño del cubo grande
    if (z2G[i] > sizeCube/2 || z2G[i] < -sizeCube/2)
    {
      //entonces cambie de dirección
      zSpeed2G[i]*=-1;
    }
    
  }

    
}
