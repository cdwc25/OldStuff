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

void loadImages () {
  //Load Images
  background = loadImage ("background.png");
  background.resize(600, 700);
  frog = loadImage ("frog.png");
  car = loadImage ("carRight.png");
  car2 = loadImage ("carLeft.png");
  truck = loadImage ("truck.png");
  log = loadImage ("log.png");
  froggertitle = loadImage ("froggertitle.png");
  scenery = loadImage ("scenery.jpg");
  balloon = loadImage("balloon.png");
}

void declareVariables () {
  //Declare Variables
  x = width / 2;
  y = 690;

  //Car Lane Y-Coords
  carlane[0] = 620;
  carlane[1] = 565;
  carlane[2] = 510;
  carlane[3] = 458;
  carlane[4] = 402;

  //Log Lane Y-Coords
  loglane[0] = 80;
  loglane[1] = 150;
  loglane[2] = 200;
  loglane[3] = 230;
  loglane[4] = 290;
}

void assignObstacles () {
  for (int i = 0; i < arraysize; i++) {
    //Draw each obstacle randomly spaced out
    ux[i] = space + round(random(110, 150));
    ux2[i] = space + round(random(110, 150));
    ux3[i] = space + round(random(110, 150));
    ux4[i] = space;

    uy[i] = carlane[round(random(3, 4))];
    uy2[i] = carlane[round(random(0, 1))];
    uy3[i] = carlane[2];
    uy4[i] = loglane[round(random(0, 4))];

    //Don't collide
    space = space + 130;
    if (space > width) space = 0;
  }
}

void playerMovement () {
  //Player Movement
  if (keyPressed) {
    timer = 0; //Reset Anti-Idling System
    if (key == 'w' && y > 0) y = y - 3;
    if (key == 'a' && x > 0) x = x - 3;
    if (key == 's' && y < height) y = y + 3;
    if (key == 'd' && x < width) x = x + 3;
  }
}

void displayLives () {
  //Display Lives
  textSize (25);
  fill (0, 139, 22);
  text ("Lives:", 10, 80);
  text (lives, 85, 80);
}

void images() {
  //Background
  image(background, width / 2, height / 2);

  //Anti-Idling System
  timer++;
  if (timer > 3000) {
    reset(); 
    level = 0;
  }

  //Player
  image(frog, x, y, 40, 40);
}


void moveEverything() {
  for (int i = 0; i < ux.length; i++) {
    //Draw Obstacles
    image(car, ux[i], uy[i], 70, 40); //Enemy Cars
    image(car2, ux2[i], uy2[i], 70, 40); //Enemy Cars
    image(truck, ux3[i], uy3[i], 90, 40); //Enemy Trucks
    image(log, ux4[i], uy4[i], 60, 20); //Enemy Logs

    //Different Speeds
    ux[i] = ux[i] + 3;
    ux2[i] = ux2[i] - 2;
    ux3[i] = ux3[i] - 4;
    ux4[i] = ux4[i] - 2;

    //If off-screen, respawn
    if (ux[i] < -100) ux[i] = width + 20;
    if (ux[i] > width + 20) ux[i] = -90;

    if (ux2[i] < -90) ux2[i] = width + 20;
    if (ux2[i] > width + 20) ux2[i] = 0;

    if (ux3[i] < -90) ux3[i] = width + 35;
    if (ux3[i] > width + 35) ux3[i] = 0;

    if (ux4[i] < -90) ux4[i] = width + 30;
    if (ux4[i] > width + 30) ux4[i] = -90;

    //Collision Detection
    if (dist(ux[i], uy[i], x, y) < 41) level = 4;
    if (dist(ux2[i], uy2[i], x, y) < 41) level = 4;
    if (dist(ux3[i], uy3[i], x, y) < 41) level = 4;
    if (dist(ux4[i], uy4[i], x, y) < 41) level = 4;

    //Win Condition
    if (y < 1) level = 3;

    //Lose Condition (Method to avoid asking to retry if already dead)
    if (dist(ux[i], uy[i], x, y) < 41 && lives == 0) level = 2;
    if (dist(ux2[i], uy2[i], x, y) < 41 && lives == 0) level = 2;
    if (dist(ux3[i], uy3[i], x, y) < 41 && lives == 0) level = 2;
    if (dist(ux4[i], uy4[i], x, y) < 41 && lives == 0) level = 2;
  }
}