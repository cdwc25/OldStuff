//Player Variables
int x, y; //Location
int c1, c2, c3, c4; //Collision Detection

//Other
int timer;
PImage background, inky, blinky; //Images

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


void setup () {
  size (448, 512);
  frameRate(60);
  noStroke();
  imageMode(CENTER);
  background(255, 0, 0);

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

  //Load Images
  background = loadImage ("gameboard.png");
  inky = loadImage ("inky.png");
  blinky = loadImage ("blinky.png");
}

void draw () {
  image (background, width / 2, height / 2);

  //Player Function
  player();

  //Inky Function
  inky();

  //Blinky Function
  blinky();

  //Timer
  timer++;
  if (timer > 150) { 
    updateInkyTarget();
    updateBlinkyTarget();
    timer = 0;
  }

  if (dist(ix, iy, targetx, targety) < 20) updateInkyTarget();
  if (dist(bx, by, btargetx, btargety) < 20) updateBlinkyTarget();

  debug();
}

void debug () {
  //Debug Stuff
  fill (0, 0, 255);
  ellipse (targetx, targety, 7, 7);
  textSize(30);
  fill(255, 0, 0);
  text (timer, 20, 90);
  ellipse(ix, iy + 18, 3, 3);
  ellipse(ix, iy - 18, 3, 3);
  ellipse(ix + 18, iy, 3, 3);
  ellipse(ix - 18, iy, 3, 3);
  ellipse(bx, by + 23, 3, 3);
  ellipse(bx, by - 23, 3, 3);
  ellipse(bx + 23, by, 3, 3);
  ellipse(bx - 23, by, 3, 3);
  ellipse (btargetx, btargety, 7, 7);
  textSize(10);
  fill(255, 0, 0);
  if (t1 != -16744200) text("t1 is free", 20, 20);
  if (t2 != -16744200) text("t2 is free", 20, 30);
  if (t3 != -16744200) text("t3 is free", 20, 40);
  if (t4 != -16744200) text("t4 is free", 20, 50);
}