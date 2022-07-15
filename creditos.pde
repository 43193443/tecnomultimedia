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
