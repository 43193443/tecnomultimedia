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
