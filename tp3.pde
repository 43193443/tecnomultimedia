// https://www.youtube.com/watch?v=IzNbEq1FzQw
// Ramiro Sebastian Juarez Giacomo 91434/5
// juego NS Shaft

//importar una biblioteca
import ddf.minim.*;

Minim cadena;
AudioPlayer cancion;

// crear variables
float ball_x, ball_y, speed_x, speed_y, a;
float block_x[] = new float[7], block_y[] = new float[7], block_width = 150, block_height = 20;
int bType[] = new int[7]; //0 normal, 1 brinco, 2 slide left, 3 slide right, 4 muerte
boolean GAME_OVER = false, YOU_WIN = false;
color[] c = {#00FF00, #FF00FF, #19194D, #19194D, #FF0000};
int life, score;
long timer;
PImage img_ball, img_win, img_loser, fondo, fondo_main;
int gameScreen = 0;

//variables pos
float posY, Y2, Y3, Y4;
int estado;

//TEXTO
int miVariable;
String textofinal;
color textoRandom;
color celeste;

//declaración de variables

void setup() {
  size(600, 600);
  //asignación
  ball_x  = width/2;
  ball_y = 20;
  speed_y = .2;
  a = .5;
  life = 100;
  score =0;
  GAME_OVER = false;
  YOU_WIN = false;

  cadena = new Minim(this);
  cancion = cadena.loadFile("ChayanneSong.wav");

  //carga de imagenes
  img_ball = loadImage("chayanne.png");
  img_loser = loadImage("bola_angry.png");
  img_win = loadImage("bola_win.png");
  fondo = loadImage("fondo_2.jpg");
  fondo_main = loadImage("main.png");

  // POSICIONES
  posY = 1000;
  Y2= 550;
  Y3=600;
  Y4=550;

  // bloques 
  rectMode(CENTER);
  for (int i=0; i <=5; i++) {
    block_x[i] = random(0, width);
    block_y[i] = height - 10 + 100*i;
    bType[i] = int(random(0, 5));
  }
}

void draw() {
  //pantallas
  if (gameScreen == 0) { 
    initScreen();
  } else if (gameScreen == 1) { 
    gameplayScreen();
  } else if (gameScreen == 2) {
    creditos();
  }
}

//pantalla inicial
void initScreen() {
  //imagen de fondo
  image(fondo_main, 0, 0, 605, 605);
  // texto inicial
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(60);
  text("Chayanne game", width/2, height/2-100);
  textSize(25);
  text("Evita que Chayanne caiga.\n consigue un puntaje \nde 30 para ganar.", width/2, height/2-60);
  textSize(25);
  text("Utiliza las flechas direccionales para moverse.", width/2, height/2+110);
  textSize(20); 
  text("Haz click para comenzar", width/2, height/2+140);
  textSize(15); 
  text("R restart\nC credits\nM main\n1 play music\n2 stop music", width/2+235, height/2-275);

  textSize(15); 
  text("Bloques \nVerde normal\nVioleta brinca\nAzul desliza\nRojo daña", width/2-235, height/2-275);


  if (cancion.isPlaying()) {
    text("", width/2, height/2-200);
  } else
  {
    text("", width/2, height/2-200);
  }
}

//pantalla de juego
void gameplayScreen() {
  // imagen como background
  image(fondo, 0, 0, 605, 605);

  // si gana o pierde
  if (YOU_WIN == false) {
    if (GAME_OVER == false) {
      ball_y += speed_y;
      speed_y +=a;
      speed_y = constrain(speed_y, -15, 15);
      //array
      for (int i=0; i <=6; i++) {
        block_y[i] -= 4;

        fill(c[bType[i]]);
        rect(block_x[i], block_y[i], block_width, block_height);

        if (ball_x > block_x[i] - block_width/2 && ball_x < block_x[i] + block_width/2 && 
          ball_y > block_y[i] - block_height/2 - 20 && ball_y < block_y[i] + block_height/2 - 20) {
          if (bType[i] == 0) { //normal
            ball_y = block_y[i] - 20;
            speed_y = 0;
          } else if (bType[i] == 1) { //brinca
            //ball_y = block_y[i] - 20;
            speed_y = -10;
          } else if (bType[i] == 2) { //slide left
            ball_y = block_y[i] - 20;
            ball_x -=4;
            speed_y =0;
          } else if (bType[i] == 3) { //slide right
            ball_y = block_y[i] - 20;
            ball_x +=4;
            speed_y =0;
          } else if (bType[i] == 4) {
            ball_y = block_y[i] - 20;
            //resta vida bloque rojo
            life -=2;
            speed_y =0;
          }
        }

        if (block_y[i] < 0) {
          block_x[i] = random(0, width);
          block_y[i] = height - 20;
          bType[i] = int(random(0, 5));
          score++;
        }
      }
      // controles del personaje
      if (keyPressed) {
        if (key == CODED) {
          if (keyCode == LEFT) ball_x -= 10;
          if (keyCode == RIGHT) ball_x +=10;
        }
      }

      if (millis() - timer >= 3000) {
        //recuperar vida
        life +=15;
        timer = millis();
      }

      ball_x = constrain(ball_x, 0, width);
      //imagen del personaje
      image (img_ball, ball_x, ball_y, 50, 50);

      if (ball_y > height || life <=0 ) GAME_OVER = true;
      if (ball_y < 0) life-=4;
      // si llega a 30 gana
      if ( score >=30 ) YOU_WIN = true;
      //texto de puntaje y vida
      textSize(24);
      fill(#98DB7C);
      text("puntaje: \n"+ score, width - 60, 40);
      life = constrain(life, 0, 100);
      text("vida: \n"+life, 60, 40);
    } else {
      //texto de reinicio
      textSize(20);
      fill(#FF0000);
      text("Presiona R \npara reiniciar.", width/2, height/2);
      //texto creditos
      textSize(15);
      fill(#FF0000);
      text("Presiona C \npara ver creditos.", width/2+235, height/2-275);
      //texto menu
      textSize(15);
      fill(#FF0000);
      text("Presiona M \npara regresar al inicio.", width/2-215, height/2-275);
      //texto de perder
      textSize(48);
      text("GAME OVER", width/2, 200);
      image(img_loser, 240, 400, 150, 150);
    }
  } else {
    //texto de reinicio
    textSize(20);
    text("Presiona R \npara reiniciar", width/2, height/2);
    //texto creditos
    textSize(15);
    text("Presiona C \npara ver creditos", width/2+235, height/2-275);
    //texto inicio
    textSize(15);
    text("Presiona M \npara regresar al inicio.", width/2-215, height/2-275);
    //texto de ganar
    textSize(48);
    text("YOU WIN", width/2, 200);
    image(img_win, 230, 400, 150, 150);
  }
}

void creditos() {
  miVariable= -1000;
  textofinal= "Chayanne game";
  textoRandom = color(0, 255, 255);
  celeste= color(0, 255, 255);
  textoRandom = color(random (255), random (255), random (255));


  background(0, 0, 0);


  if (estado==0) {
    // PRIMER TEXTO INTRO
    textSize(32);
    //random de color 
    fill(textoRandom);
    textAlign(CENTER);
    text(textofinal, width/2, posY);
    posY-=3;
  }



  // SEGUNDO TEXTO
  if (estado==1) {
    textSize(32);
    fill(celeste);
    textAlign(CENTER);
    text("Desarrollador:  Akihiko Kusanagi", width/2, posY);
    posY-=3;
  }
  // TERCER TEXTO
  if (estado==2) {  
    textSize(32);
    fill(celeste);
    textAlign(CENTER);
    text("Editor: Nagi-P Soft", width/2, posY);
    posY-=3;
  }

  //CUARTO TEXTO
  if (estado==3) {
    textAlign(CENTER);
    textSize(32);
    fill(celeste);
    text("Fecha de lanzamiento: 1996", 250, Y4);
    Y4-=3;
  }
  //QUINTO TEXTO
  if (estado==4) {
    textAlign(CENTER);
    textSize(32);
    fill(celeste);
    text("musica: torero", 250, Y4);
    Y4-=3;
  }

  //pantalla
  if (posY<-50 && estado==0) {
    estado=1;
    posY=width;
  }

  if (posY<-50 && estado==1) {
    estado=2;
    posY=width;
  }
  if (posY<-100 && estado==2) {
    estado=3;
    posY=width;
  }

  if (Y4<-100 && estado == 3) {
    estado=4;
    Y4=width;
  }

  if (Y4<-50 && estado == 4 ) {
    estado=5;
    Y4=width;
  }
}


void mousePressed() {
  // inicia la pantalla inicial si aprieto click empieza el juego
  if (gameScreen==0) { 
    startGame();
  }
}

void mainGame() {
  gameScreen = 0;
}

void startGame() {
  gameScreen=1;
}

void gamecredits() {
  gameScreen=2;
}

void keyPressed() {

  if (key == 'r' || key == 'R') {

    //if (GAME_OVER == true || YOU_WIN == true)
    setup();
  } else if (key == 'c' || key == 'C') 
  {
    gamecredits();
  } else if (key == 'm' || key == 'M') 
  { 
    mainGame();
  }
  if (key=='1') 
  {  
    cancion.play();
  }
  if (key=='2') 
  {    
    cancion.pause();
    cancion.rewind();
  }
}
