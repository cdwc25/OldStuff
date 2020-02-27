int score;
int movetimer;
boolean moveupdate = false;
int snakesize = 500;
int arraysize = snakesize;
int[] sX = new int[arraysize]; //Snake X Locations
int[] sY = new int[arraysize]; //Snake Y Locations
int aX, aY; //Apple
int LLT; //Last Location Timer
int lastX, lastY;

void setup () {
  frameRate(60);
  rectMode(CENTER);
  size(700, 500);
  background(0);

  for (int i=0; i < arraysize; i++) {
    sX[i] = width / 2;
    sY[i] = height / 2;
  }
}

void draw () {
  text(LLT, 40, 40);
  //Update Snake Size
  arraysize = snakesize;

  movetimer++;
  if (movetimer > 3) {
    moveupdate = true;
    movetimer = 0;
  }

  for (int i=0; i < snakesize; i++) {
    //Draw
    fill(0, 255, 0);
    rect(sX[i], sY[i], 20, 20);

    //Debug
    text(sX[i], 60, 20);
    text(sY[i], 60, 30);
    text(lastX, 300, 30);
    text(lastY, 300, 40);

    //Movement
    if (moveupdate == true) {
      if (key == 'w' || key == 'W') {
        sY[i] = sY[i] - 21;
      }
      if (key == 'a' || key == 'A') {
        sX[i] = sX[i] - 21;
      }
      if (key == 's' || key == 'S') {
        sY[i] = sY[i] + 21;
      }
      if (key == 'd' || key == 'D') {
        sX[i] = sX[i] + 21;
      }
    }
    moveupdate = false;

    fill(0);
    LLT++;
    if (LLT > 5000) {
      lastX = sX[i];
      lastY = sY[i];
      rect(lastX, lastY, 20, 20);
      //LLT = 0;
    }
  }
}