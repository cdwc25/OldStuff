void levels () {
  getmousecolor = get (mouseX, mouseY); //Getmousecolor for button functionality
  textFont(gamer); //Custom Font

  if (level == 0) { //MAIN MENU (LEVEL 0)
    image (blurred, width / 2, height /2); //Background
    image(splash, width / 2, height - 340, 340, 70);

    //Button
    fill (255, 247, 0);
    rect (width / 2, 280, width / 2 - 40, 120);

    //If button is clicked, Start Main Game
    if (mousePressed && (mouseButton == LEFT) && mouseY >= 150 && getmousecolor ==-2304) level = 1; 

    //Flashing Text Effect
    menutimer++;
    if (menutimer > 70) menutimer = menutimer - 70;
    if (menutimer < 50) {
      fill (0);
      textSize(23);
      text ("Start Game", width / 2 - 81, 289);
    }
  }

  if (level == 2) { //RETRY SCREEN (LEVEL 2)
    if (lives <= 0) level = 3; //Life check, send to game over screen
    background (0);
    image (blurred, width / 2, height /2);

    //Text
    textSize (30);
    fill(255, 0, 0);
    text ("You Lose!", width / 2 - 88, height / 2 - 65);

    //Button
    fill (255, 247, 0);
    rect (width / 2, 260, width / 2 - 30, 120);

    //Reset All Obstacles, Subtract a Life (Same As Setup)
    if (mousePressed && (mouseButton == LEFT) && getmousecolor ==-2304) {
      lives = lives - 1;
      reset();
      level = 1;
    }

    //Flashing Text Effect
    menutimer++;
    if (menutimer > 70) menutimer = menutimer - 70;
    if (menutimer < 50) {
      fill (0);
      text ("Retry?", width / 2 - 64, 270);
    }
  }

  if (level == 3) { //GAME OVER SCREEN (LEVEL 3)
    background (0);
    image (blurred, width / 2, height /2);

    //Text
    textSize (30);
    fill(255, 0, 0);
    text ("Game Over!", width / 2 - 99, height / 2 - 65);

    //Button
    fill (255, 247, 0);
    rect (width / 2, 260, width / 2 - 30, 120);

    //Reset All Obstacles, Subtract a Life (Same As Setup)
    if (mousePressed && (mouseButton == LEFT) && getmousecolor ==-2304) {
      exit();
    }

    //Flashing Text Effect
    menutimer++;
    if (menutimer > 70) menutimer = menutimer - 70;
    if (menutimer < 50) {
      fill (0);
      text ("Exit Game", width / 2 - 90, 270);
    }
  }

  if (level == 4) { //WIN SCREEN (LEVEL 4)
    background (0);
    image (blurred, width / 2, height /2);

    //Text
    textSize (30);
    fill(0, 255, 0);
    text ("You Win!!!", width / 2 - 77, height / 2 - 65);

    //Button
    fill (255, 247, 0);
    rect (width / 2, 260, width / 2 - 30, 120);

    //Reset All Obstacles, Subtract a Life (Same As Setup)
    if (mousePressed && (mouseButton == LEFT) && getmousecolor ==-2304) {
      exit();
    }

    //Flashing Text Effect
    menutimer++;
    if (menutimer > 70) menutimer = menutimer - 70;
    if (menutimer < 50) {
      fill (0);
      text ("Exit Game", width / 2 - 90, 270);
    }
  }
}