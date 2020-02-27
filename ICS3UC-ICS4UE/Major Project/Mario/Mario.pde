// 1.) Download REQUIRED LIBRARY: https://github.com/01010101/GifAnimation
// 2.) Put in C:\Users\NAMEHERE\Documents\Processing\libraries
// 3.) Rename folder to GifAnimation

import gifAnimation.*;
Gif mR, mR2, mRU, mR2U, spiny, spiny_u; //Load GIFS

PImage ground, cloud, bush, mi, mj, mi2, mj2, title, background, md, spike, board, bullet; //Load Images
PFont gui; //Load Fonts
int mousecolor; //Click-detection
int level; //Level Switcher

int arraysize = 42; //Bricks Array Size
int sc; //Brick-drawing counter
int cx, cy = 500, cx2, cy2; //Counters for Ground and Sky
float d, di; //Difficulty Counter, Increment
float score; //Time Alive

float mx, my; //Mario
boolean isRunning, onSky, onGround, g, alive = true; //Conditions
int c1, c2, c3, c4; //Color Collision
float gravity, gravtimer; //Gravity
boolean[] keys = new boolean[3]; //Multi-Directional Movement System

//Classes
Ground G[] = new Ground[arraysize];
Sky S[] = new Sky[arraysize];

//Obstacles
float[] sx = new float[3]; //Spike X
float[] sy = new float[3]; //Spike Y
float[] sx2 = new float[3]; //Bullet Bill X
float[] sy2 = new float[3]; //Bullet Bill Y
float sx3, sy3, sx4, sy4; //Spinies

void setup () {
  //Screen Setup
  size(900, 600);
  frameRate(60);
  noStroke();

  //Load Assets
  title = loadImage ("Title.png");
  gui = createFont("emulogic.ttf", 30);
  ground = loadImage ("ground.png");
  spike = loadImage ("spike.png");
  board = loadImage ("board.png");
  bullet = loadImage("bulletbill.png");
  md = loadImage ("mario_dead.png");
  mi = loadImage ("mario_idle.png");
  mj = loadImage ("mario_jump.png");
  mi2 = loadImage ("mario_idle_u.png");
  mj2 = loadImage ("mario_jump_u.png");
  mR = new Gif(this, "mario_run.gif");
  mR.play();
  mR2 = new Gif(this, "mario_run2.gif");
  mR2.play();
  mRU = new Gif(this, "mario_run_u.gif");
  mRU.play();
  mR2U = new Gif(this, "mario_run2_u.gif");
  mR2U.play();
  spiny = new Gif(this, "spiny.gif");
  spiny.play();
  spiny_u = new Gif(this, "spiny_u.gif");
  spiny_u.play();

  //Starting Conditions
  keys[0]=false; //W
  keys[1]=false; //A
  keys[2]=false; //D
  mx = width / 2;
  my = height / 2;

  //Setup Sky and Ground (Bricks)
  for (int i=0; i < arraysize; i++) {
    G[i] = new Ground(cx, cy);
    S[i] = new Sky(cx2, cy2);
    cx = cx + 48; //Ground Counter
    if (cx >= width + 100) {
      cx = -50;
      cy = cy + 50;
    }
    cx2 = cx2 + 48; //Sky Counter
    if (cx2 >= width + 100) {
      cx2 = -50;
      cy2 = cy2 + 50;
    }
  }

  //Setup Obstacles
  for (int i=0; i < 3; i++) {
    sc = sc + 400;
    sx[i] = sc;
    sy[i] = round(random(100, 450));
    sx2[i] = sc + width;
    sy2[i] = random(100, 400);
  }

  //Spinies
  sc = sc + 400;
  sx3 = sc;
  sy3 = 100;
  sx4 = sc + random(100, 200);
  sy4 = 464;
}

void draw () {
  if (level == 0) { //MAIN MENU
    mousecolor = get(mouseX, mouseY); //Setup Mouse

    //Background
    fill(#D96151);
    rect(0, 0, width, height / 2);
    fill(#7FA983);
    rect(0, height / 2, width, height);

    //Draw Ground
    for (int i=0; i < arraysize; i++) { 
      G[i].display();
      G[i].title();
      S[i].display();
      S[i].title();
    }

    //Title & Text
    image(title, 210, 0);
    textFont(gui, 25);
    fill(255);
    text("START GAME", 330, 420);
    text("HOW TO PLAY", 319, 470);

    //Make buttons clickable
    if (mouseY >= 400 & mouseY <= 440) rect(300, 402, 15, 15);
    if (mouseY >= 430 & mouseY <= 470) rect(290, 452, 15, 15);
    if (mousecolor == -1 & mouseY >= 400 & mouseY <= 440 & mouseButton == LEFT) level = 1;
    if (mousecolor == -1 & mouseY >= 430 & mouseY <= 470 & mouseButton == LEFT) level = 2;
  }

  if (level == 1) { //MAIN GAME
    //Background
    fill(#D96151);
    rect(0, 0, width, height / 2);
    fill(#7FA983);
    rect(0, height / 2, width, height);

    for (int i=0; i < arraysize; i++) { //Draw Ground
      G[i].display();
      G[i].move();
      S[i].display();
      S[i].move();
    }

    //Draw Objects
    mario(0.3);
    obstacles();

    //Difficulty Counter
    d = d + 0.07;
    if (d > 1) di = 2;
    if (d > 50) di = 3;
    if (d > 100) di = 5;
    if (d > 200) di = 7;
  }

  if (level == 3) { //GAME OVER
    background(0);
    textFont(gui, 25);
    fill(255);
    text("GAME OVER", 330, 290);
    textFont(gui, 15);
    text("Your time:", 327, 330);
    text(score / 10, 466, 330);

    //Go back to menu, reset Mario
    d = d + 0.07;
    if (d > 15) {
      level = 0;
      mx = width / 2;
      my = height / 2;
      alive = true;
      gravity = 0;
      gravtimer = 0;
      score = 0;
      sc = 0;

      //Setup Obstacles
      for (int i=0; i < 3; i++) {
        sc = sc + 400;
        sx[i] = sc;
        sy[i] = round(random(100, 450));
        sx2[i] = sc;
        sy2[i] = random(100, 400);
      }

      //Spinies
      sc = sc + 400;
      sx3 = sc;
      sy3 = 100;
      sx4 = sc + random(100, 200);
      sy4 = 464;
    }
  }

  if (level == 2) { //HOW TO PLAY
    mousecolor = get(mouseX, mouseY); //Setup Mouse

    //Background, Text
    fill(#D96151);
    rect(0, 0, width, height / 2);
    fill(#7FA983);
    rect(0, height / 2, width, height);
    image(board, 135, 200);
    textFont(gui, 25);
    fill(-1);
    text("HOW TO PLAY", 320, 250);
    textFont(gui, 15);
    text("- Use WASD to move", 330, 330);
    text("- Avoid the onset of obstacles", 250, 350);
    text("- Try to see how long you can stay alive!", 142, 370);

    //Back to Menu
    textFont(gui, 20);
    if (mouseY >= 400 & mouseY <= 440) rect(300, 425, 15, 15);
    if (mousecolor == -1 & mouseY >= 400 & mouseY <= 440 & mouseButton == LEFT) level = 0;
    text("Back to menu", 335, 440);
    image(mi, 435, 259, 47, 50); //Example Mario

    for (int i=0; i < arraysize; i++) { //Display Level
      G[i].display();
      G[i].title();
      S[i].display();
      S[i].title();
    }
  }
}