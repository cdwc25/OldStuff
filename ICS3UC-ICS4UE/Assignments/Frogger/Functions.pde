//Win Screen Balloon Variables
float[] balloonx = new float[20];
float[] balloony = new float[20];
float[] speed = new float[20];

void winsetup () {
  for (int i=0; i < balloonx.length; i++) {
    balloony[i] = random (0, height);
    balloonx[i] = random (0, width);
    speed[i] = random (0.4, 0.8);
  }
}

void levels () {
  //Main Menu
  if (level == 0) {
    getmousecolor = get (mouseX, mouseY); //Mouse Color Checker
    image(scenery, width / 2, height / 2, 900, 800);
    image(froggertitle, width / 2, height / 2 - 100, 300, 200);

    //Button
    fill (0, 255, 0);
    rect (width / 2, 380, width / 2 - 40, 100);

    //If button is clicked, Start Main Game
    if (mousePressed && (mouseButton == LEFT) && mouseY >= 250 && getmousecolor ==-16711936) level = 1; 

    //Flashing Text Effect
    timer++;
    if (timer > 70) timer = timer - 70;
    if (timer < 50) {
      fill (0);
      textSize(30);
      text ("Start Game", width / 2 - 80, 388);
    }
  }

  //Win Screen
  if (level == 3) { 
    background (255);
    image(scenery, width / 2, height / 2);

    //Timer
    timer++;
    if (timer > 200) exit(); //Game is finished, exit

    //Win Effects
    for (int i=0; i < balloonx.length; i++) {
      balloony[i]=balloony[i]-speed[i];
      fill (0);
      image(balloon, balloonx[i], balloony[i], 30, 50);

      if (balloony[i] <= 0) {
        balloony[i] = height;
        speed[i] = random (0.4, 0.8);
      }
    }

    //Text
    textSize (30);
    fill(0, 255, 0);
    text ("You Win!", width / 2 - 58, height / 2);
  }

  //Retry Screen 
  if (level == 4) {
    getmousecolor = get (mouseX, mouseY); 
    background (255);
    image(scenery, width / 2, height / 2);

    //Text
    textSize (30);
    fill(255, 0, 0);
    text ("You Lose!", width / 2 - 60, height / 2 - 65);

    //Button
    fill (0, 255, 0);
    rect (width / 2 + 10, 380, width / 2 - 40, 100);

    //Reset All Obstacles, Subtract a Life (Same As Setup)
    if (mousePressed && (mouseButton == LEFT) && mouseY >= 250 && getmousecolor ==-16711936) reset();

    //Flashing Text Effect
    timer++;
    if (timer > 70) timer = timer - 70;
    if (timer < 50) {
      fill (0);
      text ("Retry?", width / 2 - 32, 389);
    }
  }

  //Game Over!
  if (level == 2) { 
    timer++;
    if (timer > 200) exit(); //Game is finished, exit

    background (255);
    image(scenery, width / 2, height / 2);

    //Text
    textSize (30);
    fill(255, 0, 0);
    text ("Game Over!", width / 2 - 77, height / 2);
  }
}

void reset () { //If user died and clicked retry, reset all locations and subtract a life
  lives = lives - 1; 
  for (int i = 0; i < arraysize; i++) {
    ux[i] = space + round(random(110, 150));
    ux2[i] = space + round(random(110, 150));
    ux3[i] = space + round(random(110, 150));
    ux4[i] = space;
    uy[i] = carlane[round(random(3, 4))];
    uy2[i] = carlane[round(random(0, 1))];
    uy3[i] = carlane[2];
    uy4[i] = loglane[round(random(0, 4))];
    space = space + 120;
    if (space > width) space = 0;
    x = width / 2 - 10;
    y = 700;
    level = 1;
  }
}