// Connor Cerisano
// Dodgeball Assignment, Started 10/4/2017

int x, y; //Player
int score; //Score System (Way to win)
int level; //Level Switcher
PImage splash, dodgeball, gymFloor; //Create Images
int getmousecolor; //To check if buttons are clicked
float speed1, speed2, speed3, speed4, speed5, speed6, speed7, speed8; //Different Speed (for each obstacle)
float enemyX, enemyY, enemy2X, enemy2Y, enemy3X, enemy3Y, enemy4X, enemy4Y, enemy5X, enemy5Y, enemy6X, enemy6Y, enemy7X, enemy7Y, enemy8X, enemy8Y; //Obstacle Locations

//Setup
void setup () {
  size (500, 500);
  smooth ();
  frameRate (60);
  background (255);
  ellipseMode (CENTER);
  imageMode (CENTER);
  noStroke();
  dodgeball = loadImage ("dodgeball.png"); //Load Obstacle Sprite

  //Starting Locations
  x = width / 2;
  y = 480;

  //Starting Score
  score = 0;

  //Enemy X Coords
  enemyX = random (100, width - 100);
  enemy2X = random (100, width - 100);
  enemy3X = random (100, width - 100);
  enemy4X = random (100, width - 100);
  enemy5X = random (100, width - 100);
  enemy6X = random (100, width - 100);
  enemy7X = random (100, width - 100);
  enemy8X = random (100, width - 100);

  //Enemy Y Coords
  enemyY = random (0, height - 200);
  enemy2Y = random (0, height - 200);
  enemy3Y = random (0, height - 200);
  enemy4Y = random (0, height - 200);
  enemy5Y = random (0, height - 200);
  enemy6Y = random (0, height - 200);
  enemy7Y = random (0, height - 200);
  enemy8Y = random (0, height - 200);

  //Randomize Speeds
  speed1 = random (2, 4);
  speed2 = random (2, 4);
  speed3 = random (2, 4);
  speed4 = random (2, 4);
  speed5 = random (2, 4);
  speed6 = random (2, 4);
  speed7 = random (2, 4);
  speed8 = random (2, 4);

  //Start Menu Setup
  level = -1; 
  splash = loadImage("splash.png");
  gymFloor = loadImage ("gymFloor.jpg");
}

void draw () {
  if (level <= 0) { //Start Menu
    getmousecolor = get (mouseX, mouseY);
    //Menu Design
    image (splash, width / 2, 150);
    fill (0, 255, 0);
    rect (width / 2 - 110, 250, width / 2 - 38, 50);
    fill (0);
    text ("Start Game", width / 2 - 32, 277);
    if (mousePressed && (mouseButton == LEFT) && mouseY >= 250 && getmousecolor <=-16711936) level = 1; //Start Main Game
  }

  if (level >= 1) { //Start Main Game
    //Clear Screen
    background (255);
    image (gymFloor, width / 2, 300);

    //Score Handler
    text ("Score:", 10, 20);
    text (score, 50, 20);
    if (score > 50) { 
      level = 3;
    }

    //Player
    fill (0, 0, 255);
    ellipse (x, y, 25, 25);

    //Player Movement
    if (keyPressed) {
      if (keyCode==LEFT && x > 100 || key=='a' && x > 100) x=x-2;
      if (keyCode==RIGHT && x < 400 || key=='d' && x < 400) x=x+2;
    }

    //Collision Detection
    if (dist(x, y, enemyX, enemyY) < 28 || dist(x, y, enemy2X, enemy2Y) < 28 || dist(x, y, enemy3X, enemy3Y) < 28 || dist(x, y, enemy4X, enemy4Y) < 28 || dist(x, y, enemy5X, enemy5Y) < 28 || dist(x, y, enemy6X, enemy6Y) < 28 || dist(x, y, enemy7X, enemy7Y) < 28 || dist(x, y, enemy8X, enemy8Y) < 28)
      level = 4; //You lose!

    //Draw Obstacles
    fill (255, 0, 0);
    image (dodgeball, enemyX, enemyY, 30, 30); 
    image (dodgeball, enemy2X, enemy2Y, 30, 30);
    image (dodgeball, enemy3X, enemy3Y, 30, 30);
    image (dodgeball, enemy4X, enemy4Y, 30, 30);
    image (dodgeball, enemy5X, enemy5Y, 30, 30);
    image (dodgeball, enemy6X, enemy6Y, 30, 30);
    image (dodgeball, enemy7X, enemy7Y, 30, 30);
    image (dodgeball, enemy8X, enemy8Y, 30, 30);

    //Move And Reset Obstacles, Randomize Speed, Add Score, etc
    if (enemyY < 500) enemyY = enemyY + speed1; 
    else { 
      enemyY = 10; 
      enemyX = random (100, width - 100);
      speed1 = random (2, 4);
      score = score + 1;
    }

    if (enemy2Y < 500) enemy2Y = enemy2Y + speed2;
    else { 
      enemy2Y = 10; 
      enemy2X = random (100, width - 100);
      speed2 = random (2, 4);
      score = score + 1;
    }

    if (enemy3Y < 500) enemy3Y = enemy3Y + speed3;
    else { 
      enemy3Y = 10; 
      enemy3X = random (100, width - 100);
      speed3 = random (2, 4);
      score = score + 1;
    }

    if (enemy4Y < 500) enemy4Y = enemy4Y + speed4;
    else { 
      enemy4Y = 10; 
      enemy4X = random (100, width - 100);
      speed4 = random (2, 4);
      score = score + 1;
    }

    if (enemy5Y < 500) enemy5Y = enemy5Y + speed5;
    else { 
      enemy5Y = 10; 
      enemy5X = random (100, width - 100);
      speed5 = random (2, 4);
      score = score + 1;
    }

    if (enemy6Y < 500) enemy6Y = enemy6Y + speed6;
    else { 
      enemy6Y = 10; 
      enemy6X = random (100, width - 100);
      speed6 = random (2, 4);
      score = score + 1;
    }

    if (enemy7Y < 500) enemy7Y = enemy7Y + speed7;
    else { 
      enemy7Y = 10; 
      enemy7X = random (100, width - 100);
      speed7 = random (2, 4);
      score = score + 1;
    }

    if (enemy8Y < 500) enemy8Y = enemy8Y + speed8;
    else { 
      enemy8Y = 10; 
      enemy8X = random (100, width - 100);
      speed8 = random (2, 4);
      score = score + 1;
    }

    //Win and Lose System
    if (level >= 3) {
      background (255);
      textSize (30);
      fill (0, 255, 0);
      text ("You Win!!!", width / 2 - 65, height / 2);
      x = 700; //Put player out of bounds while not visible
      score = -1000; //Reset Score
    }

    if (level >= 4) {
      background (255);
      textSize (30);
      fill (255, 0, 0);
      text ("You Lose!", width / 2 - 65, height / 2);
      x = 700; //Put player out of bounds while not visible
      score = -1000; //Reset Score
    }
  }
}