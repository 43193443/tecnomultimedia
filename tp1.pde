/* RAMIRO JUAREZ LEGAJO 91434/5 */

//variables pos
float posY,Y2,Y3,Y4;
int estado;
//GIF
int numberOfFrames;
PImage [] gif;
int f;

// var IMAGEN
int maxImages = 10;
int imageIndex = 0;
//TEXTO
int miVariable;
String textofinal;
color textoRandom;
color celeste;

// Carga de imágenes (jpg o .png)
PImage [] images = new PImage [maxImages];
String [] filenames = {"1copia.jpg", "2copia.jpg", "3edit.jpg", "10edit.jpg"};
//carga fuentes
PFont FuenteNueva;
PFont FuenteIntro;

//asignacion var
void setup() {
  //TAMAÑO
  size (500, 500);
  //PRIMER GIF INTRO
  numberOfFrames = 27;
  gif = new PImage[numberOfFrames];
  int u = 0;
  while (u < numberOfFrames) {
    gif[u] = loadImage ("frame_"+u+"_delay-0.1s.gif");
    u=u+1;
  }
  
 // POSICIONES
  posY = 1000;
  Y2= 550;
  Y3=600;
  Y4=550;

// PRIMER TEXTO INTRO
  textSize(32);
  miVariable= -1000;
  textofinal= "LOS PINGÜINOS \nde Madagascar";
  textoRandom = color(0,255,255);
  celeste= color(0,255,255);
  
              
// RESTO DE IMAGENES
   for (int i = 0; i < filenames.length; i++){
    images [i] = loadImage(filenames[i]); }
    
    //CARGA DE FUENTES
FuenteNueva = loadFont("CordiaUPC-Bold-32.vlw"); // Carga de tipografías y gráficos con texto.
FuenteIntro = createFont("penguin", 32);
textFont (FuenteIntro);
}


//uso var
void draw(){
  //MOVIMIENTO
  miVariable = frameCount*3;
  
  // GIF
  image(gif[f],0,0, width, height);
  println(frameCount);
  if(frameCount % 10 == 0) f = f + 1;
  if (f == numberOfFrames) f = 0;

//MOUSE COORDENADAS
  println("X:");     // Obtener las propiedades 
  println(mouseX);   // del mouse en
  println("Y");      // el espacio
  println(mouseY);   // de coordenadas.
  
  
// IMAGENES
  image(images[imageIndex],CENTER,CENTER,525,525);
  
  //PRIMER TEXTO INTRO
  textFont (FuenteIntro);
  textoRandom = color(random (255), random (255), random (255));
  fill(textoRandom);
  text(textofinal,225,400-(miVariable+=2));
  
  
  // SEGUNDO TEXTO Protagonistas principales
    if (estado==0) {
      textSize(32);
    fill(celeste);
    textFont (FuenteNueva);
    textAlign(CENTER);
    text("CAST\nSKIPPER    TOM MCGRATH\nKOWALSKI    CHRIS MILLER \nPRIVATE    CHRISTOPHER KNIGHTS\nRICO    CONRAD VERNON" , width/2,posY);
    posY-=3;
  }
  // TERCER TEXTO protagonistas secundarios
  if (estado==1) {  
    textAlign(CENTER);
     textFont (FuenteNueva);
     textSize(32);
    fill(celeste);
    text("CAST SECUNDARIO\nDAVE    JOHN MALKOVICH\nAGENT CLASSIFIED    BENEDICT CUMBERBATCH\nSHORT FUSE    KEN JEONG\nEVA    ANNET MAHENDRU\nCORPORAL    PETER STORMARE\nMORT    ANDY RICHTER\nKING JULIEN    DANNY JACOBS", width/2, posY);
    posY-=3;
  }
  
  //CUARTO TEXTO
  if (estado==2) {
    textAlign(CENTER);
     textFont (FuenteNueva);
    textSize(32);
    fill(celeste);
    text("MUSIC \n  MUSIC EXECUTIVE    SUNNY PARK \n MUSIC EDITOR    SLAMM ANDREWS\nADDITIONAL MUSIC EDITOR    TOM CARLSON \nMUSIC COMPOSED BY \n LORNE BALFE_", 250, Y4);
    Y4-=3;
  }
  //QUINTO TEXTO
    if (estado==3) {
    textAlign(CENTER);
     textFont (FuenteNueva);
    textSize(32);
    fill(celeste);
    text("DIRECTED BY\nERIC DARNELL \nSIMON J.SMITH", 250, Y4);
    Y4-=3;
  }
  
  //MOV
    if (posY<-50 && estado==0) {
    estado=1;
    posY=width;
  }
   if (posY<-100 && estado==1) {
    estado=2;
    posY=width;
  }
  
  if (Y4<-100 && estado == 2 ){
 estado=3;
Y4=width;
}

 if (Y4<-50 && estado == 3 ){
 estado=3;
Y4=width;
 }
}


//AVANZAR IMAGEN
void mousePressed(){
  imageIndex++;
  if (imageIndex >= filenames.length){
    imageIndex = 0;
  }
}
