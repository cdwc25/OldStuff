//Player Variables
int x, y; //Location
int c1, c2, c3, c4; //Collision Detection
int lives = 3; //Life System

//Blinky Variables
int bx, by; //Location
int btargetx, btargety; //Target Location
int bt1, bt2, bt3, bt4, bd1, bd2, bd3, bd4; //Target Helpers
int b1, b2, b3, b4; //Collision Detection

//Inky Variables
int ix, iy; //Location 
int targetx, targety; //Target Location
int t1, t2, t3, t4, d1, d2, d3, d4; //Target Helpers
int i1, i2, i3, i4; //Collision Detection

//Pinky Variables
int px, py; //Location
int ptargetx, ptargety; //Target Location
int pt1, pt2, pt3, pt4, pd1, pd2, pd3, pd4; //Target Helpers
int p1, p2, p3, p4; //Collision Detection

//Clyde Variables
int cx, cy; //Location
int ctargetx, ctargety; //Target Location
int ct1, ct2, ct3, ct4, cd1, cd2, cd3, cd4; //Target Helpers
int ci1, ci2, ci3, ci4; //Collision Detection

//Food Variables
int arraysize = 80; //Universal array size, just for ease of use
int counterX, counterY; //Helps to draw the food in a grid-like pattern
int score; //Win Condition
int[] fC1 = new int[arraysize]; //Color Collision, right
int[] fC2 = new int[arraysize]; //Color Collision, left
int[] fC3 = new int[arraysize]; //Color Collision, up
int[] fC4 = new int[arraysize]; //Color Collision, down
int[] fX = new int[arraysize]; //Food X Locations
int[] fY = new int[arraysize]; //Food Y Locations

//Other
int timer; //Helps to move the ghosts quicker
PImage background, inky, blinky, pinky, clyde, splash, blurred, scared; //Images
PFont gamer; //Custom Font
int getmousecolor; //Button Click Ability
int menutimer; //Text Blinking Effect
int level; //Level Switcher 

//Power Pellets 
boolean scaredmode = false;
int scaredmodetimer;
int RPL1 = round(random(0, arraysize)); //Random Power-Pellet Locations
int RPL2 = round(random(0, arraysize)); //Random Power-Pellet Locations
int RPL3 = round(random(0, arraysize)); //Random Power-Pellet Locations
int RPL4 = round(random(0, arraysize)); //Random Power-Pellet Locations
int killedBlinky, killedClyde, killedInky, killedPinky;

void setup () {
  size (448, 512);
  smooth();
  frameRate(60);
  noStroke();
  imageMode(CENTER); 
  rectMode (CENTER);
  background(0, 0, 0);
  key = 'w'; //Make Player Visible when game starts

  //Load Images and Fonts
  background = loadImage ("gameboard.png");
  inky = loadImage ("inky.png");
  blinky = loadImage ("blinky.png");
  pinky = loadImage ("pinky.png");
  clyde = loadImage ("clyde.png");
  splash = loadImage ("splash.png");
  blurred = loadImage ("gameboardBlurred.png");
  scared = loadImage ("scared.png");
  gamer = createFont ("Gameplay.ttf", 22);

  reset(); //Starting Locations, set score, draw food, etc
}

void draw () {
  levels(); //Main menu, retry screen, game over screen

  if (level == 1) { //Main Game
    image (background, width / 2, height / 2);

    //Player Function
    player(2);

    //Inky Function
    inky(2);

    //Blinky Function
    blinky(2);

    //Pinky Function
    pinky(2);

    //Clyde Function
    clyde(2);

    //Draw Food
    drawFood(255);

    //Update Target
    timer++;
    if (timer > 70) { 
      updateInkyTarget();
      updateBlinkyTarget();
      updatePinkyTarget();
      updateClydeTarget();
      timer = 0;
    }
    if (dist(ix, iy, targetx, targety) < 30) updateInkyTarget();
    if (dist(bx, by, btargetx, btargety) < 30) updateBlinkyTarget();
    if (dist(px, py, ptargetx, ptargety) < 30) updatePinkyTarget();
    if (dist(cx, cy, ctargetx, ctargety) < 30) updateClydeTarget();

    //debug(); //Debug Stuff
  }
}

void debug () {
  //Blinky's Debug (Red Stuff)
  fill(255, 0, 0);
  ellipse (bx, by + 18, 5, 5);
  ellipse (bx, by - 18, 5, 5);
  ellipse (bx + 18, by, 5, 5);
  ellipse (bx - 18, by, 5, 5);

  ellipse (btargetx, btargety, 10, 10);

  //Inky's Debug (Blue Stuff)
  fill(0, 0, 255);
  ellipse (ix, iy + 18, 5, 5);
  ellipse (ix, iy - 18, 5, 5);
  ellipse (ix + 18, iy, 5, 5);
  ellipse (ix - 18, iy, 5, 5);

  ellipse (targetx, targety, 10, 10);

  //Pinky's Debug (Pink Stuff)
  fill(255, 0, 222);
  ellipse (px, py + 18, 5, 5);
  ellipse (px, py - 18, 5, 5);
  ellipse (px + 18, py, 5, 5);
  ellipse (px - 18, py, 5, 5);

  ellipse (ptargetx, ptargety, 10, 10);

  //Clyde's Debug (Orange Stuff)
  fill(255, 158, 0);
  ellipse (cx, cy + 18, 5, 5);
  ellipse (cx, cy - 18, 5, 5);
  ellipse (cx + 18, cy, 5, 5);
  ellipse (cx - 18, cy, 5, 5);

  ellipse (ctargetx, ctargety, 10, 10);
}

void reset() {
  //Reset Score
  score = 0;

  //Reset Food
  counterX = 0;
  counterY = 50;
  drawFoodSetup();

  //Starting Locations
  x = width /2;
  y = height / 2 + 40;

  ix = width / 2;
  iy = height / 2 - 50;
  targetx = ix;
  targety = iy;

  bx = width / 2;
  by = height / 2 - 50;
  btargetx = ix;
  btargety = iy;

  px = width / 2;
  py = height / 2 - 50;
  ptargetx = px;
  ptargety = py;

  cx = width / 2;
  cy = height / 2 - 50;
  ctargetx = cx;
  ctargety = cy;
}