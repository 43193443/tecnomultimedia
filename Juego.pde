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
