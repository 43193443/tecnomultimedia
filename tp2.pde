// link https://youtu.be/Q9wf5RwNRFQ
// ramiro juarez giacomo 91434/5

// Funciones para el diametro,angulo y las lineas
float dia = 180;
float angle;
float sW_max;


// funciones de color 
color c1 = color(92,25,87);
color c2 = color(200,0,0);


// Musica
import ddf.minim.*;

Minim minim;
AudioPlayer song_;

void setup (){
 size(400,400);
 // insertar la musica
 minim = new Minim(this);
 //carga el archivo wav
 song_ = minim.loadFile("music-.wav");
 
 //color y la definición de las lineas, su forma final
 strokeCap(CORNER);
 stroke(c2);
 
 // mouseX= 10;
}

void draw() {
  background(c1);
  //El mouse cambia el tamaño del circulo. Es lo que hace el efecto que se agrande.
  dia = lerp(dia, mouseX, 0.1);
  
  // cambia las coordenadas en la ventana de visualización, en este caso se traslada en la posición del medio.
  translate(width/2,height/2);
  
  // coloque rotate para que el circulo comience a girar con el angulo negativo
  rotate(-angle);
  
  
 //for
 //realización del circulo con lineas horizontales
  for(int a=0; a<300; a+=20){
     // for(int a=0; a<300; a+=mouseX){
    
    //añadir una nueva matrix de coordenadas
    pushMatrix();
    
    rotate(radians(a));
    
    // use la b como linea de intervalo y el tamaño/longitud seria diametro
    for (int b=0; b<180; b+=20) {
      float sW = map(cos(radians(b)), -1, 1, sW_max , 1);
      
     // agregue valores a x2 y2 a la linea, también la b de manera negativa para que sea en sentido contrario
      strokeWeight(sW);
      line(sin(radians(b))*dia, cos(radians(b))*dia,
      sin(radians(-b))*dia,cos(radians(-b))*dia);
    }
    
    //elimina pushmatrix
    popMatrix();
  }
  
  angle+=TWO_PI/720;
  
  float sW_angle = map(dia, 0 , width, 0, 300);
  
  sW_angle = constrain(sW_angle,180,300);
  
  sW_max = map(cos(radians(sW_angle)), -1, 1, 1, 45);
  
  noFill();
  stroke(c2);
  
  //agregue un ellipse para el borde del circulo
  ellipse(0,0,dia*2,dia*2);
}
//if-else
// PAUSAR/REANUDAR audio. si el usuario aprieta una tecla se pausa y si vuelve a apretar se reanuda.
void keyPressed(){
  if(song_.isPlaying() ) {
    song_.pause();
  } else {
 song_.play();
  }
}
