//Connor Cerisano
//Started 10/20/2017
//Frogger Assignment

PImage background, frog, car, car2, truck, log, froggertitle, scenery, balloon; //Create Images
int level; //Level Switcher
int x, y; //Coords for player
int space; //Avoid Car Collisions
int arraysize = 5; //Just for ease of use
int getmousecolor; //To check if buttons are clicked
int lives = 3; //Lives System 
int timer; //Timer; Multiple Purposes

//Car Locations
int[] ux = new int[arraysize]; 
int[] uy = new int[arraysize]; 

//Left-Facing Car Locations
int[] ux2 = new int[arraysize]; 
int[] uy2 = new int[arraysize]; 

//Truck Locations
int[] ux3 = new int[arraysize]; 
int[] uy3 = new int[arraysize]; 

//Log Locations
int[] ux4 = new int[arraysize]; 
int[] uy4 = new int[arraysize]; 

//Car Lane Array
int[] carlane = new int[arraysize];

//Log Lanes Array
int[] loglane = new int[arraysize];

void setup () {
  //Setup
  size (600, 700);
  frameRate (60);
  rectMode (CENTER);
  imageMode (CENTER);

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

  winsetup(); //Win Screen Balloons

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

void draw () {  
  //Level Handler (See Next Tab)
  levels();     

  if (level == 1) { //Main Game
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

    //Player Movement
    if (keyPressed) {
      timer = 0; //Reset Anti-Idling System
      if (key == 'w' && y > 0) y = y - 3;
      if (key == 'a' && x > 0) x = x - 3;
      if (key == 's' && y < height) y = y + 3;
      if (key == 'd' && x < width) x = x + 3;
    }

    //Display Lives
    textSize (25);
    fill (0, 139, 22);
    text ("Lives:", 10, 80);
    text (lives, 85, 80);

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
}