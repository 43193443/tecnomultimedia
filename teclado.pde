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
