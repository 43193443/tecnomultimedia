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
