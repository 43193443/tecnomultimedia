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
